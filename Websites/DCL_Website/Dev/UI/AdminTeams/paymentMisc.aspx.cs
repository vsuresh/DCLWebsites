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
using Cricket;
using Cricket.Common;
using Cricket;


namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
    public partial class PaymentMisc : PageBaseAdmin
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            lblMessage.Text = "";

            if (!IsPostBack)
            {
                lblTeamName.Text = m_strTeamName;
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
                if (lblTeamName.Text != "" && txtComments.Text != "" && int.Parse(txtAmount.Text.Trim()) > 0)
                {
                    Guid regID = Guid.NewGuid();
                    string orderID = PayPalHelper.GetOrderID();

                    string userTeamName = lblTeamName.Text.Trim();
                    string userAmount = txtAmount.Text.Trim();

                    string message = string.Format("{0} | {1}", userTeamName, txtComments.Text.Trim());

                    gotoPaypal(regID, message, userAmount, orderID);

                }
                else
                {
                    lblMessage.Text = "Team name, Amount or Description is missing!";
                }
			}
		}

        private void gotoPaypal(Guid regId, string message, string fees, string orderID)
        {
            Session["RegistrationID"] = regId;
            Session["Paypal_TeamName"] = message;
            Session["Paypal_Fees"] = fees;
            Session["Paypal_OrderId"] = orderID;

            Response.Redirect("/paypal/payment.aspx");
        }

		
	}
}
