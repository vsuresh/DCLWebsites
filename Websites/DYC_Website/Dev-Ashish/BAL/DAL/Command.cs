using System.Data;
using System.Data.SqlClient;

namespace Cricket.DAL
{
	/// <summary>
	/// Summary description for Command.
	/// </summary>
	public class Command
	{
		protected SqlCommand	m_cmd;

		public Command(Connection conn)
		{
			m_cmd = new SqlCommand();
			if (conn != null)
			{
				m_cmd.Connection = conn.getConnection();
				m_cmd.CommandType = CommandType.Text;
				m_cmd.CommandText = "";
			}
		}
		
		public SqlCommand SqlCommand
		{
			get { return m_cmd; }
		}

		//execute methods
		public SqlDataReader executeReader()
		{
			return m_cmd.ExecuteReader();
		}

		public object executeScalar()
		{
			return m_cmd.ExecuteScalar();
		}

		public int executeNonQuery()
		{
			return m_cmd.ExecuteNonQuery();
		}

		//parameter declaring methods
		public void clearParms()
		{
			m_cmd.Parameters.Clear();
		}

		public void addParmText(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.VarChar);
		}

		public void addParmTextLong(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.Text);
		}

		public void addParmInt(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.Int);
		}

        public void addParmGuid(string strID)
        {
            strID = "@" + strID;
            m_cmd.Parameters.Add(strID, SqlDbType.UniqueIdentifier);
        }

		public void addParmInt(string strName, int nValue)
		{
			strName = "@" + strName;
			m_cmd.Parameters.AddWithValue(strName, nValue);
		}

		public void addParmTinyInt(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.TinyInt);
		}

		public void addParmFloat(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.Float);
		}

		public void addParmDate(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.DateTime);
		}

		public void addParmChar(string strName)
		{
			strName = "@" + strName;
			m_cmd.Parameters.Add(strName, SqlDbType.Char);
		}

		public void setParm(string strName, object oValue)
		{
			strName = "@" + strName;
			m_cmd.Parameters[strName].Value = oValue;
		}
	}
}
