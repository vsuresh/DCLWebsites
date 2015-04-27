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
using Cricket.Common;
using Cricket.BAL;

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for schedule.
	/// </summary>
	public partial class schedule : PageBaseAdmin
	{

		protected int m_nSerialNo = 1;
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			checkSysAdmin();

			if (!IsPostBack)
			{

                int tournamentID = toInt(Request.QueryString["tournamentID"]);
				loadData(tournamentID);
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
			this.dgrid_schedule.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_schedule_ItemCommand);
			this.dgrid_schedule.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_schedule_ItemDataBound);

		}
		#endregion

		protected void loadData(int tournamentID)
		{
			//load the data from the database
			SqlDataReader dr = m_bl.getTournamentList();
			bool hasRows = dr.HasRows;
			ddlTournament.DataSource = dr;
			ddlTournament.DataTextField = "name";
			ddlTournament.DataValueField = "tournament_id";
			ddlTournament.DataBind();
			dr.Close();

			ddlTournament.Items.Insert(0, new ListItem("select", "-1"));

            if (hasRows)
            {
                ListItem item = ddlTournament.Items.FindByValue(tournamentID.ToString());
                if (item != null)
                {
                    item.Selected = true;
                }
                else
                {
                    // passed in tournamentID not found 
                    ddlTournament.SelectedIndex = 1;
                    tournamentID = int.Parse(ddlTournament.SelectedValue);
                }

                LoadTournamentSchedule(tournamentID);
            }
            else
            {
                ddlTournament.SelectedIndex = 0;
            }
		}

        protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int tournamentID = int.Parse(ddlTournament.SelectedValue);
            LoadTournamentSchedule(tournamentID);
        }

		private void LoadTournamentSchedule(int tournamentID)
		{
			SqlDataReader dr = m_bl.getSchedule(tournamentID);
			dgrid_schedule.DataSource = dr;
			dgrid_schedule.DataBind();
			dr.Close();

            DateTime endDate = DateTime.MinValue;
            dr = m_bl.getTournamentData(tournamentID);
            if (dr.Read())
            {
                endDate = DataReaderHelper.GetDateTime(dr, "end_dt");
            }
			dr.Close();

			if (DateTime.Now >= endDate.AddDays(7))
				btnAdd.Enabled = false;
			else
				btnAdd.Enabled = true;

		}

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
			int tournamentID = int.Parse(ddlTournament.SelectedValue);
			Session["tournament_id"] = tournamentID;
			Session["match_id"] = "";
			Server.Transfer("schedule_edit.aspx");
		}

		private void dgrid_schedule_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "Edit")
			{
				string strMatchId = e.Item.Cells[1].Text;
				if (strMatchId.Length > 0)
				{
					int tournamentID = int.Parse(ddlTournament.SelectedValue);
					Session["tournament_id"] = tournamentID;
					Session["match_id"] = strMatchId;
					Server.Transfer("schedule_edit.aspx");
				}
			}
		}

		private void dgrid_schedule_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				e.Item.Cells[0].Text = m_nSerialNo.ToString();
				m_nSerialNo++;

				string strDate = e.Item.Cells[2].Text;
				DateTime dt = DateTime.Parse(strDate);
				string strDayOfWeek = "";
				if (dt.DayOfWeek == DayOfWeek.Saturday)
					strDayOfWeek = "Saturday";
				else if (dt.DayOfWeek == DayOfWeek.Sunday)
					strDayOfWeek = "Sunday";

				e.Item.Cells[2].Text = dt.ToShortDateString();
				e.Item.Cells[2].Text += " " + strDayOfWeek;

				if (dt.DayOfWeek == System.DayOfWeek.Saturday)
					e.Item.BackColor = Color.Azure;
				else
					e.Item.BackColor = Color.LightYellow;


				e.Item.Cells[3].Text = MatchTypeCd.getText(toInt(e.Item.Cells[3].Text));

                if (e.Item.Cells[7].Text == "" || e.Item.Cells[7].Text == "&nbsp;")
                    e.Item.Cells[7].Text = e.Item.Cells[9].Text;

			}
		}

	}
}
