<%@ Page Language="c#" MasterPageFile="~/SiteTournament.master" AutoEventWireup="true" Inherits="Cricket.Tournament.ranking" CodeFile="ranking.aspx.cs"
	CodeFileBaseClass="Cricket.PageBaseTournament" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">

  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td align="left" valign="top" >
				<table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" align="left">
							<!-- custom code start -->
							<table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td class="title" colspan="4">Team Rankings And Statistics
									</td>
								</tr>
								<tr>
									<td align="center">
										&nbsp;
									</td>
								</tr>
                <tr>
                  <td align="center">
                    <asp:Label ID="lblMessage" runat="server"  ForeColor="Red"></asp:Label>
                  </td>
                </tr>
								<tr>
									<td colspan="2" align="center">
										<asp:DataGrid ID="dgrid_teams" runat="server" CssClass="rtTable" AllowCustomPaging="false"
											AllowPaging="false" AllowSorting="false" EnableViewState="True"
											ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
											<EditItemStyle CssClass="rtRow1"></EditItemStyle>
											<AlternatingItemStyle CssClass="rtRow2" ></AlternatingItemStyle>
											<ItemStyle CssClass="rtRow1"></ItemStyle>
											<Columns>
												<asp:BoundColumn DataField="team_id" HeaderText="Rank">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="8%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="group_id" HeaderText="Group" Visible="false">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="group_name" HeaderText="Group">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="name" HeaderText="Team Name">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="25%" CssClass="rtCellDataLeft">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="played" HeaderText="P">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="won" HeaderText="W">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="lost" HeaderText="L">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="tie" HeaderText="T">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="for_runs" HeaderText="For Runs">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="for_overs" HeaderText="For Overs" DataFormatString="{0:##0.0}">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="for_rr" HeaderText="For RR" DataFormatString="{0:##0.00}">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="opp_runs" HeaderText="Opp Runs">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="opp_overs" HeaderText="Opp Overs" DataFormatString="{0:##0.0}">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="opp_rr" HeaderText="Opp RR" DataFormatString="{0:##0.00}">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="net_rr" HeaderText="Net RR" DataFormatString="{0:##0.00}">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="8%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="points" HeaderText="Points">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="10%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
											</Columns>
										</asp:DataGrid>
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td align="center" class="infoLabel2">
										Penalties/Byes
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<asp:DataGrid ID="dgrid_penalty" runat="server" CssClass="rtTable" AllowCustomPaging="false"
											AllowPaging="false" AllowSorting="false" EnableViewState="True" Width="400px"
											ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid"  >
											<EditItemStyle CssClass="rtRow1"></EditItemStyle>
											<AlternatingItemStyle CssClass="rtRow2" BackColor=""></AlternatingItemStyle>
											<ItemStyle CssClass="rtRow1" Height="22" BackColor=""></ItemStyle>
											<Columns>
												<asp:BoundColumn DataField="penalty_id" HeaderText="No." Visible="False">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="8%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="name" HeaderText="Team Name">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="25%" CssClass="rtCellDataLeft">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="type_code" HeaderText="TypeCode" Visible="False">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="verbose" HeaderText="Description">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="25%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="points" HeaderText="Points">
													<HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													</ItemStyle>
												</asp:BoundColumn>
											  <asp:ButtonColumn CommandName="Delete" HeaderText="Delete item" Text="Delete"  ></asp:ButtonColumn>
											</Columns>
										</asp:DataGrid>
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
								<tr>
									<td>
										<hr class="hr" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<span class="infoLabel2">Points System</span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="infoData">
											<br />
											The points will be awarded as follows:
											<ul>
												<li>
                                                    Win = 4 points
                                                </li>
												<li>
                                                    Tie/No Result = 2 points
                                                </li>
												<li>
                                                    Loss = 0 points
                                                </li>
											</ul>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<hr class="hr" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<span class="infoLabel2">Rules for Ranking Teams</span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="infoData">
											<br />
											The teams will be ranked according to the following order of priority:
											<ul>
												<li>The most points.
													<li>When two or more teams have equal points, the team with the higher net run rate
														will be placed in the higher position.
														<li>In the highly unlikely event that teams cannot be separated by the above, it will
															be done by flipping a coin.</li>
											</ul>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<hr class="hr" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<span class="infoLabel2">Net Run Rate Calculations</span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="infoData">
											<br />
											A team’s net run rate is calculated by deducting from the average runs per over
											scored by that team throughout the group matches, the average runs per over scored
											against that team throughout the group matches.<br />
											<br />
											In the event of a team being all out in less than its full quota of overs, the calculation
											of its net run rate shall be based on the full quota of overs to which it would
											have been entitled and not on the number of overs in which the team was dismissed.
											This Net Run Rate explanation has been taken from <a target="_blank" href="http://www.cricket.org/link_to_database/ABOUT_CRICKET/EXPLANATION/NETRR.html">
												CricInfo</a></span>
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