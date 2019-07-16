using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Cricket;
using Cricket.controls;

namespace Cricket.Admin
{
    /// <summary>
    /// Summary description for team.
    /// </summary>
    public partial class unlock_scoresheets : PageBaseAdmin
    {

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            load_unlock_controls();
            if (!IsPostBack)
            {
                Session["unlock_id"] = string.Empty;
            }

        }
        private void InitializeComponent()
        {
            this.dgrid_unlock.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgrid_unlock_ItemCommand);
            this.dgrid_unlock.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgrid_unlock_ItemDataBound);

        }
        protected void load_unlock_controls()
        {
            var selectedValue = ddlTournament.SelectedValue;
            SqlDataReader dr = m_bl.getGroupNames();
            ddlTournament.DataSource = dr;
            ddlTournament.DataTextField = "group_name";
            ddlTournament.DataValueField = "group_name";
            ddlTournament.DataBind();
            dr.Close();
            if (!string.IsNullOrEmpty(selectedValue)) ddlTournament.SelectedIndex = ddlTournament.Items.IndexOf(ddlTournament.Items.FindByValue(selectedValue));
            //ddlTournament.SelectedIndex = ddlTournament.Items.IndexOf(ddlTournament.Items.FindByValue(dr["team_requesting"].ToString().ToLower()));
            //ddlTournament.SelectedValue = "Summer 2017";
            //load the data from the database
            SqlDataReader dr1 = m_bl.getActiveUnlockList();
            dgrid_unlock.DataSource = dr1;
            dgrid_unlock.DataBind();
            dr1.Close();
        }
        protected void ddlTournament_SelectedIndexChanged(object sender, EventArgs e)
        {
            //LoadPlayerReport(ddlTournament.SelectedValue);
            //ddlTournament.SelectedIndex = ddlTournament.Items.IndexOf(ddlTournament.Items.FindByValue(ddlTournament.SelectedValue));
        }

        private void dgrid_unlock_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

        }
        protected void ddlActive_SelectedIndexChanged(object sender, System.EventArgs e)
        {

        }
        private void clearUpdateFields()
        {
            //ddlActive.Items.Clear();
            txtMatchId.Text = string.Empty;
            txtTeamRequesting.Text = string.Empty;
            btnSubmit.Enabled = false;
        }
        protected void PopulateEditFields(int id)
        {
            SqlDataReader dr = m_bl.getUnlockData(toInt(id));
            if (dr.Read())
            {
                ddlActive.SelectedIndex = ddlActive.Items.IndexOf(ddlActive.Items.FindByValue(dr["is_active"].ToString().ToLower()));
                ddlTournament.SelectedIndex = ddlTournament.Items.IndexOf(ddlTournament.Items.FindByValue(dr["team_requesting"].ToString().ToLower()));
                //ddlActive.DataValueField = dr["is_active"].ToString().ToLower();
                txtMatchId.Text = dr["match_id"].ToString();
                txtTeamRequesting.Text = dr["team_requesting"].ToString();
                ddlTournament.SelectedValue = dr["group_name"].ToString();
            }
            dr.Close();
        }

        private void load_dropdown()
        {
            var collections = new List<ActiveValues>
            {
                new ActiveValues {DataText = "--Select One-", DataValue = ""},
                new ActiveValues {DataText = "Yes", DataValue = "true"},
                new ActiveValues {DataText = "No", DataValue = "false"},
            };
            ddlActive.DataSource = collections;
            ddlActive.DataTextField = "DataText";
            ddlActive.DataValueField = "DataValue";
            ddlActive.DataBind();
        }
        protected void dgrid_unlock_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                divUnlock.Visible = true;
                btnSubmit.Enabled = true;
                dgrid_unlock.EditItemIndex = e.Item.ItemIndex;
                PopulateEditFields(toInt(e.Item.Cells[0].Text));
                Session["unlock_id"] = e.Item.Cells[0].Text;
                this.btnSubmit.Text = "Update";
            }
        }



        private void clearAll()
        {
            Session["unlock_id"] = string.Empty;
            this.btnSubmit.Text = "Add";
            Server.Transfer("unlock_scoresheets.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (string.IsNullOrEmpty(txtMatchId.Text))
                    clearAll();
            }

            if (string.IsNullOrEmpty(Convert.ToString(Session["unlock_id"])))
            {
                int nMatchId = toInt(txtMatchId.Text);
                bool isActive = ddlActive.SelectedIndex == 1;
                string teamRequesting = txtTeamRequesting.Text;
                string season = ddlTournament.SelectedValue;
                m_bl.createUnlockScoresheet(nMatchId, isActive, teamRequesting, season);
            }
            else
            {
                int nId = toInt(Session["unlock_id"]);
                int nMatchId = toInt(txtMatchId.Text);
                bool isActive = ddlActive.SelectedIndex == 1;
                string teamRequesting = txtTeamRequesting.Text;
                string season = ddlTournament.SelectedValue;
                m_bl.setUnlockScoresheet(nMatchId, isActive, teamRequesting, nId, season);
            }

            clearAll();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearAll();
        }
    }
    public class ActiveValues
    {
        public string DataValue { get; set; }
        public string DataText { get; set; }
    }

}

