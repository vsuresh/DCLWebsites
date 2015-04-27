using System;
using System.Data.SqlClient;
using Cricket;
using Cricket.BAL;
using Cricket.controls;

namespace Cricket
{
	/// <summary>
	/// Summary description for PageBase.
	/// </summary>
	public class PageBaseAdmin : PageBase
	{
        protected int m_nUserId;
        protected int m_nTeamId;
        protected int m_nTournamentId = 0;
        protected string m_strTournamentName = "None";
        protected int m_nTournamentMatchOvers = 0;
        protected string m_strTeamName = "";

        protected int parentRegistrationID = 0;

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            // initialize team admin login data from session
            int nAdminSw = toInt(Session["admin_sw"]);
            m_nTeamId = toInt(Session["admin_team_id"]);
            m_nUserId = toInt(Session["user_id"]);
            m_nTournamentId = toInt(Session["admin_tournament_id"]);
            m_strTournamentName = Session["admin_tournament_name"] as string;
            m_nTournamentMatchOvers = toInt(Session["admin_tournament_overs"]);
            m_strTeamName = Session["team_name"] as string;

            parentRegistrationID = toInt(Session["parentregistration_id"]);


            //security check - ensure we are logged in
            bool parentLogin = parentRegistrationID > 0;
            bool adminLogin = nAdminSw == 1;
            bool sysadminLogin = (IsSysAdmin() && m_nTeamId <= 0);

            if (!adminLogin && !parentLogin && ! sysadminLogin)
                Response.Redirect("~/default.aspx");
                

            //if (!(parentLogin || adminLogin || sysadminLogin))
            //    Response.Redirect("~/default.aspx");
        }

        protected bool IsSysAdmin()
        {
            return (m_nUserId == 1);
        }

        protected void checkSysAdmin()
        {
            if (!IsSysAdmin())
                Response.Redirect("~/default.aspx");
        }

	}
}

