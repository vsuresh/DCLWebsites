using System;
using System.Collections;
using System.Collections.Generic;
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
using Cricket.Common;
using System.Linq;

namespace Cricket.Teams
{
	/// <summary>
	/// Summary description for players.
	/// </summary>
    public partial class players : PageBaseTeam
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
            using (SqlDataReader dr = m_bl.getPlayerList(teamId))
            {
                dgrid_players.DataSource = dr;
                dgrid_players.DataBind();
                dr.Close();
            }

            showTeamPlayerStatistics();
		}

        public class PlayerStats
        {
            public string name = "";
            public int matches = 0;
            public int innings = 0;
            public int notouts = 0;
            public int runs = 0;
            public float flAverage = 0;
            public float flStrikeRate = 0;
            public int hundreds = 0;
            public int fifties = 0;
            public int highest = 0;
            public int sixes = 0;
            public int fours = 0;
        
        }

        private void showTeamPlayerStatistics()
        {
            int matches = 0;
            int innings = 0;

            int topRuns = 0;
            float bestAverage = 0;
            float bestStrikeRate = 0;
            int mostHundreds = 0;
            int mostFifties = 0;
            int bestHighest = 0;
            int count = 0;
            string playerName = "";
            int playerId = 0;

            ArrayList list = new ArrayList();
            List<PlayerStats> psList = new List<PlayerStats>();
            using (SqlDataReader dr = m_bl.GetTeamPlayerStats(teamId))
            {
                while (dr.Read())
                {
                    PlayerStats ps = new PlayerStats();
                    ps.name = dr["name"] as string;
                    ps.matches = toInt(dr["matches"].ToString());
                    ps.innings = toInt(dr["innings"].ToString());
                    ps.notouts = toInt(dr["not_outs"].ToString());
                    ps.runs = toInt(dr["runs"].ToString());
                    ps.highest = toInt(dr["highest"].ToString());
                    ps.flAverage = toFloat(dr["average"]);
                    ps.flStrikeRate = toFloat(dr["strike_rate"]);
                    ps.hundreds = toInt(dr["hundred"].ToString());
                    ps.sixes = toInt(dr["six"].ToString());
                    ps.fours = toInt(dr["four"].ToString());
                    psList.Add(ps);

                }
                dr.Close();
            }

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("type"));
            dt.Columns.Add(new DataColumn("name"));
            dt.Columns.Add(new DataColumn("data"));
            PlayerStats ps1 = null;
            string name = string.Empty;

            if (psList.Count > 0)
            {
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.runs > y.runs ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.runs > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("Most Runs", name, ps1.runs);
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.flAverage > y.flAverage ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.flAverage > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("Top Average", name, ps1.flAverage);
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.flStrikeRate > y.flStrikeRate ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.flStrikeRate > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("Top Strike Rate", name, ps1.flStrikeRate);
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.highest > y.highest ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.highest > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("Highest Score", name, ps1.highest);
                ps1 = psList.First();
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.hundreds > y.hundreds ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.hundreds > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("# of Hundreds", name, ps1.hundreds);
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else   return x.fifties > y.fifties ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.fifties > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("# of Fifties", name, ps1.fifties);
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.sixes > y.sixes ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.sixes > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("# of Sixes", name, ps1.sixes);
                psList.Sort(delegate(PlayerStats x, PlayerStats y) { if (x == y) return 0; else  return x.fours > y.fours ? -1 : 1; });
                ps1 = psList.First();
                name = ps1.fours > 0 ? ps1.name : string.Empty;
                dt.Rows.Add("# of Fours", name, ps1.fours);
            }

            dgrid_stats.DataSource = dt;
            dgrid_stats.DataBind();

        }

        public void dgrid_players_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				e.Item.Cells[0].Text = m_nSerialNo.ToString();
				m_nSerialNo++;

                e.Item.Cells[3].Text += " " + PlayerTypeCd.getShortText(int.Parse(e.Item.Cells[2].Text));

                if (e.Item.Cells[4].Text != "&nbsp;")
                    e.Item.Cells[4].Text = "InActive";
                else
                    e.Item.Cells[4].Text = "Active";
			}
		}

		public void dgrid_players_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "View")
			{
                Server.Transfer(string.Format("player_profile.aspx?playerId={0}", e.Item.Cells[1].Text));
			}
		}

	}


}
