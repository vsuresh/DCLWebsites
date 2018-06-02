using System;

namespace Cricket.BAL
{

	public class Points
	{
		public static int Won = 4;
		public static int Tied = 2;
		public static int Lost = 0;
	}

	public class Overs
	{
		public static int getBalls(float flOvers)
		{
			int nTemp1 = (int) flOvers;
			int nTemp2 = (int) Math.Round(((flOvers - nTemp1) * 10));
			return (nTemp1 * 6) + nTemp2;
		}

		public static float getOvers(int nBalls)
		{
			float flOvers1 = (int) (nBalls / 6);
			float flBalls2 = nBalls % 6;
			float flOvers = flOvers1 + (flBalls2 / 10);
			return flOvers;
		}

		public static float getAverage(float flRuns, float flWickets)
		{
			float flAverage = 0;
			if (flWickets > 0)
				flAverage = flRuns / flWickets;
			return flAverage;
		}

		public static float getEconomyRate(float flRuns, float flBalls)
		{
			float flRate = 0;
			if (flBalls > 0)
				flRate = (flRuns / flBalls) * (float) 6;
			return flRate;
		}
	}

	public class RunRate
	{
		public static float getRunRate(float flRuns, float flBalls)
		{
			float flRR = 0;
			if (flBalls > 0)
				flRR = (flRuns / flBalls) * (float) 6;
			return flRR;
		}
	}
}
