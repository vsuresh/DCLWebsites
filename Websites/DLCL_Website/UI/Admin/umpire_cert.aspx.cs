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
using System.Text;
using Cricket;
using Cricket.controls;
using Cricket.Common;

namespace Cricket.Admin
{
    /// <summary>
    /// Summary description for team.
    /// </summary>
    public partial class umpire_cert : PageBaseAdmin
    {
        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void LoadData()
        {
            //load the data from the database
            var dt = m_bl.getCertList();
            CertGridView.DataSource = dt;
            if (dt.Rows.Count > 0)
            {
                CertGridView.DataBind();
            }
            dt.Clear();
            txtName.Text = String.Empty;
            txtCertifiedBy.Text = String.Empty;
            txtTeamName.Text = String.Empty;
            txtPlayerID.Text = String.Empty;


        }
        protected void Insert(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string certifiedBy = txtCertifiedBy.Text;
            string teamName = txtTeamName.Text;
            string playerID = txtPlayerID.Text;
            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(certifiedBy))
            {
                m_bl.insertCertData(name, certifiedBy, teamName, playerID);
                this.LoadData();
            }
        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            CertGridView.EditIndex = e.NewEditIndex;
            this.LoadData();
        }
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = CertGridView.Rows[e.RowIndex];
            int id = Convert.ToInt32(CertGridView.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string certifiedBy = (row.FindControl("txtCertifiedBy") as TextBox).Text;
            string teamName = (row.FindControl("txtTeamName") as TextBox).Text;
            string playerID = (row.FindControl("txtPlayerID") as TextBox).Text;

            m_bl.setUmpireCert(id, name, certifiedBy, teamName, playerID);
            CertGridView.EditIndex = -1;
           LoadData();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            CertGridView.EditIndex = -1;
            LoadData();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int playerId = Convert.ToInt32(CertGridView.DataKeys[e.RowIndex].Values[0]);
            m_bl.deleteUmpireCert(playerId);
            LoadData();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != CertGridView.EditIndex)
            {
                (e.Row.Cells[5].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            CertGridView.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
   
}