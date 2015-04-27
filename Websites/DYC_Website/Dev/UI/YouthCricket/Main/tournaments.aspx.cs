using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Cricket;
using System.Text;

namespace Cricket.Main
{
    public partial class tournaments : PageBase
    {

        private string year = string.Empty;
        System.Drawing.Color bkcolor = System.Drawing.Color.Azure;

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            //SqlDataReader dr = m_bl.GetTournamentWithResults();
            //dgrid_tournaments.DataSource = dr;
            //dgrid_tournaments.DataBind();
            //dr.Close();

            int year = 0;
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("tournament_id"));
            table.Columns.Add(new DataColumn("year"));
            table.Columns.Add(new DataColumn("name"));
            table.Columns.Add(new DataColumn("winner"));
            table.Columns.Add(new DataColumn("runnersup"));
            SqlDataReader dr = m_bl.GetTournamentWithResults();
            while (dr.Read())
            {
                DateTime date = (DateTime) dr["start_dt"];
                if (year != date.Year)
                {
                    year = date.Year;
                    table.Rows.Add(dr["tournament_id"], "", "", "", "");
                }

                table.Rows.Add(dr["tournament_id"], date.ToString("yyyy"), dr["name"], dr["winner"], dr["runnersup"]);
            }
            dr.Close();

            dgrid_tournaments.DataSource = table;
            dgrid_tournaments.DataBind();

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

        }
        #endregion    

        protected void dgrid_tournaments_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string strYear = e.Item.Cells[1].Text;
                if (!string.IsNullOrEmpty(strYear))
                {
                    if (strYear == year)
                    {
                        e.Item.BackColor = bkcolor;
                    }
                    else
                    {
                        if (bkcolor == System.Drawing.Color.Azure)
                            bkcolor = System.Drawing.Color.White;
                        else
                            bkcolor = System.Drawing.Color.Azure;
                        year = strYear;
                    }
                    e.Item.BackColor = bkcolor;
                }
            }
        }
}
}