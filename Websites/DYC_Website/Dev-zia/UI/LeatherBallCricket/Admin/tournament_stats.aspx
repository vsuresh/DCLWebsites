<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.tournament_stats" CodeFile="tournament_stats.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td align="left" valign="top" >
				<table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Manage Tournament Statistics
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customTableTD1">
                                    </td>
                                    <td class="customTableTD2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel">Select Tournament:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="False" >
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <span><b>Use this option with caution and only when required!</b></span>
                                        <br /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="left" colspan="2">
                                        <span class="infoData">Use the following option to recalculate the statistics for all the teams in the tournament
                                        <br />
                                        (This will calculate the statistics for all matches except the play off matches)
                                        </span>
                                        <br /><br />
                                        <asp:Button ID="btnRecalculateStats" TabIndex="13" runat="server" CssClass="btnAdmin" width="200" Text="Recalculate Team Statistics"
                                            OnClick="btnRecalculateStats_Click"></asp:Button>
                                            <br /><br />

                                            <asp:Label ID="lblMessage" runat="server"  ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="left" colspan="2">
                                        <span class="infoData">Use the following option to recalculate the statistics for all the players in the tournament
                                        <br />
                                        (Run this only if there is an issue with player stats and approved by the dev team)
                                        </span>
                                        <br /><br />
                                        <asp:Button ID="btnRecalculatePlayerBattingStats" TabIndex="13" runat="server" CssClass="btnAdmin" width="200" Text="Recalculate Player Batting Statistics"
                                            OnClick="btnRecalculatePlayerBattingStats_Click"></asp:Button>
                                            <br /><br />
                                        <asp:Button ID="btnRecalculatePlayerBowlingStats" TabIndex="13" runat="server" CssClass="btnAdmin" width="200" Text="Recalculate Player Bowling Statistics"
                                            OnClick="btnRecalculatePlayerBowlingStats_Click"></asp:Button>
                                            <br /><br />

                                            <asp:Label ID="lblMessage2" runat="server"  ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
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
