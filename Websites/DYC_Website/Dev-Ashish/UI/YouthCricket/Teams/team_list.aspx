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
                                    <td colspan="2" align="left">
                                    <div class="left-containerMedium">

                                        <span class="infoData">Select a team to go to the team page!
                                        </span>
                                        <br />
                                        <br />
                                        <asp:DataGrid ID="dgrid_teams" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="100%"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid"
                                             OnItemDataBound="dgrid_teams_ItemDataBound">


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
                                                    <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn HeaderText="All Teams" DataTextField="name" DataNavigateUrlField="team_id" DataNavigateUrlFormatString="/teams/default.aspx?teamId={0}" >
                                                    <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellDataLeft" ></ItemStyle>
                                                </asp:HyperLinkColumn>
                                            </Columns>
                                        </asp:DataGrid>


                                    </div>

                                    <div class="right-container">

                                        <span class="infoData">All time Champions and Runnersup!
                                        </span>
                                        <br />
                                        <br />
                                        <div style="padding-top:0;">
                                          <asp:DataGrid ID="dgrid_winners" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="330"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn DataField="team_id" HeaderText="No." Visible="false">
                                                        <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="no" HeaderText="No." Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn HeaderText="ChampionShips" DataTextField="name" DataNavigateUrlField="team_id" DataNavigateUrlFormatString="/teams/default.aspx?teamId={0}" >
                                                        <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellDataLeft" ></ItemStyle>
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="count" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>

                                                </Columns>
                                            </asp:DataGrid>
                                        </div>
                                                             
                                        <br />

                                        <div style="padding-top:0;">
                                          <asp:DataGrid ID="dgrid_runnersup" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="330"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="5" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn DataField="team_id" HeaderText="No." Visible="false">
                                                        <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="no" HeaderText="No." Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn HeaderText="RunnersUp" DataTextField="name" DataNavigateUrlField="team_id" DataNavigateUrlFormatString="/teams/tournaments.aspx?teamId={0}" >
                                                        <HeaderStyle CssClass="rtColHeader"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellDataLeft" ></ItemStyle>
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="count" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </div>

                                    </div>    
                                        
                                            
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
