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

            this.dgrid_penalty.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_penalty_ItemCommand);

        }
        #endregion
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
            LoadPenaltyList(toInt(ddlTournament.SelectedValue.ToString()));

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

            if ( dr.HasRows )
            {
                ddlTeams.DataSource = dr;
                ddlTeams.DataTextField = "name";
                ddlTeams.DataValueField = "team_id";
                ddlTeams.DataBind();
                //dr.Close();

                //ddlTeams.Items.Insert(0, new ListItem("select", "0"));
                ddlTeams.SelectedIndex = 0;
            }
            dr.Close();
        }

        private void LoadPenaltyList(int tournamentId)
        {
            //load the data from the database
            SqlDataReader dr = m_bl.getPenaltyAll(tournamentId);
            if (!dr.HasRows)
                dgrid_penalty.Visible = false;
            else
                dgrid_penalty.Visible = true;

            dgrid_penalty.DataSource = dr;
            dgrid_penalty.DataBind();
            dr.Close();

        }

        protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int id = int.Parse(ddlTournament.SelectedValue.ToString());
            if (id > 0)
            {
                loadTeamList(id);
                LoadPenaltyList(id);

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
                    loadData();

                    lblMsg.Text = "Penalty/Bonus has been applied. Please check the tournament rankings section to see the penalty and updated points!";
                }

            }
            else
                lblMsg.Text = "Data is not valid. Please select proper data";
        }

        protected void dgrid_penalty_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            switch (((LinkButton)e.CommandSource).CommandName)
            {

                case "Delete":
                    try
                    {
                        int penaltyId = 0;
                        int teamId = 0;
                        int penaltypoints = 0;

                        penaltyId = toInt( ( ( System.Web.UI.WebControls.TableCell ) e.Item.Controls[ 0 ] ).Text );
                        teamId = toInt( ( ( System.Web.UI.WebControls.TableCell ) e.Item.Controls[ 6 ] ).Text );
                        penaltypoints = toInt( ( ( System.Web.UI.WebControls.TableCell ) e.Item.Controls[ 4 ] ).Text );

                        DeletePenalty( penaltyId, teamId, penaltypoints );
                        loadData();
                    }
                    catch (Exception ex)
                    {
                        lblMsg.Text = "Error while trying to delete Penalty/Byes";
                        lblMsg.Text += "<br/>Error: <br/>" + ex.ToString();
                    }

                    break;

                default:
                    // Do nothing.
                    break;
            }

        }

        private void DeletePenalty(int penaltyId, int teamId, int penaltypoints )
        {
            try
            {
                int tournamentId = int.Parse(ddlTournament.SelectedValue.ToString());
                if (tournamentId > 0)
                    // check if we have the tournament id in session
                    if (tournamentId <= 0)
                    {
                        Response.Redirect("/default.aspx");
                    }

                int result = m_bl.DeletePenalty(tournamentId, penaltyId, teamId, penaltypoints);

                if (result <= 0)
                    lblMsg.Text = "Error while trying to delete Penalty/Byes";

                loadData();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error while trying to delete Penalty/Byes";
                lblMsg.Text += "<br/>Error: <br/>" + ex.ToString();
            }
        }

    }
}

