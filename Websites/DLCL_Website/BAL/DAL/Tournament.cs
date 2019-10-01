
namespace Cricket.DAL.Tournament
{
	public class GetTournamentList : Command
	{
		public GetTournamentList(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select tournament_id, name from tournament order by start_dt desc, name";
		}
	}

	public class GetTournamentListByTeam : Command
	{
        public GetTournamentListByTeam(Connection conn)
            : base(conn)
		{
            m_cmd.CommandText = "select t.tournament_id, t.name, start_dt, end_dt " +
                    "from tournament_Team tt inner join tournament t " +
                    "on t.tournament_id = tt.tournament_id " +
                    "and tt.team_id = @team_id order by t.start_dt desc ";
            addParmInt("team_id");
        }
    }
    
    public class GetChaukaLoginData : Command
    {
        public GetChaukaLoginData(Connection conn) : base(conn)
        {
            m_cmd.CommandText = "select top 1 * from ChaukaLogin where ChaukaUser = @ChaukaUser ";
            addParmText("ChaukaUser");
        }
    }

    public class GetGroupNames : Command
    {
        public GetGroupNames(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select distinct group_name from tournament order by group_name ";
        }
    }
    public class GetTournamentCurrent : Command
    {
        public GetTournamentCurrent(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select top 1 t.tournament_id, name, overs, start_dt, end_dt  " +
                "from tournament t  " +
                "where start_dt <= getDate() and (end_dt + @days) > getDate()  " +
                "and t.tournament_id in (select tournament_id from tournament_team where tournament_id = t.tournament_id and team_id = @team_id) " +
                "order by start_dt desc ";
            addParmInt("team_id");
            addParmInt("days");
        }
    }


	public class CheckTournamentTeam : Command
	{
		public CheckTournamentTeam(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from tournament_team where tournament_id = @tournament_id and team_id = @team_id";
			addParmInt("tournament_id");
			addParmInt("team_id");
		}
	}

	
	public class GetNewTournamentId : Command
	{
		public GetNewTournamentId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select isnull(MAX(tournament_id), 0) + 1 from tournament";
		}
	}

	public class GetNewTournamentTeamRecId : Command
	{
		public GetNewTournamentTeamRecId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select isnull(MAX(rec_id), 0) + 1 from tournament_team where tournament_id = @tournament_id";
			addParmInt("tournament_id");
		}
	}

	public class GetTournamentData : Command
	{
		public GetTournamentData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from tournament where tournament_id = @tournament_id ";
			addParmInt("tournament_id");
		}
	}

	public class AddTournamentTeam : Command
	{
		public AddTournamentTeam(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into tournament_team (tournament_id, rec_id, team_id, active_sw, created_dt) " +
				"values (@tournament_id, @rec_id, @team_id, @active_sw, GetDate()) ";
			addParmInt("tournament_id");
			addParmInt("rec_id");
			addParmInt("team_id");
			addParmTinyInt("active_sw");
		}
	}

	public class CreateTournament : Command
	{
		public CreateTournament(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "insert into tournament (tournament_id, name, description, created_dt, start_dt, end_dt, overs, fees, regstart_dt, regend_dt, group_name, registration_info, format) " +
                "values (@tournament_id, @name, @description, GetDate(), @start_dt, @end_dt, @overs, @fees, @regstart_dt, @regend_dt, @group_name, @registration_info, @format) ";
			addParmInt("tournament_id");
			addParmText("name");
			addParmText("description");
            addParmDate("start_dt");
            addParmDate("end_dt");
            addParmInt("overs");
            addParmInt("fees");
            addParmDate("regstart_dt");
            addParmDate("regend_dt");
            addParmText("group_name");
            addParmText("registration_info");
            addParmText("format");
        }
	}

	public class SetTournamentData : Command
	{
		public SetTournamentData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update tournament set " +
				"name = @name, description = @description, created_dt = GetDate(), start_dt = @start_dt, end_dt = @end_dt, overs = @overs, " +
                "fees = @fees, regstart_dt = @regstart_dt, regend_dt = @regend_dt, registration_info = @registration_info, format = @format, group_name = @group_name " +
				"where tournament_id = @tournament_id ";
			addParmInt("tournament_id");
			addParmText("name");
			addParmText("description");
			addParmDate("start_dt");
			addParmDate("end_dt");
			addParmInt("overs");
            addParmInt("fees");
            addParmDate("regstart_dt");
            addParmDate("regend_dt");
            addParmText("group_name");
            addParmText("registration_info");
            addParmText("format");
        }
	}

}
