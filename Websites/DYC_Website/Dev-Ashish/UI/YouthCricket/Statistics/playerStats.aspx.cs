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

namespace Cricket.Statistics
{
	/// <summary>
	/// Summary description for playerStats.
	/// </summary>
	public partial class playerStats : PageBaseTournament
	{
		protected System.Web.UI.WebControls.Label lblComments;
	
		protected int		m_nPlayerId = 0;
		protected string	m_strBackUrl = "";

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				m_nPlayerId = toInt(Session["player_id"]);
				m_strBackUrl = Session["back_url"].ToString();
				if (m_nPlayerId <= 0)
					Server.Transfer("teamStats.aspx");

				loadData();

				ViewState["back_url"] = m_strBackUrl;
			}
			else
				m_strBackUrl = (string) ViewState["back_url"];
		}

		protected void loadData()
		{
			SqlDataReader dr = m_bl.getPlayerData(m_nPlayerId);
			if (dr.Read())
			{
				int nKeeperSw = 0;
				string strFirstName, strLastName, strPhotoURL;
				strFirstName = dr["first_name"].ToString();
				strLastName = dr["last_name"].ToString();
				lblTeamName.Text = "(" + dr["name"].ToString() + ")";
				lblBattingStyle.Text = dr["batting_style"].ToString();
				lblBowlingStyle.Text = dr["bowling_style"].ToString();
				lblBattingPosition.Text = dr["batting_position"].ToString();
				nKeeperSw = toInt(dr["keeper_sw"]);
				lblStartDate.Text = dr["start_dt"].ToString();
				lblEndDate.Text = dr["end_dt"].ToString();
				//lblComments.Text = dr["comments"].ToString();
				strPhotoURL = dr["photo_url"].ToString();

				lblName.Text = strFirstName.ToUpper() + " " + strLastName.ToUpper();
				lblWicketKeeper.Text = (nKeeperSw > 0)? "Yes" : "No";

				if (strPhotoURL.Length > 0)
					imgPlayer.ImageUrl = "../photos/" + strPhotoURL;
			}
			dr.Close();

			//set the batting stats 
			dr = m_bl.getPlayerBattingStats(tournamentId, m_nPlayerId);
			if (dr.Read())
			{
				lblMatches.Text = dr["matches"].ToString();
				lblInnings.Text = dr["innings"].ToString();
				lblNotOuts.Text = dr["not_outs"].ToString();
				lblRuns.Text = dr["runs"].ToString();
				lblHighest.Text = dr["highest"].ToString();
				float flAverage = toFloat(dr["average"]);
				float flStrikeRate = toFloat(dr["strike_rate"]);
				lbl100.Text = dr["hundred"].ToString();
				lbl50.Text = dr["fifty"].ToString();
				lblFour.Text = dr["four"].ToString();
				lblSix.Text = dr["six"].ToString();
				lblDuck.Text = dr["duck"].ToString();

				lblAverage.Text = flAverage.ToString("##0.00");
				lblStrikeRate.Text = flStrikeRate.ToString("##0.00");
			}
			dr.Close();
			
			//set the bowling stats 
			dr = m_bl.getPlayerBowlingStats(tournamentId, m_nPlayerId);
			if (dr.Read())
			{
				lblMatches2.Text = dr["matches"].ToString();
				lblInnings2.Text = dr["innings"].ToString();
				float flOvers = toFloat(dr["overs"]);
				lblWickets.Text = dr["wickets"].ToString();
				lblRuns2.Text = dr["runs"].ToString();
				float flAverage = toFloat(dr["average"]);
				lblBest.Text = dr["best"].ToString();
				float flEconomyRate = toFloat(dr["economy_rate"]);

				lblOvers.Text = flOvers.ToString("##0.0");
				lblEconomyRate.Text = flEconomyRate.ToString("##0.00");
				lblAverage2.Text = flAverage.ToString("##0.00");
			}
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

		}
		#endregion

		protected void btnReturn_Click(object sender, System.EventArgs e)
		{
			Server.Transfer(m_strBackUrl);
		}

	}

}
