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

namespace Cricket.Main
{
	/// <summary>
	/// Summary description for aboutus.
	/// </summary>
	public partial class announcements : PageBase
	{
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            int annoucementId = toInt(Request.QueryString["AnnouncementID"] as string);
            if (annoucementId > 0)
            {
                DisplayAccouncement(annoucementId);
            }
            else
            {
                //lblAnnouncementTitle.Text = "Error: Invalid Announcement ID!";
                DisplayAccouncementList();
            }

		}

        private void DisplayAccouncement(int annoucementId)
        {
            divAnnouncement.Visible = false;
            divAnnouncementList.Visible = false;
            divNoAnnouncement.Visible = false;

            SqlDataReader dr = null;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dallascricketleague"].ConnectionString))
            {
                using (SqlCommand com = new SqlCommand(string.Format("select * from announcement where ID={0}", annoucementId), con))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    con.Open();
                    dr = com.ExecuteReader();
                    if (dr.Read())
                    {
                        lblAnnouncementDate.Text = DateTime.Parse(dr["created_dt"].ToString()).ToShortDateString();
                        lblAnnouncementTitle.Text = dr["title"] as string;
                        lblAnnouncementDesc.Text = dr["description"] as string;
                    }
                    dr.Close();
                }
            }

            if (lblAnnouncementDate.Text.Length > 0)
                divAnnouncement.Visible = true;
            else
                divNoAnnouncement.Visible = true;
        }

        private void DisplayAccouncementList()
        {
            divAnnouncement.Visible = false;
            divAnnouncementList.Visible = true;
            divNoAnnouncement.Visible = false;

            int displayCount = toInt(ConfigurationManager.AppSettings["AnnouncementsDisplayCount"]);
            if (displayCount <= 0)
                displayCount = 20;

            labelDisplayCount.Text = displayCount.ToString();

            SqlDataReader dr = m_bl.GetAnnouncements(displayCount);
            dgrid_announcements.DataSource = dr;
            dgrid_announcements.DataBind();
            dr.Close();
        }

        protected void dgrid_announcements_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                Server.Transfer("announcements_edit.aspx?AnnouncementID=" + e.Item.Cells[0].Text);
            }
        }


	}
}
