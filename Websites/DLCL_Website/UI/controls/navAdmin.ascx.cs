using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Security;

namespace Cricket.controls
{

	/// <summary>
	///		Summary description for headerBase.
	/// </summary>
    public partial class navAdmin :  System.Web.UI.UserControl
	{
        public String SessionID = String.Empty;
        public String keys = String.Empty;
        HttpCookie myCookie;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Constants.IsSysAdmin(int.Parse(Session["user_id"].ToString())))
            {
                divScoresheets.Visible = false;
                divPlayers.Visible = false;
            }

            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void aLogOut_OnClick(object sender, EventArgs e)
        {
            //todo: check this out
            SessionID = HttpContext.Current.Session.SessionID;
            myCookie = new HttpCookie(SessionID);
            myCookie.Expires = DateTime.Now.AddDays(-1D);
            Response.Cookies.Add(myCookie);
            Response.Cookies.Clear();
            Session.Clear();
            Response.Redirect("~/default.aspx");
        }
	}
}
