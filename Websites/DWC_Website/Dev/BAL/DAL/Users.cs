
namespace Cricket.DAL.Users
{
	/// <summary>
	/// Summary description for users.
	/// </summary>
	public class LoginUser : Command
	{
		public LoginUser(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "select u.user_id, t.team_id, t.name from users u left join team t on u.team_id = t.team_id where user_name = @user_name and password = @password";
			addParmText("user_name");
			addParmText("password");
		}
	}

	public class GetUserById : Command
	{
		public GetUserById(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from users where user_id = @user_id";
			addParmInt("user_id");
		}
	}

	public class ChangePassword : Command
	{
		public ChangePassword(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update users set password = @password where user_id = @user_id";
			addParmInt("user_id");
			addParmText("password");
		}
	}


    public class CreateUserData: Command
    {
        public CreateUserData(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "insert into users (user_id, user_name, password, reminder, created_dt, modified_dt, team_id, user_type) " +
                                "values (@user_id, @user_name, @password, @reminder, GetDate(), GetDate(), @team_id, 1) ";
            addParmInt("user_id");
            addParmText("user_name");
            addParmText("password");
            addParmText("reminder");
            addParmInt("team_id");
        }
    }

 

}
