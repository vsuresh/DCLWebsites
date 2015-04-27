using System;
using System.Web.UI.WebControls;

namespace Cricket.Common
{
	/// <summary>
	/// Summary description for PlayerTypeCd.
	/// </summary>
	public class PlayerTypeCd
	{
		public static string getShortText(int nTypeCd)
		{
            return getText(nTypeCd, false);
		}

		public static string getFullText(int nTypeCd)
		{
            return getText(nTypeCd, true);
		}
	
		protected static string getText(int nTypeCd, bool retfullText)
		{
            string fullText = "";
            string shortText = "";
			switch(nTypeCd)
			{
				case 3:
					fullText = "Manager";
					shortText = "(Mgr)";
					break;
				case 4:
					fullText = "Vice Captain";
					shortText = "(VC)";
					break;
				case 5:
					fullText = "Captain";
					shortText = "(C)";
					break;
				default:
					fullText = "";
					shortText = "";
					break;
			}

            if (retfullText)
                return fullText;
            else
                return shortText;
                    
		}

		public static void populateList(ref DropDownList ddl)
		{
			ddl.Items.Add(new ListItem("Player", "0"));
			ddl.Items.Add(new ListItem("Captain", "5"));
			ddl.Items.Add(new ListItem("Vice Captain", "4"));
			ddl.Items.Add(new ListItem("Manager", "3"));
		}
	}

}
