<%@ Control Language="c#" Inherits="Cricket.controls.navStatistics" CodeFile="navStatistics.ascx.cs" %>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30" align="left" valign="top" class="">
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="33%" align="center" valign="middle">
                        <span class="SubTitle">Statistics</span>
                        <br />
                        <a href="/Statistics/default.aspx" class="menulineNoBorder">Summary</a>
                        <br />
                        <a href="/Statistics/teamStats.aspx" class="menulineNoBorder">Team Statistics</a>
                        <br />
                    </td>
                    <td width="33%" align="center" valign="middle" >
                        <span class="SubTitle">Batting Statistics</span>
                        <br />
                        <a href="/Statistics/topBattingAgg.aspx" class="menulineNoBorder">Top Batting Aggregates</a>
                        <br />
                        <a href="/Statistics/topBattingScores.aspx" class="menulineNoBorder">Top Batting Scores</a>
                        <br />
                        <a href="/Statistics/topBattingAvg.aspx" class="menulineNoBorder">Top Batting Averages</a>
                        <br />
                        <a href="/Statistics/topBattingSR.aspx" class="menulineNoBorder">Top Strike Rates</a>
                        <br />
                        <a href="/Statistics/topCatches.aspx" class="menulineNoBorder">Top Catches</a>
                        <br />
                    </td>
                    <td width="33%" align="center" valign="middle" >
                        <span class="SubTitle">Bowling Statistics</span>
                        <br />
                        <a href="/Statistics/topBowlingWkts.aspx" class="menulineNoBorder">Top Wicket Takers</a>
                        <br />
                        <a href="/Statistics/topBowlingWktsInn.aspx" class="menulineNoBorder">Top Wickets in Innings</a>
                        <br />
                        <a href="/Statistics/topBowlingER.aspx" class="menulineNoBorder">Top Economy Rates</a>
                        <br />
                        <a href="/Statistics/topBowlingAvg.aspx" class="menulineNoBorder">Top Averages</a>
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
