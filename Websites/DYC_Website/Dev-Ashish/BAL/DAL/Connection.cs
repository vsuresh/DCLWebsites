using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System;

namespace Cricket.DAL
{
	/// <summary>
	/// Summary description for Connection.
	/// </summary>
	public class Connection : System.IDisposable
	{
		protected SqlConnection		connection = null;
        protected string connectionStringKey = "dallascricketleague";

		public Connection()
		{
            connection = new SqlConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringKey].ConnectionString;
		}

        public SqlConnection getConnection()
        {
            return connection;
        }

        //public static SqlConnection GetSQLConnection()
        //{
        //    return new SqlConnection(ConfigurationManager.ConnectionStrings[connectionStringKey].ConnectionString);
        //}

        public void open()
		{
			//open the connection
			close();
            connection.Open();

			//initialize the connection properties
            SqlCommand sqlcmd = connection.CreateCommand();
			sqlcmd.CommandType = CommandType.Text;
			sqlcmd.CommandText = "set ansi_nulls off; set ansi_padding off; set ansi_warnings off; set concat_null_yields_null off";
			sqlcmd.ExecuteNonQuery();
		}

		public void close()
		{
            if (connection != null)
			{
                if (connection.State == ConnectionState.Open)
                    connection.Close();
			}
		}


        public void Dispose()
        {
        }
    }
}
