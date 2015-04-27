using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Cricket.BAL;
using Cricket;
using Cricket.controls;
using Cricket.Common;

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for schedule_edit.
	/// </summary>
	public partial class schedule_edit : PageBaseAdmin
	{

		protected int m_nMatchId = 0;
		protected int tournamentID = 0;

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			checkSysAdmin();

			if (!IsPostBack)
			{
				m_nMatchId = toInt(Session["match_id"]);
				tournamentID = toInt(Session["tournament_id"]);

				loadData();

				ViewState["match_id"] = m_nMatchId.ToString();
				ViewState["tournament_id"] = tournamentID.ToString();
			}
			else
			{
				m_nMatchId = toInt(ViewState["match_id"]);
				tournamentID = toInt(ViewState["tournament_id"]);
			}
		}

		protected void loadData()
		{
			SqlDataReader dr = m_bl.getTeamListByTournament(tournamentID);

			ddlTeam1.DataSource = dr;
			ddlTeam1.DataTextField = "name";
			ddlTeam1.DataValueField = "team_id";
			ddlTeam1.DataBind();
			dr.Close();
		
			SqlDataReader dr1 = m_bl.getTeamListByTournament(tournamentID);
			ddlTeam2.DataSource = dr1;
			ddlTeam2.DataTextField = "name";
			ddlTeam2.DataValueField = "team_id";
			ddlTeam2.DataBind();
			dr1.Close();

            TournamentHelper.populateList(ddlUmpiringText);

            //SqlDataReader dr2 = m_bl.GetUmpiringTeams(tournamentID);
            //ddlUmpireTeam.DataSource = dr2;
            //ddlUmpireTeam.DataTextField = "name";
            //ddlUmpireTeam.DataValueField = "team_id";
            //ddlUmpireTeam.DataBind();
            //dr2.Close();

            //SqlDataReader dr21 = m_bl.GetUmpiringTeams(tournamentID);
            //ddlUmpireTeam2.DataSource = dr21;
            //ddlUmpireTeam2.DataTextField = "name";
            //ddlUmpireTeam2.DataValueField = "team_id";
            //ddlUmpireTeam2.DataBind();
            //dr21.Close();

            SqlDataReader dr3 = m_bl.getTeamListByTournament(tournamentID);
			ddlWinTeam.DataSource = dr3;
			ddlWinTeam.DataTextField = "name";
			ddlWinTeam.DataValueField = "team_id";
			ddlWinTeam.DataBind();
			dr3.Close();

            SqlDataReader dr4 = m_bl.GetGroundList();
			ddlGround.DataSource = dr4;
			ddlGround.DataTextField = "name";
			ddlGround.DataValueField = "ground_id";
			ddlGround.DataBind();
			dr4.Close();

			ddlTeam1.Items.Insert(0, new ListItem("select", "0"));
			ddlTeam2.Items.Insert(0, new ListItem("select", "0"));
            //ddlUmpireTeam.Items.Insert(0, new ListItem("select", "0"));
            //ddlUmpireTeam2.Items.Insert(0, new ListItem("select", "0"));
            ddlWinTeam.Items.Insert(0, new ListItem("select", "0"));
            ddlGround.Items.Insert(0, new ListItem("select", "0"));
			ddlMOM.Items.Insert(0, new ListItem("select", "0"));

            string tournamentName = string.Empty;
            DateTime endDate = DateTime.Now;
            DateTime startDate = DateTime.Now;
			dr = m_bl.getTournamentData(tournamentID);
            if (dr.Read())
            {
                tournamentName = DataReaderHelper.GetString(dr, "name");
                startDate = DataReaderHelper.GetDateTime(dr, "start_dt");
                endDate = DataReaderHelper.GetDateTime(dr, "end_dt");
            }
			dr.Close();

			ddlTournament.Items.Insert(0, new ListItem(tournamentName, tournamentID.ToString()));

			MatchTypeCd.populateList(ref ddlTypecd);

            if (endDate <= startDate)
                endDate = startDate.AddDays(30);

            string strDate = "";
            DateTime dt = startDate;
            int totalDays = (int)endDate.Subtract(startDate).TotalDays;
            int displayWeekendsOnly = toInt(System.Configuration.ConfigurationManager.AppSettings["DisplayWeekendsOnlyforScheduleEntry"]);

            for (int i = 0; i < totalDays; i++)
            {
                if (displayWeekendsOnly == 0 || dt.DayOfWeek == DayOfWeek.Saturday || dt.DayOfWeek == DayOfWeek.Sunday)
                {
                    strDate = dt.ToShortDateString();
                    ddlMatchDt.Items.Add(new ListItem(strDate + " " + dt.DayOfWeek.ToString(), strDate));
                }
                dt = dt.AddDays(1);
            }

			if (m_nMatchId > 0)
			{
                int nTeam1Id = 0;
                int nTeam2Id = 0;
                dr = m_bl.getMatchData(m_nMatchId);
				if (dr.Read())
				{
                    int nUmpiringTeamId = 0;
                    int nUmpiringTeamId2 = 0;
                    int nWinningTeamId = 0;
					int nMatchTypeCd = 0;
					DateTime dtMatchDate = DateTime.Now;
					int nGroundId = 0;
					string strResult = "";
					string startTime = "";
					string endTime = "";
                    string umpiringText = string.Empty;
					int nMOMPlayerId = 0;

					if (!dr.IsDBNull(dr.GetOrdinal("team1_id")))
						nTeam1Id = toInt(dr["team1_id"]);
					if (!dr.IsDBNull(dr.GetOrdinal("team2_id")))
						nTeam2Id = toInt(dr["team2_id"]);
                    if (!dr.IsDBNull(dr.GetOrdinal("umpiring_team_id")))
                        nUmpiringTeamId = toInt(dr["umpiring_team_id"]);
                    if (!dr.IsDBNull(dr.GetOrdinal("umpiring_team2_id")))
                        nUmpiringTeamId2 = toInt(dr["umpiring_team2_id"]);
                    if (!dr.IsDBNull(dr.GetOrdinal("winning_team_id")))
						nWinningTeamId = toInt(dr["winning_team_id"]);
					if (!dr.IsDBNull(dr.GetOrdinal("type_cd")))
						nMatchTypeCd = toInt(dr["type_cd"]);
					if (!dr.IsDBNull(dr.GetOrdinal("match_dt")))
						dtMatchDate = (DateTime) dr["match_dt"];
					if (!dr.IsDBNull(dr.GetOrdinal("ground_id")))
						nGroundId = toInt(dr["ground_id"]);
					if (!dr.IsDBNull(dr.GetOrdinal("result")))
						strResult = dr["result"].ToString();
					if (!dr.IsDBNull(dr.GetOrdinal("mom_player_id")))
						nMOMPlayerId = toInt(dr["mom_player_id"]);
					if (!dr.IsDBNull(dr.GetOrdinal("start_time")))
						startTime = dr["start_time"].ToString();
					if (!dr.IsDBNull(dr.GetOrdinal("end_time")))
						endTime = dr["end_time"].ToString();
                    if (!dr.IsDBNull(dr.GetOrdinal("umpiring_text")))
                        umpiringText = dr["umpiring_text"].ToString();

                    if (!dr.IsDBNull(dr.GetOrdinal("umpire1")))
                        txtUmpire1.Text = dr["umpire1"].ToString();
                    if (!dr.IsDBNull(dr.GetOrdinal("umpire2")))
                        txtUmpire2.Text = dr["umpire2"].ToString();
                    if (!dr.IsDBNull(dr.GetOrdinal("supervisor1")))
                        txtSupervisor1.Text = dr["supervisor1"].ToString();
                    if (!dr.IsDBNull(dr.GetOrdinal("supervisor2")))
                        txtSupervisor2.Text = dr["supervisor2"].ToString();


					//todo: type sw and others
					ListItem item = ddlTeam1.Items.FindByValue(nTeam1Id.ToString());
					if (item != null) item.Selected = true;
					item = ddlTeam2.Items.FindByValue(nTeam2Id.ToString());
                    //if (item != null) item.Selected = true;
                    //item = ddlUmpireTeam.Items.FindByValue(nUmpiringTeamId.ToString());
                    //if (item != null) item.Selected = true;
                    //item = ddlUmpireTeam2.Items.FindByValue(nUmpiringTeamId2.ToString());
                    if (item != null) item.Selected = true;
                    item = ddlWinTeam.Items.FindByValue(nWinningTeamId.ToString());
					if (item != null) item.Selected = true;
					item = ddlGround.Items.FindByValue(nGroundId.ToString());
					if (item != null) item.Selected = true;
					item = ddlMOM.Items.FindByValue(nMOMPlayerId.ToString());
					if (item != null) item.Selected = true;
					item = ddlMatchDt.Items.FindByValue(dtMatchDate.ToShortDateString());
					if (item != null) item.Selected = true;
					item = ddlTypecd.Items.FindByValue(nMatchTypeCd.ToString());
					if (item != null) item.Selected = true;

                    if (!string.IsNullOrEmpty(umpiringText))
                    {
                        ListItem item1 = ddlUmpiringText.Items.FindByText(umpiringText);
                        if (item1 != null)
                            item1.Selected = true;
                    }

                    txtResult.Text = strResult;
					txtStartTime.Text = startTime;
					txtEndTime.Text = endTime;
				}
				dr.Close();

				lblMatchId.Text = m_nMatchId.ToString();

                if (DateTime.Now >= endDate.AddDays(7))
                    btnSubmit.Enabled = false;

                //Note: This update will not be allowed if the match scores have already been entered
                if (m_bl.CheckMatchStatsExists(m_nMatchId, nTeam1Id) || m_bl.CheckMatchStatsExists(m_nMatchId, nTeam2Id))
                    btnSubmit.Enabled = false;

			}
			else
			{
				lblMatchId.Text = "New Match";

				ddlTeam1.Items.FindByText("select").Selected = true;
				ddlTeam2.Items.FindByText("select").Selected = true;
				//ddlUmpireTeam.Items.FindByText("select").Selected = true;
				ddlWinTeam.Items.FindByText("select").Selected = true;
				ddlGround.Items.FindByText("select").Selected = true;

				txtStartTime.Text = "8:00 AM";
				txtEndTime.Text = "12:00 PM";
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

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
                string umpiringText = "";
                //if (toInt(ddlUmpireTeam.SelectedValue) <= 0)
                //{
                //    // alrite we do not have the umpire team id so check if the umpire text value was selected
                //    if (toInt(ddlUmpiringText.SelectedValue) > 0)
                //        umpiringText = ddlUmpiringText.SelectedItem.Text;
                //}

                if (txtUmpire1.Text == "" && txtUmpire2.Text == "")
                    umpiringText = ddlUmpiringText.SelectedItem.Text;


                if (m_nMatchId > 0)
                {
                    //Note: This update will not be allowed if the match scores have already been entered

                    m_bl.setMatch(m_nMatchId, toInt(ddlTournament.SelectedValue), toInt(ddlTeam1.SelectedValue), toInt(ddlTeam2.SelectedValue), 0, toInt(ddlWinTeam.SelectedValue), toInt(ddlTypecd.SelectedValue), DateTime.Parse(ddlMatchDt.SelectedValue), toInt(ddlGround.SelectedValue), txtResult.Text, toInt(ddlMOM.SelectedValue), m_nTournamentMatchOvers, txtStartTime.Text, txtEndTime.Text, umpiringText, 0, txtUmpire1.Text, txtUmpire2.Text, txtSupervisor1.Text, txtSupervisor2.Text);
                }
                else
                    m_bl.addMatch(toInt(ddlTournament.SelectedValue), toInt(ddlTeam1.SelectedValue), toInt(ddlTeam2.SelectedValue), 0, toInt(ddlWinTeam.SelectedValue), toInt(ddlTypecd.SelectedValue), DateTime.Parse(ddlMatchDt.SelectedValue), toInt(ddlGround.SelectedValue), txtResult.Text, toInt(ddlMOM.SelectedValue), txtStartTime.Text, txtEndTime.Text, umpiringText, 0, txtUmpire1.Text, txtUmpire2.Text, txtSupervisor1.Text, txtSupervisor2.Text);

                Server.Transfer("schedule.aspx?tournamentID=" + tournamentID.ToString());
			}
		}

		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
            Server.Transfer("schedule.aspx?tournamentID=" + tournamentID.ToString());
		}

	}
}

