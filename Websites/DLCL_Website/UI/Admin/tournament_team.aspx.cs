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
using System.Configuration;
using Cricket;
using Cricket.controls;
using Cricket.Common;

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for team.
	/// </summary>
	public partial class tournament_team : PageBaseAdmin
	{
		protected System.Web.UI.WebControls.Button btnSubmit;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator4;

		protected int		m_nAddressId;
		protected int		m_nPhoneId;
		protected System.Web.UI.WebControls.TextBox txtName;
		protected System.Web.UI.WebControls.TextBox txtDesc;
		protected System.Web.UI.WebControls.TextBox txtStartDate;
		protected System.Web.UI.WebControls.TextBox txtEndDate;
		protected System.Web.UI.WebControls.Label lblId;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected int		m_nEmailId;
	
		protected int		m_nSerialNo = 1;
	
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
			//load the data from the database
			SqlDataReader dr = m_bl.getTournamentList();
			ddlTournament.DataSource = dr;
			ddlTournament.DataTextField = "name";
			ddlTournament.DataValueField = "tournament_id";
			ddlTournament.DataBind();
			dr.Close();

			ddlTournament.Items.Insert(0, new ListItem("select", "0"));
			ddlTournament.SelectedIndex = 0;

			dr = m_bl.getTeamList(true);
			ddlTeam.DataSource = dr;
			ddlTeam.DataTextField = "name";
			ddlTeam.DataValueField = "team_id";
			ddlTeam.DataBind();
			dr.Close();

			ddlTeam.Items.Insert(0, new ListItem("select", "0"));
			ddlTeam.SelectedIndex = 0;
		}

		public void loadTournamentTeams(int nTournamentId)
		{
			SqlDataReader dr = m_bl.getTeamListByTournament(nTournamentId);
			dgrid_teams.DataSource = dr;
			dgrid_teams.DataBind();
			dr.Close();

            DateTime startDate = DateTime.MinValue;
			dr = m_bl.getTournamentData(nTournamentId);
            if (dr.Read())
            { 
			    startDate = DataReaderHelper.GetDateTime(dr, "start_dt");
            }
			dr.Close();

            // disable Add button after a week of tournament start

            int disableAfterDays = toInt(ConfigurationManager.AppSettings["DisableTeamAddAfterTournamentStartInDays"]);
            if (disableAfterDays <= 0)
                disableAfterDays = 7;

            lblbtnAddMessage.Text = "";
            if (DateTime.Now >= startDate.AddDays(disableAfterDays))
            {
                btnAdd.Enabled = false;
                lblbtnAddMessage.Text = string.Format("You cannot add teams after {0} days past the tournament start date!", disableAfterDays);
            }
            else
                btnAdd.Enabled = true;
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
			this.dgrid_teams.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_teams_ItemDataBound);

		}
		#endregion

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
				int nTournamentId = int.Parse(ddlTournament.SelectedValue);
				int nTeamId = int.Parse(ddlTeam.SelectedValue);
				if (nTournamentId > 0 && nTeamId > 0)
				{
					m_bl.addTournamentTeam(int.Parse(ddlTournament.SelectedValue), int.Parse(ddlTeam.SelectedValue));
					loadTournamentTeams(nTournamentId);
				}
			}
		}
		
		protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			int id = int.Parse(ddlTournament.SelectedValue.ToString());

			if (id > 0)
			{
				loadTournamentTeams(id);
			}
			else
			{
				loadTournamentTeams(0);
			}

		}

		private void dgrid_teams_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				e.Item.Cells[0].Text = m_nSerialNo.ToString();
				m_nSerialNo++;
			}
		
		}
	}
}

