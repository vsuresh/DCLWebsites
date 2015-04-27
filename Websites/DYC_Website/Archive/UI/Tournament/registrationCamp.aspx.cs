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


namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
	public partial class registrationCamp : PageBaseTournament
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (!IsPostBack)
            {
                loadData();
                ViewState["tournament_id"] = tournamentId;

            }
            else
            {
                tournamentId = (int)ViewState["tournament_id"];
            }
		}

		protected void loadData()
		{
            DateTime? regStartDate = null;
            DateTime? regEndDate = null;
            SqlDataReader dr = m_bl.getTournamentData(tournamentId);
            if (dr.Read())
            {
                regStartDate = DataReaderHelper.GetDateTime(dr, "regstart_dt");
                regEndDate = DataReaderHelper.GetDateTime(dr, "regend_dt");
                lblFees.Text = dr["fees"].ToString();
            }
            dr.Close();

            if (regStartDate.HasValue)
                lblRegStartDate.Text = regStartDate.Value.ToLongDateString();
            if (regEndDate.HasValue)
                lblRegEndDate.Text = regEndDate.Value.ToLongDateString();

			if (DateTime.Now >= regStartDate && DateTime.Now <= regEndDate)
			{
                divRegOpen.Visible = true;
                divRegClose.Visible = false;
			}
			else
			{
                divRegOpen.Visible = false;
                divRegClose.Visible = true;
                if (DateTime.Now < regStartDate)
                {
                    divClosed.Visible = false;
                    divNotStarted.Visible = true;
                }
                else
                {
                    divClosed.Visible = true;
                    divNotStarted.Visible = false;
                }
            }

		}

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
                Guid regID = Guid.NewGuid();
                string orderID = PayPalHelper.GetOrderID();

                string playerName = "Player Registration";
                string userFees = lblFees.Text;

                DetailsView1.InsertItem(true);

                string message = string.Format("{0} | {1}", playerName, tournamentName);

                gotoPaypal(regID, message, userFees, orderID);

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
