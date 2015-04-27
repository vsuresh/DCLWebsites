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
	public class PageBaseTournament : PageBase
	{
        protected int tournamentId = 0;
        protected string tournamentName = "None";

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (!IsPostBack)
            {
                // get the id form query string if one exists and set it 
                int tournamentIDFromRequest = toInt(Request.QueryString["TournamentID"]);
                if (tournamentIDFromRequest > 0 && tournamentIDFromRequest != tournamentId)
                {
                    tournamentId = tournamentIDFromRequest;
                    tournamentName = GetTournamentName(tournamentId);

                    Session["tournament_id"] = tournamentId;
                    Session["tournament_name"] = tournamentName;
                }

                // check if we have the tournament id in session
                if (tournamentId <= 0)
                {
                    tournamentId = toInt(Session["tournament_id"]);
                    tournamentName = Session["tournament_name"] as string;
                    if (tournamentId <= 0)
                    {
                        Response.Redirect("~/default.aspx");
                    }
                }
            }
		}

        private string GetTournamentName(int tournamentId)
        {
            string name = string.Empty;
            using (SqlCommand com = new SqlCommand("select * from tournament where tournament_id = " + tournamentId.ToString(), m_bl.GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    name = dr["name"] as string;
                }
                dr.Close();

                return name;
            }
        }
    }
}

