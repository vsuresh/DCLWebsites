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
