using System;

namespace Cricket.Common
{
	/// <summary>
	/// Summary description for MatchStatus.
	/// </summary>
	public class MatchStatus
	{
		public static int NotPlayed
		{
			get { return 0; }
		}
		public static int Tied
		{
			get { return -1; }
		}
	}


    public class MatchTypeCD
    {

        public static string GetMatchType(int typeCD)
        { 
            string matchType = "";
            if (typeCD == 1)
                matchType = ""; //League
            else if (typeCD == 2)
                matchType = "Finals";
            else if (typeCD == 3 || typeCD == 4)
                matchType = "SemiFinals";
            else if (typeCD == 5 || typeCD == 6 || typeCD == 7 || typeCD == 11)
                matchType = ""; //Group
            else if (typeCD == 10 || typeCD == 12 || typeCD == 13 || typeCD == 14)
                matchType = "QuaterFinals";
            else if (typeCD >= 15 && typeCD <= 22)
                matchType = "Pre-QuaterFinals";

            return matchType;
        }

    }
}
