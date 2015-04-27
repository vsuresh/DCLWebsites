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
    public partial class player_registration : PageBaseAdmin
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
            }
        }



        protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            GridView1.DataBind();
        }


    }
}

