using System;
using System.Collections;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using Cricket;
using Cricket.controls;

namespace Cricket.Admin
{
    public partial class announcements : PageBaseAdmin
    {

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
                PopulateAccouncements();
        }

        private void PopulateAccouncements()
        {
            int displayCount = toInt(ConfigurationManager.AppSettings["AnnouncementsDisplayCount"]);
            if (displayCount <= 0)
                displayCount = 20;

            labelDisplayCount.Text = displayCount.ToString();

            SqlDataReader dr = m_bl.GetAnnouncements(displayCount);
            dgrid_announcements.DataSource = dr;
            dgrid_announcements.DataBind();
            dr.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Server.Transfer("announcements_edit.aspx?AnnouncementID=");
        }

        protected void dgrid_announcements_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Server.Transfer("announcements_edit.aspx?AnnouncementID=" + e.Item.Cells[0].Text);
            }
        }


       

    }
}