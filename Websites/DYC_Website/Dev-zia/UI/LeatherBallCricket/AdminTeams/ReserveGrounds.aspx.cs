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

namespace Cricket.AdminTeams
{

	/// <summary>
	/// Summary description for scoresheet.
	/// </summary>
    public partial class ReserveGrounds : PageBaseAdmin
    {

        DateTime _startDate = DateTime.MinValue;
        DateTime _cancelDate = DateTime.MinValue;
        DateTime _requestOpenDate = DateTime.MinValue;
        DateTime _requestCloseDate = DateTime.MinValue;
        DateTime _currentDate = DateTime.MinValue;

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
            // start date should always  be a Monday
            _startDate = GetStartDate();

            _cancelDate = _startDate.Date.Add(new TimeSpan(2, 17, 0, 0));
            lblCancelDate.Text = "Reservations Cancellation is valid till: " + _cancelDate.ToLongDateString() + " 5 pm";

            lblRequestEndDate.Text = _startDate.ToLongDateString() + " 5 pm";
            lblCancelDate.Text = _cancelDate.ToLongDateString() + " 5 pm";

            int daysToAdd = 0;
            DateTime startDateTime = _startDate.Date.AddHours(17);
            if (GetCurrentDate() < startDateTime)
                daysToAdd = 7;
            else
                daysToAdd = 14;

            _requestOpenDate = _startDate.AddDays(daysToAdd);
            _requestCloseDate = _requestOpenDate.AddDays(7).AddMinutes(-1);
            lblReservationStart.Text = _requestOpenDate.ToLongDateString();
            lblReservationEnd.Text = _requestCloseDate.ToLongDateString();

            DateTime displayDate = _startDate;
            if (GetCurrentDate() < _startDate)
                displayDate = _startDate.AddDays(-7);

            DataTable dt = GetGroundOptions(displayDate, _requestCloseDate);
            dt = FilterGroundOptionsByAvailability(dt, displayDate, _requestCloseDate);

            dgrid_reservations.DataSource = dt;
            dgrid_reservations.DataBind();

            myReservations.NavigateUrl = "ReserveGroundsHistory.aspx?teamId=" + m_nTeamId.ToString();

        }

        private DateTime GetCurrentDate()
        {
            if (_currentDate == DateTime.MinValue)
            {
                string testing = Request.QueryString["testing"];
                if (testing == "1")
                {
                    string date = Request.QueryString["date"];
                    string month = Request.QueryString["month"];
                    string hour = Request.QueryString["hour"];
                    _currentDate = DateTime.Parse(string.Format("{1}/{0}/2012", date, month)).AddHours(int.Parse(hour));
                }
                else
                {
                    _currentDate = DateTime.Now;
                }
            }
            return _currentDate;
        }

        private DateTime GetStartDate()
        {
            DateTime startDate = GetCurrentDate();
            return AdminHelper.GetStartDate(startDate.Date);
        }

