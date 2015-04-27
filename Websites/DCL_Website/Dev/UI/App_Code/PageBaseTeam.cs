using System;
using System.Web.UI;
using Cricket.BAL;
using Cricket.controls;

namespace Cricket
{
	/// <summary>
	/// Summary description for PageBase.
	/// </summary>
    public class PageBaseTeam : PageBase
    {
        protected int teamId = 0;
        //protected string teamName = "";

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);


            //testing: DT team id
            //Session["team_id"] = 665505850;
            //teamId = 665505850;
            //tournamentId = 1086433297;

            if (!IsPostBack)
            {
                //get the id's from session
                //teamId = toInt(Session["team_id"]);

                // ge tthe team id from teh query string
                teamId = toInt(Request.QueryString["teamId"]);
                if (teamId <= 0)
                    teamId = toInt(Session["teamId"]);

                if (teamId > 0)
                {
                    // get the team name from db and put it in session
                    if (teamId != toInt(Session["teamId"]))
                    {
                        Session["teamId"] = teamId;
                        Session["teamName"] = m_bl.getTeamName(teamId);
                    }
                }
                else
                    Response.Redirect("/default.aspx");
                
            }
        }

    }
}
