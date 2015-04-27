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
using Cricket;
using Cricket.controls;

namespace Cricket.Admin
{
	/// <summary>
	/// Summary description for team.
	/// </summary>
	public partial class tournament : PageBaseAdmin
	{

		protected int		m_nAddressId;
		protected int		m_nPhoneId;
		protected int		m_nEmailId;
	
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
			//load the data from the database
			SqlDataReader dr = m_bl.getTournamentList();
			ddlTournament.DataSource = dr;
			ddlTournament.DataTextField = "name";
			ddlTournament.DataValueField = "tournament_id";
			ddlTournament.DataBind();
			dr.Close();

			ddlTournament.Items.Insert(0, new ListItem("select", "0"));
			ddlTournament.SelectedIndex = 0;

            setDefaults();
        }

        private void setDefaults()
        {
            txtOvers.Text = "20";
            txtFees.Text = "240";
            txtStartDate.Text = DateTime.Now.AddDays(14).ToShortDateString();
            txtEndDate.Text = DateTime.Now.AddDays(60).ToShortDateString();
            txtRegStartDate.Text = DateTime.Now.ToShortDateString();
            txtRegEndDate.Text = DateTime.Now.AddDays(10).ToShortDateString();
            //editorRegInfo.Content = "<ol>  <li><span class=infoData><b>Registration fees</b> is to be submitted with the registration online using paypal. The fees includes the tournament fees and fees to cover liability insurance and ground usage fees payable to the City of Plano. Please note that the fees is currently <b>tentative</b> as we are still negotiating with the insurance companies and it will also be based on the number of teams and the number of Plano/non-Plano residents participating in the tournament. </span></li>  <li><span class=infoData><b>Grounds:</b> The City of Plano will allocated&nbsp;(n) slots at Russel Creek Park (with concrete pitches). This requires the league to have liability insurance coverage and to pay the ground usage fees ($4 for Plano residents/$8 for non Plano residents per person per season). We are required to submit a combined list of players for all the teams and the City will invoice us accordingly. To simplify it DCL is charging a flat fees to all teams to cover the ground and insurance charges. </span></li>  <li><span class=infoData>Balls and Tapes would be provided for all the matches. </span></li>  <li><span class=infoData><strong>$40/-</strong> fine per umpire will be charged for missing the scheduled umpiring.&nbsp; </span></li>  <li><span class=infoData>Please call/email&nbsp;<strong>Kuljit/Krishna </strong>to arrange for pick up of cricket balls/tapes and submit the fees. </span></li>  <li><span class=infoData>All the captains, players and umpires are required to know the tournament rules as described on the rules page </span></li>  <li><span class=infoData><b8. will= be= published= on= <strong= &nbsp;schedule= />New teams will receive a website account and are required to enter and keep their player list upto date t upto date </span></li>  <li><span class=infoData>The teams are required collect the balls/tapes from the organizers by appointment on or before the 1st weekend of the tournament </span></li>  <li><span class=infoData>A discount of 50% of tournament fees (not registration fees) will be provided to the teams that have atleast 75% students on their roster </span></li>  <li><span class=infoData>All matches timings will be based on the timings provided to us by the City of Plano </span></li>  <li><span class=infoData>Matches will be scheduled on <strong>Russel Creek Athletic fields</strong> in Plano, Allen ground (concrete pitch) and if required on Tom Muehlenback Center (grass pitch)/ Frankford (grass pitch).&nbsp; </span></li>  <li><span class=infoData>Every team will send 1 umpire for their scheduled umpiring duties. This neutral umpire will act as the main umpire for the match. Leg umpire will be provided by the batting team and would perform the scoring. </span></li>  <li><span class=infoData>There are no cash prizes for winners/runnersup teams for this tournament&nbsp;</span> </li></ol>";
            editorRegInfo.Content = "<ol><li><span class=\"infoData\"><b>Registration fees</b> is to be submitted with the registration online using paypal. The fees includes the tournament fees and fees to cover liability insurance and ground usage fees payable to the City of Plano. Please note that the fees is currently <b>tentative</b> as it will depend upon the insurance cost, the number of teams and the number of Plano/non-Plano residents participating in the tournament. </span></li><li><span class=\"infoData\"><b>Grounds:</b> The City of Plano will allocated&nbsp;(n) slots at Russel Creek Park (with concrete pitches). This requires the league to have liability insurance coverage and to pay the ground usage fees ($4 for Plano residents/$8 for non Plano residents per person per season plus extra ground fees by hour). We are required to submit a combined list of players for all the teams and the City will invoice us accordingly. To simplify it DCL is charging a flat fees to all teams to cover the ground and insurance charges. </span></li><li><span class=\"infoData\">Balls and Tapes would be provided for all the matches. </span></li><li><span class=\"infoData\"><strong>$40/-</strong> fine per umpire will be charged for missing the scheduled umpiring.&nbsp; </span></li><li><span class=\"infoData\">Please call/email&nbsp;<strong>Kuljit/Krishna </strong>to arrange for pick up of cricket balls/tapes and submit the fees. </span></li><li><span class=\"infoData\">All the captains, players and umpires are required to know the tournament rules as described on the rules page </span></li><li><span class=\"infoData\"><b8. <strong=\" schedule=\" published=\"on=\" will=\"be=\" />New teams will receive a website account and are required to enter and keep their player list upto date t upto date </span></li><li><span class=\"infoData\">The teams are required collect the balls/tapes from the organizers by appointment on or before the 1st weekend of the tournament </span></li><li><span class=\"infoData\">A discount of 50% of tournament fees (not registration fees) will be provided to teams that have atleast 75% students on their roster </span></li><li><span class=\"infoData\">All matches timings will be based on the timings provided to us by the City of Plano </span></li><li><span class=\"infoData\">Matches will be scheduled on <strong>Russel Creek Athletic fields</strong> in Plano, Allen ground (concrete pitch) and if required on Tom Muehlenback Center (grass pitch)/ Frankford (grass pitch).&nbsp; </span></li><li><span class=\"infoData\">Every team will send 1 umpire for their scheduled umpiring duties. This neutral umpire will act as the main umpire for the match. Leg umpire will be provided by the batting team and would perform the scoring. </span></li><li><span class=\"infoData\">There are no cash prizes for winners/runnersup teams for this tournament&nbsp;</span> </li></ol>";
            //editorFormat.Content = "";
            editorFormat.Content = "The Spring tournament will be played with teams from all the divisions combined. The teams will be divided into various groups for group matches. Based on the points and NRR, selected teams from the groups will move to the play offs and play the Quaterfinals, Semifinals and the Final. There is a possibility that Pre-Quaterfinals will be scheduled dependeing upon the number of teams participating in the tournament and the number of ground slots being available. There will be 1 team winner and 1 team runner up for the Spring 2012 Tournament.";
            txtName.Focus();
        }

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
				int id = 0;
				if (lblId.Text.Length > 0)
					id = int.Parse(lblId.Text);

