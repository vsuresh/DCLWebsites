using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using Cricket;
using Cricket.Common;


namespace Cricket.AdminParent
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
    public partial class profile : PageBaseAdmin
	{
        protected string TEMP1 = "hello";

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (!IsPostBack)
            {
                loadData();
                //ViewState["tournament_id"] = tournamentId;

                lblPRID.Text = parentRegistrationID.ToString();

            }
            else
            {
                //tournamentId = (int)ViewState["tournament_id"];
            }
		}

		protected void loadData()
		{

            //GridView1.DataBind();
            //if (GridView1.Rows.Count > 0)
            //{
            //    GridView1.SelectedIndex = 0;
            //}

            //lbl1.Text = ""; // GridView1.SelectedIndex.ToString();
        }

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
	
		}

        protected void btnAddKid_Click(object sender, EventArgs e)
        {

            //if (parentRegistrationID <= 0)
              //  throw new Exception("id not present");

            if (GridView1.Rows.Count < 10)
            {
                m_bl.AddNewKid(parentRegistrationID);
                GridView1.DataBind();
                GridView1.SelectedIndex = GridView1.Rows.Count - 1;
                lblMessage.Text = "A new record has been added. Please select edit and provide the kid's information!";
            }
            else 
            {
                lblMessage.Text = "You are only allowed to add 10 kids to your profile!";
            }

        }
        protected void DetailsView3_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            lblMessage.Text = "A kid's record has been deleted!";
        }
        protected void DetailsView3_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }
}
}
