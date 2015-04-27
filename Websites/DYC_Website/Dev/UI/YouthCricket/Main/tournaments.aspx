<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="tournaments.aspx.cs" Inherits="Cricket.Main.tournaments"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="">
        <tr>
            <td align="left" valign="top" class="">
                <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" id="TableMain">
                    <tr>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Tournaments
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        &nbsp;
                                        <asp:DataGrid ID="dgrid_tournaments" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" 
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemdatabound="dgrid_tournaments_ItemDataBound">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="40px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="tournament_id" HeaderText="TournamentId" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="year" HeaderText="Year">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle Width="10%" Font-Bold="true" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataTextField="name" HeaderText="Tournament" DataNavigateUrlField="tournament_id" DataNavigateUrlFormatString="/Tournament/default.aspx?TournamentID={0}">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="30%" CssClass="rtCellData" Font-Size="9pt"></ItemStyle>
                                                </asp:HyperLinkColumn>                                                
                                                <asp:BoundColumn DataField="winner" HeaderText="Winner">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"  Font-Size="9pt"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="runnersup" HeaderText="Runnersup">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"  Font-Size="9pt"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                            <!-- custom code end -->
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
