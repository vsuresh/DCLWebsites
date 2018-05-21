using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Cricket;

namespace Cricket.Paypal
{
    public partial class paymentCancel : PageBase
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            StringBuilder sb = new StringBuilder();
            if (Session["RegistrationID"] != null)
                sb.Append(" [RegistrationID: " + Session["RegistrationID"].ToString() + "]");
            if (Session["Paypal_OrderId"] != null)
                sb.Append(" [Paypal_OrderId: " + Session["Paypal_OrderId"].ToString() + "]");
            if (Session["Paypal_TeamName"] != null)
                sb.Append(" [Paypal_TeamName: " + Session["Paypal_TeamName"].ToString() + "]");
            if (Session["Paypal_Fees"] != null)
                sb.Append(" [Paypal_Fees: " + Session["Paypal_Fees"].ToString() + "]");

            if (sb.Length == 0)
                sb.Append("No Session data found!");

            m_bl.LogInfo("PayPalCancel", sb.ToString());
        }
    }
}