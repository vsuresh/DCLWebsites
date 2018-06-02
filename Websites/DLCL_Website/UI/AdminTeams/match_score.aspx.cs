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
using Cricket;
using Cricket.Common;

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for match_score.
	/// </summary>
	public partial class match_score : PageBaseAdmin
	{

        protected int matchId = 0;
        protected int tournamentId = 0;

        // todo: get this and use this instead of the pagebase on
        // to make this page independent off the current tournament since sometimes we allow updates to old tournament matches
        protected int tournamentMatchOvers = 0;

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				matchId = toInt(Session["match_id"]);

				loadData();

                ViewState["match_id"] = matchId;
                ViewState["tournament_id"] = tournamentId;
            }
			else
			{
                matchId = (int)ViewState["match_id"];
                tournamentId = (int)ViewState["tournament_id"];
            }
		}

		protected void loadData()
		{
			int	nTeam1Id = 0;
			int	nTeam2Id = 0;
			int nWinningTeamId = 0;
			string strTeam1Name = "", strTeam2Name = "";
			SqlDataReader dr;

			txtTotalMatchOvers.Text = m_nTournamentMatchOvers.ToString();
			if (IsSysAdmin() || Request.QueryString["sysadmin"] == "1")
				txtTotalMatchOvers.Enabled = true;
			else
				txtTotalMatchOvers.Enabled = false;

			dr = m_bl.getMatchData(matchId);
			if (dr.Read())
			{
				string strMatchDate;
				lblMatchId.Text = matchId.ToString();
				strMatchDate = dr["match_dt"].ToString();
				nWinningTeamId = toInt(dr["winning_team_id"]);
				txtResult.Text = dr["result"].ToString();

                tournamentId = toInt(dr["tournament_id"]);

				nTeam1Id = toInt(dr["team1_id"]);
				nTeam2Id = toInt(dr["team2_id"]);

				//display only the date part
				if (strMatchDate.Length > 0)
				{
					DateTime dtMatchDate = DateTime.Parse(strMatchDate);
					lblMatchDate.Text = dtMatchDate.ToShortDateString();
				}
			}
			dr.Close();

            if (tournamentId == 0)
                throw new Exception("Invalid match id specified!");

			int nTeam1Inning = 0;
			int nTeam2Inning = 0;
			dr = m_bl.getMatchStats(matchId, nTeam1Id);
			if (dr.Read())
			{
				strTeam1Name = dr["name"].ToString();
				nTeam1Inning = toInt(dr["inning_sw"]);
				setInningsData(dr, nTeam1Inning);
			}
			dr.Close();

			dr = m_bl.getMatchStats(matchId, nTeam2Id);
			if (dr.Read())
			{
				strTeam2Name = dr["name"].ToString();
				nTeam2Inning = toInt(dr["inning_sw"]);
				setInningsData(dr, nTeam2Inning);
			}
			dr.Close();

			lblTeams.Text = strTeam1Name + " vs " + strTeam2Name;

			ddlWinningTeam.Items.Add(new ListItem("Select", MatchStatus.NotPlayed.ToString()));
			ddlWinningTeam.Items.Add(new ListItem(strTeam1Name, nTeam1Id.ToString()));
			ddlWinningTeam.Items.Add(new ListItem(strTeam2Name, nTeam2Id.ToString()));
			ddlWinningTeam.Items.Add(new ListItem("Match Tied", MatchStatus.Tied.ToString()));

			ListItem item = ddlWinningTeam.Items.FindByValue(nWinningTeamId.ToString());
			if (item != null)
				item.Selected = true;

			ddlInning1.Items.Add(new ListItem(strTeam1Name, nTeam1Id.ToString()));
			ddlInning1.Items.Add(new ListItem(strTeam2Name, nTeam2Id.ToString()));
			ddlInning2.Items.Add(new ListItem(strTeam2Name, nTeam2Id.ToString()));
			ddlInning2.Items.Add(new ListItem(strTeam1Name, nTeam1Id.ToString()));

			if (nTeam1Inning < 2)
			{
				ListItem item1 = ddlInning1.Items.FindByValue(nTeam1Id.ToString());
				if (item1 != null)
					item1.Selected = true;
				ListItem item2 = ddlInning2.Items.FindByValue(nTeam2Id.ToString());
				if (item2 != null)
					item2.Selected = true;
			}
			else 
			{
				ListItem item1 = ddlInning1.Items.FindByValue(nTeam2Id.ToString());
				if (item1 != null)
					item1.Selected = true;
				ListItem item2 = ddlInning2.Items.FindByValue(nTeam1Id.ToString());
				if (item2 != null)
					item2.Selected = true;
			}

		}

		public void setInningsData(SqlDataReader dr, int nInnings)
		{
			if (nInnings < 2)
			{
				txtRuns1.Text = dr["total_runs"].ToString();
				txtWickets1.Text = dr["wickets"].ToString();
				txtExtras1.Text = dr["extras"].ToString();
				txtNos1.Text = dr["nos"].ToString();
				txtWides1.Text = dr["wides"].ToString();
				txtByes1.Text = dr["byes"].ToString();
				txtOverThrow1.Text = dr["over_throw"].ToString();

				float flOvers = toFloat(dr["overs"]);
				txtOvers1.Text = flOvers.ToString("##0.0");
			}
			else
			{
				txtRuns2.Text = dr["total_runs"].ToString();
				txtWickets2.Text = dr["wickets"].ToString();
				txtExtras2.Text = dr["extras"].ToString();
				txtNos2.Text = dr["nos"].ToString();
				txtWides2.Text = dr["wides"].ToString();
				txtByes2.Text = dr["byes"].ToString();
				txtOverThrow2.Text = dr["over_throw"].ToString();

				float flOvers = toFloat(dr["overs"]);
				txtOvers2.Text = flOvers.ToString("##0.0");
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
				int nTeam1InningSw = 1;
				int nTeam2InningSw = 2;
				int	nTeam1Id = toInt(ddlInning1.SelectedItem.Value);
				int	nTeam2Id = toInt(ddlInning2.SelectedItem.Value);
				int nWinningTeamId = toInt(ddlWinningTeam.SelectedItem.Value);
				int totalMatchOvers = toInt(txtTotalMatchOvers.Text);
				if (totalMatchOvers <= 0)
					totalMatchOvers = m_nTournamentMatchOvers;

				if (nTeam1Id == nTeam2Id)
					return;
				
				m_bl.setMatchResult(matchId, nWinningTeamId, txtResult.Text);
                m_bl.setMatchStats(matchId, nTeam1Id, nTeam1InningSw, toInt(txtRuns1.Text), toInt(txtWickets1.Text), toFloat(txtOvers1.Text), toInt(txtExtras1.Text), toInt(txtNos1.Text), toInt(txtWides1.Text), toInt(txtByes1.Text), toInt(txtOverThrow1.Text));
                m_bl.setMatchStats(matchId, nTeam2Id, nTeam2InningSw, toInt(txtRuns2.Text), toInt(txtWickets2.Text), toFloat(txtOvers2.Text), toInt(txtExtras2.Text), toInt(txtNos2.Text), toInt(txtWides2.Text), toInt(txtByes2.Text), toInt(txtOverThrow2.Text));
                m_bl.setTeamStats(tournamentId, matchId, nTeam1Id, nTeam2Id, totalMatchOvers);
			}
            Server.Transfer("matches.aspx");
		}

		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
            Server.Transfer("matches.aspx");
		}

		protected void btnBatting1_Click(object sender, System.EventArgs e)
		{
			if (IsValid && matchId > 0)
			{
				Session["player_id"] = "";
				Session["batting_team_id"] = toInt(ddlInning1.SelectedItem.Value);
				Session["bowling_team_id"] = toInt(ddlInning2.SelectedItem.Value);
				Session["inning_no"] = "1";
                Session["match_id"] = matchId.ToString();
                Session["tournament_id"] = tournamentId.ToString();
                Server.Transfer("match_batting.aspx");		
			}
		}

		protected void btnBowling1_Click(object sender, System.EventArgs e)
		{
			if (IsValid && matchId > 0)
			{
				Session["player_id"] = "";
				Session["batting_team_id"] = toInt(ddlInning1.SelectedItem.Value);
				Session["bowling_team_id"] = toInt(ddlInning2.SelectedItem.Value);
				Session["inning_no"] = "1";
				Session["match_id"] = matchId.ToString();
                Session["tournament_id"] = tournamentId.ToString();
                Server.Transfer("match_bowling.aspx");		
			}
		}

		protected void btnBatting2_Click(object sender, System.EventArgs e)
		{
			if (IsValid && matchId > 0)
			{
				Session["player_id"] = "";
				Session["batting_team_id"] = toInt(ddlInning2.SelectedItem.Value);
				Session["bowling_team_id"] = toInt(ddlInning1.SelectedItem.Value);
				Session["inning_no"] = "2";
				Session["match_id"] = matchId.ToString();
                Session["tournament_id"] = tournamentId.ToString();
                Server.Transfer("match_batting.aspx");		
			}
		}

		protected void btnBowling2_Click(object sender, System.EventArgs e)
		{
			if (IsValid && matchId > 0)
			{
				Session["player_id"] = "";
				Session["batting_team_id"] = toInt(ddlInning2.SelectedItem.Value);
				Session["bowling_team_id"] = toInt(ddlInning1.SelectedItem.Value);
				Session["inning_no"] = "2";
				Session["match_id"] = matchId.ToString();
                Session["tournament_id"] = tournamentId.ToString();
                Server.Transfer("match_bowling.aspx");		
			}
		}

	}
}
