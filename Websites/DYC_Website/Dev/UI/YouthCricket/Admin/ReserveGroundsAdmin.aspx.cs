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
    public partial class ReserveGroundsAdmin : PageBaseAdmin
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
            string startDate = "02/01/" + DateTime.Now.Year.ToString();
            DateTime dt = DateTime.Parse(startDate);
            for (int i = 0; i < 310; i++)
            {
                string strDate = dt.ToLongDateString();

                if (dt.DayOfWeek == DayOfWeek.Monday)
                {
                    ddlWeeks.Items.Add(new ListItem(strDate, strDate));
                }
                dt = dt.AddDays(1);
            }

            ddlWeeks.Items.Insert(0, new ListItem("All", "All"));
            //ddlWeeks.SelectedValue = AdminHelper.GetStartDate(DateTime.Now).ToLongDateString();

            ShowData();
        }

        void ShowData()
        {
            DateTime startDate = DateTime.Parse(string.Format("1/1/{0}", DateTime.Now.Year));
            DateTime endDate = DateTime.Parse(string.Format("12/31/{0}", DateTime.Now.Year));
            ShowData(startDate, endDate);
        }

        void ShowData(DateTime startDate, DateTime endDate)
        {

            using (SqlDataReader dr = GetGroundReservations(startDate, endDate))
            {
                dgrid_reservations.DataSource = dr;
                dgrid_reservations.DataBind();
            }
        }

        private SqlDataReader GetGroundReservations(DateTime startDate, DateTime endDate)
        {
            using (SqlCommand com = new SqlCommand(string.Format("select team_name = t.name, gr.* from ground_reservations gr inner join team t on gr.team_id = t.team_id " +
                    " and status != 'Cancelled' and practice_dt between '{0}' and '{1}' ", startDate, endDate), m_bl.GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                return com.ExecuteReader();
            }
        }

        public void dgrid_reservations_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                srno++;
                e.Item.Cells[1].Text = srno.ToString();

                e.Item.Cells[4].Text = DateTime.Parse(e.Item.Cells[4].Text).ToLongDateString();

                string status = e.Item.Cells[6].Text;
                //if (status != GroundReservationStatus.PendingApproval.ToString())
                //{
                //    e.Item.Cells[7].Text = "";
                //    e.Item.Cells[8].Text = "";
                //}
            }
        }


        protected void ddlWeeks_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = ddlWeeks.SelectedValue;
            if (value == "All")
            {
                ShowData();
            }
            else
            {
                DateTime monday = DateTime.Parse(value);
                ShowData(monday, monday.AddDays(6));
            }
        }
        protected void dgrid_reservations_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                string status = e.Item.Cells[6].Text;
                if (status == GroundReservationStatus.PendingApproval.ToString())
                {
                    int reservationId = int.Parse(e.Item.Cells[0].Text);
                    using (SqlCommand com = new SqlCommand(
                                string.Format("update ground_reservations set status = '{0}' where reservation_id = {1} ", 
                                GroundReservationStatus.Confirmed.ToString(), reservationId), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }

                    ShowData();
                }
            }
            else if (e.CommandName == "Reject")
            {
                string status = e.Item.Cells[6].Text;
                if (status == GroundReservationStatus.PendingApproval.ToString())
                {
                    int reservationId = int.Parse(e.Item.Cells[0].Text);
                    using (SqlCommand com = new SqlCommand(
                                string.Format("update ground_reservations set status = '{0}' where reservation_id = {1} ",
                                GroundReservationStatus.Rejected.ToString(), reservationId), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }

                    ShowData();
                }
            }
        }
}
}
