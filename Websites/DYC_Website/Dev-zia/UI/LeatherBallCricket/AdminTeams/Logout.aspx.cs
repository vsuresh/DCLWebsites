using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Cricket;
//using Cricket.controls;

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for LogOut.
	/// </summary>
	public partial class LogOut : PageBaseAdmin
	{
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);
			
			//clear the session login values
			Session["admin_sw"] = "";
			Session["admin_team_id"] = "";
			Session["user_id"] = "";
			Session["team_id"] = "";
			Session["team_name"] = "";
			Session["admin_tournament_id"] = "";
			Session["admin_tournament_name"] = "";
			Session["admin_tournament_overs"] = "";

			//goto home page
			Response.Redirect("~/default.aspx");
        }


		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

	}
}

