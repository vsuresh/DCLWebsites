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
using System.Configuration;
using Cricket;
using Cricket.Common;
using Cricket.BAL;

namespace Cricket.Tournament
{
	/// <summary>
	/// Summary description for default_Fall2009.
	/// </summary>
    public partial class _default : PageBaseTournament
    {
        protected override void OnLoad(System.EventArgs e)
        {
            //// get the id form query string if one exists and set it 
            //int tournamentID = toInt(Request.QueryString["TournamentID"]);
            //if (tournamentID > 0 && tournamentID != tournamentId)
            //{
            //    Session["tournament_id"] = tournamentID;
            //    Session["tournament_name"] = string.Empty;
            //}

            // we can do base load here since we have the tournament id in session 
            // this will be the case when the user selects a tournament
            /// however if we are coming from other tournament pages, then we will not have the id in query string
            base.OnLoad(e);

            DateTime endDate = PopulateTournamentData();
            PopulateAwards(endDate);
            PopulateAccouncements();
            PopulateRecentMatchResults();
            PopulateNextWeekendSchedule(endDate);

        }

        private void PopulateRecentMatchResults()
        {
            SqlDataReader dr = m_bl.GetRecentMatchResults(tournamentId);
            dgrid_matches.DataSource = dr;
            dgrid_matches.DataBind();
            dr.Close();

            divRecentMatches.Visible = false;
            divNoRecentMatches.Visible = false;
            if (dgrid_matches.Items.Count > 0)
                divRecentMatches.Visible = true;
            else
                divNoRecentMatches.Visible = true;
        }

        private void PopulateNextWeekendSchedule(DateTime endDate)
        {
            divNextSchedule.Visible = false;
            divNextSchedulePresent.Visible = false;
            divNoNextSchedulePresent.Visible = false;
            if (DateTime.Now <= endDate)
            {
                DayOfWeek dow = DateTime.Now.DayOfWeek;
                DateTime sat = DateTime.MinValue;
                if (dow != DayOfWeek.Sunday)
                    sat = DateTime.Now.AddDays(6 - (int)dow);
                else
                    sat = DateTime.Now.AddDays(-1);

                // get matches for the next weekend
                // if today is sat/sunday we will continue to display this weekend matches
                SqlDataReader dr = m_bl.GetNextWeekendMatches(tournamentId, sat, sat.AddDays(1));
                dgrid_schedule.DataSource = dr;
                dgrid_schedule.DataBind();
                dr.Close();

                divNextSchedule.Visible = true;
                if (dgrid_schedule.Items.Count > 0)
                    divNextSchedulePresent.Visible = true;
                else
                    divNoNextSchedulePresent.Visible = true;
            }
        }

        private void PopulateAccouncements()
        {
            SqlDataReader dr = m_bl.GetAnnouncements(6, tournamentId);
            dgrid_announcements.DataSource = dr;
            dgrid_announcements.DataBind();
            dr.Close();

            divAnnouncements.Visible = false;
            divNoAnnouncements.Visible = false;
            if (dgrid_announcements.Items.Count > 0)
                divAnnouncements.Visible = true;
            else
                divNoAnnouncements.Visible = true;
        }


        private DateTime PopulateTournamentData()
        {
            DateTime endDate = DateTime.MaxValue;
            using (SqlCommand com = new SqlCommand("select * from tournament where tournament_id = " + tournamentId.ToString(), m_bl.GetSQLConnection()))
            {
                com.CommandType = System.Data.CommandType.Text;
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    lblTournamentName.Text = dr["name"] as string;
                    lblStartDate.Text = Convert.ToDateTime(dr["start_dt"]).ToLongDateString();
                    endDate = Convert.ToDateTime(dr["end_dt"]);
                    lblEndDate.Text = endDate.ToLongDateString();
                    lblOvers.Text = "Overs: " + dr["overs"].ToString();
                    DateTime regStartDate = DataReaderHelper.GetDateTime(dr, "regstart_dt");
                    DateTime regEndDate = DataReaderHelper.GetDateTime(dr, "regend_dt");

                    if (DateTime.Now >= regStartDate && DateTime.Now <= regEndDate)
                    {
                        lblRegStatus.Text = "Registration is Open! <br />Registration will close on " + regEndDate.ToLongDateString();
                        lblRegStatus.Visible = true;
                    }
                    else
                    {
                        lblRegStatus.Visible = false;
                    }

                    // check if we have the tournament name in session and add it there if its different
                    if (!lblTournamentName.Text.Equals(Session["tournament_name"]))
                        Session["tournament_name"] = lblTournamentName.Text;

                }
                dr.Close();
            }

            return endDate;        
        }

        private void PopulateAwards(DateTime endDate)
        {
            divAwards.Visible = false;
            if (DateTime.Now >= endDate)
            {
                string str = string.Format("select at.*, awards.name from award_types at left join " +
                    "(select t.name, ta.* from tournament_awards ta left join team t on t.team_id = ta.team_id " +
                    "where ta.tournament_id = {0}) as awards " +
                    "on awards.award_id = at.award_id where at.teamaward_sw = 1 " +
                    "order by seq_id", tournamentId.ToString());

                using (SqlCommand com = new SqlCommand(str, m_bl.GetSQLConnection()))
                {
                    com.CommandType = System.Data.CommandType.Text;
                    SqlDataReader dr = com.ExecuteReader();
                    dgrid_awardsmain.DataSource = dr;
                    dgrid_awardsmain.DataBind();
                    dr.Close();

                    str = string.Format("select at.*, awards.* from award_types at left join " +
                        "(select t.name, ta.* from tournament_awards ta left join team t on t.team_id = ta.team_id " +
                        "where ta.tournament_id = {0}) as awards " +
                        "on awards.award_id = at.award_id where at.teamaward_sw = 0 " +
                        "order by seq_id", tournamentId.ToString());

                    com.CommandText = str;
                    com.CommandType = System.Data.CommandType.Text;
                    dr = com.ExecuteReader();
                    dgrid_awards.DataSource = dr;
                    dgrid_awards.DataBind();
                    dr.Close();
                }

                divAwards.Visible = true;
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
            this.ID = "documents";

        }
        #endregion

        protected void dgrid_matches_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string typecd = e.Item.Cells[2].Text;
                e.Item.Cells[2].Text = MatchTypeCd.getText(toInt(typecd));

                string strDate = e.Item.Cells[1].Text;
                if (strDate == null)
                    strDate = "";

                if (strDate.Length > 0 && strDate != "&nbsp;")
                {
                    DateTime dt = DateTime.Parse(strDate);

                    TimeSpan ts = DateTime.Now.Subtract(dt);
                    string strDayOfWeek = getDayOfWeek(dt);

                    e.Item.Cells[1].Text = dt.ToShortDateString();
                    e.Item.Cells[1].Text += " " + strDayOfWeek;

                    if (dt.DayOfWeek == System.DayOfWeek.Saturday)
                        e.Item.BackColor = Color.Azure;
                    else
                        e.Item.BackColor = Color.LightYellow;

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
