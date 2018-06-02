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

namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for match_score.
	/// </summary>
	public partial class match_score : PageBaseTournament
	{
	

		protected int			m_nMatchId;

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				m_nMatchId = toInt(Session["match_id"]);
				if (m_nMatchId <= 0)
					Server.Transfer("matches.aspx");

				loadData();
			}
		}

		protected void loadData()
		{
			int nTeam1Id = 0;
			int nTeam2Id = 0;

            // display in hidden label
            lblMatchID.Text = m_nMatchId.ToString();

			//Match details
			SqlDataReader dr = m_bl.getMatchData(m_nMatchId);
			if (dr.Read())
			{

                string umpiringText = "";
                string umpiringText1 = dr["umpiring_team"] as string;
                string umpiringText2 = dr["umpiring_team2"] as string;
                if (string.IsNullOrEmpty(umpiringText1) && string.IsNullOrEmpty(umpiringText2))
                {
                    umpiringText = dr["umpiring_text"] as string;
                }
                else
                {
                    if (string.IsNullOrEmpty(umpiringText1))
                        umpiringText = umpiringText2;
                    else if (string.IsNullOrEmpty(umpiringText2))
                        umpiringText = umpiringText1;
                    else
                        umpiringText = umpiringText1 + " / " + umpiringText2;
                }


				string strMatchDate;
				strMatchDate = dr["match_dt"].ToString();
				lblHomeTeam.Text = dr["team1"].ToString();
				lblVisitingTeam.Text = dr["team2"].ToString();
				lblWinningTeam.Text = dr["winning_team"].ToString();
                lblUmpiringTeam.Text = umpiringText;
				lblResult.Text = dr["result"].ToString();
				lblGround.Text = dr["ground"].ToString();
				lblMOM.Text = "";
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

			int nInning1TeamId = 0;
			int nInning2TeamId = 0;
			int nInningNo = m_bl.getMatchInningNo(m_nMatchId, nTeam1Id);
			if (nInningNo < 2)
			{
				nInning1TeamId = nTeam1Id;
				nInning2TeamId = nTeam2Id;
				lblTeamName1.Text = lblHomeTeam.Text;
				lblTeamName2.Text = lblVisitingTeam.Text;
			}
			else
			{
				nInning1TeamId = nTeam2Id;
				nInning2TeamId = nTeam1Id;
				lblTeamName1.Text = lblVisitingTeam.Text;
				lblTeamName2.Text = lblHomeTeam.Text;
			}


			//Inning1 details
			dr = m_bl.getMatchBattingData(m_nMatchId, nInning1TeamId);
			dgrid_batting.DataSource = dr;
			dgrid_batting.DataBind();
			dr.Close();

			dr = m_bl.getMatchStats(m_nMatchId, nInning1TeamId);
			dgrid_summary.DataSource = dr;
			dgrid_summary.DataBind();
			dr.Close();

			dr = m_bl.getMatchBowlingData(m_nMatchId, nInning1TeamId);
			dgrid_bowling2.DataSource = dr;
			dgrid_bowling2.DataBind();
			dr.Close();

			//Inning2 details
			dr = m_bl.getMatchBattingData(m_nMatchId, nInning2TeamId);
			dgrid_batting2.DataSource = dr;
			dgrid_batting2.DataBind();
			dr.Close();

			dr = m_bl.getMatchStats(m_nMatchId, nInning2TeamId);
			dgrid_summary2.DataSource = dr;
			dgrid_summary2.DataBind();
			dr.Close();

			dr = m_bl.getMatchBowlingData(m_nMatchId, nInning2TeamId);
			dgrid_bowling.DataSource = dr;
			dgrid_bowling.DataBind();
			dr.Close();
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
			this.dgrid_batting.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_batting_ItemDataBound);
			this.dgrid_batting2.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_batting2_ItemDataBound);

		}
		#endregion

		protected void btnReturn_Click(object sender, System.EventArgs e)
		{
			Server.Transfer("matches.aspx");
		}

		private void dgrid_batting_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				if (e.Item.Cells[2].Text == "1")
					e.Item.Cells[3].Text += " " + PlayerTypeCd.getShortText(toInt(e.Item.Cells[2].Text));
				if (e.Item.Cells[5].Text.Length == 1)
					e.Item.Cells[5].Text += "&nbsp;";
				if (e.Item.Cells[6].Text.Length == 1)
					e.Item.Cells[6].Text += "&nbsp;";
			}
		}

		private void dgrid_batting2_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				if (e.Item.Cells[2].Text == "1")
					e.Item.Cells[3].Text += " " + PlayerTypeCd.getShortText(toInt(e.Item.Cells[2].Text));
				if (e.Item.Cells[5].Text.Length == 1)
					e.Item.Cells[5].Text += "&nbsp;";
				if (e.Item.Cells[6].Text.Length == 1)
					e.Item.Cells[6].Text += "&nbsp;";

			}
		}


	}
}
