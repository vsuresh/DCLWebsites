﻿using System;
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

namespace Cricket.AdminTeams
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
                //LoginUser("admin", "demo650");
                //LoginUser("dt", "dt");
                //LoginUser("Fortworth", "Fortworth");
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
            int nTeamId = 0;
            int nUserId = 0;
            string teamName = string.Empty;
            SqlDataReader dr = m_bl.GetLoginUserInfo(username, password);
            if (dr.Read())
            {
                nTeamId = toInt(dr["team_id"]);
                nUserId = toInt(dr["user_id"]);
                Session["user_name"] = username;
                teamName = dr["name"].ToString();
            }
            dr.Close();

            //check if the user is a DCL admin
            if (Constants.IsSysAdmin(nUserId))
            {
                // user is a sysadmin
                //put the admin status switch to indicate we are in team administrator mode
                Session["admin_sw"] = "1";
                Session["user_id"] = nUserId;				//used in admin team section
                Session["team_name"] = "System Admin";
                Session["user_name"] = username;
                Response.Redirect("/Admin/default.aspx");
            }
            //check if student
            else if (Constants.IsStudent(nUserId))
            {
                //put the admin status switch to indicate we are in team administrator mode
                Session["admin_sw"] = "1";
                Session["user_id"] = nUserId;               //used in admin team section
                Session["team_name"] = "Student";
                Session["user_name"] = username;
                Response.Redirect("/Student/default.aspx");

            }
            //check if user is a team admin
            else if (nTeamId > 0)   
            {
                //put the admin status switch to indicate we are in team administrator mode
                Session["admin_sw"] = "1";
                Session["user_id"] = nUserId;				//used in admin team section

                //put the team and  details in the session 
                Session["admin_team_id"] = nTeamId;			//used in admin team  section

                //todo: = do we need this?
                Session["team_id"] = nTeamId;				//used in admin team  section 
                Session["team_name"] = teamName;

                // get current tournament for the team which is used to display the current tournament matches for updates
                int updateDaysAfterEndDate = toInt(ConfigurationManager.AppSettings["CurrentTournamentEndMatchUpdateDays"]);
                dr = m_bl.getTournamentCurrent(nTeamId, updateDaysAfterEndDate);
                if (dr.Read())
                {
                    Session["admin_tournament_id"] = int.Parse(dr["tournament_id"].ToString());     //used in admin section
                    Session["admin_tournament_name"] = dr["name"].ToString();       //used in admin section
                    Session["admin_tournament_overs"] = int.Parse(dr["overs"].ToString());      //used in admin section
                }
                dr.Close();

                Response.Redirect("/AdminTeams/default.aspx");
            }
            else
            {
                lblError.Text = "Invalid login!";
            }
        }
 
    }
}