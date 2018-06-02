using System;

namespace Cricket.BAL
{
	/// <summary>
	/// Summary description for BattingStatus.
	/// </summary>
	
	//TODO: this exists at UI layer too
	public class BattingStatus
	{
		public static string NotOut
		{
			get{ return "not out"; }
		}
		public static string DNP
		{
			get{ return "did not bat"; }
		}
	}
}
