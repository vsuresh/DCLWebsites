using System;
using Cricket.BAL;
using Cricket.controls;

namespace Cricket
{
	/// <summary>
	/// Summary description for PageBase.
	/// </summary>
	public class PageBase : System.Web.UI.Page
	{
		protected BusinessLayer		m_bl;

        // todo: change this behavior to reduce connections if not needed

		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

            // check if the url is the right one to use and redirect accordingly.

			m_bl = new BusinessLayer();
			m_bl.open();


		}

		protected override void OnUnload(System.EventArgs e)
		{
			base.OnUnload(e);
			if (m_bl != null)
				m_bl.close();
		}

		//Helper methods
        protected string sqlEncode(string data)
        {
            return data.Replace("'", "''");
        }

        protected int toIntNoThrow(Object strDataObject)
        {
            try
            {
                if (strDataObject != null)
                {
                    string strData = strDataObject.ToString();
                    if (strData != null)
                        if (strData.Length > 0)
                            return int.Parse(strData);
                }
            }
            catch
            { }

            return 0;
        }

		protected int toInt(Object strDataObject)
		{
			if (strDataObject != null)
			{
				string strData = strDataObject.ToString();
				if (strData != null)
					if (strData.Length > 0)
						return int.Parse(strData);
			}
			return 0;
		}
		protected long toLong(string strData)
		{
			if (strData != null)
				if (strData.Length > 0)
					return long.Parse(strData);
			return 0;
		}

		protected float toFloat(Object strDataObject)
		{
			if (strDataObject != null)
			{
				string strData = strDataObject.ToString();
				if (strData != null)
					if (strData.Length > 0)
						return float.Parse(strData);
			}
			return 0;
		}
		protected string toDataGridFloat(string strData)
		{
			if (strData != "&nbsp;")
			{
				float flValue = toFloat(strData);
				return flValue.ToString("##0.0000");
			}
			else
				return "0";
		}

	}
}
