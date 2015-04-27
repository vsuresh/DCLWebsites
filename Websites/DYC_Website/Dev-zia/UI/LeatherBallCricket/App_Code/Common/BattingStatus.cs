using System;
using System.Web.UI.WebControls;

namespace Cricket.Common
{
	/// <summary>
	/// Summary description for BattingStatus.
	/// </summary>
	public class BattingStatus
	{
		public static string NotOut
		{
			get{ return "not out"; }
		}
		public static string DNP
		{
			get{ return "did not bat"; }
		}
		public static void populateList(ref DropDownList ddlStatus)
		{
			//load the status combo box
			ddlStatus.Items.Add(new ListItem("did not bat", "0"));
			ddlStatus.Items.Add(new ListItem("not out", "1"));
			ddlStatus.Items.Add(new ListItem("run out", "2"));
			ddlStatus.Items.Add(new ListItem("bowled", "3"));
			ddlStatus.Items.Add(new ListItem("caught behind", "4"));
			ddlStatus.Items.Add(new ListItem("caught", "5"));
			ddlStatus.Items.Add(new ListItem("stumped", "6"));
			ddlStatus.Items.Add(new ListItem("hit wicket", "7"));
            ddlStatus.Items.Add(new ListItem("retired not out", "8"));
            ddlStatus.Items.Add(new ListItem("retired out", "9"));
            ddlStatus.Items.Add(new ListItem("LBW", "10"));
        }
	}
}
