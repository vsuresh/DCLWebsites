using System;
using System.Data.SqlClient;

namespace Cricket.DAL.Address
{
	public class CheckEmailId : Command
	{
		public CheckEmailId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from email where email_id = @email_id ";
			addParmInt("email_id");
		}
	}

	public class CheckPhoneId : Command
	{
		public CheckPhoneId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from phone where phone_id = @phone_id ";
			addParmInt("phone_id");
		}
	}

	public class CheckAddressId : Command
	{
		public CheckAddressId(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "select 1 from address where address_id = @address_id ";
			addParmInt("address_id");
		}
	}

	public class CreateEmail : Command
	{
		public CreateEmail(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into email (email_id, email_code, address) values (@email_id, @email_code, @address) ";
			addParmInt("email_id");
			addParmText("email_code");
			addParmText("address");
		}
	}

	public class SetEmail : Command
	{
		public SetEmail(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update email set email_code = @email_code, address = @address where email_id = @email_id ";
			addParmInt("email_id");
			addParmText("email_code");
			addParmText("address");
		}
	}

	public class CreatePhone : Command
	{
		public CreatePhone(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into phone (phone_id, phone_code, number) values (@phone_id, @phone_code, @number) ";
			addParmInt("phone_id");
			addParmText("phone_code");
			addParmText("number");
		}
	}

	public class SetPhone : Command
	{
		public SetPhone(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update phone set phone_code = @phone_code, number = @number where phone_id = @phone_id ";
			addParmInt("phone_id");
			addParmText("phone_code");
			addParmText("number");
		}
	}

	public class CreateAddress : Command
	{
		public CreateAddress(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "insert into address (address_id, address_code, street1, street2, city, state, zip, country) " + 
								"values (@address_id, @address_code, @street1, @street2, @city, @state, @zip, @country) ";
			addParmInt("address_id");
			addParmText("address_code");
			addParmText("street1");
			addParmText("street2");
			addParmText("city");
			addParmText("state");
			addParmText("zip");
			addParmText("country");
		}
	}

	public class SetAddress : Command
	{
		public SetAddress(Connection conn) : base(conn)
		{
			m_cmd.CommandText = "update address set address_code = @address_code, street1 = @street1, street2 = @street2,  " + 
								"city = @city, state = @state, zip = @zip, country = @country " +
								"where address_id = @address_id ";
			addParmInt("address_id");
			addParmText("address_code");
			addParmText("street1");
			addParmText("street2");
			addParmText("city");
			addParmText("state");
			addParmText("zip");
			addParmText("country");
		}
	}
}
