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

namespace Cricket.AdminParent
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public partial class _default : PageBaseAdmin
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (IsSysAdmin())
                Server.Transfer("~/Admin/default.aspx");

		}

	}
}

