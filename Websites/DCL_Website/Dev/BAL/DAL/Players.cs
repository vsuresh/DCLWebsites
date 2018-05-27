
using System.Data.SqlClient;

namespace Cricket.DAL.Players
{
	public class CheckPlayerId : Command
	{
		public CheckPlayerId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from player where player_id = @player_id ";
			addParmInt("player_id");
		}
	}
	
	public class GetPlayerName : Command
	{
		public GetPlayerName(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from player where player_id = @player_id ";
			addParmInt("player_id");
		}
	}
	
	public class CheckPlayerName : Command
	{
		public CheckPlayerName(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from player where team_id = @team_id and first_name = @first_name and last_name = @last_name ";
			addParmInt("team_id");
			addParmText("first_name");
			addParmText("last_name");
		}
	}
    public class GetActivePlayerList : Command
    {
        public GetActivePlayerList(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select player_id, name = first_name + ' ' + last_name, address, number, keeper_sw, type_cd from player pl " +
                "inner join email e on e.email_id = pl.email_id inner join phone p on p.phone_id = pl.phone_id " +
                "where team_id = @team_id and (end_dt = '' or end_dt = NULL) order by type_cd desc, name ";
            addParmInt("team_id");
        }
    }
    public class GetPlayerList : Command
    {
        public GetPlayerList(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select player_id, name = first_name + ' ' + last_name, address, number, keeper_sw, type_cd, end_dt from player pl " +
                "inner join email e on e.email_id = pl.email_id inner join phone p on p.phone_id = pl.phone_id " +
                "where team_id = @team_id order by end_dt asc, type_cd desc, name ";
            addParmInt("team_id");
        }
    }
    public class GetActivePlayerSortedList : Command
	{
		public GetActivePlayerSortedList(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select player_id, name = first_name + ' ' + last_name, address, number, keeper_sw, type_cd from player pl " +
								"inner join email e on e.email_id = pl.email_id inner join phone p on p.phone_id = pl.phone_id " +
								"where team_id = @team_id and (end_dt = '' or end_dt = NULL) order by name ";
			addParmInt("team_id");
		}
	}
	public class GetInActivePlayerList : Command
	{
		public GetInActivePlayerList(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select player_id, name = first_name + ' ' + last_name, address, number, keeper_sw, type_cd from player pl " +
				"inner join email e on e.email_id = pl.email_id inner join phone p on p.phone_id = pl.phone_id " +
				"where team_id = @team_id and (end_dt != '' and end_dt != NULL) order by name ";
			addParmInt("team_id");
		}
	}
    public class GetPlayerReport : Command
    {
        public GetPlayerReport(Connection conn, string groupName) : base(conn)
        {
    
            m_cmd.CommandText = "GetPlayerListByGroupName";
            m_cmd.CommandType = System.Data.CommandType.StoredProcedure;
            // 3. add parameter to command, which will be passed to the stored procedure
            m_cmd.Parameters.Add(new SqlParameter("@group_name", groupName));
            m_cmd.CommandTimeout = 240;
            // addParmInt("tournament_id");
        }
    }

    public class GetMatchBattingPlayerList : Command
	{
		public GetMatchBattingPlayerList(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select player_id, name = first_name + ' ' + last_name from player pl " + 
								"where team_id = @team_id and (end_dt = '' or end_dt = NULL) and player_id not in (select player_id from match_batting where match_id = @match_id  and team_id = @team_id) " +
								"order by name ";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetMatchBowlingPlayerList : Command
	{
		public GetMatchBowlingPlayerList(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select player_id, name = first_name + ' ' + last_name from player pl " + 
				"where team_id = @team_id and (end_dt = '' or end_dt = NULL) and player_id not in (select player_id from match_bowling where match_id = @match_id  and team_id = @team_id) " +
				"order by name ";
			addParmInt("match_id");
			addParmInt("team_id");
		}
	}

	public class GetPlayerData : Command
	{
		public GetPlayerData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from player pl inner join team t on pl.team_id = t.team_id left join phone p on p.phone_id = pl.phone_id left join email e on e.email_id = pl.email_id " +
								"where pl.player_id = @player_id ";
			addParmInt("player_id");
		}
	}

	public class CreatePlayer : Command
	{
		public CreatePlayer(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into player (player_id, team_id, first_name, last_name, age, batting_style, bowling_style, batting_position, start_dt, end_dt, photo_url, comments, keeper_sw, type_cd, phone_id, email_id) " +
				"values (@player_id, @team_id, @first_name, @last_name, @age, @batting_style, @bowling_style, @batting_position, @start_dt, @end_dt, @photo_url, @comments, @keeper_sw, @type_cd, @phone_id, @email_id) ";
			addParmInt("team_id");
			addParmInt("player_id");
			addParmText("first_name");
			addParmText("last_name");
			addParmText("age");
			addParmText("batting_style");
			addParmText("bowling_style");
			addParmText("batting_position");
			addParmText("start_dt");
			addParmText("end_dt");
			addParmText("photo_url");
			addParmText("comments");
			addParmInt("phone_id");
			addParmInt("email_id");
			addParmInt("keeper_sw");
			addParmInt("type_cd");
		}
	}

	public class SetPlayer : Command
	{
		public SetPlayer(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update player set first_name = @first_name, last_name = @last_name, age = @age, " + 
				"batting_style = @batting_style, bowling_style = @bowling_style, batting_position = @batting_position, " +
				"start_dt = @start_dt, end_dt = @end_dt, photo_url = @photo_url, comments = @comments, keeper_sw = @keeper_sw, type_cd = @type_cd, " +
				"phone_id = @phone_id, email_id = @email_id " + 
				"where team_id = @team_id and player_id = @player_id";
			addParmInt("team_id");
			addParmInt("player_id");
			addParmText("first_name");
			addParmText("last_name");
			addParmText("age");
			addParmText("batting_style");
			addParmText("bowling_style");
			addParmText("batting_position");
			addParmText("start_dt");
			addParmText("end_dt");
			addParmText("photo_url");
			addParmText("comments");
			addParmInt("phone_id");
			addParmInt("email_id");
			addParmInt("keeper_sw");
			addParmInt("type_cd");
		}
	}

	public class GetPlayerMatchCount : Command
	{
		public GetPlayerMatchCount(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select matches = count(*) from match_batting mb inner join match m on m.match_id = mb.match_id and m.tournament_id = @tournament_id and mb.player_id = @player_id ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}

	public class GetPlayerBattingData : Command
	{
		public GetPlayerBattingData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select mb.* from match_batting mb inner join match m on m.match_id = mb.match_id and m.tournament_id = @tournament_id and mb.player_id = @player_id ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}

	public class GetPlayerBowlingData : Command
	{
		public GetPlayerBowlingData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select mb.* from match_bowling mb inner join match m on m.match_id = mb.match_id and m.tournament_id = @tournament_id and mb.player_id = @player_id ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}

	public class CheckPlayerBattingStats : Command
	{
		public CheckPlayerBattingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from player_batting where player_id = @player_id and tournament_id = @tournament_id ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}
	
	public class CheckPlayerBowlingStats : Command
	{
		public CheckPlayerBowlingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from player_bowling where player_id = @player_id and tournament_id = @tournament_id  ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}
	

	public class GetPlayerBattingStats : Command
	{
		public GetPlayerBattingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from player_batting where player_id = @player_id and tournament_id = @tournament_id  ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}

	public class GetPlayerBowlingStats : Command
	{
		public GetPlayerBowlingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from player_bowling where player_id = @player_id and tournament_id = @tournament_id  ";
			addParmInt("player_id");
			addParmInt("tournament_id");
		}
	}

	public class CreatePlayerBattingStats : Command
	{
		public CreatePlayerBattingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into player_batting (player_id, tournament_id, matches, innings, runs, not_outs, average, strike_rate, highest, hundred, fifty, four, six, duck, highestvs_team_id) " +
				"values (@player_id, @tournament_id, @matches, @innings, @runs, @not_outs, @average, @strike_rate, @highest, @hundred, @fifty, @four, @six, @duck, @highestvs_team_id) ";
			addParmInt("player_id");
			addParmInt("tournament_id");
			addParmInt("matches");
			addParmInt("innings");
			addParmInt("runs");
			addParmInt("not_outs");
			addParmFloat("average");
			addParmFloat("strike_rate");
			addParmInt("highest");
			addParmInt("hundred");
			addParmInt("fifty");
			addParmInt("four");
			addParmInt("six");
			addParmInt("duck");
			addParmInt("highestvs_team_id");
		}
	}

	public class SetPlayerBattingStats : Command
	{
		public SetPlayerBattingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update player_batting set matches = @matches, innings = @innings, runs = @runs, " + 
				"not_outs = @not_outs, average = @average, strike_rate = @strike_rate, " +
				"highest = @highest, hundred = @hundred, fifty = @fifty, " +
				"four = @four, six = @six, duck = @duck, highestvs_team_id = @highestvs_team_id " +
				"where player_id = @player_id and tournament_id = @tournament_id ";
			addParmInt("player_id");
			addParmInt("tournament_id");
			addParmInt("matches");
			addParmInt("innings");
			addParmInt("runs");
			addParmInt("not_outs");
			addParmFloat("average");
			addParmFloat("strike_rate");
			addParmInt("highest");
			addParmInt("hundred");
			addParmInt("fifty");
			addParmInt("four");
			addParmInt("six");
			addParmInt("duck");
			addParmInt("highestvs_team_id");
		}
	}

	public class CreatePlayerBowlingStats : Command
	{
		public CreatePlayerBowlingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into player_bowling (player_id, tournament_id, matches, innings, overs, maidens, wickets, runs, average, economy_rate, best) " +
				"values (@player_id, @tournament_id, @matches, @innings, @overs, @maidens, @wickets, @runs, @average, @economy_rate, @best) ";
			addParmInt("player_id");
			addParmInt("tournament_id");
			addParmInt("matches");
			addParmInt("innings");
			addParmFloat("overs");
			addParmInt("maidens");
			addParmInt("wickets");
			addParmInt("runs");
			addParmFloat("average");
			addParmFloat("economy_rate");
			addParmText("best");
		}
	}

	public class SetPlayerBowlingStats : Command
	{
		public SetPlayerBowlingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update player_bowling set matches = @matches, innings = @innings, overs = @overs, " + 
				"wickets = @wickets, runs = @runs, average = @average, best = @best, " +
				"maidens = @maidens, economy_rate = @economy_rate " + 
				"where player_id = @player_id and tournament_id = @tournament_id";
			addParmInt("player_id");
			addParmInt("tournament_id");
			addParmInt("matches");
			addParmInt("innings");
			addParmFloat("overs");
			addParmInt("maidens");
			addParmInt("wickets");
			addParmInt("runs");
			addParmFloat("average");
			addParmFloat("economy_rate");
			addParmText("best");
		}
	}

	public class GetAllPlayersBattingStats : Command
	{
		public GetAllPlayersBattingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select name = p.first_name + ' ' + p.last_name, pb.* from player p inner join player_batting pb on pb.player_id = p.player_id " +
				"and p.team_id = @team_id and (p.end_dt = '' or p.end_dt = NULL) " + 
				"and pb.tournament_id = @tournament_id order by pb.runs desc ";
			addParmInt("tournament_id");
			addParmInt("team_id");
		}
	}
	
	public class GetAllPlayersBowlingStats : Command
	{
		public GetAllPlayersBowlingStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select name = p.first_name + ' ' + p.last_name, pb.* from player p inner join player_bowling pb on pb.player_id = p.player_id " +
				"and p.team_id = @team_id  and (p.end_dt = '' or p.end_dt = NULL) " + 
				"and pb.tournament_id = @tournament_id order by pb.wickets desc ";
			addParmInt("tournament_id");
			addParmInt("team_id");
		}
	}
	
}
