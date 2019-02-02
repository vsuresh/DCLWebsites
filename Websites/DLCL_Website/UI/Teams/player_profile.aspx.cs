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

namespace Cricket.Teams
{
    /// <summary>
    /// Summary description for player_profile.
    /// </summary>
    public partial class player_profile : PageBaseTeam
    {

        protected int playerId = 0;

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                playerId = toInt(Request.QueryString["playerId"]);
                if (playerId <= 0)
                    Server.Transfer("/teams/players.aspx");

                loadData();
            }
        }

        protected void loadData()
        {
            SqlDataReader dr = m_bl.getPlayerData(playerId);
            if (dr.Read())
            {
                int nKeeperSw = 0;
                string strFirstName, strLastName, strPhotoURL;
                strFirstName = dr["first_name"].ToString();
                strLastName = dr["last_name"].ToString();
                lblAge.Text = dr["age"].ToString();
                lblBattingStyle.Text = dr["batting_style"].ToString();
                lblBowlingStyle.Text = dr["bowling_style"].ToString();
                lblBattingPosition.Text = dr["batting_position"].ToString();
                nKeeperSw = toInt(dr["keeper_sw"]);
                lblStartDate.Text = dr["start_dt"].ToString();
                lblEndDate.Text = dr["end_dt"].ToString();
                lblComments.Text = dr["comments"].ToString();
                strPhotoURL = dr["photo_url"].ToString();

                lblName.Text = strFirstName.ToUpper() + " " + strLastName.ToUpper();
                lblWicketKeeper.Text = (nKeeperSw > 0) ? "Yes" : "No";

                if (strPhotoURL.Length > 0)
                    imgPlayer.ImageUrl = "../photos/" + strPhotoURL;
            }
            dr.Close();

            int matches = 0;
            int innings = 0;
            int notouts = 0;
            int runs = 0;
            float flAverage = 0;
            float flStrikeRate = 0;
            int hundreds = 0;
            int fifties = 0;
            int highest = 0;

            //set the batting stats 
            int index = 0;
            //         dr = m_bl.GetPlayerBattingStatsAll(playerId);
            //while (dr.Read())
            //{
            //	 matches += toInt(dr["matches"].ToString());
            //	 innings += toInt(dr["innings"].ToString());
            //              notouts += toInt(dr["not_outs"].ToString());
            //              runs += toInt(dr["runs"].ToString());
            //              highest = (toInt(dr["highest"].ToString()) > highest) ? toInt(dr["highest"].ToString()) : highest;
            //	 flAverage += toFloat(dr["average"]);
            //	 flStrikeRate += toFloat(dr["strike_rate"]);
            //              hundreds += toInt(dr["hundred"].ToString());
            //              fifties += toInt(dr["fifty"].ToString());

            //             index++;
            //         }
            dr = m_bl.GetPlayerBattingStatsAllRevised(playerId);
            while (dr.Read())
            {
                matches = toInt(dr["Matches"].ToString());
                innings = toInt(dr["Innings"].ToString());
                notouts = toInt(dr["NotOuts"].ToString());
                runs = toInt(dr["Runs"].ToString());
                highest = toInt(dr["Highest"].ToString()); ;
                flAverage += toFloat(dr["Average"]);
                flStrikeRate += toFloat(dr["StrikeRate"]);
                hundreds += toInt(dr["Hundred"].ToString());
                fifties += toInt(dr["Fifty"].ToString());

                index++;
            }
            dr.Close();
            if (index > 0)
            {
                flAverage /= index;
                flStrikeRate /= index;
            }


            lblMatches.Text = matches.ToString();
            lblInnings.Text = innings.ToString();
            lblNotOuts.Text = notouts.ToString();
            lblRuns.Text = runs.ToString();
            lblHighest.Text = highest.ToString();
            lblAverage.Text = flAverage.ToString("##0.00");
            lblStrikeRate.Text = flStrikeRate.ToString("##0.00");
            lbl100.Text = hundreds.ToString();
            lbl50.Text = fifties.ToString();

            //set the bowling stats 
            //int tournamentId = 0;
            dr = m_bl.getPlayerBowlingStatsAllRevised(playerId);
            if (dr.Read())
            {
                lblMatches2.Text = dr["Matches"].ToString();
                lblInnings2.Text = dr["Innings"].ToString();
                float flOvers = toFloat(dr["Overs"]);
                lblWickets.Text = dr["Wickets"].ToString();
                lblRuns2.Text = dr["Runs"].ToString();
                flAverage = toFloat(dr["Average"]);
                lblBest.Text = dr["Best"].ToString();

                lblOvers.Text = flOvers.ToString("##0.0");
                lblAverage2.Text = flAverage.ToString("##0.00");
            }
            else
            {
                lblMatches2.Text = matches.ToString();
                lblInnings2.Text = innings.ToString();
                float flOvers = 0;
                lblWickets.Text = "0";
                lblRuns2.Text = "0";
                flAverage = 0;
                lblBest.Text = "0";

                lblOvers.Text = flOvers.ToString("##0.0");
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

        protected void btnPlayerList_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("/teams/players.aspx");
        }
    }

}
