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
	/// Summary description for topBowlingWkts.
	/// </summary>
	public partial class topBowlingWkts : PageBaseTournament
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
			SqlDataReader dr = m_bl.DataStatistics.getTopBowlingWicketTakers(tournamentId);
			dgrid_bowling.DataSource = dr;
			dgrid_bowling.DataBind();
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
			this.dgrid_bowling.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_bowling_ItemCommand);
			this.dgrid_bowling.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_bowling_ItemDataBound);
		}
		#endregion

		private void dgrid_bowling_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				e.Item.Cells[0].Text = m_nSerialNo.ToString();
				m_nSerialNo++;
			}
		}

		private void dgrid_bowling_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "View")
			{
				Session["back_url"] = "topBowlingWkts.aspx";
				Session["player_id"] = e.Item.Cells[1].Text;
				Server.Transfer("playerStats.aspx");
			}
		}

	}

}
