<%@ Page Language="c#" MasterPageFile="~/SiteTournament.Master" Inherits="Cricket.Statistics.playerStats" CodeFile="playerStats.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseTournament" %>
<%@ Register TagPrefix="uc1" TagName="navbarStatistics" Src="../controls/navStatistics.ascx" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
    <script language="JavaScript" type="text/javascript">
        //event handler for right mouse button
        function right_OnClick(click) {
            if (navigator.appName == "Microsoft Internet Explorer") {
                if (event.button == 2 || event.button == 3) {
                    alert("The right click has been disabled.");
                    return false;
                }
            }
            if (navigator.appName == "Netscape") {
                if (click.which == 2 || click.which == 3) {
                    alert("The right click has been disabled.");
                    return false;
                }
            }
            return false;
        }

        //set the event handlers for the right mouse events
        if (document.layers) window.captureEvents(Event.MOUSEDOWN);
        if (document.layers) window.captureEvents(Event.MOUSEUP);
        document.onmousedown = right_OnClick;
        document.onmouseup = right_OnClick;
        window.document.layers = right_OnClick;
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="">
        <tr>
            <td align="left" valign="top" class="">
                <table id="Table1" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Team Player Statistics
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        <uc1:navbarStatistics ID="NavbarStatistics1" runat="server" SelectedID="Summary">
                                        </uc1:navbarStatistics>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Label ID="lblName" CssClass="infoLabel2" runat="server"></asp:Label>
                                        <br>
                                        <asp:Label ID="lblTeamName" CssClass="Subtitle" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table class="innerTable" id="TableInner1" width="100%" border="0">
                                            <tr>
                                                <td align="left" width="60%">
                                                    <table class="innerTable" id="TableInner2" width="100%" border="0">
                                                        <tr>
                                                            <td width="30%" align="right">
                                                                <span class="infoLabel">Batting Style:</span>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lblBattingStyle" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <span class="infoLabel">Bowling Style:</span>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lblBowlingStyle" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <span class="infoLabel">Batting Position:</span>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lblBattingPosition" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <span class="infoLabel">WicketKeeper:</span>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lblWicketKeeper" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <span class="infoLabel">Start Date:</span>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lblStartDate" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <span class="infoLabel">End Date:</span>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lblEndDate" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="center" width="40%">
                                                    <asp:Image ID="imgPlayer" runat="server" AlternateText="Player Image" ImageUrl="../images/player_profile.jpg"
                                                        Width="200px" Height="150px" ImageAlign="Middle"></asp:Image>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <span class="infoLabel">Batting Statistics:</span>
                                        <br>
                                        <table id="TableStats1" cellspacing="1" cellpadding="0" border="1" width="100%">
                                             <tr style="background-color:lightblue;" >
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">Matches</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">Innings</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">NotOut</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">Runs</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">Highest</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">Average</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">SRate</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">100</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">50</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">4's</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">6's</span>
                                                </td>
                                                <td align="center" width="8%">
                                                    <span class="infoLabelShort">Duck</span>
                                                </td>
                                            </tr>
                                            <tr bgcolor="LightYellow">
                                                <td align="center">
                                                    <asp:Label ID="lblMatches" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblInnings" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblNotOuts" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblRuns" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblHighest" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblAverage" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblStrikeRate" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lbl100" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lbl50" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblFour" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblSix" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblDuck" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <span class="infoLabel">Bowling Statistics:</span>
                                        <br>
                                        <table id="TableStats2" border="1" width="80%">
                                            <tr style="background-color:lightblue;" >
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Matches</span>
                                                </td>
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Innings</span>
                                                </td>
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Overs</span>
                                                </td>
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Wickets</span>
                                                </td>
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Runs</span>
                                                </td>
                                                <td align="center" width="15%">
                                                    <span class="infoLabelShort">Economy Rate</span>
                                                </td>
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Average</span>
                                                </td>
                                                <td align="center" width="10%">
                                                    <span class="infoLabelShort">Best</span>
                                                </td>
                                            </tr>
                                            <tr bgcolor="LightYellow">
                                                <td align="center">
                                                    <asp:Label ID="lblMatches2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblInnings2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblOvers" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblWickets" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblRuns2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblEconomyRate" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblAverage2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="center">
                                                    <asp:Label ID="lblBest" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="btnReturn" TabIndex="3" runat="server" Text="Return" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnReturn_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        &nbsp;
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

