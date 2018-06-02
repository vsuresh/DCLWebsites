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
using System.Configuration;
using Cricket;
using Cricket.Common;


namespace Cricket.Admin
{

	/// <summary>
	/// Summary description for scoresheet.
	/// </summary>
    public partial class ReserveGroundsPayment : PageBaseAdmin
    {

        int srno = 0;

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                bindControls();
            }
        }

        protected void bindControls()
        {
            //todo: this should be dependent upon the tournament dates
            DateTime startDate = DateTime.Parse("02/01/" + DateTime.Now.Year.ToString());
            DateTime endDate = DateTime.Parse("12/31/" + DateTime.Now.Year.ToString());

            txtStartDate.Text = startDate.ToShortDateString();
            txtEndDate.Text = endDate.ToShortDateString();

            ShowData(startDate, endDate);

        }

        private void ShowData(DateTime startDate, DateTime endDate)
        {
 
            using (SqlDataReader dr = GetGroundReservationsByTeams(startDate, endDate))
            {
                dgrid_reservations.DataSource = dr;
                dgrid_reservations.DataBind();
            }

        }

        private SqlDataReader GetGroundReservationsByTeams(DateTime startDate, DateTime endDate)
        {
            using (SqlCommand com = new SqlCommand(string.Format(
                "select t.name, confirmed_hours=COUNT(t.name)*2 from ground_reservations gr inner join team t on gr.team_id = t.team_id " +
                    " and status = 'Confirmed' and practice_dt between '{0}' and '{1}' group by t.name ", startDate, endDate), m_bl.GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        int chargesPerHour = 6;
        int numberOfHours = 2;

        public void dgrid_reservations_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                srno++;
                e.Item.Cells[0].Text = srno.ToString();

                int hours = int.Parse(e.Item.Cells[2].Text);
                e.Item.Cells[3].Text = string.Format("${0}", hours * 6);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //todo: this should be dependent upon the tournament dates
            DateTime startDate = DateTime.Parse(txtStartDate.Text);
            DateTime endDate = DateTime.Parse(txtEndDate.Text);
            ShowData(startDate, endDate);
        }
}
}
