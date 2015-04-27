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

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for team.
	/// </summary>
    public partial class tournament_awards : PageBaseAdmin
	{

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (!IsPostBack)
            {
                loadTournaments();
            }
            else
            {
                // reload the grid since we loose it on post back
                LoadAwards(toInt(ddlTournament.SelectedValue));
            }
		}

		protected void loadTournaments()
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

        protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			int id = int.Parse(ddlTournament.SelectedValue.ToString());
			if (id > 0)
			{
                LoadAwards(id);
                divAwards.Visible = false;
			}
			else
				clearFields();

		}

        protected void dgrid_awards_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                clearUpdateFields();
                divAwards.Visible = true;
                btnSubmit.Enabled = true;

                LoadTeams(toInt(ddlTournament.SelectedValue));

                lblAwardId.Text = e.Item.Cells[1].Text;
                lblAwardType.Text = e.Item.Cells[2].Text;

                string recId = e.Item.Cells[0].Text.Trim();
                if (!string.IsNullOrEmpty(recId) && recId != "&nbsp;")
                {
                    lblRecId.Text = recId;

                    if (e.Item.Cells[3].Text != "&nbsp;")
                    {
                        if (ddlTeam.Items.FindByValue(e.Item.Cells[3].Text) != null)
                            ddlTeam.SelectedValue = e.Item.Cells[3].Text;

                        if (ddlTeam.SelectedIndex != 0)
                        {
                            LoadPlayers(toInt(e.Item.Cells[3].Text));

                            if (ddlPlayer.Items.FindByValue(e.Item.Cells[5].Text) != null)
                                ddlPlayer.SelectedValue = e.Item.Cells[5].Text;
                            else if (ddlPlayer.Items.FindByText(e.Item.Cells[6].Text) != null)
                            {
                                ListItem item = ddlPlayer.Items.FindByText(e.Item.Cells[6].Text);
                                ddlPlayer.SelectedItem.Selected = false;
                                item.Selected = true;
                            }
                        }
                    }

                    if (e.Item.Cells[6].Text != "&nbsp;")
                        txtPlayerName.Text = e.Item.Cells[6].Text;
                    else
                        txtPlayerName.Text = "";
                    if (e.Item.Cells[7].Text != "&nbsp;")
                        txtStats.Text = e.Item.Cells[7].Text;
                    else
                        txtStats.Text = "";
                }
                else
                {
                    lblRecId.Text = "0";
                }

            }
        }

        protected void LoadAwards(int tournamentId)
        {
            // load the awards grid
            string str = string.Format("select at.*, awards.* from award_types at left join " +
                "(select t.name, ta.* from tournament_awards ta left join team t on t.team_id = ta.team_id " +
                "where ta.tournament_id = {0}) as awards " +
                "on awards.award_id = at.award_id " +
                "order by seq_id", tournamentId.ToString());

            SqlDataReader dr = null;
            using (SqlCommand com = new SqlCommand(str, m_bl.GetSQLConnection()))
            {
                com.CommandText = str;
                com.CommandType = System.Data.CommandType.Text;
                dr = com.ExecuteReader();
                dgrid_awards.DataSource = dr;
                dgrid_awards.DataBind();
                dr.Close();
            }

        }

        protected void LoadTeams(int tournamentId)
        {
            // load the tournament teams 
            SqlDataReader dr = m_bl.getTeamListByTournament(tournamentId);
            ddlTeam.DataSource = dr;
            ddlTeam.DataTextField = "name";
            ddlTeam.DataValueField = "team_id";
            ddlTeam.DataBind();
            dr.Close();

            ddlTeam.Items.Insert(0, new ListItem("select", "0"));
            ddlTeam.SelectedIndex = 0;
        }

        protected void LoadPlayers(int teamId)
        {
            SqlDataReader dr = m_bl.getPlayerList(toInt(teamId));
            ddlPlayer.DataSource = dr;
            ddlPlayer.DataTextField = "name";
            ddlPlayer.DataValueField = "player_id";
            ddlPlayer.DataBind();
            dr.Close();

            ddlPlayer.Items.Insert(0, new ListItem("select", "0"));
            ddlPlayer.SelectedIndex = 0;
            txtPlayerName.Text = "";
        }

        protected void ddlTeam_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTeam.SelectedIndex != 0)
                LoadPlayers(toInt(ddlTeam.SelectedValue));
            else
            {
                ddlPlayer.Items.Clear();
                txtPlayerName.Text = "";
            }
        }

        protected void ddlPlayer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPlayer.SelectedIndex != 0)
                txtPlayerName.Text = ddlPlayer.SelectedItem.Text;
            else
                txtPlayerName.Text = "";
        }

        private void clearFields()
        {
            ddlTournament.SelectedIndex = 0;
            divAwards.Visible = false;

            clearUpdateFields();
        }

        private void clearUpdateFields()
        {
            ddlTeam.Items.Clear();
            ddlPlayer.Items.Clear();
            txtPlayerName.Text = string.Empty;
            txtStats.Text = string.Empty;
            lblRecId.Text = string.Empty;
            lblAwardId.Text = string.Empty;
            lblAwardType.Text = string.Empty;
            btnSubmit.Enabled = false;
        }

        protected void btnSubmit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                if (lblRecId.Text == "0")
                {
                    int recId = 0;
                    using (SqlCommand com1 = new SqlCommand("select isnull(MAX(rec_id)+1, 1) from tournament_awards where tournament_id = " + toInt(ddlTournament.SelectedValue), m_bl.GetSQLConnection()))
                    {
                        com1.CommandType = System.Data.CommandType.Text;
                        recId = (int) com1.ExecuteScalar();
                    }

                    using (SqlCommand com = new SqlCommand(
                        string.Format("insert into tournament_awards (tournament_id, rec_id, award_id, team_id, player_id, player_name, stats, created_dt, active_sw) " +
                                "values ({0},{1},{2},{3},{4},'{5}','{6}',GETDATE(),1) ",
                                ddlTournament.SelectedValue, recId, lblAwardId.Text, ddlTeam.SelectedValue,
                                ddlPlayer.SelectedValue, txtPlayerName.Text, txtStats.Text), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }
                }
                else
                {
                    using (SqlCommand com = new SqlCommand(
                        string.Format("update tournament_awards set award_id = {0}, team_id = {1}, player_id = {2}, player_name = '{3}', stats = '{4}' " +
                            "where tournament_id = {5} and rec_id = {6}",
                            lblAwardId.Text, ddlTeam.SelectedValue, ddlPlayer.SelectedValue, txtPlayerName.Text, txtStats.Text,
                            ddlTournament.SelectedValue, lblRecId.Text), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }
                }

                clearUpdateFields();
                LoadAwards(toInt(ddlTournament.SelectedValue));
                divAwards.Visible = false;
            }
        }

    }
}

