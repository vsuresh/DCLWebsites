using System;
using System.Web.UI.WebControls;

namespace Cricket.Common
{


    public enum GroundReservationStatus
    {
        None,
        Available,
        PendingApproval,
        Confirmed,
        Rejected,
        NotAvailable
    }

	/// <summary>
	/// Summary description for BattingStatus.
	/// </summary>
	public static class AdminHelper
	{
        public static DateTime GetStartDate(DateTime currentDate)
        {
            DateTime startDate = currentDate;
            switch (startDate.DayOfWeek)
            {
                case DayOfWeek.Friday:
                    startDate = startDate.AddDays(3);
                    break;
                case DayOfWeek.Saturday:
                    startDate = startDate.AddDays(2);
                    break;
                case DayOfWeek.Sunday:
                    startDate = startDate.AddDays(1);
                    break;
                case DayOfWeek.Monday:
                    break;
                case DayOfWeek.Tuesday:
                    startDate = startDate.AddDays(-1);
                    break;
                case DayOfWeek.Wednesday:
                    startDate = startDate.AddDays(-2);
                    break;
                case DayOfWeek.Thursday:
                    startDate = startDate.AddDays(4);
                    break;
                default:
                    break;
            }

            return startDate;
        }

	}
}
