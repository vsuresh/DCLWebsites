using System;
using System.Data.SqlClient;

namespace Cricket.DAL.Players_Bowling
{

	public class GetBowlingStatistics : Command
	{
		public GetBowlingStatistics(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_bowling pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id ";
			addParmInt("tournament_id");
		}
	}
	
	public class GetTopBowlingWicketTakers : Command
	{
		public GetTopBowlingWicketTakers(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_bowling pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id " + 
				"order by pb.wickets desc, pb.economy_rate asc ";
			addParmInt("tournament_id");
		}
	}
	
	public class GetTopBowlingEconomyRate : Command
	{
		public GetTopBowlingEconomyRate(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_bowling pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id and pb.overs > 0 " + 
				"and pb.innings > (select MAX(played) * 0.35 from tournament_team where tournament_id = @tournament_id) " +
				"order by pb.economy_rate asc, pb.wickets desc ";
			addParmInt("tournament_id");
		}
	}
	
	public class GetTopBowlingAverage : Command
	{
		public GetTopBowlingAverage(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.* " + 
				"from player p inner join player_bowling pb on pb.player_id = p.player_id " +
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id and pb.wickets > 0 " + 
				"and pb.innings > (select MAX(played) * 0.35 from tournament_team where tournament_id = @tournament_id) " +
				"order by pb.average asc, economy_rate asc ";
			addParmInt("tournament_id");
		}
	}
	
	public class GetTopBowlingBestInning : Command
	{
		public GetTopBowlingBestInning(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select top 20 " +
				"best_wkts = Convert(int, Left(pb.best, charindex('/', pb.best)-1)), " + 
				"best_runs = Convert(int, Right(pb.best, Len(pb.best) - charindex('/', pb.best))),  " + 
				"name = p.first_name + ' ' + p.last_name, team_name = t.name, pb.*  " + 
				"from player p inner join player_bowling pb on pb.player_id = p.player_id  " + 
				"and (p.end_dt = '' or p.end_dt = NULL) and pb.tournament_id = @tournament_id " + 
				"inner join team t on p.team_id = t.team_id  " + 
				"order by best_wkts desc, best_runs asc, economy_rate asc ";
			addParmInt("tournament_id");
		}
	}
	

}
