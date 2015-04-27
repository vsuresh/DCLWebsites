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

namespace Cricket.Teams
{
	/// <summary>
	/// Summary description for matches.
	/// </summary>
    public partial class tournaments : PageBaseTeam
	{
        int srno = 1;
        int finalsCount = 0;
        int semifinalsCount = 0;
        int quaterfinalsCount = 0;
        int prequarterfinalsCount = 0;
        int playoffCount = 0;
        int tournamentChampions = 0;
        int tournamentRunnerUps = 0;
        int leagueChampions = 0;
        int leagueRunnerUps = 0;
        int tournamentCount = 0;
        

        protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				loadData();
			}
		}

		protected void loadData()
		{

            using (SqlDataReader dr = m_bl.GetTeamTournaments(teamId))
            {
                dgrid_matches.DataSource = dr;
                dgrid_matches.DataBind();
                dr.Close();
            }

            showTeamMatchStatistics();
            showTeamStatistics();
        }

        private void showTeamMatchStatistics()
        {
            int tournamentCount = 0;
            int matchCount = 0;
            int matchWins = 0;
            int matchLosses = 0;

            using (SqlDataReader dr = m_bl.GetTeamStatCounts(teamId))
            {
                if (dr.Read())
                    tournamentCount = toInt(dr[0]);

                if (dr.NextResult())
                    if (dr.Read())
                        matchCount = toInt(dr[0]);

                if (dr.NextResult())
                    if (dr.Read())
                        matchWins = toInt(dr[0]);

                if (dr.NextResult())
                    if (dr.Read())
                        matchLosses = toInt(dr[0]);
            }

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("name"));
            dt.Columns.Add(new DataColumn("data"));
            dt.Rows.Add("Matches Played", matchCount);
            dt.Rows.Add("Matches Won", matchWins);
            dt.Rows.Add("Matches Lost", matchLosses);

            float ratio = (matchCount > 0) ? (float)matchWins / (float)matchCount : 0;
            dt.Rows.Add("Matches Win Ratio", ratio.ToString("0.00"));

            dgrid_stats3.DataSource = dt;
            dgrid_stats3.DataBind();
        }

        private void showTeamStatistics()
        {

            tournamentCount = dgrid_matches.Items.Count;
            playoffCount = finalsCount + semifinalsCount + quaterfinalsCount + prequarterfinalsCount;

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("name"));
            dt.Columns.Add(new DataColumn("data"));
            dt.Rows.Add("Tournament Played", tournamentCount);
            dt.Rows.Add("Tournament Champions", tournamentChampions);
            dt.Rows.Add("Tournament RunnerUps ", tournamentRunnerUps);
            dt.Rows.Add("League Champions", leagueChampions);
            dt.Rows.Add("League RunnerUps", leagueRunnerUps);
            dgrid_stats.DataSource = dt;
            dgrid_stats.DataBind();

            DataTable dt2 = new DataTable();
            dt2.Columns.Add(new DataColumn("name"));
            dt2.Columns.Add(new DataColumn("data"));
            dt2.Rows.Add("PlayOff Appearance", playoffCount);
            dt2.Rows.Add("Finals Appearance", finalsCount);
            dt2.Rows.Add("SemiFinals Appearance", semifinalsCount);
            dt2.Rows.Add("QuaterFinals Appearance", quaterfinalsCount);
            dt2.Rows.Add("Pre-QuaterFinals Appearance", prequarterfinalsCount);
            dgrid_stats2.DataSource = dt2;
            dgrid_stats2.DataBind();        
        }
        public void dgrid_matches_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
                DateTime dt = DateTime.MinValue;
                DateTime.TryParse(e.Item.Cells[3].Text, out dt);
                e.Item.Cells[3].Text = dt.ToShortDateString();
                DateTime.TryParse(e.Item.Cells[4].Text, out dt);
                e.Item.Cells[4].Text = dt.ToShortDateString();

                e.Item.Cells[0].Text = srno.ToString();

                // add the rank to the position column
                if (e.Item.Cells[6].Text != "&nbsp;")
                {
                    // rank is available only for the league
                    e.Item.Cells[5].Text = e.Item.Cells[6].Text;

                    // calculate the counts
                    if (e.Item.Cells[6].Text == "1")
                        leagueChampions++;
                    else if (e.Item.Cells[6].Text == "2")
                        leagueRunnerUps++;
                }


                if (e.Item.Cells[7].Text != "&nbsp;")
                {
                    string matchType = MatchTypeCD.GetMatchType(toInt(e.Item.Cells[7].Text));
                    switch (matchType)
                    {
                        case "Finals":
                            finalsCount++;
                            break;
                        case "SemiFinals":
                            semifinalsCount++;
                            break;
                        case "QuaterFinals":
                            quaterfinalsCount++;
                            break;
                        case "Pre-QuaterFinals":
                            prequarterfinalsCount++;
                            break;
                    }

                    // add the last position to the position column
                    if (e.Item.Cells[5].Text == "&nbsp;")
                        e.Item.Cells[5].Text = matchType;
                }

                if (e.Item.Cells[5].Text == "Champions")
                {
                    e.Item.Cells[5].ForeColor = Color.Red;
                    e.Item.Cells[5].Font.Bold = true;
                    tournamentChampions++;
                }
                if (e.Item.Cells[5].Text == "RunnerUp")
                {
                    e.Item.Cells[5].ForeColor = Color.Blue;
                    e.Item.Cells[5].Font.Bold = true;
                    tournamentRunnerUps++;
                }

                srno++;

			}
		}

		public void dgrid_matches_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "View")
			{
				Server.Transfer(string.Format("~/teams/matches.aspx?tournamentId={0}&tournamentName={1}",e.Item.Cells[1].Text, e.Item.Cells[2].Text));
			}
		}
	}

}
