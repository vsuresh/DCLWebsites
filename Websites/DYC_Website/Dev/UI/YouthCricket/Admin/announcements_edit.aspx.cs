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
    public partial class announcements_edit : PageBaseAdmin
    {
        public static String Type = String.Empty;
        public static String SubType = String.Empty;
        public static String Description = String.Empty;


        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
                PopulateData();
        }

        private void PopulateData()
        {
            SqlDataReader dr = m_bl.getTournamentList();
            ddlTournament.DataSource = dr;
            ddlTournament.DataTextField = "name";
            ddlTournament.DataValueField = "tournament_id";
            ddlTournament.DataBind();
            dr.Close();

            ddlTournament.Items.Insert(0, new ListItem("None", "0"));
            ddlTournament.SelectedIndex = 0;

            int id = toInt(Request.QueryString["AnnouncementID"]);
            if (id > 0)
            {
                lblID.Text = id.ToString();
                using (SqlCommand com = new SqlCommand("select * from announcement where ID = " + id, m_bl.GetSQLConnection()))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    dr = com.ExecuteReader();
                    if (dr.Read())
                    {
                        txtDate.Text = DateTime.Parse(dr["created_dt"].ToString()).ToShortDateString();
                        txtTitle.Text = dr["title"] as string;
                        Editor1.Content = dr["description"] as string;
                        if (!string.IsNullOrEmpty(dr["tournament_id"].ToString()))
                        {
                            ddlTournament.ClearSelection();
                            ddlTournament.Items.FindByValue(dr["tournament_id"].ToString()).Selected = true;
                        }
                    }
                    dr.Close();
                }
            }
            else
            {
                txtDate.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string tournamentId = (ddlTournament.SelectedValue == "0") ? "Null" : ddlTournament.SelectedValue;
                string content = sqlEncode(Editor1.Content);
                if (string.IsNullOrEmpty(lblID.Text))
                {
                    using (SqlCommand com = new SqlCommand(
                        string.Format("insert into announcement (type, title, description, tournament_id, created_dt) values ('Announcement', '{0}', '{1}', {2}, '{3}') ",
                        txtTitle.Text, content, tournamentId, txtDate.Text), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }
                }
                else
                {
                    using (SqlCommand com = new SqlCommand(
                        string.Format("update announcement set type = 'Announcement', title = '{0}', description = '{1}', tournament_id = {2}, created_dt = '{3}' where " +
                        "ID = {4} ", txtTitle.Text, content, tournamentId, txtDate.Text, lblID.Text), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }
                }

                Server.Transfer("announcements.aspx");
            }
        }
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("announcements.aspx");
        }
       
   }
}