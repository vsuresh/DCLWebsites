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
	public partial class registration : PageBaseTournament
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
			clearData();
			populateTitle();

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

            oldTeamrow.Visible = true;
            newTeamrow.Visible = false;
            //load the data from the database
            SqlDataReader dr1 = m_bl.getTeamList(false);
            ddlTeams.DataSource = dr1;
            ddlTeams.DataTextField = "name";
            ddlTeams.DataValueField = "team_id";
            ddlTeams.SelectedValue = null;
            ddlTeams.DataBind();
            dr1.Close();

            ddlTeams.Items.Insert(0, new ListItem("select", "0"));
            ddlTeams.SelectedIndex = 0;

            //loadTeamData(0);
            //
        }

  
        protected void ddlTeams_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //int id = toInt(ddlTeams.SelectedValue.ToString());

            //if (id > 0)
            //{
            //    loadTeamData(id);
            //}
            //else
            //{
            //    loadTeamData(0);
            //}

        }
        public void populateTitle()
		{
			ddlContact1Title.Items.Add(new ListItem("Captain", "Captain"));
			ddlContact1Title.Items.Add(new ListItem("Vice-Captain", "Vice-Captain"));
			ddlContact1Title.Items.Add(new ListItem("Manager", "Manager"));
			ddlContact1Title.Items.Add(new ListItem("Player", "Player"));
			ddlContact2Title.SelectedIndex = 0;

			ddlContact2Title.Items.Add(new ListItem("Captain", "Captain"));
			ddlContact2Title.Items.Add(new ListItem("Vice-Captain", "Vice-Captain"));
			ddlContact2Title.Items.Add(new ListItem("Manager", "Manager"));
			ddlContact2Title.Items.Add(new ListItem("Player", "Player"));
			ddlContact2Title.SelectedIndex = 1;
		

            ddlLocation.Items.Add(new ListItem("Addison", "Addison"));
            ddlLocation.Items.Add(new ListItem("Allen", "Allen"));
            ddlLocation.Items.Add(new ListItem("Arlington", "Arlington"));
            ddlLocation.Items.Add(new ListItem("Carrollton", "Carrollton"));
            ddlLocation.Items.Add(new ListItem("Coppell", "Coppell"));
            ddlLocation.Items.Add(new ListItem("Dallas", "Dallas"));
            ddlLocation.Items.Add(new ListItem("Flower mond", "Flower mond"));
            ddlLocation.Items.Add(new ListItem("Fortworth", "Fortworth"));
            ddlLocation.Items.Add(new ListItem("Frisco", "Frisco"));
            ddlLocation.Items.Add(new ListItem("Garland", "Garland"));
            ddlLocation.Items.Add(new ListItem("Grand Prairie", "Grand Prairie"));
            ddlLocation.Items.Add(new ListItem("Irving", "Irving"));
            ddlLocation.Items.Add(new ListItem("Mckinney", "Mckinney"));
            ddlLocation.Items.Add(new ListItem("Murphy", "Murphy"));
            ddlLocation.Items.Add(new ListItem("Plano", "Plano"));
            ddlLocation.Items.Add(new ListItem("Prosper", "Prosper"));
            ddlLocation.Items.Add(new ListItem("Richardson", "Richardson"));
            ddlLocation.Items.Add(new ListItem("Southlake", "Southlake"));
            ddlLocation.Items.Add(new ListItem("Wylie", "Wylie"));
			ddlLocation.SelectedIndex = 0;
			
		}


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
            txtTeamName.Text = "";
            ddlTeams.SelectedValue = "0";

        }

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
                txtTeamName.Text = oldTeamrow.Visible ? ddlTeams.SelectedItem.Text : txtTeamName.Text;
                if (txtTeamName.Text != "" && txtTeamName.Text != "")
                {
                    Guid regID = Guid.NewGuid();
                    string orderID = PayPalHelper.GetOrderID();

                    m_bl.createTeamRegistration(regID, tournamentId, txtTeamName.Text, ddlLocation.SelectedValue,
                        txtContact1Name.Text, ddlContact1Title.SelectedValue, txtContact1Phone.Text, txtContact1Email.Text,
                        txtContact2Name.Text, ddlContact2Title.SelectedValue, txtContact2Phone.Text, txtContact2Email.Text,
                        txtComments.Text, orderID);

                    string userTeamName = txtTeamName.Text.Trim();
                    string userFees = lblFees.Text.Trim();

                    // check if any teams is configured as a student team so we will charge less money
                    // for student teams we give 50% of registration fees off. i.e. $180 instead of $240
                    string teamNames = System.Configuration.ConfigurationManager.AppSettings["StudentTeamNamesForFees"];
                    if (!string.IsNullOrEmpty(teamNames))
                    {
                        string[] teamNamesArray = teamNames.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        if (teamNamesArray != null && teamNamesArray.Length > 0)
                        { 
                            List<string> teamNameList = new List<string>(teamNamesArray);
                            if (teamNameList.Exists(item => item.Equals(userTeamName)))
                                userFees = "180";
                        }
                    }

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

            Response.Redirect("/paypal/payment.aspx");
        }


		private void SendEmail(string teamName, string toAddress)
		{
            try
            {
                string message = string.Format("This email is to confirm that we have received registration entry for your team {0} to participate in the {1}{2}{2}, Your registration is not final until you pay the regsiration fees on the website.", teamName, tournamentName, Environment.NewLine);
                MailMessage msg = new MailMessage();
                msg.Body = message;
                msg.From = "ziaq@dallascricket.net";
                msg.Bcc = "ziaq@dallascricket.net";
                msg.BodyFormat = MailFormat.Text;
                msg.Subject = string.Format("DCL: Registration confirmation for {0}", teamName);
                msg.Priority = MailPriority.Normal;
                msg.To = toAddress;
                SmtpMail.Send(msg);
            }
            catch
            {
            }
        }
		
		
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
        #endregion


        protected void chkbxNewTeam_CheckedChanged(object sender, EventArgs e)
        {
           
            CheckBox cb = (CheckBox)sender;
            oldTeamrow.Visible = !cb.Checked;
            newTeamrow.Visible = cb.Checked;
        }
    }
}
