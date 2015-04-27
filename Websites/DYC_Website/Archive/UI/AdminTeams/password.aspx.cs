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
using Cricket.controls;

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for password.
	/// </summary>
	public partial class password : PageBaseAdmin
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				txtOldPwd.Text = string.Empty;
                txtNewPwd.Text = string.Empty;
                txtConfirmPwd.Text = string.Empty;
			}

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

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (IsValid)
			{
				if (m_bl.changePassword(m_nUserId, txtOldPwd.Text, txtNewPwd.Text))
					lblMessage.Text = "Your password has been changed";
				else
					lblMessage.Text = "Please enter a valid old password";

                txtOldPwd.Text = string.Empty;
                txtNewPwd.Text = string.Empty;
                txtConfirmPwd.Text = string.Empty;
            }
		}
	}
}
