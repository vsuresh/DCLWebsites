<%@ Page Language="c#" MasterPageFile="~/SiteTournament.Master" Inherits="Cricket.Statistics.teamStats" CodeFile="teamStats.aspx.cs" CodeFileBaseClass="Cricket.PageBaseTournament" %>
<%@ Register TagPrefix="uc1" TagName="navbarStatistics" Src="../controls/navStatistics.ascx" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
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
                                        Team Rankings And Statistics
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
                                    <td colspan="2" align="center" class="infoData">
                                        (Click on the team name to see player statistics)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:DataGrid ID="dgrid_teams" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" ShowFooter="False" ShowHeader="True"
                                            AutoGenerateColumns="False" CellPadding="0" CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2" ></AlternatingItemStyle>
                                            <ItemStyle Height="22px" CssClass="rtRow1" ></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="team_id" HeaderText="Rank">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn Visible="False" DataField="team_id" HeaderText="TeamId">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
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
                                                <asp:ButtonColumn DataTextField="name" SortExpression="View" HeaderText="Team Name"
                                                    CommandName="View">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:ButtonColumn>
                                                <asp:BoundColumn DataField="played" HeaderText="P">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="won" HeaderText="W">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="lost" HeaderText="L">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="tie" HeaderText="T">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
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
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="points" HeaderText="Points">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
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

