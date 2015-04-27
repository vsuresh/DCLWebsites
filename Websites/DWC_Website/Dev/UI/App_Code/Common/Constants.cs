using System;
using System.Web.UI.WebControls;

namespace Cricket
{
	/// <summary>
	/// Summary description for PlayerTypeCd.
	/// </summary>
	public static class Constants
	{

        public static bool IsSysAdmin(int userId)
        {
            return (userId == 1);
        }
	}

}
