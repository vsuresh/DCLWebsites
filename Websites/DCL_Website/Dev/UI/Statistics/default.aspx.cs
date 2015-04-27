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
	/// Summary description for _default.
	/// </summary>
	public partial class _default : PageBaseTournament
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
			DataTable dataTable = new DataTable();
			dataTable.Columns.Add("serial_no");
			dataTable.Columns.Add("statistics");
			dataTable.Columns.Add("player_id");
			dataTable.Columns.Add("player_name");
			dataTable.Columns.Add("team_name");
			dataTable.Columns.Add("figures");

			int nSerialNo = 1;
			DataRow dataRow;

			SqlDataReader sqldr = m_bl.DataStatistics.getTopBattingAverages(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Best Batting Average";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("average")))
					dataRow["figures"] = toDataGridFloat(sqldr["average"].ToString());
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();

			sqldr = m_bl.DataStatistics.getTopBattingAggregates(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Best Batting Aggregate";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("runs")))
					dataRow["figures"] = sqldr["runs"];
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();

			sqldr = m_bl.DataStatistics.getTopBattingScores(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Highest Score";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("highest")))
					dataRow["figures"] = sqldr["highest"];
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();
			
			sqldr = m_bl.DataStatistics.getTopBowlingWicketTakers(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Top Wicket Taker";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("wickets")))
					dataRow["figures"] = sqldr["wickets"];
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();
			
			
			sqldr = m_bl.DataStatistics.getTopBowlingBestInning(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Best Bowling in Inning";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("best")))
					dataRow["figures"] = sqldr["best"];
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();
			
			sqldr = m_bl.DataStatistics.getTopBowlingEconomyRate(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Best Economy Rate";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("economy_rate")))
					dataRow["figures"] = toDataGridFloat(sqldr["economy_rate"].ToString());
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();
			
			sqldr = m_bl.DataStatistics.getTopBowlingAverage(tournamentId);
			if (sqldr.Read())
			{
				dataRow = dataTable.NewRow();
				dataRow["serial_no"] = nSerialNo++;
				dataRow["statistics"] = "Best Bowling Average";
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("player_id")))
					dataRow["player_id"] = sqldr["player_id"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("name")))
					dataRow["player_name"] = sqldr["name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("team_name")))
					dataRow["team_name"] = sqldr["team_name"];
				if (!sqldr.IsDBNull(sqldr.GetOrdinal("average")))
					dataRow["figures"] = toDataGridFloat(sqldr["average"].ToString());
				dataTable.Rows.Add(dataRow);
			}
			sqldr.Close();
			
			dgrid_summary.DataSource = dataTable;
			dgrid_summary.DataBind();

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
			this.dgrid_summary.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_summary_ItemCommand);
		}
		#endregion

		private void dgrid_summary_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "View")
			{
				Session["back_url"] = "default.aspx";
				Session["player_id"] = e.Item.Cells[2].Text;
				Server.Transfer("playerStats.aspx");
			}
		}

	}

}

