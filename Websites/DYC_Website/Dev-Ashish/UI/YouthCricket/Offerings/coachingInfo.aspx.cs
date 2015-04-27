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
    public partial class coachingInfo : PageBase
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (!IsPostBack)
            {

                ShowAmount(ddlPackageUnder8.Text);
            }
            else
            {
            }
		}


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txtKidName.Text != "" && lblAmount.Text != "")
                {
                    Guid regID = Guid.NewGuid();
                    string orderID = PayPalHelper.GetOrderID();

                    string message = string.Format("Coaching: {0}|{1}|{2}|{3}|{4}", txtKidName.Text, ddlAge.SelectedValue.ToString(), ddlGender.SelectedValue.ToString(), ddlFirstSlot.SelectedValue.ToString(), ddlSecondSlot.SelectedValue.ToString());

                    gotoPaypal(regID, message, lblAmount.Text, orderID);

                }
                //else
                //{
                //    lblMessage.Text = "Team name or Fees is missing!";
                //}
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
            m_bl.LogInfo("CoachingRegistration", sb.ToString()); 
            
            Response.Redirect("~/paypal/payment.aspx");
        }

        protected void ddlAge_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(ddlAge.SelectedValue) >= 8)
            {
                ddlPackageUnder8.Visible = false;
                ddlPackageAbove8.Visible = true;
                ShowAmount(ddlPackageAbove8.SelectedValue);
            }
            else
            {
                ddlPackageUnder8.Visible = true;
                ddlPackageAbove8.Visible = false;
                ShowAmount(ddlPackageUnder8.SelectedValue);
            }
        }
        protected void ddlPackageUnder8_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowAmount(ddlPackageUnder8.SelectedValue);
        }
        protected void ddlPackageAbove8_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowAmount(ddlPackageAbove8.SelectedValue);
        }

        private void ShowAmount(string packageFees)
        {
            lblAmount.Text = (toInt(lblRegistrationFees.Text) + toInt(packageFees)).ToString();
        }
}
}
