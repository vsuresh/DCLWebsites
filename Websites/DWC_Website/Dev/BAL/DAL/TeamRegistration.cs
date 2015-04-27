
namespace Cricket.DAL.TeamRegistration
{

	public class GetNewTeamRegistrationRecId : Command
	{
		public GetNewTeamRegistrationRecId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select isnull(MAX(rec_id), 0) + 1 from team_registration where tournament_id = @tournament_id";
			addParmInt("tournament_id");
		}
	}

	public class GetTeamRegistrations : Command
	{
		public GetTeamRegistrations(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select * from team_registration where tournament_id = @tournament_id and active_sw = @active_sw order by created_dt";
            addParmInt("tournament_id");
            addParmInt("active_sw");
		}
	}

    public class AddPaymentDetails : Command
    {
        public AddPaymentDetails(Connection conn)
            : base(conn)
        {
            m_cmd.CommandText = "insert into PaymentDetails(RegistrationID,OrderId,Amount,PaymentStatus,PaymentDate) values(@RegistrationID,@OrderId,@Amount,@PaymentStatus,@PaymentDate)";

            addParmGuid("RegistrationID");
            addParmText("OrderId");
            addParmText("Amount");
            addParmText("PaymentStatus");
            addParmDate("PaymentDate");
        }
    }

	public class CreateTeamRegistration : Command
	{
		public CreateTeamRegistration(Connection conn) : base(conn)
		{
            m_cmd.CommandText = "insert into team_registration (RegistrationID,tournament_id, rec_id, team_id, name, contact1_name, contact1_title, contact1_phone, contact1_email, contact2_name, contact2_title, contact2_phone, contact2_email, location, comments, created_dt, order_id) " +
                "values (@RegistrationID,@tournament_id, @rec_id, @team_id, @name, @contact1_name, @contact1_title, @contact1_phone, @contact1_email, @contact2_name, @contact2_title, @contact2_phone, @contact2_email, @location, @comments, GetDate(), @order_id) ";

            addParmGuid("RegistrationID");
			addParmInt("tournament_id");
			addParmInt("rec_id");
			addParmInt("team_id");
			addParmText("name");
			addParmText("contact1_name");
			addParmText("contact1_title");
			addParmText("contact1_phone");
			addParmText("contact1_email");
			addParmText("contact2_name");
			addParmText("contact2_title");
			addParmText("contact2_phone");
			addParmText("contact2_email");
			addParmText("location");
			addParmText("comments");
            addParmText("order_id");
		}
	}


	public class CreatePayPalRegistration : Command
	{
		public CreatePayPalRegistration(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into tblRegistration (RegistrationID, TeamName, Location, ContactName) " +
				"values (@RegistrationID, @TeamName, @Location, @ContactName) ";
			addParmGuid("RegistrationID");
			addParmText("TeamName");
			addParmText("Location");
			addParmText("ContactName");
		}
	}
}
