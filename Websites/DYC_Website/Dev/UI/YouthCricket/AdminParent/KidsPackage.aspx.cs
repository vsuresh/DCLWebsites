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


namespace Cricket.Offerings
{
	/// <summary>
	/// Summary description for registration.
	/// </summary>
    public partial class KidsPackage : PageBaseAdmin
	{
	
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            if (!IsPostBack)
            {
                lblPRID.Text = parentRegistrationID.ToString();
                lblPendingAmount.Text = m_bl.GetTotalPendingAmount(toInt(lblPRID.Text));
            }
            else
            {
            }
		}


        protected void ddlPackageUnder8_SelectedIndexChanged(object sender, EventArgs e)
        {
            int packageID = toInt(ddlPackageUnder8.SelectedValue);
            float packageFee, regFee, totalAmount;
            if (packageID > 0)
            {
                packageFee = toFloat(m_bl.GetPackageFee(packageID));
                if (chkYearlyRegFee.Checked)
                    regFee = 40;
                else
                    regFee = 0;
                totalAmount = packageFee + regFee;
                lblAmount.Text = totalAmount.ToString();
            }
        }

        protected void ddlPackageAbove8_SelectedIndexChanged(object sender, EventArgs e)
        {
            int packageID = toInt(ddlPackageAbove8.SelectedValue);
            float packageFee, regFee, totalAmount;
            if (packageID > 0)
            {
                packageFee = toFloat(m_bl.GetPackageFee(packageID));
                if (chkYearlyRegFee.Checked)
                    regFee = 40;
                else
                    regFee = 0;
                totalAmount = packageFee + regFee;
                lblAmount.Text = totalAmount.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int yearlyReg = 0;
            if (chkYearlyRegFee.Checked)
                yearlyReg = 1;
            if(toInt(lblKidsAge.Text) > 8)
                m_bl.AddKidsPackage(toInt(lblPRID.Text), toInt(ddlKids.SelectedValue), toInt(ddlPackageAbove8.SelectedValue), ddlFirstSlot.SelectedValue, ddlSecondSlot.SelectedValue, toFloat(lblAmount.Text), yearlyReg, string.Empty, string.Empty);
            else
                m_bl.AddKidsPackage(toInt(lblPRID.Text), toInt(ddlKids.SelectedValue), toInt(ddlPackageUnder8.SelectedValue), ddlFirstSlot.SelectedValue, ddlSecondSlot.SelectedValue, toFloat(lblAmount.Text), yearlyReg, string.Empty, string.Empty);

            gvKidsPackage.DataBind();
            lblPendingAmount.Text = m_bl.GetTotalPendingAmount(toInt(lblPRID.Text));
        }

        protected void ddlKids_SelectedIndexChanged(object sender, EventArgs e)
        {
            int playerID = toInt(ddlKids.SelectedItem.Value);
            if (playerID > 0)
            {
                int kidsAge = m_bl.GetKidsAge(playerID);
                lblKidsAge.Text = kidsAge.ToString();
                if (kidsAge > 8)
                {
                    ddlPackageUnder8.Visible = false;
                    ddlPackageAbove8.Visible = true;
                }
                else
                {
                    ddlPackageUnder8.Visible = true;
                    ddlPackageAbove8.Visible = false;
                }
            }
            else
            {
                lblKidsAge.Text = "";
                lblAmount.Text = "";
                ddlPackageUnder8.SelectedIndex = -1;
                ddlPackageAbove8.SelectedIndex = -1;
                ddlFirstSlot.SelectedIndex = -1;
                ddlSecondSlot.SelectedIndex = -1;
            }
        }
        protected void chkYearlyRegFee_CheckedChanged(object sender, EventArgs e)
        {
        }
}
}
