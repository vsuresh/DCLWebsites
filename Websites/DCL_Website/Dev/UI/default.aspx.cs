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
using System.Text;
using Cricket.DAL;

namespace Cricket
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
    public partial class _default : PageBase
    {
        public static DataSet Defaults = new DataSet();

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            // clear the tournament in the session as we are on the home page
            Session["tournament_id"] = 0;
            Session["tournament_name"] = "";

            PopulateAccouncements();
            PopulateTournaments();
        }

        private void PopulateTournaments()
        {
            SqlDataReader dr = null;
            string CommandText = string.Format("select top {0} *, 'current'=(select 1 where GetDate() between regstart_dt and end_dt) from tournament order by start_dt desc", toInt(ConfigurationManager.AppSettings["DisplayMainPageAnouncementTournamentsCount"]));
            using (SqlCommand com = new SqlCommand(CommandText, m_bl.GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                dr = com.ExecuteReader();
                dgrid_tournaments.DataSource = dr;
                dgrid_tournaments.DataBind();
                dr.Close();
            }

        }

        private void PopulateAccouncements()
        {
            SqlDataReader dr = m_bl.GetAnnouncements(toInt(ConfigurationManager.AppSettings["DisplayMainPageAnouncementTournamentsCount"]));
            dgrid_announcements.DataSource = dr;
            dgrid_announcements.DataBind();
            dr.Close();

        }

        protected void dgrid_tournaments_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                //string current = e.Item.Cells[2].Text;
                //if (!string.IsNullOrEmpty(current) && current == "1")
                //{
                //    e.Item.BackColor = Color.Azure;
                //    e.Item.Font.Bold = true;
                //    e.Item.Font.Size = FontUnit.XXLarge;
                //}


                //DateTime startDate = DateTime.Parse(e.Item.Cells[2].Text);
                //DateTime endDate = DateTime.Parse(e.Item.Cells[3].Text);
                //if (DateTime.Now > startDate && DateTime.Now < endDate)
                //{
                //    string d = e.Item.Cells[1].Text;
                //    e.Item.Cells[1].Text = "<b>sfsddf" + d + "<b>";
                //}
            }
        }
    }
}
