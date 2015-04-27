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

namespace Cricket.AdminTeams
{

	/// <summary>
	/// Summary description for scoresheet.
	/// </summary>
    public partial class ReserveGroundsHistory : PageBaseAdmin
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
            using (SqlDataReader dr = GetGroundReservations(m_nTeamId))
            {
                dgrid_reservations.DataSource = dr;
                dgrid_reservations.DataBind();
            }

            if (dgrid_reservations.Items.Count == 0)
            {
                lblMessage.Text = "Your team does not have any reservations yet!";
                lblMessage.Visible = true;
            }

            //if (!base.IsSysAdmin())
            //    dgrid_reservations.Columns[7].Visible = false;
        }

        private SqlDataReader GetGroundReservations(int teamId)
        {
            using (SqlCommand com = new SqlCommand(string.Format("select * from ground_reservations where team_id = {0} " +
                    " and status != 'Cancelled' ", teamId), m_bl.GetSQLConnection()))
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
            }
        }


    }
}
