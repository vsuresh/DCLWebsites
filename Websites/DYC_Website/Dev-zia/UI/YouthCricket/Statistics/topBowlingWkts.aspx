<%@ Page Language="c#" MasterPageFile="~/SiteTournament.Master" Inherits="Cricket.Statistics.topBowlingWkts" CodeFile="topBowlingWkts.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseTournament" %>
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
                                        Top Bowling Wicket Takers
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
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <!-- datagrid -->
                                        <asp:DataGrid ID="dgrid_bowling" runat="server" AllowCustomPaging="false" AllowPaging="false"
                                            AllowSorting="false" EnableViewState="True" CssClass="rtTable" ShowFooter="False"
                                            ShowHeader="True" AutoGenerateColumns="False" CellPadding="0" CellSpacing="0"
                                            BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="player_id" HeaderText="No.">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn DataTextField="name" CommandName="View" SortExpression="View" HeaderText="Player Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:ButtonColumn>
                                                <asp:BoundColumn DataField="team_name" HeaderText="Team Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="matches" HeaderText="&nbsp;M&nbsp;">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="innings" HeaderText="Inn">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="overs" HeaderText="Overs" DataFormatString="{0:##0.00}">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="wickets" HeaderText="Wkt">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="runs" HeaderText="Runs">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="economy_rate" HeaderText="E.Rate" DataFormatString="{0:##0.00}">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="average" HeaderText="Avg" DataFormatString="{0:##0.00}">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="best" HeaderText="Best">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
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