				if (id <= 0)
				{
                    m_bl.createTournament(txtName.Text, txtDesc.Text, txtStartDate.Text, txtEndDate.Text, toInt(txtOvers.Text), toInt(txtFees.Text), txtRegStartDate.Text, txtRegEndDate.Text, txtGroupName.Text, sqlEncode(editorRegInfo.Content), sqlEncode(editorFormat.Content));
                    ClientScript.RegisterStartupScript(this.GetType(), "Submitted", "javascript:alert('Successfully Inserted.');", true);

					clearFields();
					loadData();
				}
				else
				{
                    m_bl.setTournamentData(int.Parse(lblId.Text), txtName.Text, txtDesc.Text, txtStartDate.Text, txtEndDate.Text, toInt(txtOvers.Text), toInt(txtFees.Text), txtRegStartDate.Text, txtRegEndDate.Text, txtGroupName.Text, sqlEncode(editorRegInfo.Content), sqlEncode(editorFormat.Content));
				}
			}
		}
		
		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
			clearFields();
            setDefaults();
		}

		private void clearFields()
		{
			lblId.Text = string.Empty;
			txtName.Text = string.Empty;
			txtDesc.Text = string.Empty;
			txtStartDate.Text = string.Empty;
			txtEndDate.Text = string.Empty;
			txtOvers.Text = "0";
			ddlTournament.SelectedIndex = 0;
            txtFees.Text = "0";
            txtRegStartDate.Text = string.Empty;
            txtRegEndDate.Text = string.Empty;
            editorRegInfo.Content = string.Empty;
            editorFormat.Content = string.Empty;
            txtGroupName.Text = string.Empty;
        }

		protected void ddlTournament_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			int id = int.Parse(ddlTournament.SelectedValue.ToString());

			if (id > 0)
			{
				SqlDataReader dr = m_bl.getTournamentData(id);
				if (dr.Read())
				{
					lblId.Text = id.ToString();
					txtName.Text = dr["name"].ToString();
					txtDesc.Text = dr["description"].ToString();
                    txtStartDate.Text = DateTime.Parse(dr["start_dt"].ToString()).ToShortDateString();
                    txtEndDate.Text = DateTime.Parse(dr["end_dt"].ToString()).ToShortDateString();
					txtOvers.Text = dr["overs"].ToString();
                    txtFees.Text = dr["fees"].ToString();
                    txtRegStartDate.Text = DateTime.Parse(dr["regstart_dt"].ToString()).ToShortDateString();
                    txtRegEndDate.Text = DateTime.Parse(dr["regend_dt"].ToString()).ToShortDateString();
                    txtGroupName.Text = dr["group_name"].ToString();
                    editorRegInfo.Content = dr["registration_info"].ToString();
                    editorFormat.Content = dr["format"].ToString();
                }
				dr.Close();
			}
			else
				clearFields();

		}
	}
}

