using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Security;

namespace Cricket.controls
{

	/// <summary>
	///		Summary description for headerBase.
	/// </summary>
	public partial class navData : System.Web.UI.UserControl
	{   
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            anchorTeamName.Text = Session["team_name"] as string;
            //string teamIdValue = Session["teamId"].ToString();
            //if (!string.IsNullOrEmpty(teamIdValue))
            //    anchorTeamName.NavigateUrl = "/teams/default.aspx?teamId=" + Session["teamId"].ToString();
            //else
            //    anchorTeamName.NavigateUrl = "/teams/default.aspx";

			anchorTitle.Text = Session["tournament_name"] as string;

			anchorAdmin.Text = "";
			if (Session["admin_sw"] != null)
			{
				string strAdminSw = Session["admin_sw"].ToString();
				if (strAdminSw == "1")
					anchorAdmin.Text = "Admin Section";
			}
		}

		public HyperLink AnchorTeamName
		{
            get { return anchorTeamName; }
		}

		public string Title
		{
            get { return anchorTitle.Text; }
		}

	}
}
