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
using Cricket.controls;
using Cricket.Common;

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for team.
	/// </summary>
	public partial class tournament_stats : PageBaseAdmin
	{
	
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
			//load the data from the database
			SqlDataReader dr = m_bl.getTournamentList();
			ddlTournament.DataSource = dr;
			ddlTournament.DataTextField = "name";
			ddlTournament.DataValueField = "tournament_id";
			ddlTournament.DataBind();
			dr.Close();

			ddlTournament.Items.Insert(0, new ListItem("select", "0"));
			ddlTournament.SelectedIndex = 0;
		}


        protected void btnRecalculateStats_Click(object sender, System.EventArgs e)
		{
            try
            {
                if (Page.IsValid)
                {
                    int nTournamentId = int.Parse(ddlTournament.SelectedValue);
                    if (nTournamentId > 0)
                    {
                        int teamCount = m_bl.setTeamStatsCalc(nTournamentId);

                        lblMessage.Text = string.Format("Team statistics calculation completed for tournament: <b>[{0}]</b> and for a total of <b>{1}</b> teams!", ddlTournament.SelectedItem.Text, teamCount);
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = string.Format("Team statistics calculation failed for tournament: <b>[{0}]</b>", ddlTournament.SelectedItem.Text);
                lblMessage.Text += "<br/>Error: <br/>" + ex.ToString();
            }

		}


        protected void btnRecalculatePlayerBattingStats_Click(object sender, System.EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int nTournamentId = int.Parse(ddlTournament.SelectedValue);
                    if (nTournamentId > 0)
                    {
                        m_bl.setPlayerBattingStatsCalc(nTournamentId);

                        lblMessage2.Text = string.Format("Player statistics calculation completed for tournament: <b>[{0}]</b>!", ddlTournament.SelectedItem.Text);
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage2.Text = string.Format("Player statistics calculation failed for tournament: <b>[{0}]</b>", ddlTournament.SelectedItem.Text);
                lblMessage2.Text += "<br/>Error: <br/>" + ex.ToString();
            }

        }

        protected void btnRecalculatePlayerBowlingStats_Click(object sender, System.EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int nTournamentId = int.Parse(ddlTournament.SelectedValue);
                    if (nTournamentId > 0)
                    {
                        m_bl.setPlayerBowlingStatsCalc(nTournamentId);

                        lblMessage2.Text = string.Format("Player statistics calculation completed for tournament: <b>[{0}]</b>!", ddlTournament.SelectedItem.Text);
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage2.Text = string.Format("Player statistics calculation failed for tournament: <b>[{0}]</b>", ddlTournament.SelectedItem.Text);
                lblMessage2.Text += "<br/>Error: <br/>" + ex.ToString();
            }

        }
		
	}
}

