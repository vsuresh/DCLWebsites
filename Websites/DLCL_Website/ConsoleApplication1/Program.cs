using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cricket.BAL;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19).ToString());
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.1).ToString());
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.2).ToString());
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.3).ToString());
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.4).ToString());
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.5).ToString());
            sb2.AppendLine(" Balls=" + Overs.getBalls((float)19.6).ToString());

            Overs.getOvers(114);
            Overs.getOvers(115);
            Overs.getOvers(116);
            Overs.getOvers(117);
            Overs.getOvers(118);
            Overs.getOvers(119);
            Overs.getOvers(120);

        }
    }
}
