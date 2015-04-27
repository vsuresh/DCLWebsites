using System.Web.UI.WebControls;

namespace Cricket.BAL
{
	/// <summary>
	/// Summary description for MatchTypeCd.
	/// </summary>
	public class MatchTypeCd
	{

        /// <summary>
        /// Indicates if the match type is valid for stats calculation
        /// playoff matches are not valid for stats calculations
        /// </summary>
        /// <param name="nTypeCd"></param>
        /// <returns></returns>
        public static bool IsMatchTypeValidForStats(int nTypeCd)
        {
            bool valid = true;
            switch (nTypeCd)
            {
                case 2:
                case 3:
                case 4:
                case 10:
                case 12:
                case 13:
                case 14:
                case 15:
                case 16:
                case 17:
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                    valid = false;
                    break;

                default:
                    valid = true;
                    break;
            }

            return valid;
        }

		public static string getText(int nTypeCd)
		{
			string strType = "";
			switch(nTypeCd)
			{
				case 1:
					strType = "League";
					break;
				case 2:
					strType = "Final";
					break;
				case 3:
					strType = "SemiFinal 2";
					break;
				case 4:
					strType = "SemiFinal 1";
					break;
				case 5:
					strType = "Group A";
					break;
				case 6:
					strType = "Group B";
					break;
				case 7:
					strType = "Group C";
					break;
				case 8:
					strType = "Premier Division";
					break;
				case 9:
					strType = "Division A";
					break;
				case 10:
					strType = "QuaterFinal 1";
					break;
				case 11:
					strType = "Group D";
					break;
				case 12:
					strType = "QuaterFinal 2";
					break;
				case 13:
					strType = "QuaterFinal 3";
					break;
				case 14:
					strType = "QuaterFinal 4";
					break;
                case 15:
                    strType = "PreQuaterFinal 1";
                    break;
                case 16:
                    strType = "PreQuaterFinal 2";
                    break;
                case 17:
                    strType = "PreQuaterFinal 3";
                    break;
                case 18:
                    strType = "PreQuaterFinal 4";
                    break;
                case 19:
                    strType = "PreQuaterFinal 5";
                    break;
                case 20:
                    strType = "PreQuaterFinal 6";
                    break;
                case 21:
                    strType = "PreQuaterFinal 7";
                    break;
                case 22:
                    strType = "PreQuaterFinal 8";
                    break;
            }
			return strType;
		}

		public static string getGroup(int nTypeCd)
		{
			string strType = "";
			switch(nTypeCd)
			{
				case 5:
					strType = "A";
					break;
				case 6:
					strType = "B";
					break;
				case 7:
					strType = "C";
					break;
				case 8:
					strType = "Premier";
					break;
				case 9:
					strType = "A";
					break;
				case 11:
					strType = "D";
					break;
				default:
					strType = "-";
					break;
					
			}
			return strType;
		}

		public static void populateList(ref DropDownList ddl)
		{
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 8", "22"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 7", "21"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 6", "20"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 5", "19"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 4", "18"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 3", "17"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 2", "16"));
            ddl.Items.Insert(0, new ListItem("PreQuaterFinal 1", "15"));
            ddl.Items.Insert(0, new ListItem("QuaterFinal 4", "14"));
			ddl.Items.Insert(0, new ListItem("QuaterFinal 3", "13"));
			ddl.Items.Insert(0, new ListItem("QuaterFinal 2", "12"));
			ddl.Items.Insert(0, new ListItem("QuaterFinal 1", "10"));
			ddl.Items.Insert(0, new ListItem("Group D Match", "11"));
			ddl.Items.Insert(0, new ListItem("Group C Match", "7"));
			ddl.Items.Insert(0, new ListItem("Group B Match", "6"));
			ddl.Items.Insert(0, new ListItem("Group A Match", "5"));
			ddl.Items.Insert(0, new ListItem("SemiFinal 1 Match", "4"));
			ddl.Items.Insert(0, new ListItem("SemiFinal 2 Match", "3"));
			ddl.Items.Insert(0, new ListItem("Final Match", "2"));
			ddl.Items.Insert(0, new ListItem("League Match", "1"));
		}
	}
}
