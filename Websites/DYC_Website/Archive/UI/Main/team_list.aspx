<%@ Page Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.team_list" CodeFile="team_list.aspx.cs"
    CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td align="left" valign="top" class="bodyoutline">
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <%--<td class="outerTableTD1" valign="top">
                        <uc2:navbarMain ID="navbarMain1" runat="server" SelectedID="ListTeams"></uc2:navbarMain>
                        </td>--%>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        List of Teams
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData" align="center">
                                        <span class="infoData">Select a team to go to the team page!
                                        </span>
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                            <asp:DataGrid ID="dgrid_teams" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" Width="300"                                           
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2" BackColor="LightYellow"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1" BackColor="Azure"></ItemStyle>
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="team_id" HeaderText="No." Visible="true">
                                                    <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn Visible="False" DataField="team_id" HeaderText="TeamId">
                                                    <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team Name" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn HeaderText="Team Name" DataTextField="name" DataNavigateUrlField="team_id" DataNavigateUrlFormatString="/teams/default.aspx?teamId={0}" >
                                                    <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                </asp:HyperLinkColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Label ID="lblError" runat="server" CssClass="infoLabel">&nbsp;</asp:Label>
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
