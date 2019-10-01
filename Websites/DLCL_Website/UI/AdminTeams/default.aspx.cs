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
//using Cricket.controls;

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public partial class _default : PageBaseAdmin
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);
            if (!IsPostBack)
            {
                getChaukaLoginData();
            }
            if (IsSysAdmin())
                Server.Transfer("/Admin/default.aspx");

		}
        private void getChaukaLoginData()
        {
            string userName = Session["user_name"].ToString().Trim();
            SqlDataReader dr = m_bl.getChaukaLoginData(userName);
            if (dr.Read())
            {
                lblChaukaLogin.Text = dr["ChaukaUser"].ToString();
                lblChaukaPassword.Text = dr["ChaukaPassword"].ToString();
            }
            dr.Close();
        }
    }
}

