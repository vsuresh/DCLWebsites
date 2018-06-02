using System;
using System.Data.SqlClient;

namespace Cricket.DAL.Penalty
{

	public class GetTeamPenalty : Command
	{
		public GetTeamPenalty(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select points = SUM(points) from penalty where tournament_id = @tournament_id and team_id = @team_id ";
			addParmInt("tournament_id");
			addParmInt("team_id");
		}
	}

	public class GetPenaltyAll : Command
	{
		public GetPenaltyAll(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select p.*, t.name from penalty p inner join team t on t.team_id = p.team_id where p.tournament_id = @tournament_id order by points desc, name";
			addParmInt("tournament_id");
		}
	}

  public class DeletePenalty : Command
  {
    public DeletePenalty(Connection conn) : base(conn)
    {
      m_cmd.CommandText = "Delete penalty where tournament_id = @tournament_id and penalty_id = @penalty_id";
      addParmInt("tournament_id");
      addParmInt("penalty_id");
    }
  }
}
