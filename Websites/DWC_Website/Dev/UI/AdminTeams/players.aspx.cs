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
using Cricket.Common;

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for players.
	/// </summary>
	public partial class players : PageBaseAdmin
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

		enum EPlayerStatus
		{
			Active, 
			InActive
		}

		protected void loadPlayers(bool fActiveSw)
		{
			SqlDataReader dr = m_bl.getPlayerList(m_nTeamId, fActiveSw);
			dgrid_players.DataSource = dr;
			dgrid_players.DataBind();
			dr.Close();
		}

		protected void loadData()
		{
			loadPlayers(true);

			lblError.Text = "";
			if (dgrid_players.Items.Count <= 0)
				lblError.Text = "There are no players in this team yet!";

			ddlStatus.Items.Add(new ListItem("Active", EPlayerStatus.Active.ToString()));
			ddlStatus.Items.Add(new ListItem("InActive", EPlayerStatus.InActive.ToString()));
			ddlStatus.Items.FindByValue(EPlayerStatus.Active.ToString()).Selected = true;

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
			this.dgrid_players.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_players_ItemCommand);
			this.dgrid_players.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_players_ItemDataBound);

		}
		#endregion

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
			Session["player_id"] = "";
			Server.Transfer("player_profile.aspx");
		}

		private void dgrid_players_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName == "Edit")
			{
				string strPlayerId = e.Item.Cells[1].Text;
				if (strPlayerId.Length > 0)
				{
					Session["player_id"] = strPlayerId;
					Server.Transfer("player_profile.aspx");
				}
			}
		
		}

		private void dgrid_players_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				e.Item.Cells[0].Text = m_nSerialNo.ToString();
				m_nSerialNo++;

                string type = PlayerTypeCd.getFullText(toInt(e.Item.Cells[3].Text));
                if (string.IsNullOrEmpty(type))
                    type = "&nbsp;";
                e.Item.Cells[3].Text = type;

				bool nKeeperSw = toInt(e.Item.Cells[6].Text) > 0;
				if (nKeeperSw)
				{
					e.Item.Cells[3].Text += " " + "(wk)";
				}
			}
		}

		protected void ddlStatus_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			bool fActiveSw = (ddlStatus.SelectedValue == EPlayerStatus.Active.ToString());
			loadPlayers(fActiveSw);
		}
	}


}
