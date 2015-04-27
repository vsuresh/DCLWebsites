<%@ Page language="c#" MasterPageFile="~/SiteTeam.master" AutoEventWireup="true" Inherits="Cricket.Team.match_score" CodeFile="match_score.aspx.cs" %>
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
                            <table id="Table1" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
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
                                    <td class="title" colspan="4">Match Scores - 
                                        <asp:Label ID="lblTournamentName" runat="server"></asp:Label>
                                    </td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<table width="100%">
										<tr>
											<td align="right"><span class="infoLabel">Team 1:</span>
											</td>
											<td><asp:label id="lblHomeTeam" tabIndex="1" runat="server" CssClass="infoData"></asp:label></td>
											<td align="right"><span class="infoLabel">Date:</span>
											</td>
											<td><asp:label id="lblMatchDate" tabIndex="1" runat="server" CssClass="infoData"></asp:label></td>
										</tr>
										<tr>
											<td align="right"><span class="infoLabel">Team 2:</span>
											</td>
											<td><asp:label id="lblVisitingTeam" tabIndex="1" runat="server" CssClass="infoData"></asp:label></td>
											<td align="right"><span class="infoLabel">Ground:</span>
											</td>
											<td><asp:label id="lblGround" tabIndex="1" runat="server" CssClass="infoData"></asp:label></td>
										</tr>
										<tr>
											<td align="right"><span class="infoLabel">Winning Team:</span>
											</td>
											<td><asp:label id="lblWinningTeam" tabIndex="1" runat="server" CssClass="infoDataBold"></asp:label></td>
											<td align="right"><span class="infoLabel">Umpiring Team: </span>
											</td>
											<td><asp:label id="lblUmpiringTeam" tabIndex="1" runat="server" CssClass="infoDataBold"></asp:label></td>
										</tr>
										<tr>
											<td align="right"><span class="infoLabel">Result:</span>
											</td>
											<td><asp:label id="lblResult" tabIndex="1" runat="server" CssClass="infoData"></asp:label></td>
											<td align="right"><span class="infoLabel">Man of the Match:</span>
											</td>
											<td><asp:label id="lblMOM" tabIndex="1" runat="server" CssClass="infoData"></asp:label></td>
										</tr>
										<tr>
											<td align="right"></td>
											<td></td>
											<td align="right"><span class="infoLabel">MatchID:</span></td>
											<td><asp:label id="lblMatchID" tabIndex="1" runat="server" CssClass="infoData" ></asp:label></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colSpan="2">
									<hr class="hr">
								</td>
							</tr>
							<tr>
								<td align="center" colSpan="2"><span class="infoLabel2">Innings I:&nbsp;</span>
									<asp:label id="lblTeamName1" tabIndex="1" runat="server" CssClass="infoLabel2"></asp:label></td>
							</tr>
							<tr>
								<td align="left" colSpan="2"><span class="infoLabel">Batting Scorecard</span>
								</td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<!-- datagrid -->
                                    <asp:datagrid id="dgrid_batting" runat="server" CssClass="rtTable" CellPadding="0"
										AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" 
                                        EnableViewState="True" AllowSorting="false" AllowPaging="false" AllowCustomPaging="false" 
                                        CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
										<EditItemStyle CssClass="rtRow1"></EditItemStyle>
										<AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
										<ItemStyle CssClass="rtRow1"></ItemStyle>
										<Columns>
											<asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="seq_no" HeaderText="No">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="type_cd" HeaderText="No" Visible="False">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="name" HeaderText="Player Name">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="status" HeaderText="Status">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="15%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="fielder_name" HeaderText="Fielder">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bowler_name" HeaderText="Bowler">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="runs" HeaderText="Runs">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="balls" HeaderText="Balls">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="strike_rate" HeaderText="SR%" DataFormatString="{0:##0}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="four" HeaderText="4's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="six" HeaderText="6's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="left" colSpan="2"><span class="infoLabel">Batting Summary</span>
								</td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<!-- datagrid -->
                                    <asp:datagrid id="dgrid_summary" runat="server" CssClass="rtTable" CellPadding="0"
										AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" Width="600px" 
                                        EnableViewState="True" AllowSorting="false" AllowPaging="false" AllowCustomPaging="false" 
                                        CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
										<EditItemStyle CssClass="rtRow1" BackColor="LightYellow"></EditItemStyle>
										<AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
										<ItemStyle CssClass="rtRow1"></ItemStyle>
										<Columns>
											<asp:BoundColumn DataField="total_runs" HeaderText="Runs">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="33%" CssClass="rtCellData" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wickets" HeaderText="Wickets">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"  ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="overs" HeaderText="Overs" DataFormatString="{0:##0.0}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="extras" HeaderText="Extras">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="nos" HeaderText="NoBalls">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wides" HeaderText="WideBalls">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="byes" HeaderText="Byes">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="over_throw" HeaderText="OverThrow">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="left" colSpan="2"><span class="infoLabel">Bowling Scorecard</span>
								</td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<!-- datagrid -->
                                    <asp:datagrid id="dgrid_bowling" runat="server" CssClass="rtTable" CellPadding="0"
										AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" Width="600px" 
                                        EnableViewState="True" AllowSorting="false" AllowPaging="false" AllowCustomPaging="false" 
                                        CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
										<EditItemStyle CssClass="rtRow1"></EditItemStyle>
										<AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
										<ItemStyle CssClass="rtRow1"></ItemStyle>
										<Columns>
											<asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="seq_no" HeaderText="No">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="name" HeaderText="Player Name">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="33%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="overs" HeaderText="Overs" DataFormatString="{0:##0.0}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="maiden" HeaderText="Maiden">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="runs" HeaderText="Runs">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wickets" HeaderText="Wickets">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="no_balls" HeaderText="No's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wide_balls" HeaderText="Wide's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="average" HeaderText="EconomyRate" DataFormatString="{0:##0.00}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td colSpan="2">
									<hr class="hr">
								</td>
							</tr>
							<tr>
								<td align="center" colSpan="2"><span class="infoLabel2">Innings II:&nbsp;</span>
									<asp:label id="lblTeamName2" tabIndex="1" runat="server" CssClass="infoLabel2"></asp:label></td>
							</tr>
							<tr>
								<td align="left" colSpan="2"><span class="infoLabel">Batting Scorecard</span>
								</td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<!-- datagrid -->
                                    <asp:datagrid id="dgrid_batting2" runat="server" CssClass="rtTable" CellPadding="0"
										AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" 
                                        EnableViewState="True" AllowSorting="false" AllowPaging="false" AllowCustomPaging="false" 
                                        CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
										<EditItemStyle CssClass="rtRow1"></EditItemStyle>
										<AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
										<ItemStyle CssClass="rtRow1"></ItemStyle>
										<Columns>
											<asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="seq_no" HeaderText="No">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="type_cd" HeaderText="No" Visible="False">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="name" HeaderText="Player Name">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="status" HeaderText="Status">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="15%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="fielder_name" HeaderText="Fielder">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="bowler_name" HeaderText="Bowler">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="runs" HeaderText="Runs">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="balls" HeaderText="Balls">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="strike_rate" HeaderText="SR%" DataFormatString="{0:##0}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="four" HeaderText="4's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="six" HeaderText="6's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="left" colSpan="2"><span class="infoLabel">Batting Summary</span>
								</td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<!-- datagrid -->
                                    <asp:datagrid id="dgrid_summary2" runat="server" CssClass="rtTable" CellPadding="0"
										AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" Width="600px" 
                                        EnableViewState="True" AllowSorting="false" AllowPaging="false" AllowCustomPaging="false" 
                                        CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
										<EditItemStyle CssClass="rtRow1" BackColor="LightYellow"></EditItemStyle>
										<AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
										<ItemStyle CssClass="rtRow1"></ItemStyle>
										<Columns>
											<asp:BoundColumn DataField="total_runs" HeaderText="Runs">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="33%" CssClass="rtCellData" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wickets" HeaderText="Wickets">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="overs" HeaderText="Overs" DataFormatString="{0:##0.0}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData" ></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="extras" HeaderText="Extras">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="nos" HeaderText="NoBalls">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wides" HeaderText="WideBalls">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="byes" HeaderText="Byes">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="over_throw" HeaderText="OverThrow">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="left" colSpan="2"><span class="infoLabel">Bowling Scorecard</span>
								</td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<!-- datagrid -->
                                    <asp:datagrid id="dgrid_bowling2" runat="server" CssClass="rtTable" CellPadding="0"
										AutoGenerateColumns="False" ShowHeader="True" ShowFooter="False" Width="600px" 
                                        EnableViewState="True" AllowSorting="false" AllowPaging="false" AllowCustomPaging="false" 
                                        CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
										<EditItemStyle CssClass="rtRow1"></EditItemStyle>
										<AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
										<ItemStyle CssClass="rtRow1"></ItemStyle>
										<Columns>
											<asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="seq_no" HeaderText="No">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="name" HeaderText="Player Name">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left" Width="33%" CssClass="rtCellDataLeft"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="overs" HeaderText="Overs" DataFormatString="{0:##0.0}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="maiden" HeaderText="Maiden">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="runs" HeaderText="Runs">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wickets" HeaderText="Wickets">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="no_balls" HeaderText="No's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wide_balls" HeaderText="Wide's">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="average" HeaderText="EconomyRate" DataFormatString="{0:##0.00}">
												<HeaderStyle CssClass="rtColHeader"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="left" colSpan="2">
									<hr class="hr">
								</td>
							</tr>
							<tr>
								<td align="center" colSpan="2"><asp:button id="btnReturn" tabIndex="3" runat="server" CssClass="btnAdmin" CausesValidation="False"
										Text="Match List" onclick="btnReturn_Click"></asp:button></td>
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
