using System.Web.UI.WebControls;

namespace Cricket.BAL
{
	/// <summary>
	/// Summary description for MatchTypeCd.
	/// </summary>
	public class TournamentHelper
	{

		public static void populateList(DropDownList ddl)
		{
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 8", "13"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 7", "12"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 6", "11"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 5", "10"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 4", "9"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 3", "8"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 2", "7"));
            ddl.Items.Insert(0, new ListItem("Winner of PreQuaterFinal 1", "6"));
            ddl.Items.Insert(0, new ListItem("Winner of QuaterFinal 4", "5"));
            ddl.Items.Insert(0, new ListItem("Winner of QuaterFinal 3", "4"));
            ddl.Items.Insert(0, new ListItem("Winner of QuaterFinal 2", "3"));
            ddl.Items.Insert(0, new ListItem("Winner of QuaterFinal 1", "2"));
			ddl.Items.Insert(0, new ListItem("DCL Sponsored", "1"));
            ddl.Items.Insert(0, new ListItem("select", "0"));

		}
	}
}
