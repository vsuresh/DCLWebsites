using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using Cricket.BAL;
using Cricket.controls;

namespace Cricket.AdminParent
{
    public partial class Login : PageBase
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            txtLogin.Focus();

            // Todo: Ensure this is set to false in production
            bool autoLogin = true;
            if (autoLogin)
            {
                //LoginUser("testuser1", "testuser1");
            }
        }

        protected void imgLogin_Click(object sender, ImageClickEventArgs e)
        {
            //verify the user password
            LoginUser(txtLogin.Text, txtPassword.Text);
        }

        protected void LoginUser(string username, string password)
        {
            //verify the user password
            int userId = 0;
            int parentRegistrationID = 0;
            SqlDataReader dr = m_bl.LoginParentAccount(username, password);
            if (dr.Read())
            {
                userId = toInt(dr["user_id"]);
                parentRegistrationID = toInt(dr["pr_id"]);
            }

            //check if user is a team admin
            if (userId > 0)   
            {
                Session["user_id"] = userId;
                Session["parentregistration_id"] = parentRegistrationID;
                Session["parent_name"] = string.Empty;

                Response.Redirect("~/AdminParent/default.aspx");
            }
            else
            {
                lblError.Text = "Username and/or Password is not valid! Please try again!";
            }
        }

    }
}