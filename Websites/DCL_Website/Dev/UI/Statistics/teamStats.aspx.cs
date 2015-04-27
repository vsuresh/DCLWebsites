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

namespace Cricket.Statistics
{
	/// <summary>
	/// Summary description for teamStats.
	/// </summary>
	public partial class teamStats : PageBaseTournament
	{

		protected int		m_nSerialNo = 1;
        protected string groupId = "";
	
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
			SqlDataReader dr = m_bl.getTeamStats(tournamentId);

            DataTable dt = new DataTable();
            dt.Columns.Add("team_id");
            dt.Columns.Add("group_id");
            dt.Columns.Add("group_name");
            dt.Columns.Add("name");
            dt.Columns.Add("played");
            dt.Columns.Add("won");
            dt.Columns.Add("lost");
            dt.Columns.Add("tie");
            dt.Columns.Add("for_runs");
            dt.Columns.Add("for_overs");
            dt.Columns.Add("for_rr");
            dt.Columns.Add("opp_runs");
            dt.Columns.Add("opp_overs");
            dt.Columns.Add("opp_rr");
            dt.Columns.Add("net_rr");
            dt.Columns.Add("points");

            string groupId2 = "";
            while (dr.Read())
            {
                string groupId2temp = dr["group_id"].ToString();
                if (groupId2 != groupId2temp)
                {
                    DataRow row = dt.NewRow();
                    row["group_id"] = "EmptyRow";
                    dt.Rows.Add(row);
                    groupId2 = groupId2temp;
                }

                dt.Rows.Add(dr["team_id"], dr["group_id"], dr["group_name"], dr["name"], dr["played"], dr["won"], dr["lost"], dr["tie"], dr["for_runs"], toFloat(dr["for_overs"]).ToString("##0.0"), toFloat(dr["for_rr"]).ToString("##0.00"), dr["opp_runs"],
                    toFloat(dr["opp_overs"]).ToString("##0.0"), toFloat(dr["opp_rr"]).ToString("##0.00"), toFloat(dr["net_rr"]).ToString("##0.00"), dr["points"]);
            }

            dgrid_teams.DataSource = dt;
            dgrid_teams.DataBind();
            dr.Close();

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
			this.dgrid_teams.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_teams_ItemCommand);
			this.dgrid_teams.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_teams_ItemDataBound);

		}
		#endregion

		private void dgrid_teams_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{

                string currentGroupId = e.Item.Cells[2].Text;

                if (currentGroupId != "EmptyRow")
                {
                    if (currentGroupId != "&nbsp;" && currentGroupId != groupId)
                    {
                        m_nSerialNo = 1;
                    }

                    groupId = currentGroupId;

                    e.Item.Cells[0].Text = m_nSerialNo.ToString();
                    m_nSerialNo++;

                    foreach (TableCell item in e.Item.Cells)
                    {
                        if (item.Text == "&nbsp;")
                            item.Text = "0";
                    }

                    if (e.Item.Cells[3].Text == "0")
                        e.Item.Cells[3].Text = "";
                }
                else
                {
                    e.Item.BackColor = Color.LightYellow;
                }


			}
		}

		private void dgrid_teams_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "View")
			{
				Session["team_id"] = e.Item.Cells[1].Text;
				Server.Transfer("teamPlayerStats.aspx");
			}
		
		}

	}
}
