<%@Page Title="Divisions" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.divisions" CodeFile="divisions.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="">
        <tr>
            <td align="left" valign="top" class="">
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Divisional Structure
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
<strong>Reason for Divisional Structure</strong>
<br />
<br />
The divisional structure for DCL was created to sustain the growth of DCL and maintain the competitiveness of the teams. It was created for the following main reasons:<ol>
<li>
Sustain competitive interest in the DCL-conducted games by ensuring that teams play more games with equally-capable teams 
</li>
<li>
Accommodate the increase in the number of teams 
</li>
<li>
Maintain consistency in ranking methods used for game scheduling purposes 
</li>
</ol>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
<strong>Divisional Structure</strong>
<br />
<br />
DCL has distributed all the teams into 2 divisions based on their rankings in the past: 
<ul>
<li>
Division A 
</li>
<li>
Division B
</li>
</ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
The divisional structure is formed as follows:

<ol>
<li>
Division A contains the top n teams based on rankings on rankings 
</li>
<li>
Division B contains the remaining n teams based on rankings 
</li>
<li>
For scheduling the games within the divisions, the teams in each division gets divided into n groups based on odd/even rankings and each team is then scheduled to play a set number of teams in the same group and the teams of the other group within the same division. The purpose of grouping within the division is purely for scheduling purpose 
</li>
<li>
Each division will have the Division champions and Division runner up based on the league rankings in the Summer tournament. The Summer tournament will have a league format and no play offs 
</li>
<li>
The rankings achieved within the division in the Summer tournament will be used for the FALL knock out tournament which will be conducted seperately for each division resulting in a champion/runner up for each division 
</li>
<li>
The Divisions A and B are independent of each other 
</li>
<li>
Based on the rankings at the end of the year, n of teams will move across the divisions. The actual number is being worked on and will be published soon. 
</li>
<li>
The bottom n teams from Division A will move to Division B for next year. 
</li>
<li>
The top n teams from Division B will move into Division A for next year 
</li>
<li>
This provides an incentive for the teams to maintain good rankings within their divisions 
</li>
</ol>
                                    </td>
                                </tr>
                                </table>
                            <!-- custom code end -->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
