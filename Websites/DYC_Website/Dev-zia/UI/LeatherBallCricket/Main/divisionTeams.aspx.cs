using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Cricket;

namespace Cricket.Main
{
	/// <summary>
	/// Summary description for aboutus.
	/// </summary>
    public partial class divisionTeams : PageBase
	{

        protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);
            
            if (!IsPostBack)
            {
                PopulateYear();
                PopulateTeams();
            }

        }

        protected void PopulateYear()
        {
            using (SqlDataReader dr = m_bl.GetDivisionYears())
            {
                ddlYear.DataTextField = "year";
                ddlYear.DataValueField = "year";
                ddlYear.DataSource = dr;
                ddlYear.DataBind();
            }

            if (ddlYear.Items.Count > 0)
                ddlYear.SelectedIndex = 0;
        }

        protected void PopulateTeams()
        {
            string year = ddlYear.SelectedValue;

            using (SqlDataReader dr = m_bl.GetDivisionTeams(year, "A"))
            {
                dgrid_divisionA.DataSource = dr;
                dgrid_divisionA.DataBind();
            }

            using (SqlDataReader dr = m_bl.GetDivisionTeams(year, "B"))
            {
                dgrid_divisionB.DataSource = dr;
                dgrid_divisionB.DataBind();
            }

            using (SqlDataReader dr = m_bl.GetDivisionTeams(year, "C"))
            {
                dgrid_divisionC.DataSource = dr;
                dgrid_divisionC.DataBind();
            }

            using (SqlDataReader dr = m_bl.GetDivisionTeams(year, "D"))
            {
                dgrid_divisionD.DataSource = dr;
                dgrid_divisionD.DataBind();
            }

        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateTeams();
        }


	}
}
