<%@ Page Language="c#" MasterPageFile="~/SiteTeam.master" Inherits="Cricket.Teams.player_profile" CodeFile="player_profile.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="navbarTeam" Src="~/controls/navTeam.ascx" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">

	<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td align="left" valign="top" class="bodyoutline">
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
					<td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="infoData">
                                        <uc1:navbarTeam ID="navbarTeam1" runat="server"></uc1:navbarTeam>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="middle">
                                        <asp:Label ID="lblName" CssClass="infoTitle" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table class="innerTable" id="TableInner1" width="100%" border="0">
                                            <tr>
                                                <td align="right" width="60%">
                                                    <table class="innerTable" id="TableInner2" width="100%" border="0">
                                                        <tr>
                                                            <td align="right" width="30%">
                                                                <span class="infoLabel">Age:</span>
                                                            </td>
                                                            <td align="left" width="70%">
                                                                <asp:Label ID="lblAge" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
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
                                                <td align="middle" width="40%">
                                                    <asp:Image ID="imgPlayer" runat="server" AlternateText="Player Image" ImageUrl="../images/player_profile.jpg"
                                                        Width="200px" Height="150px" ImageAlign="Middle"></asp:Image>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <span class="infoLabel">Batting Statistics:</span>
                                        <br>
                                        <table id="TableStats1" cellspacing="0" cellpadding="0" border="1" width="100%" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <tr style="background-color:lightblue;" >
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Matches</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Innings</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">NotOut</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Runs</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Highest</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Average</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">SRate</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">100</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">50</span>
                                                </td>
                                            </tr>
                                            <tr bgcolor="LightYellow">
                                                <td align="middle">
                                                    <asp:Label ID="lblMatches" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblInnings" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblNotOuts" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblRuns" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblHighest" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblAverage" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblStrikeRate" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lbl100" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lbl50" runat="server" CssClass="infoDataShort"></asp:Label>
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
                                        <table id="Table1" cellspacing="0" cellpadding="0" border="1" width="80%" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <tr style="background-color:lightblue;" >
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Matches</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Innings</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Overs</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Wickets</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Runs</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Average</span>
                                                </td>
                                                <td align="middle" width="10%">
                                                    <span class="infoLabelShort">Best</span>
                                                </td>
                                            </tr>
                                            <tr bgcolor="LightYellow">
                                                <td align="middle">
                                                    <asp:Label ID="lblMatches2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblInnings2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblOvers" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblWickets" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblRuns2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblAverage2" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                                <td align="middle">
                                                    <asp:Label ID="lblBest" runat="server" CssClass="infoDataShort"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <br />
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <span class="infoLabel">Comments:</span>
                                        <br>
                                        <asp:Label ID="lblComments" runat="server" CssClass="infoData"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="middle" colspan="2">
                                        <asp:Button ID="btnPlayerList" TabIndex="3" runat="server" Text="Player List" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnPlayerList_Click"></asp:Button>
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
