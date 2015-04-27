using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
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
    public partial class tournament_registration : PageBaseAdmin
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
            bool hasRows = dr.HasRows;
            ddlTournament.DataSource = dr;
            ddlTournament.DataTextField = "name";
            ddlTournament.DataValueField = "tournament_id";
            ddlTournament.DataBind();
            dr.Close();

            ddlTournament.Items.Insert(0, new ListItem("select", "0"));
            ddlTournament.SelectedIndex = 0;
            int tournamentID = 0;
            if (hasRows)
            {
                ddlTournament.SelectedIndex = 1;
                tournamentID = int.Parse(ddlTournament.SelectedValue);
                LoadTeamRegistrations(tournamentID, rblRegistrationStatus.SelectedValue == "1");
            }
        }

        protected void LoadTeamRegistrations(int tournamentID, bool active)
        {
            //load the data from the database
            SqlDataReader dr = m_bl.getTeamRegistrations(tournamentID, active);

            DataTable dt = new DataTable();
            dt.Columns.Add("sr_no");
            dt.Columns.Add("rec_id");
            dt.Columns.Add("team_id");
            dt.Columns.Add("name");
            dt.Columns.Add("location");
            dt.Columns.Add("contacts");
            dt.Columns.Add("comments");
            dt.Columns.Add("created_dt");

            int teamcount = 1;
            while (dr.Read())
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("Contact1 Name: " + ((dr["contact1_name"] != null) ? dr["contact1_name"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("Contact1 Title: " + ((dr["contact1_title"] != null) ? dr["contact1_title"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("Contact1 Phone: " + ((dr["contact1_phone"] != null) ? dr["contact1_phone"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("Contact1 Email: " + ((dr["contact1_email"] != null) ? dr["contact1_email"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("<br>");

                sb.Append("Contact2 Name: " + ((dr["contact2_name"] != null) ? dr["contact2_name"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("Contact2 Title: " + ((dr["contact2_title"] != null) ? dr["contact2_title"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("Contact2 Phone: " + ((dr["contact2_phone"] != null) ? dr["contact2_phone"].ToString() : ""));
                sb.Append("<br>");
                sb.Append("Contact2 Email: " + ((dr["contact2_email"] != null) ? dr["contact2_email"].ToString() : ""));

                DataRow row = dt.NewRow();
                row["sr_no"] = teamcount.ToString();
                row["rec_id"] = (dr["rec_id"] != null) ? dr["rec_id"].ToString() : "";
                row["team_id"] = (dr["team_id"] != null) ? dr["team_id"].ToString() : "";
                row["name"] = (dr["name"] != null) ? dr["name"].ToString() : "";
                row["location"] = (dr["location"] != null) ? dr["location"].ToString() : "";
                row["contacts"] = sb.ToString();
                row["comments"] = (dr["comments"] != null) ? dr["comments"].ToString() : "";
                row["created_dt"] = (dr["created_dt"] != null) ? DateTime.Parse(dr["created_dt"].ToString()).ToString() : "";

                dt.Rows.Add(row);
                teamcount++;
            }

            dr.Close();

            dgrid_registrations.DataSource = dt.DefaultView;
            dgrid_registrations.DataBind();

            lblTotalTeams.Text = dgrid_registrations.Items.Count.ToString();
        }


        protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int tournamentID = int.Parse(ddlTournament.SelectedValue);
            rblRegistrationStatus.SelectedIndex = 0;
            LoadTeamRegistrations(tournamentID, true);
        }

        protected void rblRegistrationStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tournamentID = int.Parse(ddlTournament.SelectedValue);
            LoadTeamRegistrations(tournamentID, rblRegistrationStatus.SelectedValue == "1");
        }

        protected void dgrid_registrations_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int tournamentID = int.Parse(ddlTournament.SelectedValue);
                string recId = e.Item.Cells[2].Text;
                if (recId.Length > 0)
                {
                    // toggle the registration status of this team
                    bool active = rblRegistrationStatus.SelectedValue == "1";
                    m_bl.SetTeamRegistrationStatus(tournamentID, toInt(recId), !active);
                }

                //reload the list
                LoadTeamRegistrations(tournamentID, rblRegistrationStatus.SelectedValue == "1");
            }

        }
    }
}

