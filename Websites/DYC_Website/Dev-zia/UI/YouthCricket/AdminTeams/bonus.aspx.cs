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
using System.Configuration;
using Cricket;

namespace Cricket.AdminTeams
{
    /// <summary>
    /// Summary description for scoresheet.
    /// </summary>
    public partial class bonus : PageBaseAdmin
    {
        int matchId = 0;

        protected override void OnLoad(System.EventArgs e)
        {

            base.OnLoad(e);

            if (!IsPostBack)
            {
                matchId = toInt(Session["match_id"]);

                loadData();

                ViewState["match_id"] = matchId;
                ViewState["tournament_id"] = m_nTournamentId;
            }
            else
            {
                matchId = (int)ViewState["match_id"];
                m_nTournamentId = (int)ViewState["tournament_id"];
            }
        }

        protected void loadData()
        {
            SqlDataReader dr = m_bl.getMatchData(matchId);
            if (dr.Read())
            {
                ddlTeam.Items.Add(new ListItem("select", "0"));
                ddlTeam.Items.Add(new ListItem(dr["team1"] as string, toInt(dr["team1_id"]).ToString()));
                ddlTeam.Items.Add(new ListItem(dr["team2"] as string, toInt(dr["team2_id"]).ToString()));
            }
            dr.Close();

            PopulateBonusReasons();

            dr = m_bl.GetBonusData(matchId);
            dgrid_bonus.DataSource = dr;
            dgrid_bonus.DataBind();
            dr.Close();
        }



        private void PopulateBonusReasons()
        {
            // get the match ids that are defined in web config files that we need to allow match score updates for
            string ruleSet1 = ConfigurationManager.AppSettings["BonusPointsRuleSet1"];
            string ruleSet2 = ConfigurationManager.AppSettings["BonusPointsRuleSet2"];
            string ruleSet3 = ConfigurationManager.AppSettings["BonusPointsRuleSet3"];

            int ruleSet1TournamentID = toInt(ConfigurationManager.AppSettings["BonusPointsRuleSet1TournamentID"]);
            int ruleSet2TournamentID = toInt(ConfigurationManager.AppSettings["BonusPointsRuleSet2TournamentID"]);
            int ruleSet3TournamentID = toInt(ConfigurationManager.AppSettings["BonusPointsRuleSet3TournamentID"]);


            //BonusPointsRuleSet1 = "Team scored >= 50 runs, Team restricted opponent to <= 50 runs, Batsman scored >= 21 runs, Bowler took >= 3 wickets in an over"
            if (m_nTournamentId == ruleSet1TournamentID)
            {
                string[] ruleSetArray = ruleSet1.Split(new char[] {','},  StringSplitOptions.RemoveEmptyEntries);

                int index = 1;
                ddlReason.Items.Add(new ListItem("select", "0"));
                foreach (string rule in ruleSetArray)
                {
                    ddlReason.Items.Add(new ListItem(rule, index.ToString()));
                    index++;
                }
            }
            else if (m_nTournamentId == ruleSet2TournamentID)
            {
                string[] ruleSetArray = ruleSet2.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                int index = 1;
                ddlReason.Items.Add(new ListItem("select", "0"));
                foreach (string rule in ruleSetArray)
                {
                    ddlReason.Items.Add(new ListItem(rule, index.ToString()));
                    index++;
                }
            }
            else
            {
                string[] ruleSetArray = ruleSet3.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                int index = 1;
                ddlReason.Items.Add(new ListItem("select", "0"));
                foreach (string rule in ruleSetArray)
                {
                    ddlReason.Items.Add(new ListItem(rule, index.ToString()));
                    index++;
                }
            }

        }


        protected void btnSubmit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid && ddlTeam.SelectedIndex > 0 && ddlReason.SelectedIndex > 0)
            {
                int teamId = toInt(ddlTeam.SelectedValue);
                m_bl.SetBonusPoints(m_nTournamentId, matchId, teamId, ddlReason.SelectedItem.Text, txtDesc.Text, 1);

            }

            SqlDataReader dr = m_bl.GetBonusData(matchId);
            dgrid_bonus.DataSource = dr;
            dgrid_bonus.DataBind();
            dr.Close();
        }

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("match_score.aspx");
        }

    }
}
