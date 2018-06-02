using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cricket.BAL;
using System.Text;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using Cricket;

namespace Cricket.Paypal
{
    public partial class paymentSuccess : PageBase
    {
        #region Variables

        public string Status, TransID, OrderID, Email, CurrencyType, Amount, ProfileId, TransDate, plannumber, planName;

        #endregion

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            StringBuilder sb = new StringBuilder();
            if (Session["RegistrationID"] != null)
                sb.Append(" [RegistrationID: " + Session["RegistrationID"].ToString() + "]");
            if (Session["Paypal_OrderId"] != null)
                sb.Append(" [Paypal_OrderId: " + Session["Paypal_OrderId"].ToString() + "]");
            if (Session["Paypal_TeamName"] != null)
                sb.Append(" [Paypal_TeamName: " + Session["Paypal_TeamName"].ToString() + "]");


            string Payment_Status = string.Empty;
            if (Request.QueryString["payment_status"] != null)
                Payment_Status = Request.QueryString["payment_status"].ToString();

            if (Payment_Status != string.Empty)
            {
                sb.Append(" [payment_status: " + Payment_Status + "]");

                StringBuilder strReturnQstring = new StringBuilder();
                strReturnQstring.Append(Request.QueryString.ToString());
                strReturnQstring.Append("&cmd=_notify-validate");


                string PostMode = "2";
                string WebURL = string.Empty;
                string SdHost = string.Empty;

                if (IsPostBack)
                    return;

                if (PostMode == "1")
                {
                    WebURL = "http://www.paypal.com/cgi-bin/webscr";
                    SdHost = "www.paypal.com";
                }
                else if (PostMode == "2")
                {
                    WebURL = "https://www.paypal.com/cgi-bin/webscr";
                    SdHost = "www.paypal.com";
                }
                else
                {
                    Response.Write("PostMode: " + (PostMode) + "is invalid!");
                }


                HttpWebRequest myRequest = (HttpWebRequest)HttpWebRequest.Create(WebURL);
                myRequest.AllowAutoRedirect = false;
                myRequest.Method = "POST";
                myRequest.ContentType = "application/x-www-form-urlencoded";

                //Create post stream 
                Stream RequestStream = myRequest.GetRequestStream();
                byte[] SomeBytes = Encoding.UTF8.GetBytes(strReturnQstring.ToString());
                RequestStream.Write(SomeBytes, 0, SomeBytes.Length);
                RequestStream.Close();

                sb.Append(" [request sent]");

                //Send request and get response 
                HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
                if (myResponse.StatusCode == HttpStatusCode.OK)
                {
                    sb.Append(" [response: OK]");

                    //Get the stream. 
                    Stream ReceiveStream = myResponse.GetResponseStream();
                    Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
                    //send the stream to a reader. 
                    StreamReader readStream = new StreamReader(ReceiveStream, encode);
                    //Read the result 
                    string Result = readStream.ReadLine();
                    if (Result == "INVALID")
                    {
                        sb.Append(" [result: INVALID]");

                        Response.Redirect("cancel.aspx");
                    }
                    // The result was invalid so send a failure notice or some other handling. 
                    else if (Result == "VERIFIED")
                    {
                        sb.Append(" [result: VERIFIED]");

                        switch ((Payment_Status))
                        {
                            case "Completed":

                                if (Session["RegistrationID"] != null)
                                {
                                    Guid regID = new Guid(Session["RegistrationID"].ToString());
                                    m_bl.AddPaymentDetails(regID, Session["Paypal_OrderId"].ToString(), Session["Paypal_TeamName"].ToString(), Payment_Status, DateTime.Now);
                                }
                                else
                                {
                                    Guid regID = Guid.Empty;
                                    m_bl.AddPaymentDetails(regID, Session["Paypal_OrderId"].ToString(), Session["Paypal_TeamName"].ToString(), Payment_Status, DateTime.Now);
                                }

                                break;
                        }
                    }
                }
            }

            m_bl.LogInfo("PayPalSuccess", sb.ToString());

        }
    }

}