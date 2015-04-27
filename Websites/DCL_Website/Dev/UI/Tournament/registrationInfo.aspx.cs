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
using System.Web.Mail;
using Cricket;
using Cricket.Common;
using Cricket;


namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
    public partial class registrationInfo : PageBaseTournament
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				loadData();

				ViewState["tournament_id"] = tournamentId;

			}
			else
			{
				tournamentId = (int) ViewState["tournament_id"];

			}

		}

		protected void loadData()
		{
            DateTime? regStartDate = null;
            DateTime? regEndDate = null;
            SqlDataReader dr = m_bl.getTournamentData(tournamentId);
            if (dr.Read())
            {
                regStartDate = DataReaderHelper.GetDateTime(dr, "regstart_dt");
                regEndDate = DataReaderHelper.GetDateTime(dr, "regend_dt");
                lblFees.Text = dr["fees"].ToString();
                lblRegInfo.Text = dr["registration_info"] as string;
            }
            dr.Close();

            if (regStartDate.HasValue)
                lblRegStartDate.Text = regStartDate.Value.ToLongDateString();
            if (regEndDate.HasValue)
                lblRegEndDate.Text = regEndDate.Value.ToLongDateString();

            if (DateTime.Now >= regStartDate && DateTime.Now <= regEndDate)
                lblRegStatus.Text = "Open!";
            else if (DateTime.Now < regStartDate)
                lblRegStatus.Text = "Not yet started!";
            else
                lblRegStatus.Text = "Closed!";
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
