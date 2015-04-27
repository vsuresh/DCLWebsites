using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Cricket.Common;
using Cricket;

namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for schedule.
	/// </summary>
    public partial class format : PageBaseTournament
	{

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				loadData();
			}
		}

		protected void loadData()
		{
            string format = string.Empty;
            SqlDataReader dr = m_bl.getTournamentData(tournamentId);
            if (dr.Read())
            {
                format = dr["format"] as string;
            }
            dr.Close();

            if (string.IsNullOrEmpty(format))
                format = "Tournament format information is not available!";
            
            lblFormat.Text = format;
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
