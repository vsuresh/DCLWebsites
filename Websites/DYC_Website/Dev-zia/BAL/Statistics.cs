using System.Data;
using System.Data.SqlClient;
using Cricket.DAL;
using Cricket.DAL.Players_Batting;
using Cricket.DAL.Players_Bowling;

namespace Cricket.BAL
{

	public class DataStatistics : Data
	{
		public DataStatistics(Connection conn) : base(conn)
		{
		}
	
		public DataTable getBattingStatistics(int nTournamentId)
		{
			GetBattingStatistics cmd = new GetBattingStatistics(m_conn);
			cmd.setParm("tournament_id", nTournamentId);

			DataTable dt = new DataTable();
			SqlDataAdapter da = new SqlDataAdapter();
			da.SelectCommand = cmd.SqlCommand;
			da.Fill(dt);
			return dt;
		}	
	
		public SqlDataReader getTopBattingAggregates(int nTournamentId)
		{
			GetTopBattingAggregates cmd = new GetTopBattingAggregates(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public SqlDataReader getTopBattingAverages(int nTournamentId)
		{
			GetTopBattingAverages cmd = new GetTopBattingAverages(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public SqlDataReader getTopBattingScores(int nTournamentId)
		{
			GetTopBattingScores cmd = new GetTopBattingScores(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public SqlDataReader getTopBattingStrikeRate(int nTournamentId)
		{
			GetTopBattingStrikeRate cmd = new GetTopBattingStrikeRate(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	

		public SqlDataReader getTopCatches(int nTournamentId)
		{
			GetTopCatches cmd = new GetTopCatches(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public DataTable getBowlingStatistics(int nTournamentId)
		{
			GetBowlingStatistics cmd = new GetBowlingStatistics(m_conn);
			cmd.setParm("tournament_id", nTournamentId);

			DataTable dt = new DataTable();
			SqlDataAdapter da = new SqlDataAdapter();
			da.SelectCommand = cmd.SqlCommand;
			da.Fill(dt);
			return dt;
		}	

		public SqlDataReader getTopBowlingWicketTakers(int nTournamentId)
		{
			GetTopBowlingWicketTakers cmd = new GetTopBowlingWicketTakers(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public SqlDataReader getTopBowlingEconomyRate(int nTournamentId)
		{
			GetTopBowlingEconomyRate cmd = new GetTopBowlingEconomyRate(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public SqlDataReader getTopBowlingAverage(int nTournamentId)
		{
			GetTopBowlingAverage cmd = new GetTopBowlingAverage(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
		public SqlDataReader getTopBowlingBestInning(int nTournamentId)
		{
			GetTopBowlingBestInning cmd = new GetTopBowlingBestInning(m_conn);
			cmd.setParm("tournament_id", nTournamentId);
			return cmd.executeReader();		
		}	
	
	}
}
