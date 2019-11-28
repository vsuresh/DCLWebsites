using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cricket;

namespace Cricket.Main
{
    public partial class umpires : PageBase
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

            //save the datatable into a viewstate for later use
            ViewState["certViewState"] = dt;
            //dt.Clear();
            searchBox.Text = String.Empty;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchTerm = searchBox.Text.ToLower();

            //check if the search input is at least 3 chars
            if (searchTerm.Length >= 3)
            {
                //always check if the viewstate exists before using it
                if (ViewState["certViewState"] == null)
                    return;

                //cast the viewstate as a datatable
                DataTable dt = ViewState["certViewState"] as DataTable;

                //make a clone of the datatable
                DataTable dtNew = dt.Clone();

                //search the datatable for the correct fields
                foreach (DataRow row in dt.Rows)
                {
                    //add your own columns to be searched here
                    if (row["Name"].ToString().ToLower().Contains(searchTerm) ||
                        row["TeamName"].ToString().ToLower().Contains(searchTerm))
                    {
                        //when found copy the row to the cloned table
                        dtNew.Rows.Add(row.ItemArray);
                    }
                }

                //rebind the grid
                CertGridView.DataSource = dtNew;
                CertGridView.DataBind();
            }
        }

        protected void resetSearchButton_Click(object sender, EventArgs e)
        {
            //always check if the viewstate exists before using it
            if (ViewState["certViewState"] == null)
                return;

            //cast the viewstate as a datatable
            DataTable dt = ViewState["certViewState"] as DataTable;

            //rebind the grid
            CertGridView.DataSource = dt;
            CertGridView.DataBind();
        }
    }
}