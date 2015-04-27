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
using System.IO;
using Cricket;
using Cricket.Common;

namespace Cricket.AdminTeams
{
	/// <summary>
	/// Summary description for player_profile.
	/// </summary>
	public partial class player_profile : PageBaseAdmin
	{
	
		protected int		m_nPlayerId = 0;
		protected int		m_nEmailId = 0;
		protected int		m_nPhoneId = 0;
		protected string	m_strPhotoURL = "";

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack)
			{
				m_nPlayerId = toInt(Session["player_id"]);

				loadData();

				ViewState["player_id"] = m_nPlayerId;
				ViewState["email_id"] = m_nEmailId;
				ViewState["phone_id"] = m_nPhoneId;
				ViewState["photo_url"] = m_strPhotoURL;
			}
			else
			{
				m_nPlayerId = (int) ViewState["player_id"];
				m_nEmailId = (int) ViewState["email_id"];
				m_nPhoneId = (int) ViewState["phone_id"];
				m_strPhotoURL = (string) ViewState["photo_url"];
			}
		}

		protected void loadData()
		{
			PlayerTypeCd.populateList(ref ddlDesignation);

			if (m_nPlayerId > 0)
			{
				SqlDataReader dr = m_bl.getPlayerData(m_nPlayerId);
				if (dr.Read())
				{
					lblPlayerId.Text = m_nPlayerId.ToString();
					txtFirstName.Text = dr["first_name"].ToString();
					txtLastName.Text = dr["last_name"].ToString();
					txtBattingStyle.Text = dr["batting_style"].ToString();
					txtBowlingStyle.Text = dr["bowling_style"].ToString();
					txtBattingPos.Text = dr["batting_position"].ToString();
					//txtAge.Text = dr["age"].ToString();
					//txtStartDate.Text = dr["start_dt"].ToString();
					string strEndDate = dr["end_dt"].ToString();
					//txtComments.Text = dr["comments"].ToString();
					txtEmail.Text = dr["address"].ToString();
					txtPhone.Text = dr["number"].ToString();
					m_strPhotoURL = dr["photo_url"].ToString();
					chkKeeper.Checked = toInt(dr["keeper_sw"]) > 0;
					int nTypeCd = toInt(dr["type_cd"]);
					
					m_nEmailId = toInt(dr["email_id"]);
					m_nPhoneId = toInt(dr["phone_id"]);

					ListItem item = ddlDesignation.Items.FindByValue(nTypeCd.ToString());
					if (item != null)
						item.Selected = true;

					chkInActive.Checked =  (strEndDate.Length > 0);
				}
				dr.Close();
			}
			else
				lblPlayerId.Text = "New Player";

            int displayGuardianData = toInt(System.Configuration.ConfigurationManager.AppSettings["DisplayPlayerGuardianDataOnPlayerProfile"]);
            //if (displayGuardianData > 0)
            //    FormView1.Visible = true;
            //else
            //    FormView1.Visible = true;


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

		}
		#endregion

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
				string strPhotoURL = "";
				bool fKeeperSw = chkKeeper.Checked;
				bool fInActiveSw = chkInActive.Checked;
				int nTypeCd = toInt(ddlDesignation.SelectedValue);
				bool fInsert = false;
				if (m_nPlayerId <= 0)
				{
					fInsert = true;
					m_nPlayerId = m_bl.newPlayerId();
				}

				try
				{
					string strPhotoPath = "c:\\inetpub\\wwwroot\\cricket\\photos\\";
					string strPhotoName = "Player_" + m_nPlayerId.ToString();
					HttpPostedFile postedFile = filePhoto.PostedFile;
					if (postedFile != null)
					{
						strPhotoName += Path.GetExtension(postedFile.FileName);
						strPhotoPath += strPhotoName;
						strPhotoURL = strPhotoName;

						int nFileLengthKB = postedFile.ContentLength / 1024;
						string strFileMIMEType = postedFile.ContentType;
						if (strFileMIMEType.StartsWith("image") && nFileLengthKB > 0 && nFileLengthKB <= 100)
						{
							postedFile.SaveAs(strPhotoPath);
						}
						else
							strPhotoURL = "";
					}
				}
				catch(Exception)
				{
					strPhotoURL = "";
				}

				if (strPhotoURL.Length <= 0)
					strPhotoURL = m_strPhotoURL;

				int nAge = 0;
				string strComments = "";
				string strDate = "";
				string strEndDate = "";

				if (fInActiveSw)
					strEndDate = DateTime.Now.ToShortDateString();

				if (fInsert)
				{
					//check player name for duplication
					if (m_bl.checkPlayerName(m_nTeamId, txtFirstName.Text, txtLastName.Text))
					{
						lblMessage.Text = "Player name already exists!";
						return;
					}
				}
                
				m_bl.setPlayerData(fInsert, m_nTeamId, m_nPlayerId, txtFirstName.Text, txtLastName.Text, nAge, txtBattingStyle.Text, txtBowlingStyle.Text, 
					txtBattingPos.Text, strDate, strEndDate, m_nEmailId, txtEmail.Text, m_nPhoneId, txtPhone.Text, strComments, strPhotoURL, fKeeperSw, nTypeCd);
		
				Server.Transfer("players.aspx");		
			}
		}

		protected void btnCancel_Click(object sender, System.EventArgs e)
		{
			Server.Transfer("players.aspx");	
		}
    }
}
