using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Cricket.Common;
using Cricket;
using Cricket.BAL;

namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for schedule.
	/// </summary>
	public partial class schedule : PageBaseTournament
	{

		protected int m_nSerialNo = 1;

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

			DataTable table = new DataTable();
			table.Columns.Add("sr_no");
			table.Columns.Add("match_id");
			table.Columns.Add("match_dt");
			table.Columns.Add("type_cd");
			table.Columns.Add("team1");
			table.Columns.Add("team2");
			table.Columns.Add("ground");
			table.Columns.Add("umpiring_team");
			table.Columns.Add("start_time");
			table.Columns.Add("end_time");

			int nWeek = 1;
			DataRow row3 = table.NewRow();
			row3["sr_no"] = "WK" + nWeek.ToString();
			table.Rows.Add(row3);
			nWeek++;

			int nSerialNo = 1;
			DateTime dtPrevious = DateTime.Now.AddYears(100);
			SqlDataReader dr = m_bl.getSchedule(tournamentId);
			while(dr.Read())
			{
				DateTime dt = (DateTime) dr["match_dt"];

				TimeSpan ts = dt.Subtract(dtPrevious);
				if (ts.Days > 3)
				{
					DateTime dtWk = dtPrevious.AddDays(1);
					while (dtWk != dt)
					{
						if (dtWk.DayOfWeek == DayOfWeek.Monday)
						{
							DataRow row1 = table.NewRow();
							row1["sr_no"] = "WK" + nWeek.ToString();
							table.Rows.Add(row1);
							nWeek++;
						}
						if (dtWk.DayOfWeek == DayOfWeek.Saturday || dtWk.DayOfWeek == DayOfWeek.Sunday)
						{
							DataRow row1 = table.NewRow();
							row1["match_dt"] = dtWk;
							table.Rows.Add(row1);
						}
						dtWk = dtWk.AddDays(1);
						
					}
				}

                string umpiringText = "";
                string umpiringText1 = dr["umpiring_team"] as string;
                string umpiringText2 = dr["umpiring_team2"] as string;
                if (string.IsNullOrEmpty(umpiringText1) && string.IsNullOrEmpty(umpiringText2))
                {
                    umpiringText = dr["umpiring_text"] as string;
                }
                else
                {
                    if (string.IsNullOrEmpty(umpiringText1))
                        umpiringText = umpiringText2;
                    else if (string.IsNullOrEmpty(umpiringText2))
                        umpiringText = umpiringText1;
                    else
                        umpiringText = umpiringText1 + " / " + umpiringText2;
                }

                DataRow row = table.NewRow();
				row["sr_no"] = nSerialNo++;
				row["match_id"] = dr["match_id"];
				row["match_dt"] = dt;
				row["type_cd"] = MatchTypeCd.getText(toInt(dr["type_cd"]));
				row["team1"] = dr["team1"];
				row["team2"] = dr["team2"];
				row["ground"] = dr["ground"];
                row["umpiring_team"] = umpiringText;
				row["start_time"] = dr["start_time"];
				row["end_time"] = dr["end_time"];
				table.Rows.Add(row);

				dtPrevious = dt;

			}
			dr.Close();

			DataView dv = new DataView(table);

			dgrid_schedule.DataSource = dv;
			dgrid_schedule.DataBind();

            //			SqlDataReader dr = m_bl.getSchedule(tournamentId);
//			dgrid_schedule.DataSource = dr;
//			dgrid_schedule.DataBind();
//			dr.Close();

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
			this.dgrid_schedule.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_schedule_ItemDataBound);
		}
		#endregion


		private void dgrid_schedule_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{

//				e.Item.Cells[0].Text = m_nSerialNo.ToString();
//				m_nSerialNo++;

				string strDate = e.Item.Cells[2].Text;
				if (strDate == null)
					strDate = "";

				if (strDate.Length > 0 && strDate != "&nbsp;")
				{
					DateTime dt = DateTime.Parse(strDate);

					TimeSpan ts = DateTime.Now.Subtract(dt);
					string strDayOfWeek = getDayOfWeek(dt);

					e.Item.Cells[2].Text = dt.ToShortDateString();
					e.Item.Cells[2].Text += " " + strDayOfWeek;

					if (dt.DayOfWeek == System.DayOfWeek.Saturday)
						e.Item.BackColor = Color.Azure;
					else
						e.Item.BackColor = Color.LightYellow;

//					string strNo = e.Item.Cells[0].Text;
//					if (strNo.Length > 0 && strNo == "&nbsp;")
//						e.Item.BackColor = Color.LightGray;
				}
				else
				{
					e.Item.BackColor = Color.WhiteSmoke;
					e.Item.ForeColor = Color.Red;
				}


			}
		}

		public string getDayOfWeek(DateTime dt)
		{
			string strDayOfWeek = "";
			if (dt.DayOfWeek == DayOfWeek.Saturday)
				strDayOfWeek = "Saturday";
			else if (dt.DayOfWeek == DayOfWeek.Sunday)
				strDayOfWeek = "Sunday";
			return strDayOfWeek;
		}

	}
}
