<%@ Page Language="c#" MasterPageFile="~/SiteTournament.master" AutoEventWireup="true" Inherits="Cricket.Tournament._default" CodeFile="default.aspx.cs"
	CodeFileBaseClass="Cricket.PageBaseTournament" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">

	<table id="TableMain" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top" align="left">
				<!-- custom code start -->
				<table id="TableCustom" width="96%" class="customTable">
					<tr>
						<td class="infoData" align="center">
							<br />
                            <asp:Label id="lblTournamentName" CssClass="bigtitle"  Font-Names="Times" Font-Underline=true runat="server">Tournament Name</asp:Label>
			                <br />
            			</td>
					</tr>
					<tr>
						<td class="title" align="center">
                            (<asp:Label id="lblOvers" runat="server"></asp:Label>)
						</td>
					</tr>
	                <tr>
						<td class="infoData" align="center">
                            <table width="45%">
                                <tr>
                                    <td align="left" class="titleNoLine" >
                                        Tournament Start Date: &nbsp;&nbsp;&nbsp;
                                        <asp:Label id="lblStartDate" CssClass="infoData" runat="server"></asp:Label>  
                                        <br />
                                        Tournament &nbsp;End &nbsp;Date: &nbsp;&nbsp;&nbsp;
                                        <asp:Label id="lblEndDate" CssClass="infoData" runat="server"></asp:Label>  
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="infoLabel">
                                        <asp:Label id="lblRegStatus" runat="server"></asp:Label>  
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="infoLabel">
                                        <asp:Label id="Label1" runat="server"><a href="/tournament/registrationInfo.aspx">Click here</a> to go to the registration page!</asp:Label>  
                                    </td>
                                </tr>
                            </table>
						</td>
					</tr>
					<tr>
						<td class="infoData">
							<hr class="hr" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
                            <div id="divAwards" runat="server">
                            <table width="100%">
					            <tr>
						            <td class="titleNoLine" align="center">
							           Awards
						            </td>
					            </tr>
					            <tr>
						            <td align="center">
							            &nbsp;
						            </td>
					            </tr>
                                <tr>
                                    <td align="center">
							            <asp:DataGrid ID="dgrid_awardsmain" runat="server" CssClass="rtTable" AllowCustomPaging="false"
								            AllowPaging="false" AllowSorting="false" EnableViewState="False" Width="500"
								            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" >
								            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
								            <AlternatingItemStyle CssClass="rtRow2"  BackColor="LightYellow"></AlternatingItemStyle>
								            <ItemStyle CssClass="rtRow1" BackColor="Azure"></ItemStyle>
								            <Columns>
									            <asp:BoundColumn DataField="award_type"  HeaderText="Award">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="True" Width="50%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="name" HeaderText="Team Name">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="True" Width="50%" CssClass="rtCellData">
										            </ItemStyle>
									            </asp:BoundColumn>
								            </Columns>
							            </asp:DataGrid>
						            </td>
					            </tr>
					            <tr>
						            <td align="center">
							            &nbsp;
						            </td>
					            </tr>
					            <tr>
						            <td colspan="2" align="center">
							            <asp:DataGrid ID="dgrid_awards" runat="server" CssClass="rtTable" AllowCustomPaging="false"
								            AllowPaging="false" AllowSorting="false" EnableViewState="False" Width="500"
								            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
								            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
								            <AlternatingItemStyle CssClass="rtRow2" BackColor="LightYellow"></AlternatingItemStyle>
								            <ItemStyle CssClass="rtRow1" BackColor="Azure"></ItemStyle>
								            <Columns>
									            <asp:BoundColumn DataField="award_type" HeaderText="Award">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="30%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="player_name" HeaderText="Player Name">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="25%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="name" HeaderText="Team Name">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="25%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="stats" HeaderText="Stats">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="25%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
								            </Columns>
							            </asp:DataGrid>
                                    </td>
                                </tr>
					            <tr>
						            <td class="infoData">
							            <hr class="hr" />
						            </td>
					            </tr>
                            </table>
                            </div>
						</td>
					</tr>
					<tr>
						<td class="titleNoLine" align=center>
							Recent Match Results
						</td>
					</tr>
                    <tr>
                        <td colspan="2" align="center">
                         <div id="divRecentMatches" runat="server" visible="false">
                            &nbsp;
                            <asp:DataGrid ID="dgrid_matches" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                AllowPaging="false" AllowSorting="false" EnableViewState="True" width=600
                                ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                onitemdatabound="dgrid_matches_ItemDataBound">
                                <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                <Columns>
                                    <asp:BoundColumn DataField="match_id" HeaderText="MatchId" Visible="false">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="match_dt" HeaderText="Date">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellDataLeft"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="type_cd" HeaderText="Type">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="5%" CssClass="rtCellData"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="team1" HeaderText="Team 1">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="team2" HeaderText="Team 2">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="winning_team" HeaderText="Winner">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="result" HeaderText="Result">
                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                        </div>
                        <div id="divNoRecentMatches" runat="server" visible="false">
                        <br />
                            <span class="infoData">There are no recent matches!</span>
                        </div>
                        </td>
                    </tr>
					<tr>
						<td class="infoData">
							<hr class="hr" />
						</td>
					</tr>
					<tr>
						<td class="infoData" align="center">
                            <div id="divNextSchedule" runat="server" visible="false">
                            <table width="100%">
					            <tr>
						            <td class="titleNoLine" align="center">
            							Upcoming Match Schedule
						            </td>
					            </tr>
                                <tr>
                                    <td align="center">
                                        &nbsp;
                                        <div id="divNextSchedulePresent" runat="server" visible="false">
                                        <asp:DataGrid ID="dgrid_schedule" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width=600
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemdatabound="dgrid_matches_ItemDataBound">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="match_id" HeaderText="MatchId" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="match_dt" HeaderText="Date">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="type_cd" HeaderText="Type">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team1" HeaderText="Team 1">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team2" HeaderText="Team 2">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ground" HeaderText="Venue">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="umpiring_team" HeaderText="Umpiring">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                    </asp:DataGrid>
                                    </div>
                                    <div id="divNoNextSchedulePresent" runat="server" visible="false">
                                        <span class="infoData">Schedule not available!</span>
                                    </div>
                                    </td>
                                </tr>
					            <tr>
						            <td class="infoData">
							            <hr class="hr" />
						            </td>
					            </tr>
                            </table>
                        </div>
						</td>
					</tr>
					<tr>
						<td class="titleNoLine" align="center">
							Announcements
						</td>
					</tr>
					<tr>
						<td class="infoData">
                        &nbsp;
						</td>
					</tr>
					<tr>
						<td class="infoData" align="center">
                        <div id="divAnnouncements" runat="server"  visible="false">
                            <asp:DataGrid ID="dgrid_announcements" runat="server" CssClass="" AllowCustomPaging="false"
                                AllowPaging="false" AllowSorting="false" EnableViewState="False" 
                                ShowFooter="False" ShowHeader="false" AutoGenerateColumns="False" CellPadding="0"
                                CellSpacing="0" GridLines="None" BorderStyle="None">
                                <AlternatingItemStyle CssClass="gridHomeRow2"></AlternatingItemStyle>
                                <ItemStyle CssClass="gridHomeRow1" ></ItemStyle>
                                <Columns>
                                    <asp:BoundColumn DataField="created_dt" HeaderText="" DataFormatString="{0:MMM d, yyyy}">
                                        <ItemStyle HorizontalAlign="left" Width="30%" CssClass="gridHomeCellData">
                                        </ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:HyperLinkColumn DataTextField="title"  DataNavigateUrlField="ID" DataNavigateUrlFormatString="/Main/Announcements.aspx?AnnouncementID={0}">
                                        <ItemStyle HorizontalAlign="left" Width="70%" CssClass="gridHomeCellData">
                                        </ItemStyle>
                                    </asp:HyperLinkColumn>
                                    <asp:BoundColumn DataField="ID" HeaderText="" Visible="false" >
                                        <ItemStyle HorizontalAlign="left" Width="0%" CssClass="gridHomeCellData">
                                        </ItemStyle>
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                        </div>
                        <div id="divNoAnnouncements" runat="server" visible="false">
                            <span class="infoData">There are no announcements for this tournament!</span>
                        </div>
						</td>
					</tr>
				</table>
				<!-- custom code end -->
			</td>
		</tr>
	</table>

</asp:Content>