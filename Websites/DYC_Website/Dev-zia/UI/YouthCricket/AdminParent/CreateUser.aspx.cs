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
    public partial class CreateUser : PageBase
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            txtLogin.Focus();
        }

        protected void btnCreateUser_Click(object sender, System.EventArgs e)
        {
            //verify the user password
            CreateAccount(txtLogin.Text, txtPassword.Text, txtPassword2.Text);
        }

        protected void CreateAccount(string username, string password, string password2)
        {
            //user name rules
            // minimum 6 characters
            
            // password
            // min 6 characters

            // validate the user name and passwowrds
            if (string.IsNullOrEmpty(username))
            {
                lblError.Text = "User Name not provided";
                return;
            }
            else if (string.IsNullOrEmpty(password) || string.IsNullOrEmpty(password2))
            {
                lblError.Text = "Password not provided";
                return;
            }
            else if (password != password2)
            {
                lblError.Text = "Passwords do not match";
                return;
            }
            else if (username.Length < 6)
            {
                lblError.Text = "Username should be minimum 6 characters long";
                return;
            }
            else if (password.Length < 6)
            {
                lblError.Text = "Password should be minimum 6 characters long";
                return;
            }
            else if (username.Contains(' '))
            {
                lblError.Text = "Username cannot contain spaces";
                return;
            }
            else if (password.Contains(' '))
            {
                lblError.Text = "Password cannot contain spaces";
                return;
            }


            //verify the user password
            string teamName = string.Empty;
            if (!m_bl.DoesUserNameExists(username))
            {
                // create user account
                m_bl.CreateParentAccount(username, password);

                // login user 
                LoginUser(username, password);

            }
            else 
            {
                lblError.Text = "Specified username already exsits. Please select another username";
                return;
            }

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
            dr.Close();

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