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

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for match_bowling.
	/// </summary>
	public partial class match_bowling : PageBaseAdmin
	{
		protected System.Web.UI.WebControls.Label lblTeam;
		protected System.Web.UI.WebControls.TextBox txtMinutes;
	
		protected int		m_nMatchId = 0;
		protected int		m_nInningNo = 0;
		protected int		m_nPlayerId = 0;
		protected int		m_nBattingTeamId = 0;
		protected int		m_nBowlingTeamId = 0;

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				m_nMatchId = toInt(Session["match_id"]);
				m_nInningNo = toInt(Session["inning_no"]);
				m_nPlayerId = toInt(Session["player_id"]);
				m_nBattingTeamId = toInt(Session["batting_team_id"]);
				m_nBowlingTeamId = toInt(Session["bowling_team_id"]);
				
				loadData();

				ViewState["match_id"] = m_nMatchId;
				ViewState["batting_team_id"] = m_nBattingTeamId;
				ViewState["bowling_team_id"] = m_nBowlingTeamId;
				ViewState["player_id"] = m_nPlayerId;
			}
			else
			{
				m_nMatchId = (int) ViewState["match_id"];
				m_nBattingTeamId = (int) ViewState["batting_team_id"];
				m_nBowlingTeamId = (int) ViewState["bowling_team_id"];
				m_nPlayerId = (int) ViewState["player_id"];
			}
		}

		protected void loadData()
		{
			string strPlayerName = "";
			SqlDataReader dr;

			if (m_nMatchId > 0)
			{
				lblMatchId.Text = m_nMatchId.ToString();
				lblInning.Text = m_nInningNo.ToString();

                lblBattingTeam.Text = m_bl.getTeamName(m_nBattingTeamId);
                lblBowlingTeam.Text = m_bl.getTeamName(m_nBowlingTeamId);

				dr = m_bl.getMatchBowlingData(m_nMatchId, m_nBowlingTeamId);
				dgrid_bowling.DataSource = dr;
				dgrid_bowling.DataBind();
				dr.Close();
			}

			if (m_nPlayerId > 0)
			{
				dr = m_bl.getMatchPlayerBowlingData(m_nMatchId, m_nBowlingTeamId, m_nPlayerId);
				if (dr.Read())
				{
					strPlayerName = dr["name"].ToString();
					float flOvers = toFloat(dr["overs"]);
					txtMaiden.Text = dr["maiden"].ToString();
					txtRuns.Text = dr["runs"].ToString();
					txtWickets.Text = dr["wickets"].ToString();
					txtWides.Text = dr["wide_balls"].ToString();
					txtNos.Text = dr["no_balls"].ToString();
					
					txtOvers.Text = flOvers.ToString("##0.0");
				}
				dr.Close();

				ddlPlayer.Items.Add(new ListItem(strPlayerName, m_nPlayerId.ToString()));
				btnCancel.Visible = true;
				btnSubmit.Enabled = true;

				lblBowlerStatus.Text = "EDIT Bowler statistics:";

			}
			else
			{
				lblBowlerStatus.Text = "ADD New Bowler Statistics:";

				dr = m_bl.getMatchBowlingPlayerList(m_nMatchId, m_nBowlingTeamId);
				ddlPlayer.DataSource = dr;
				ddlPlayer.DataTextField = "name";
				ddlPlayer.DataValueField = "player_id";
				ddlPlayer.DataBind();
				dr.Close();

				btnCancel.Visible = false;
				btnSubmit.Enabled = true;
				if (dgrid_bowling.Items.Count >= 11)
					btnSubmit.Enabled = false;
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
			this.dgrid_bowling.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_bowling_ItemCommand);
			this.dgrid_bowling.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_bowling_ItemDataBound);

		}
		#endregion

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
				if (ddlPlayer.Items.Count <= 0)
					Server.Transfer("match_bowling.aspx");

				int nPlayerId = toInt(ddlPlayer.SelectedItem.Value);
				float flMatchOvers = toFloat(txtOvers.Text);
				int nMatchMaiden = toInt(txtMaiden.Text);
				int nMatchRuns = toInt(txtRuns.Text);
				int nMatchWickets = toInt(txtWickets.Text);
				int nMatchWides = toInt(txtWides.Text);
				int nMatchNos = toInt(txtNos.Text);

				//save match details
				if (m_nPlayerId > 0)
				{
					m_bl.setMatchBowling(false, m_nTournamentId, m_nMatchId, m_nBowlingTeamId, nPlayerId, flMatchOvers, nMatchMaiden, nMatchRuns, nMatchWickets, nMatchWides, nMatchNos);
				}
				else
				{
					if (dgrid_bowling.Items.Count < 11)
						m_bl.setMatchBowling(true, m_nTournamentId, m_nMatchId, m_nBowlingTeamId, nPlayerId, flMatchOvers, nMatchMaiden, nMatchRuns, nMatchWickets, nMatchWides, nMatchNos);
				}

				Session["player_id"] = "";
				Server.Transfer("match_bowling.aspx");
			}
		}


		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
			Session["player_id"] = "";
			Server.Transfer("match_bowling.aspx");
		}

		private void dgrid_bowling_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "Edit")
			{
				Session["player_id"] = e.Item.Cells[0].Text;
				Server.Transfer("match_bowling.aspx");
			}
			else if (e.CommandName == "Delete")
			{
				int nPlayerId = toInt(e.Item.Cells[0].Text);
				m_bl.deletePlayerBowling(m_nTournamentId, m_nMatchId, nPlayerId);

				Session["player_id"] = "";
				Server.Transfer("match_bowling.aspx");
			}
		}

		protected void btnReturn_Click(object sender, System.EventArgs e)
		{
			Session["player_id"] = "";
			Server.Transfer("match_score.aspx");
		}

		protected void btnMatchList_Click(object sender, System.EventArgs e)
		{
			Session["player_id"] = "";
            Server.Transfer("matches.aspx");
		}

		private void dgrid_bowling_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				if (e.Item.Cells[0].Text == m_nPlayerId.ToString())
					e.Item.BackColor = Color.LightYellow;
			}
		}
	}
}
