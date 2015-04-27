using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Text;
using Cricket;
using Cricket.Common;


namespace Cricket.Offerings
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
    public partial class paymentMisc : PageBase
	{

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            lblMessage.Text = "";

            if (!IsPostBack)
            {
            }
            else
            {
            }
        }

        protected void loadData()
        {

        }

        protected void btnSubmit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txtUserName.Text != "" && txtComments.Text != "" && int.Parse(txtAmount.Text.Trim()) > 0)
                {
                    Guid regID = Guid.NewGuid();
                    string orderID = PayPalHelper.GetOrderID();

                    string userName = txtUserName.Text.Trim();
                    string userAmount = txtAmount.Text.Trim();

                    string message = string.Format("{0} | {1}", userName, txtComments.Text.Trim());

                    gotoPaypal(regID, message, userAmount, orderID);

                }
                else
                {
                    lblMessage.Text = "UserName, Amount or Description is missing!";
                }
            }
        }

        private void gotoPaypal(Guid regId, string message, string fees, string orderID)
        {
            Session["RegistrationID"] = regId;
            Session["Paypal_TeamName"] = message;
            Session["Paypal_Fees"] = fees;
            Session["Paypal_OrderId"] = orderID;

            StringBuilder sb = new StringBuilder();
            sb.Append(" [RegistrationID: " + regId.ToString() + "]");
            sb.Append(" [Paypal_OrderId: " + orderID + "]");
            sb.Append(" [Paypal_TeamName: " + message + "]");
            sb.Append(" [Paypal_Fees: " + fees + "]");
            m_bl.LogInfo("Misc.Payments", sb.ToString());

            Response.Redirect("~/paypal/payment.aspx");
        }


    }
}
