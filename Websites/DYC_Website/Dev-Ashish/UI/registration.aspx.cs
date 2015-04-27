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


namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
	public partial class registration : PageBaseTournament
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            //TODO: this is temp for now for the summer camp registration
            // change it later and put a flag on the tournament table


            //redirectif 
            //if (tournamentId != 20)
            //{
            //    Response.Redirect("registrationCamp.aspx");
            //    return;
            //}

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
			clearData();
			//populateTitle();

            string regType = string.Empty;
            DateTime? regStartDate = null;
            DateTime? regEndDate = null;
            SqlDataReader dr = m_bl.getTournamentData(tournamentId);
            if (dr.Read())
            {
                regStartDate = DataReaderHelper.GetDateTime(dr, "regstart_dt");
                regEndDate = DataReaderHelper.GetDateTime(dr, "regend_dt");
                //lblFees.Text = dr["fees"].ToString();
                if (dr["reg_type"] != null)
                    regType = dr["reg_type"].ToString();
            }
            dr.Close();


            //if tournament is not team registration then send to player registration page
            if (regType != "TEAM")
            {
                Response.Redirect("registrationCamp.aspx");
                return;
            }

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

        //public void populateTitle()
        //{
        //    ddlContact1Title.Items.Add(new ListItem("Captain", "Captain"));
        //    ddlContact1Title.Items.Add(new ListItem("Vice-Captain", "Vice-Captain"));
        //    ddlContact1Title.Items.Add(new ListItem("Manager", "Manager"));
        //    ddlContact1Title.Items.Add(new ListItem("Player", "Player"));
        //    ddlContact2Title.SelectedIndex = 0;

        //    ddlContact2Title.Items.Add(new ListItem("Captain", "Captain"));
        //    ddlContact2Title.Items.Add(new ListItem("Vice-Captain", "Vice-Captain"));
        //    ddlContact2Title.Items.Add(new ListItem("Manager", "Manager"));
        //    ddlContact2Title.Items.Add(new ListItem("Player", "Player"));
        //    ddlContact2Title.SelectedIndex = 1;
		
        //    ddlLocation.Items.Add(new ListItem("Plano", "Plano"));
        //    ddlLocation.Items.Add(new ListItem("Coppel", "Coppel"));
        //    ddlLocation.SelectedIndex = 0;
			
        //}


		public void clearData()
		{
			txtContact1Name.Text = "";
			txtContact1Phone.Text = "";
			txtContact1Email.Text = "";

			txtContact2Name.Text = "";
			txtContact2Phone.Text = "";
			txtContact2Email.Text = "";

			txtTeamName.Text = "";
			txtComments.Text = "";

			lblMessage.Text = "";

            txtClubCity.Text = "";
            

		}

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
                if (txtTeamName.Text != "" && ddlClubState.SelectedValue != "0")
                {
                    Guid regID = Guid.NewGuid();
                    string orderID = PayPalHelper.GetOrderID();


                    m_bl.createTeamRegistration(regID, tournamentId, txtTeamName.Text, txtClubCity.Text,
                        txtContact1Name.Text, "", txtContact1Phone.Text, txtContact1Email.Text,
                        txtContact2Name.Text, "", txtContact2Phone.Text, txtContact2Email.Text,
                        txtComments.Text, orderID, ddlAgeCategory.SelectedValue, ddlClubState.SelectedValue, lblFees.Text);

                    string userTeamName = txtTeamName.Text.Trim();
                    string userFees = lblFees.Text.Trim();

                    //// check if any teams is configured as a student team so we will charge less money
                    //// for student teams we give 50% of registration fees off. i.e. $180 instead of $240
                    //string teamNames = System.Configuration.ConfigurationManager.AppSettings["StudentTeamNamesForFees"];
                    //if (!string.IsNullOrEmpty(teamNames))
                    //{
                    //    string[] teamNamesArray = teamNames.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    //    if (teamNamesArray != null && teamNamesArray.Length > 0)
                    //    { 
                    //        List<string> teamNameList = new List<string>(teamNamesArray);
                    //        if (teamNameList.Exists(item => item.Equals(userTeamName)))
                    //            userFees = "180";
                    //    }
                    //}

                    string message = string.Format("{0} | {1}", userTeamName, tournamentName);

                    gotoPaypal(regID, message, userFees, orderID);

                }
                else
                {
                    lblMessage.Text = "Team name or Fees is missing!";
                }
			}
		}

        private void gotoPaypal(Guid regId, string message, string fees, string orderID)
        {
            Session["RegistrationID"] = regId;
            Session["Paypal_TeamName"] = message;
            Session["Paypal_Fees"] = fees;
            Session["Paypal_OrderId"] = orderID;

            Response.Redirect("~/paypal/payment.aspx");
        }


        protected void ddlClubState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlClubState.SelectedValue == "Texas")
                lblFees.Text = "900";
            else
                lblFees.Text = "400";
        }

        protected void chkAgree_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAgree.Checked)
            {
                btnSubmit.Enabled = true;
            }
            else
            {
                btnSubmit.Enabled = false;
            }
        }
        protected void ddlAgeCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAgeCategory.SelectedValue == "U12")
                lblOvers.Text = "20 Overs";
            else if (ddlAgeCategory.SelectedValue == "U14")
                lblOvers.Text = "25 Overs";
            else if (ddlAgeCategory.SelectedValue == "U16")
                lblOvers.Text = "30 Overs";
            else
                lblOvers.Text = "20 Overs";
        }
}
}
