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
	/// Summary description for _default.
	/// </summary>
    public partial class _default : PageBaseTeam
	{
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


            using (SqlDataReader dr = m_bl.getTeamData(teamId))
            {
                if (dr.Read())
                {
                    lblTeamDesc.Text = dr["description"].ToString();
                }
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
            using (SqlDataReader dr = m_bl.GetTeamTournaments(teamId))
            {
                while (dr.Read())
                {
                    string awardType = dr["award_type"] as string;
                    int rank = toInt(dr["rank"]);
                    int lastmatchTypeCD = toInt(dr["lastmatch_type_cd"]);

                    // add the rank to the position column
                    if (rank > 0)
                    {
                        // calculate the counts
                        if (rank == 1)
                            leagueChampions++;
                        else if (rank== 2)
                            leagueRunnerUps++;
                    }

                    string matchType = MatchTypeCD.GetMatchType(lastmatchTypeCD);
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

                    if (awardType == "Champions")
                        tournamentChampions++;
                    else if (awardType == "RunnerUp")
                        tournamentRunnerUps++;

                    tournamentCount++;
                }
                dr.Close();
            }

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

	}
}
