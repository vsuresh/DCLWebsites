namespace Cricket.controls
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using Microsoft.Web.UI.WebControls;
	using System.ComponentModel;

	/// <summary>
	///		Summary description for navbarMods.
	/// </summary>
	public class navbarBase : System.Web.UI.UserControl
	{
		protected TabStrip tabStrip;
		protected string [] m_tabUrls;
		protected int m_nCount;

		public void Page_LoadMain(object sender, System.EventArgs e)
		{
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
	
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_LoadMain);
			tabStrip.SelectedIndexChange += new EventHandler(tabStrip_OnClick);
		}
		#endregion


		public string SelectedID
		{
			get 
			{ 
				return tabStrip.Items[tabStrip.SelectedIndex].ID; 
			}
			set 
			{
				int j=-1;
				for (int i = 0; i < tabStrip.Items.Count; i++)
				{
					TabItem item = tabStrip.Items[i];
					if (item.ID.Length > 0)
						j++;
					if (item.ID == value)
					{
						tabStrip.SelectedIndex = j;
						break;
					}
				}
				return;
			}
		}

		public void setTabUrls(string [] tabUrls)
		{
			m_nCount = tabStrip.Items.NumTabs;
			m_tabUrls = tabUrls;
			if (m_tabUrls.Length < m_nCount)
				throw new Exception("Fewer urls provided");
		}

		public string getTabUrl(int nTabIdx)
		{
			if (nTabIdx < 0 || nTabIdx >= m_nCount)
				throw new IndexOutOfRangeException("Index out of range");
			return m_tabUrls[nTabIdx];
		}

		public void tabStrip_OnClick(object sender, EventArgs e)
		{
			Context.Response.Redirect(getTabUrl(tabStrip.SelectedIndex));
		}

		//Helper methods
		protected int toInt(Object strDataObject)
		{
			if (strDataObject != null)
			{
				string strData = strDataObject.ToString();
				if (strData != null)
					if (strData.Length > 0)
						return int.Parse(strData);
			}
			return 0;
		}
	}
}
