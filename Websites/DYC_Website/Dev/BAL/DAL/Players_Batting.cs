
namespace Cricket.DAL.Players_Batting
{

	public class GetBattingStatistics : Command
	{
		public GetBattingStatistics(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_batting pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id ";
			addParmInt("tournament_id");
		}
	}

	public class GetTopBattingAggregates : Command
	{
		public GetTopBattingAggregates(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_batting pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id " + 
				"order by pb.runs desc, pb.average desc ";
			addParmInt("tournament_id");
		}
	}
	
	public class GetTopBattingAverages : Command
	{
		public GetTopBattingAverages(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_batting pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id " + 
				"and pb.innings > (select MAX(played) * 0.35 from tournament_team where tournament_id = @tournament_id) " +
				"order by pb.average desc, pb.strike_rate desc ";
			addParmInt("tournament_id");
		}
	}

	public class GetTopBattingScores : Command
	{
		public GetTopBattingScores(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_batting pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id " + 
				"order by pb.highest desc, pb.average desc ";
			addParmInt("tournament_id");
		}
	}

	public class GetTopBattingStrikeRate : Command
	{
		public GetTopBattingStrikeRate(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_batting pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id " + 
				"and pb.innings > (select MAX(played) * 0.35 from tournament_team where tournament_id = @tournament_id) " +
				"order by pb.strike_rate desc, pb.average desc ";
			addParmInt("tournament_id");
		}
	}

	public class GetTopCatches : Command
	{
		public GetTopCatches(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "select top 20 team_name = t.name, t.team_id, catches.* from team t inner join player p on p.team_id = t.team_id inner join " +
                "(select player_id = mb.fielder_id, name = p.first_name + ' ' + p.last_name, catches = COUNT(mb.fielder_id)  " + 
                "from match_batting mb  " +
                "inner join match m on m.match_id = mb.match_id and m.tournament_id = @tournament_id " + 
                "inner join player p on p.player_id = mb.fielder_id " + 
                "and status in ('caught', 'caught behind') " +
                "group by mb.fielder_id, p.first_name, p.last_name, tournament_id)  as catches " +
                "on catches.player_id = p.player_id " +
                "order by catches desc ";
			addParmInt("tournament_id");
		}
	}

}
