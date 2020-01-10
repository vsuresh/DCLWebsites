using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cricket;

/// <summary>
/// Summary description for PageBaseTutorial
/// </summary>
public class PageBaseStudent : PageBase
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
            int userId = toInt(Session["user_id"]);
            if (teamId > 0 || userId != 9999)
            {
                Response.Redirect("/default.aspx");
            }
        }
    }

}

