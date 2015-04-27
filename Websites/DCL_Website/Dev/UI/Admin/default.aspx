<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.master" Inherits="Cricket.Admin._default" CodeFile="default.aspx.cs" CodeFileBaseClass="Cricket.PageBaseAdmin" %>

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
                                    <td class="title">
                                        <span>System Administration functionality!</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <table width="100%" border="0">
                                            <tr>
                                                <td width="33%" align="center">
                                                    <table width="100%" >
                                                        <tr>
                                                            <td align="center" class="Subtitle">
            											        Tournaments
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
            											        <a href="/Admin/tournament.aspx">Manage Tournament</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
			            								        <a href="/Admin/tournament_team.aspx">Manage Tournament Teams</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
            											        <a href="/Admin/schedule.aspx">Manage Tournament Schedule</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/tournament_registration.aspx">View Tournament Registrations</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/tournament_awards.aspx">Manage Tournament Awards</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/tournament_stats.aspx">Recalculate Tournament Statistics</a>
                                                            </td>
                                                        </tr>
                                                    </table>
						                        </td>
                                                <td width="33%" align="center">
                                                    <table width="100%" >
                                                        <tr>
                                                            <td align="center" class="Subtitle">
            											        Other
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/teams.aspx">Manage Teams</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/announcements.aspx">Manage Announcements</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/manageFinancialReports.aspx">Manage Financial Reports</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/ReserveGroundsAdmin.aspx">Manage Ground Reservations</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/ReserveGroundsPayment.aspx">Manage Ground Payments</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
											                    <a href="/Admin/Penalty.aspx">Manage Team Penalty/Bonus</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="33%" align="center">
                                                    <table width="100%" >
                                                        <tr>
                                                            <td align="center" class="Subtitle">
                                                            &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
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
                