        private DataTable FilterGroundOptionsByAvailability(DataTable dt, DateTime startDate, DateTime endDate)
        {

            using (SqlCommand com = new SqlCommand(string.Format("select * from ground_reservations where practice_dt between '{0}' and '{1}' "  +
                    " and status != 'Cancelled' ", startDate.ToShortDateString(), endDate.ToShortDateString()), m_bl.GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    DateTime date = DateTime.Parse(dr["practice_dt"].ToString());
                    string groundName = dr["ground_name"] as string;
                    string practiceTime = dr["practice_time"] as string;
                    string teamId = dr["team_id"].ToString();
                    string status = dr["status"] as string;
                    string reservationId = dr["reservation_id"].ToString();


                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["ground_name"].ToString() == groundName &&
                            DateTime.Parse(row["date"].ToString()).Equals(date) &&
                            row["time"].ToString() == practiceTime)
                        {
                            if (m_nTeamId.ToString() != teamId)
                                row["status"] = GroundReservationStatus.NotAvailable.ToString();
                            else
                            {
                                row["status"] = status;
                                row["reservation_id"] = reservationId;
                            }
                        }
                    }
                }
                dr.Close();
            }
            return dt;
            
        }

        private DataTable GetGroundOptions(DateTime startDate, DateTime endDate)
        {

            DataTable dt = new DataTable();
            dt.Columns.AddRange(
                new DataColumn[] { 
                    new DataColumn("reservation_id"),
                    new DataColumn("srno"),
                    new DataColumn("date"),
                    new DataColumn("time"),
                    new DataColumn("status"),
                    new DataColumn("ground_name")
               
            });

            int index=0;
            int startingHour = 5;
            int endingHour = 7;
            DateTime displayDate = _startDate;
            if (GetCurrentDate() < _startDate)
                displayDate = _startDate.AddDays(-7);
            for (DateTime date = displayDate; date < endDate; date = date.AddDays(1))
            {
                if (date.DayOfWeek == DayOfWeek.Monday && index != 0)
                {
                    DataRow dr1 = dt.NewRow();
                    dr1["srno"] = "";
                    dt.Rows.Add(dr1);
                }
                
                index++;
                DataRow dr = dt.NewRow();
                dr["srno"] = index.ToString();
                dr["date"] = date.ToLongDateString();
                dr["time"] = string.Format("{0} PM - {1} PM", startingHour, endingHour);
                dr["status"] = GroundReservationStatus.Available.ToString();
                dr["ground_name"] = "Any";
                dt.Rows.Add(dr);
            }

            return dt;
        }

        public void dgrid_reservations_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {

                if (e.Item.Cells[1].Text == "&nbsp;")
                {
                    e.Item.Cells[5].Text = "";
                    e.Item.Cells[6].Text = "";
                }
                else
                {
                    DateTime itemDate = DateTime.Parse(e.Item.Cells[2].Text);

                    if (itemDate.Date == GetCurrentDate().Date)
                        e.Item.BackColor = Color.LightBlue;

                    if (itemDate.Date == _startDate.Date)
                        e.Item.Cells[2].BackColor = Color.LightCoral;

                    if (itemDate.ToShortDateString() == _cancelDate.ToShortDateString())
                        e.Item.Cells[2].BackColor = Color.Orange;

                    if (itemDate >= _requestOpenDate && itemDate <= _requestCloseDate)
                        e.Item.Cells[2].BackColor = Color.LightGreen;

                    string status = e.Item.Cells[4].Text;
                    switch (((GroundReservationStatus)Enum.Parse(typeof(GroundReservationStatus), status)))
                    {
                        case GroundReservationStatus.NotAvailable:
                            e.Item.Cells[5].Text = "";
                            e.Item.Cells[6].Text = "";

                            if (itemDate < _requestOpenDate)
                            {
                                e.Item.Cells[4].Text = "";
                            }
                            break;
                        case GroundReservationStatus.Available:
                            e.Item.Cells[6].Text = "";

                            //if (itemDate < _startDate.AddDays(daysToAdd).AddHours(17))
                            if (itemDate < _requestOpenDate || itemDate > _requestCloseDate)
                            {
                                e.Item.Cells[4].Text = "";
                                e.Item.Cells[5].Text = "";
                            }
                            
                            break;
                        case GroundReservationStatus.PendingApproval:
                            e.Item.Cells[5].Text = "";

                            // hide the cancel option if the current date is greater than the cancel date
                            // also hide the cancel option if the date for the ground slot is in the current week (since teams cannot cahnge current week requests)
                            DateTime currentDate = GetCurrentDate();
                            //DateTime cancelDate = _startDate.Date.Add(new TimeSpan(2, 17, 0, 0));
                            if (currentDate >= _cancelDate || itemDate < _startDate.AddDays(5))
                                e.Item.Cells[6].Text = "";
                            break;
                        case GroundReservationStatus.Confirmed:
                            e.Item.Cells[5].Text = "";
                            e.Item.Cells[6].Text = "";
                            break;
                        case GroundReservationStatus.Rejected:
                            e.Item.Cells[5].Text = "";
                            e.Item.Cells[6].Text = "";
                            break;
                        default:
                            e.Item.Cells[5].Text = "";
                            e.Item.Cells[6].Text = "";
                            break;


                    }
                             
                }
            }
        }

        public  void dgrid_reservations_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Request")
            {
                string status = e.Item.Cells[4].Text;
                if (status == GroundReservationStatus.Available.ToString())
                {

                    string groundName = e.Item.Cells[8].Text;
                    DateTime practiceDate = DateTime.Parse(e.Item.Cells[2].Text);
                    string practiceTime = e.Item.Cells[3].Text;
                    using (SqlCommand com = new SqlCommand(
                                string.Format("insert into ground_reservations(team_id, ground_name, practice_dt, practice_time, status, created_dt) " +
                                " values ({0}, '{1}', '{2}', '{3}', '{4}', '{5}') ",
                                m_nTeamId, groundName, practiceDate.ToString(), practiceTime, "PendingApproval", DateTime.Now.ToString()), m_bl.GetSQLConnection()))
                    {
                        com.CommandType = System.Data.CommandType.Text;
                        com.ExecuteNonQuery();
                    }

                    bindControls();
                }
            }
            else if (e.CommandName == "Cancel")
            {
                string reservationId = e.Item.Cells[0].Text;
                string practiceTime = e.Item.Cells[3].Text;
                using (SqlCommand com = new SqlCommand(
                            string.Format("update ground_reservations set status = 'Cancelled' where reservation_id = {0} ",  
                            reservationId), m_bl.GetSQLConnection()))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.ExecuteNonQuery();
                }

                bindControls();
            }
        }

    }
}
