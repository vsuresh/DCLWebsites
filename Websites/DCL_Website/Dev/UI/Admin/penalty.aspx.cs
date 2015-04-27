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
using System.Text;
using Cricket;
using Cricket.controls;
using Cricket.Common;

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for team.
	/// </summary>
    public partial class penalty : PageBaseAdmin
    {
        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                loadData();

                lblMsg.Text = string.Empty;
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

            ddlTournament.SelectedIndex = 0;
            
            loadTeamList(toInt(ddlTournament.SelectedValue.ToString()));

            ddlPenaltyPoints.Items.Add(new ListItem("-2", "-2"));
            ddlPenaltyPoints.Items.Add(new ListItem("-4", "-4"));
            ddlPenaltyPoints.Items.Add(new ListItem("+1", "1"));
            ddlPenaltyPoints.Items.Add(new ListItem("+2", "2"));
            ddlPenaltyPoints.Items.Add(new ListItem("+4", "4"));
            ddlPenaltyPoints.SelectedIndex = 0;

            ddlDescription.Items.Add(new ListItem("Missed Umpiring Duty", "1"));
            ddlDescription.Items.Add(new ListItem("Bye as per Schedule", "2"));
            ddlDescription.Items.Add(new ListItem("Using Player from Other Team", "3"));
            ddlDescription.Items.Add(new ListItem("Bonus Points", "4"));
            ddlDescription.SelectedIndex = 0;
        }

        public void loadTeamList(int tournamentId)
        {
            //load the data from the database
            SqlDataReader dr = m_bl.getTeamListByTournament(tournamentId);
            ddlTeams.DataSource = dr;
            ddlTeams.DataTextField = "name";
            ddlTeams.DataValueField = "team_id";
            ddlTeams.DataBind();
            dr.Close();

            //ddlTeams.Items.Insert(0, new ListItem("select", "0"));
            ddlTeams.SelectedIndex = 0;
        }

		protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			int id = int.Parse(ddlTournament.SelectedValue.ToString());
            if (id > 0)
            {
                loadTeamList(id);
            }
        }


        protected void btnAddPenalty_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int tournamentId = int.Parse(ddlTournament.SelectedValue.ToString());
                int teamId = toInt(ddlTeams.SelectedValue.ToString());
                int points = toInt(ddlPenaltyPoints.SelectedItem.Text.ToString());
                if (tournamentId > 0 && teamId > 0)
                {
                    m_bl.AddPenaltyPoints(tournamentId, teamId, points, ddlDescription.SelectedItem.Text, 1);

                    lblMsg.Text = "Penalty/Bonus has been applied. Please check the tournament rankings section to see the penalty and updated points!";
                }

            }
            else
                lblMsg.Text = "Data is not valid. Please select proper data";
        }

    }
}

