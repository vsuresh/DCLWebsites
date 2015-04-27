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

namespace Cricket.Main
{
	/// <summary>
	/// Summary description for team_list.
	/// </summary>
	public partial class team_list : PageBase
	{

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
			SqlDataReader dr = m_bl.getTeamList(true);
			dgrid_teams.DataSource = dr;
			dgrid_teams.DataBind();
			dr.Close();

			lblError.Text = "";
			if (dgrid_teams.Items.Count <= 0)
			{
				lblError.Text = "There are no teams registered!";
			}

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("name"));
            dt.Columns.Add(new DataColumn("count"));
            dt.Columns.Add(new DataColumn("team_id"));
            dt.Columns.Add(new DataColumn("no"));

            DataTable dt2 = new DataTable();
            dt2.Columns.Add(new DataColumn("name"));
            dt2.Columns.Add(new DataColumn("count"));
            dt2.Columns.Add(new DataColumn("team_id"));
            dt2.Columns.Add(new DataColumn("no"));

            int winners = 0;
            int runnersup = 0;
            using (dr = m_bl.GetTeamAwardsSummary())
            {
                while (dr.Read())
                {
                    int awardType = toInt(dr["award_id"]);
                    if (awardType == 1)
                    {
                        winners++;
                        dt.Rows.Add(dr["name"] as string, dr["count"], dr["team_id"], winners.ToString());
                    }
                    else
                    {
                        runnersup++;
                        dt2.Rows.Add(dr["name"] as string, dr["count"], dr["team_id"], runnersup.ToString());
                    }
                }
                dr.Close();
            }

            dgrid_winners.DataSource = dt;
            dgrid_winners.DataBind();

            dgrid_runnersup.DataSource = dt2;
            dgrid_runnersup.DataBind();
        }

        protected void dgrid_teams_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				e.Item.Cells[0].Text = m_nSerialNo.ToString();
				m_nSerialNo++;

			}
		}


	}
}
