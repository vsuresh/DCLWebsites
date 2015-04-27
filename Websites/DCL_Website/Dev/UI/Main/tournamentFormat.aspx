<%@Page Title="Tournament Format" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.tournamentFormat" CodeFile="tournamentFormat.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

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
                                        Tournament Format</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        <p>
                                            DCL conducts 3 main tournaments per year as follows:</p>
                                        <p>
                                            <strong>Spring Tournament&nbsp;</strong></p>
                                        <p>
                                            The Spring Tournament is a knock out tournament that includes all the teams from 
                                            all the divisions. Rankings from the Summer league and the Fall tournament is used to distribute the  
                                            teams into multiple groups and few teams 
                                            from each group then qualify for the play offs after the group matches which would include 
                                            quaterfinals, semifinals and finals. 
                                            <br /><br />
                                            There is 1 winner and 1 runner up for the Spring tournament</p>
                                        <p>
                                            <strong>Summer League - Divisional structure&nbsp;</strong></p>
                                        <p>
                                            The Summer League is divided into multiple divisions (A-D) where teams play matches with teams within the divisions 
                                            and are ranked based on their performance at the end of the league season. Each Division has a Division Champion and Runner up. 
                                            The bottom 2 teams in each division based on the team rankings at the end of the Summer League season are moved to lower divisions in the following year.
                                            The top 2 teams in each division based on the team rankings at the end of the Summer League season are moved to higher divisions in the following year.
                                            <br /><br />
                                            A team who misses the Summer League season will loose their spot in the division (Missing Fall or Spring does not have similar effect) and if they come back later they will have to start in the lower division. However in a rare
                                             occasion if there is a spot open in their original division and the team has missed only 1 Summer season, they will be considered for that particular division.
                                             <br /><br />
                                             There is a winner and runnersup for each division
                                             <br /><br />
                                             Example: 
                                             <br />
                                             Top 2 teams in Division B/C/D will move to Division A/B/C respectively next year
                                             <br />
                                             Botton 2 teams in Division A/B/C will move to Division B/C/D respectively next year
                                            
                                            </p>
                                        <p>
                                            <strong>Fall Tournament - Divisional structure</strong></p>
                                        <p>
                                            The Fall tournament is also divided into multiple divisions similar to Summer League but is a knock out tournament with playoffs and Champion/Runnersup for each division.
                                            The teams in a division play with teams in the same division. The divisions and rankings of the Summer league in that year is used in the Fall tournament. In case a division has open spots available, teams are moved
                                             accross the divisions for scheduling purpose only. This movement is temporary for Fall tournament only and does not affect the Summer League divisions and rankings in any way.
                                            The rankings of the teams within the division is then used to 
                                            distribute the teams into multiple groups. Few teams from each group qualify 
                                            for the knock out playoffs for each division. 
                                             <br /><br />
                                             There is a winner and runnersup for each division
                                             </p>
                                        </p>
                                        <br />
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
