
namespace Cricket.DAL.Matches
{
	public class CheckMatchId : Command
	{
		public CheckMatchId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from match where match_id = @match_id ";
			addParmInt("match_id");
		}
	}
	
	public class GetMatchList : Command
	{
		public GetMatchList(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select m.*, team1_name = t1.name, team2_name = t2.name, winning_team_name = t3.name " +
				"from match m left join team t1 on t1.team_id = m.team1_id " + 
				"left join team t2 on t2.team_id = m.team2_id " + 
				"left join team t3 on t3.team_id = m.winning_team_id " +
				"where (team1_id = @team_id or team2_id = @team_id) and tournament_id = @tournament_id order by match_dt ";
			addParmInt("tournament_id");
			addParmInt("team_id");
		}
	}

    public class GetSchedule : Command
    {
        public GetSchedule(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select m.*, team1 = t1.name, team2 = t2.name, umpiring_team = t3.name, umpiring_team2 = t5.name, winning_team = t4.name, ground = g.name " +
                "from match m  " +
                "left join team t1 on m.team1_id = t1.team_id " +
                "left join team t2 on m.team2_id = t2.team_id " +
                "left join team t3 on m.umpiring_team_id = t3.team_id " +
                "left join team t4 on m.winning_team_id = t4.team_id " +
                "left join team t5 on m.umpiring_team2_id = t5.team_id " +
                "left join ground g on m.ground_id = g.ground_id " +
                "where tournament_id = @tournament_id " +
                "order by  match_dt ";
            addParmInt("tournament_id");
        }
    }

    public class GetSchedule2 : Command
    {
        public GetSchedule2(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select m.*, team1 = t1.name, team2 = t2.name, umpiring_team = t3.name, umpiring_team2 = t5.name, winning_team = t4.name, ground = g.name " +
                "from match m  " +
                "left join team t1 on m.team1_id = t1.team_id " +
                "left join team t2 on m.team2_id = t2.team_id " +
                "left join team t3 on m.umpiring_team_id = t3.team_id " +
                "left join team t4 on m.winning_team_id = t4.team_id " +
                "left join team t5 on m.umpiring_team2_id = t5.team_id " +
                "left join ground g on m.ground_id = g.ground_id " +
                "where (team1_id = @team_id or team2_id = @team_id) and tournament_id = @tournament_id order by match_dt desc ";
            addParmInt("tournament_id");
            addParmInt("team_id");
        }
    }

    public class GetScheduleTop : Command
	{
        public GetScheduleTop(Connection conn)
            : base(conn)
		{
            m_cmd.CommandText = "select top 3 m.*, team1 = t1.name, team2 = t2.name, umpiring_team = t3.name, winning_team = t4.name, ground = g.name " +
				"from match m  " +
				"left join team t1 on m.team1_id = t1.team_id " +
				"left join team t2 on m.team2_id = t2.team_id " +
				"left join team t3 on m.umpiring_team_id = t3.team_id " +
				"left join team t4 on m.winning_team_id = t4.team_id " +
				"left join ground g on m.ground_id = g.ground_id " +
				"where tournament_id = @tournament_id " +
				"order by  match_dt desc ";
			addParmInt("tournament_id");
        }
	}

	public class GetMatchData : Command
	{
		public GetMatchData(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "select m.*, team1 = t1.name, team2 = t2.name, umpiring_team = t3.name, umpiring_team2 = t5.name, winning_team = t4.name, ground = g.name, m.tournament_id " +
				"from match m  " +
				"left join team t1 on m.team1_id = t1.team_id " +
				"left join team t2 on m.team2_id = t2.team_id " +
				"left join team t3 on m.umpiring_team_id = t3.team_id " +
                "left join team t5 on m.umpiring_team2_id = t5.team_id " +
                "left join team t4 on m.winning_team_id = t4.team_id " +
				"left join ground g on m.ground_id = g.ground_id " +
				"where match_id = @match_id ";
			addParmInt("match_id");
		}
	}

	public class GetMatchStats : Command
	{
		public GetMatchStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select ms.*, t.name from match_stats ms inner join team t on t.team_id = ms.team_id where match_id =  @match_id and ms.team_id =  @team_id";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetMatchStats2 : Command
	{
		public GetMatchStats2(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from match_stats where match_id =  @match_id and team_id =  @team_id";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetMatchStatsAll : Command
	{
		public GetMatchStatsAll(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from match_stats where match_id = @match_id ";
			addParmInt("match_id");
		}
	}

	public class CreateMatchData : Command
	{
		public CreateMatchData(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "insert into match (match_id, tournament_id, team1_id, team2_id, umpiring_team_id, winning_team_id, type_cd, match_dt, ground_id, result, mom_player_id, start_time, end_time, umpiring_text, umpiring_team2_id) " +
                                "values (@match_id, @tournament_id, @team1_id, @team2_id, @umpiring_team_id, @winning_team_id, @type_cd, @match_dt, @ground_id, @result, @mom_player_id, @start_time, @end_time, @umpiring_text, @umpiring_team2_id) ";
			addParmInt("match_id");
			addParmInt("tournament_id");
			addParmInt("team1_id");
			addParmInt("team2_id");
            addParmInt("umpiring_team_id");
            addParmInt("umpiring_team2_id");
            addParmText("umpiring_text");
            addParmInt("winning_team_id");
			addParmTinyInt("type_cd");
			addParmDate("match_dt");
			addParmInt("ground_id");
			addParmText("result");
			addParmInt("mom_player_id");
			addParmText("start_time");
			addParmText("end_time");
		}
	}

	public class SetMatchData : Command
	{
		public SetMatchData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update match set tournament_id = @tournament_id, team1_id = @team1_id, team2_id = @team2_id, umpiring_team_id = @umpiring_team_id, winning_team_id = @winning_team_id, " +
                "type_cd = @type_cd, match_dt = @match_dt, ground_id = @ground_id, result = @result, mom_player_id = @mom_player_id, start_time = @start_time, end_time = @end_time, umpiring_text =  @umpiring_text, umpiring_team2_id = @umpiring_team2_id " + 
				"where match_id = @match_id";
			addParmInt("match_id");
			addParmInt("tournament_id");
			addParmInt("team1_id");
			addParmInt("team2_id");
			addParmInt("umpiring_team_id");
            addParmInt("umpiring_team2_id");
            addParmText("umpiring_text");
			addParmInt("winning_team_id");
			addParmTinyInt("type_cd");
			addParmDate("match_dt");
			addParmInt("ground_id");
			addParmText("result");
			addParmInt("mom_player_id");
			addParmText("start_time");
			addParmText("end_time");
		}
	}

	public class SetMatchResult : Command
	{
		public SetMatchResult(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update match set winning_team_id = @winning_team_id, result = @result " + 
				"where match_id = @match_id";
			addParmInt("match_id");
			addParmInt("winning_team_id");
			addParmText("result");
		}
	}

	public class CreateMatchStats : Command
	{
		public CreateMatchStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into match_stats (match_id, team_id, runs_scored, inning_sw, total_runs, wickets, overs, extras, nos, wides, byes, over_throw) " +
								"values (@match_id, @team_id, @runs_scored, @inning_sw, @total_runs, @wickets, @overs, @extras, @nos, @wides, @byes, @over_throw) ";
			addParmInt("match_id");
			addParmInt("team_id");
			addParmInt("runs_scored");
			addParmInt("inning_sw");
			addParmInt("total_runs");
			addParmInt("wickets");
			addParmFloat("overs");
			addParmInt("extras");
			addParmInt("nos");
			addParmInt("wides");
			addParmInt("byes");
			addParmInt("over_throw");
		}
	}

	public class SetMatchStats : Command
	{
		public SetMatchStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update match_stats set inning_sw = @inning_sw, runs_scored = @runs_scored, total_runs = @total_runs, wickets = @wickets, overs = @overs, " + 
				"extras = @extras, nos = @nos, wides = @wides, byes = @byes, over_throw = @over_throw " +
				"where match_id = @match_id and team_id = @team_id";
			addParmInt("match_id");
			addParmInt("team_id");
			addParmInt("inning_sw");
			addParmInt("runs_scored");
			addParmInt("total_runs");
			addParmInt("wickets");
			addParmFloat("overs");
			addParmInt("extras");
			addParmInt("nos");
			addParmInt("wides");
			addParmInt("byes");
			addParmInt("over_throw");
		}
	}

	
	public class SetMatchStats2 : Command
	{
		public SetMatchStats2(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update match_stats set team_id = @team_id " + 
				"where match_id = @match_id and inning_sw = @inning_sw";
			addParmInt("match_id");
			addParmInt("team_id");
			addParmInt("inning_sw");
		}
	}


	public class GetMatchBattingData : Command
	{
		public GetMatchBattingData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select mb.*, p.keeper_sw, p.type_cd, name = p.first_name + ' ' + p.last_name, " + 
								"fielder_name = p1.first_name + ' ' + p1.last_name, " +
								"bowler_name = p2.first_name + ' ' + p2.last_name " +
								"from match_batting mb " + 
								"left join player p on p.player_id = mb.player_id " + 
								"left join player p1 on p1.player_id = mb.fielder_id " + 
								"left join player p2 on p2.player_id = mb.bowler_id " + 
								"where match_id = @match_id " + 
								"and mb.team_id = @team_id order by seq_no";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetMatchBowlingData : Command
	{
		public GetMatchBowlingData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select mb.*, name = p.first_name + ' ' + p.last_name from match_bowling mb " + 
								"inner join player p on p.player_id = mb.player_id where match_id = @match_id " + 
								"and mb.team_id = @team_id order by seq_no";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetMatchPlayerBattingData : Command
	{
		public GetMatchPlayerBattingData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select mb.*, name = p.first_name + ' ' + p.last_name, team_name = t.name " + 
				"from match_batting mb " + 
				"inner join player p on p.player_id = mb.player_id  inner join team t on t.team_id = mb.team_id " + 
				"where match_id = @match_id and mb.team_id = @team_id and mb.player_id = @player_id ";
			addParmInt("match_id");
			addParmInt("team_id");
			addParmInt("player_id");
		}
	}

	public class GetMatchPlayerBowlingData : Command
	{
		public GetMatchPlayerBowlingData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select mb.*, name = p.first_name + ' ' + p.last_name, team_name = t.name from match_bowling mb " + 
								"inner join player p on p.player_id = mb.player_id  inner join team t on t.team_id = mb.team_id " + 
								"where match_id = @match_id and mb.team_id = @team_id and mb.player_id = @player_id";
			addParmInt("match_id");
			addParmInt("team_id");
			addParmInt("player_id");
		}
	}

	public class GetMatchBattingSeqNo : Command
	{
		public GetMatchBattingSeqNo(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select seq_no = isnull(max(seq_no), 0) + 1 from match_batting where match_id = @match_id and team_id = @team_id ";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetMatchBowlingSeqNo : Command
	{
		public GetMatchBowlingSeqNo(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select seq_no = isnull(max(seq_no), 0) + 1 from match_bowling where match_id = @match_id and team_id = @team_id ";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class CreateMatchBatting : Command
	{
		public CreateMatchBatting(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into match_batting (match_id, player_id, team_id, seq_no, status, fielder_id, bowler_id, runs, balls, strike_rate, four, six) " +
								"values (@match_id, @player_id, @team_id, @seq_no, @status, @fielder_id, @bowler_id, @runs, @balls, @strike_rate, @four, @six)";
			addParmInt("match_id");
			addParmInt("player_id");
			addParmInt("team_id");
			addParmInt("seq_no");
			addParmText("status");
			addParmInt("fielder_id");
			addParmInt("bowler_id");
			addParmInt("runs");
			addParmInt("balls");
			addParmFloat("strike_rate");
			addParmInt("four");
			addParmInt("six");
		}
	}

    

    public class SetUmpireCert : Command
    {
        public SetUmpireCert(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "update UmpireCert set Name = @Name, CertifiedBy = @CertifiedBy , TeamName = @TeamName , PlayerID = @PlayerID " +
                                "where id = @id";
            addParmInt("id");
            addParmText("Name");
            addParmText("CertifiedBy");
            addParmText("TeamName");
            addParmText("PlayerID");
        }
    }

    public class SetMatchBatting : Command
	{
		public SetMatchBatting(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update match_batting set team_id = @team_id, status = @status, " + 
				"fielder_id = @fielder_id, bowler_id = @bowler_id, runs = @runs, balls = @balls, " + 
				"strike_rate= @strike_rate, four = @four, six = @six where match_id = @match_id and player_id = @player_id";
			addParmInt("match_id");
			addParmInt("player_id");
			addParmInt("team_id");
			addParmText("status");
			addParmInt("fielder_id");
			addParmInt("bowler_id");
			addParmInt("runs");
			addParmInt("balls");
			addParmFloat("strike_rate");
			addParmInt("four");
			addParmInt("six");
		}
	}

	public class CreateMatchBowling : Command
	{
		public CreateMatchBowling(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into match_bowling (match_id, player_id, team_id, seq_no, overs, maiden, runs, wickets, wide_balls, no_balls, average) " + 
								"values (@match_id, @player_id, @team_id, @seq_no, @overs, @maiden, @runs, @wickets, @wide_balls, @no_balls, @average) ";
			addParmInt("match_id");
			addParmInt("player_id");
			addParmInt("team_id");
			addParmInt("seq_no");
			addParmFloat("overs");
			addParmInt("maiden");
			addParmInt("runs");
			addParmInt("wickets");
			addParmInt("wide_balls");
			addParmInt("no_balls");
			addParmFloat("average");
		}
	}

	public class SetMatchBowling : Command
	{
		public SetMatchBowling(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update match_bowling set team_id = @team_id, overs = @overs, maiden = @maiden, " + 
				"runs = @runs, wickets = @wickets, wide_balls = @wide_balls, no_balls = @no_balls, average = @average  " +
				"where match_id = @match_id and player_id = @player_id";
			addParmInt("match_id");
			addParmInt("player_id");
			addParmInt("team_id");
			addParmFloat("overs");
			addParmInt("maiden");
			addParmInt("runs");
			addParmInt("wickets");
			addParmInt("wide_balls");
			addParmInt("no_balls");
			addParmFloat("average");
		}
	}


	public class DeletePlayerBatting : Command
	{
		public DeletePlayerBatting(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "delete from match_batting where match_id = @match_id and player_id = @player_id ";
			addParmInt("match_id");
			addParmInt("player_id");
		}
	}
    public class DeleteUmpireCert : Command
    {
        public DeleteUmpireCert(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "delete from UmpireCert where id = @id ";
            addParmInt("id");
        }
    }

    public class DeletePlayerBowling : Command
	{
		public DeletePlayerBowling(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "delete from match_bowling where match_id = @match_id and player_id = @player_id ";
			addParmInt("match_id");
			addParmInt("player_id");
		}
	}

	public class GetTeamMatches : Command
	{
		public GetTeamMatches(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from match where tournament_id = @tournament_id and @team_id in (team1_id, team2_id) and winning_team_id != 0 ";
			addParmInt("tournament_id");
			addParmInt("team_id");
		}
	}

	public class GetTeamIdForHighestScore : Command
	{
		public GetTeamIdForHighestScore(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select ms.team_id from match_batting  mb " +
				"inner join match_stats ms on ms.match_id = mb.match_id and ms.team_id != mb.team_id " +
				"where mb.match_id = @match_id and mb.player_id = @player_id ";
			addParmInt("match_id");
			addParmInt("player_id");
		}
	}

	public class CheckMatchStatsExists : Command
	{
		public CheckMatchStatsExists(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from match_Stats  " +
				"where (runs_scored > 0 or total_runs > 0 or overs > 0) " +
				"and match_id = @match_id and team_id = @team_id";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}


	public class GetMatchType : Command
	{
		public GetMatchType(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select type_cd from match " +
				"where match_id = @match_id ";
			addParmInt("match_id");
		}
	}
}
