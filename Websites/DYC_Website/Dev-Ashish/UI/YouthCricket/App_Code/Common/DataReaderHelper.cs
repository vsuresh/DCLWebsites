using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Cricket.Common
{
	/// <summary>
	/// Summary description for BattingStatus.
	/// </summary>
	public class DataReaderHelper
	{
		public static string GetString(SqlDataReader dr, string name)
		{
			string value = string.Empty;
			if (dr[name] != null)
				value = dr[name].ToString();
			return value;
		}	

		public static DateTime GetDateTime(SqlDataReader dr, string name)
		{
			DateTime date = DateTime.MinValue;
			if (dr[name] != null)
				date = DateTime.Parse(dr[name].ToString());
			return date;
		}	
	}
}
