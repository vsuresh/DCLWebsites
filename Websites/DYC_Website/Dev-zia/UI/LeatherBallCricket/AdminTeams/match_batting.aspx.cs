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
	/// Summary description for match_batting.
	/// </summary>
	public partial class match_batting : PageBaseAdmin
	{
	
		protected System.Web.UI.WebControls.Button btnAddBatsman;

		protected int		m_nMatchId = 0;
		protected int		m_nInningNo = 0;
		protected int		m_nPlayerId = 0;
		protected int		m_nBattingTeamId = 0;
		protected int		m_nBowlingTeamId = 0;
		protected int		m_nTotalRuns = 0;
		protected int		tournamentId = 0;

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				m_nMatchId = toInt(Session["match_id"]);
				m_nBattingTeamId = toInt(Session["batting_team_id"]);
				m_nBowlingTeamId = toInt(Session["bowling_team_id"]);
				m_nInningNo = toInt(Session["inning_no"]);
				m_nPlayerId = toInt(Session["player_id"]);
                tournamentId = toInt(Session["tournament_id"]);
				
				loadData();

				ViewState["match_id"] = m_nMatchId;
				ViewState["batting_team_id"] = m_nBattingTeamId;
				ViewState["bowling_team_id"] = m_nBowlingTeamId;
                ViewState["player_id"] = m_nPlayerId;
                ViewState["tournament_id"] = tournamentId;
            }
			else
			{
				m_nMatchId = (int) ViewState["match_id"];
				m_nBattingTeamId = (int) ViewState["batting_team_id"];
				m_nBowlingTeamId = (int) ViewState["bowling_team_id"];
                m_nPlayerId = (int)ViewState["player_id"];
                tournamentId = (int)ViewState["tournament_id"];
            }
		}

		protected void loadData()
		{
			string strPlayerName = "";
			SqlDataReader dr;

			//load the status combo box
			BattingStatus.populateList(ref ddlStatus);

			dr = m_bl.getPlayerSortedList(m_nBowlingTeamId);
			ddlFielder.DataSource = dr;
			ddlFielder.DataTextField = "name";
			ddlFielder.DataValueField = "player_id";
			ddlFielder.DataBind();
			ddlFielder.Items.Insert(0, new ListItem("select", "0"));
			ddlFielder.Items.FindByValue("0").Selected = true;
			dr.Close();

			dr = m_bl.getPlayerSortedList(m_nBowlingTeamId);
			ddlBowler.DataSource = dr;
			ddlBowler.DataTextField = "name";
			ddlBowler.DataValueField = "player_id";
			ddlBowler.DataBind();
			ddlBowler.Items.Insert(0, new ListItem("select", "0"));
			ddlBowler.Items.FindByValue("0").Selected = true;
			dr.Close();

			if (m_nMatchId > 0)
			{
				lblMatchId.Text = m_nMatchId.ToString();
				lblInning.Text = m_nInningNo.ToString();

                lblBattingTeam.Text = m_bl.getTeamName(m_nBattingTeamId);
                lblBowlingTeam.Text = m_bl.getTeamName(m_nBowlingTeamId);
                
				dr = m_bl.getMatchBattingData(m_nMatchId, m_nBattingTeamId);
				dgrid_batting.DataSource = dr;
				dgrid_batting.DataBind();
				dr.Close();
			}

			if (m_nPlayerId > 0)
			{
				dr = m_bl.getMatchPlayerBattingData(m_nMatchId, m_nBattingTeamId, m_nPlayerId);
				if (dr.Read())
				{
					string strStatus;
					strPlayerName = dr["name"].ToString();
					strStatus = dr["status"].ToString();
					txtRuns.Text = dr["runs"].ToString();
					txtBalls.Text = dr["balls"].ToString();
					txtFour.Text = dr["four"].ToString();
					txtSix.Text = dr["six"].ToString();

					int nFielderId = toInt(dr["fielder_id"]);
					int nBowlerId = toInt(dr["bowler_id"]);

					ListItem item = ddlStatus.Items.FindByText(strStatus);
					if (item != null)
						item.Selected = true;

					ddlFielder.SelectedItem.Selected = false;
					item = ddlFielder.Items.FindByValue(nFielderId.ToString());
					if (item != null)
						item.Selected = true;

					ddlBowler.SelectedItem.Selected = false;
					item = ddlBowler.Items.FindByValue(nBowlerId.ToString());
					if (item != null)
						item.Selected = true;
				}
				dr.Close();

				ddlPlayer.Items.Add(new ListItem(strPlayerName, m_nPlayerId.ToString()));

				btnCancel.Visible = true;
				btnSubmit.Enabled = true;

				lblBatsmanStatus.Text = "EDIT Batsman statistics:";
			}
			else
			{
				lblBatsmanStatus.Text = "ADD New Batsman Statistics:";

				dr = m_bl.getMatchBattingPlayerList(m_nMatchId, m_nBattingTeamId);
				ddlPlayer.DataSource = dr;
				ddlPlayer.DataTextField = "name";
				ddlPlayer.DataValueField = "player_id";
				ddlPlayer.DataBind();
				dr.Close();

				btnCancel.Visible = false;
				btnSubmit.Enabled = true;
				if (dgrid_batting.Items.Count >= 11)
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
			this.dgrid_batting.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_batting_ItemCommand);
			this.dgrid_batting.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_batting_ItemDataBound);

		}
		#endregion

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
				if (ddlPlayer.Items.Count <= 0)
					Server.Transfer("match_batting.aspx");

				int nPlayerId = toInt(ddlPlayer.SelectedItem.Value);
				string strMatchStatus = ddlStatus.SelectedItem.Text;
				int nFielderId = toInt(ddlFielder.SelectedItem.Value);
				int nBowlerId = toInt(ddlBowler.SelectedItem.Value);
				int nMatchRuns = toInt(txtRuns.Text);
				int nMatchBalls = toInt(txtBalls.Text);
				int nMatchFours = toInt(txtFour.Text);
				int nMatchSixes = toInt(txtSix.Text);
				
				//if balls are not available. then make it same as runs so that strike rate would not be sky high
				if (nMatchBalls <= 0)
					nMatchBalls = nMatchRuns;

				//calculate the strike rate
				float fStrikeRate = 0;
				if (nMatchBalls > 0)
					fStrikeRate = ((float) nMatchRuns / (float) nMatchBalls) * (float) 100;

				//set match details
				if (m_nPlayerId > 0)
				{
                    m_bl.setMatchBatting(false, tournamentId, m_nMatchId, m_nBattingTeamId, nPlayerId, strMatchStatus, nFielderId, nBowlerId, nMatchRuns, nMatchBalls, fStrikeRate, nMatchFours, nMatchSixes);
				}
				else
				{
					if (dgrid_batting.Items.Count < 11)
                        m_bl.setMatchBatting(true, tournamentId, m_nMatchId, m_nBattingTeamId, nPlayerId, strMatchStatus, nFielderId, nBowlerId, nMatchRuns, nMatchBalls, fStrikeRate, nMatchFours, nMatchSixes);
				}

				Session["player_id"] = "";
				Server.Transfer("match_batting.aspx");
			}
		}

		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
			Session["player_id"] = "";
			Server.Transfer("match_batting.aspx");
		}

		private void dgrid_batting_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "Edit")
			{
				e.Item.BackColor = Color.LightYellow;
				Session["player_id"] = e.Item.Cells[0].Text;
				Server.Transfer("match_batting.aspx");
			}
			else if (e.CommandName == "Delete")
			{
				int nPlayerId = toInt(e.Item.Cells[0].Text);
                m_bl.deletePlayerBatting(tournamentId, m_nMatchId, nPlayerId);

				Session["player_id"] = "";
				Server.Transfer("match_batting.aspx");
			}
		}

		private void dgrid_batting_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				m_nTotalRuns += toInt(e.Item.Cells[7].Text);
				lblTotalRuns.Text = m_nTotalRuns.ToString();

				if (e.Item.Cells[2].Text == "1")
					e.Item.Cells[3].Text += " " + PlayerTypeCd.getShortText(toInt(e.Item.Cells[2].Text));
				if (e.Item.Cells[5].Text.Length == 1)
					e.Item.Cells[5].Text += "&nbsp;";
				if (e.Item.Cells[6].Text.Length == 1)
					e.Item.Cells[6].Text += "&nbsp;";

				if (e.Item.Cells[0].Text == m_nPlayerId.ToString())
					e.Item.BackColor = Color.LightYellow;

				float flStrikeRate = toFloat(e.Item.Cells[9].Text);
				e.Item.Cells[9].Text = flStrikeRate.ToString("##0.00");


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

	}
}
