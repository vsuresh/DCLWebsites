using System;

namespace Cricket.Common
{
	/// <summary>
	/// Summary description for ConfigurationHelper.
	/// </summary>
	public class ConfigurationHelper
	{

		public static int LoadMatchOvers()
		{
			int matchOvers = 0;
			string overs = System.Configuration.ConfigurationSettings.AppSettings["AdminTournamentMatchOvers"];
			if (overs != null)
			{
				try
				{
					matchOvers = int.Parse(overs);
				}
				catch
				{ 
					matchOvers = 0;
				}
			}

			return matchOvers;
			
		}

		public static int LoadConfiguration(ref string tournamentName)
		{
			int tournamentId = 0;
			tournamentName = System.Configuration.ConfigurationSettings.AppSettings["AdminTournamentName"];
			string id = System.Configuration.ConfigurationSettings.AppSettings["AdminTournamentID"];
			if (id != null)
			{
				try
				{
					tournamentId = int.Parse(id);
				}
				catch
				{ 
					tournamentId = 0;
					tournamentName = "Not specified";
				}
			}
			else
			{
				tournamentId = 0;
				tournamentName = "Not specified";
			}

			return tournamentId;
		}
	}
}
