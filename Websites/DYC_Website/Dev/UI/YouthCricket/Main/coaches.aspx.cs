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
using Cricket;

namespace Cricket.Main
{
    /// <summary>
    /// Summary description for aboutus.
    /// </summary>
    public partial class coaches : PageBase
    {
        int srno = 0;
        int firstGroundId = 0;

        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            int groundId = 0;
            if (!IsPostBack)
            {
                PopulateData();
                groundId = firstGroundId;
            }

            string groundIdString = Request.QueryString["coachId"] as string;
            if (!string.IsNullOrEmpty(groundIdString))
            {
                groundId = toIntNoThrow(groundIdString);
            }

            if (groundId > 0)
            {
                DisplayGroundInfo(groundId);
            }
        }

        private void DisplayGroundInfo(int groundId)
        {
            using (SqlDataReader dr = m_bl.GetCoachList(groundId))
            {
                if (dr.Read())
                {
                    lblName.Text = dr["name"] as string;
                    lblTitle.Text = dr["title"] as string;
                    lblAddress.Text = dr["address"] as string;
                    lblDescription.Text = dr["description"] as string;
                    
                    string imageUri = dr["photo_url"] as string;
                    if (!string.IsNullOrEmpty(imageUri))
                    {
                        imageGround.ImageUrl = "~/photos/" + imageUri;
                        imageGround.Visible = true;
                    }
                    else
                        imageGround.Visible = false;
                }
                else
                {
                    divMap.Visible = false;
                    imageGround.Visible = false;
                }
                dr.Close();
            }
        }

        protected void PopulateData()
        {
            using (SqlDataReader dr = m_bl.GetCoachList())
            {
                dgrid_grounds.DataSource = dr;
                dgrid_grounds.DataBind();
            }
        }

        protected void dgrid_grounds_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                srno++;
                if (srno == 1)
                {
                    firstGroundId = toInt(e.Item.Cells[0].Text as string);
                }
            }
        }

    }
}
