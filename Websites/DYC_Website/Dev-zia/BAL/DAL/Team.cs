
namespace Cricket.DAL.Team
{
	public class CheckTeamId : Command
	{
		public CheckTeamId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from team where team_id = @team_id ";
			addParmInt("team_id");
		}
	}

	public class CheckTeamName : Command
	{
		public CheckTeamName(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from team where name = @name ";
			addParmText("name");
		}
	}

	public class GetTeamData : Command
	{
		public GetTeamData(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select t.*, a.*, p.*, e.* " +
								"from team t left join address a on t.address_id = a.address_id " + 
								"left join phone p on p.phone_id = t.phone_id left join email e on e.email_id = t.email_id " +
								"where team_id = @team_id ";
			addParmInt("team_id");
		}
	}

	public class SetTeamData : Command
	{
		public SetTeamData(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "update team set name = @name, description = @description, contact_name = @contact_name, contact_email = @contact_email," + 
								"ground_name = @ground_name, active_sw = @active_sw where team_id = @team_id ";
			addParmInt("team_id");
			addParmText("name");
			addParmTextLong("description");
            addParmText("contact_name");
            addParmText("contact_email");
            addParmText("ground_name");
            addParmInt("active_sw");
		}
	}


	public class CreateTeamData : Command
	{
		public CreateTeamData(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "insert into team (team_id, name, description, contact_name, contact_email, address_id, phone_id, email_id, ground_name, created_dt, active_sw) " +
                                "values (@team_id, @name, @description, @contact_name, @contact_email, @address_id, @phone_id, @email_id, @ground_name, GetDate(), @active_sw) ";
			addParmInt("team_id");
			addParmText("name");
			addParmTextLong("description");
            addParmText("contact_name");
            addParmText("contact_email");
            addParmInt("address_id");
			addParmInt("phone_id");
			addParmInt("email_id");
			addParmText("ground_name");
            addParmInt("active_sw");
		}
	}

	public class GetTeamListByTeamId : Command
	{
		public GetTeamListByTeamId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select team_id, name from team where team_id != @team_id";
			addParmInt("team_id");
		}
	}

    public class GetTeamList : Command
    {
        public GetTeamList(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select team_id, name from team order by name";
        }
    }

    public class GetTeamListActive : Command
    {
        public GetTeamListActive(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select team_id, name from team where active_sw = 1 order by name";
        }
    }


    public class GetTeamListByTournament : Command
    {
        public GetTeamListByTournament(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "select t.* from team t inner join tournament_team tm on tm.team_id = t.team_id and tm.tournament_id = @tournament_id order by name";
            addParmInt("tournament_id");
        }
    }

    public class SetTeamStats : Command
	{
		public SetTeamStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update tournament_team set " +
				"played = @played, won = @won, lost = @lost, tie = @tie, " +
				"for_runs = @for_runs, for_overs = @for_overs, for_rr = @for_rr, " +
				"opp_runs = @opp_runs, opp_overs = @opp_overs, opp_rr = @opp_rr, " +
				"net_rr = @net_rr, points = @points " +
				"where tournament_id = @tournament_id and team_id = @team_id ";
			addParmInt("tournament_id");
			addParmInt("team_id");
			addParmTinyInt("played");
			addParmTinyInt("won");
			addParmTinyInt("lost");
			addParmTinyInt("tie");
			addParmInt("for_runs");
			addParmFloat("for_overs");
			addParmFloat("for_rr");
			addParmInt("opp_runs");
			addParmFloat("opp_overs");
			addParmFloat("opp_rr");
			addParmFloat("net_rr");
			addParmInt("points");
		}
	}

	public class GetTeamStats : Command
	{
		public GetTeamStats(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select t.name, tt.* from tournament_team tt " +
				"inner join team t on tt.team_id = t.team_id " +
				"where tournament_id = @tournament_id and t.active_sw = 1 " +
                "order by group_id, points desc, net_rr desc, previous_rank ";
			addParmInt("tournament_id");
		}
	}

	public class GetTeamStatsByGroup : Command
	{
		public GetTeamStatsByGroup(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select t.name, tt.* from tournament_team tt " +
				"inner join team t on tt.team_id = t.team_id " +
				"where tournament_id = @tournament_id and t.active_sw = 1 " +
				"order by group_id asc, points desc, net_rr desc ";
			addParmInt("tournament_id");
		}
	}
}
