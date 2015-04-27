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
    public partial class matches : PageBaseAdmin
    {
        int updateDaysAfterEndDate = 7;
        ArrayList matchIDsForScoreUpdateAllowed = new ArrayList();

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            // get the # of days we allow users to update the scores after the match date
            updateDaysAfterEndDate = toInt(ConfigurationManager.AppSettings["DaysToAllowMatchScoreUpdatesAfterMatchDate"]);

            // get the match ids that are defined in web config files that we need to allow match score updates for
            string matchIds = ConfigurationManager.AppSettings["MatchIDsForScoreUpdateAllowedCommaSeperated"];
            if (!string.IsNullOrEmpty(matchIds))
            {
                string[] matchIdArray = matchIds.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                matchIDsForScoreUpdateAllowed.AddRange(matchIdArray);
            }

            if (!IsPostBack)
            {
                bindControls();
            }
        }

        protected void bindControls()
        {

            SqlDataReader dr = m_bl.getTournamentList(m_nTeamId);
            ddlTournament.DataSource = dr;
            ddlTournament.DataTextField = "name";
            ddlTournament.DataValueField = "tournament_id";
            ddlTournament.DataBind();
            dr.Close();

            ddlTournament.SelectedValue = m_nTournamentId.ToString();

            LoadMatchList(toInt(ddlTournament.SelectedValue), ddlTournament.SelectedItem.Text);

        }

        private void LoadMatchList(int tournamentId, string tournamentName)
        {
            SqlDataReader dr = m_bl.getMatchList(tournamentId, m_nTeamId);
            dgrid_scores.DataSource = dr;
            dgrid_scores.DataBind();
            dr.Close();

            lblErrorMatches.Text = "";
            if (dgrid_scores.Items.Count <= 0)
                lblErrorMatches.Text = "There are no matches scheduled.";

            lblTournament.Text = tournamentName;
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
            this.dgrid_scores.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_scores_ItemCommand);
            this.dgrid_scores.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_scores_ItemDataBound);

        }
        #endregion

        private void dgrid_scores_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DateTime matchDate = DateTime.MinValue;
                if (DateTime.TryParse(e.Item.Cells[0].Text, out matchDate))
                    e.Item.Cells[0].Text = matchDate.ToShortDateString();

                // disable the edit option if the match date is in the past beyond the allowed # of days fro match score updates
                if (DateTime.Now > matchDate.AddDays(updateDaysAfterEndDate))
                {
                    // check if there are any match Ids that we need explicitly allow updates for 
                    // this is mainly for matches whose scores were not entered by the teams and has been delayed
                    // this comes form the web configuration file 
                    if (!matchIDsForScoreUpdateAllowed.Contains(e.Item.Cells[1].Text))
                        e.Item.Cells[8].Enabled = false;
                }
            }
        }

        private void dgrid_scores_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string strMatchId = e.Item.Cells[1].Text;
                if (strMatchId.Length > 0)
                {
                    Session["match_id"] = strMatchId;
                    Server.Transfer("match_score.aspx");
                }
            }
        }

        protected void ddlTournament_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadMatchList(toInt(ddlTournament.SelectedValue), ddlTournament.SelectedItem.Text);
        }
    }
}
