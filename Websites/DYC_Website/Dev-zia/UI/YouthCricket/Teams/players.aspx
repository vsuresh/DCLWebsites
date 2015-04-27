<%@ Page Language="c#" MasterPageFile="~/SiteTeam.master" Inherits="Cricket.Teams.players" CodeFile="players.aspx.cs" %>
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
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="infoData" colspan="4">
                                        <uc1:navbarTeam ID="navbarTeam1" runat="server" ></uc1:navbarTeam>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        &nbsp;
                                    </td>
                                </tr>

                                <tr>
                                    <td class="title" colspan="4">Player Roster
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="middle">
                                        &nbsp;

                                    <div class="left-container">

                                        <asp:DataGrid ID="dgrid_players" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="100%"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid"
                                             OnItemCommand="dgrid_players_ItemCommand" OnItemDataBound="dgrid_players_ItemDataBound">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2" BackColor="LightYellow"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1" BackColor="Azure"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="player_id" HeaderText="No.">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn Visible="False" DataField="player_id" HeaderText="PlayerId">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn Visible="False" DataField="type_cd" HeaderText="CaptainSw">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Player Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="end_dt" HeaderText="Status">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn Text="View" SortExpression="View" HeaderText="Profile" CommandName="View">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                        <br />
                                        <div style="float:right">
                                            <span class="infoData">(List is ordered by name)</span>
                                        </div>

                                    </div>

                                    <div class="right-container">

                                        <div style="float:right;padding-left:0;padding-top:0;">
                                          <asp:DataGrid ID="dgrid_stats" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="230"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn  DataField="type" HeaderText="Top Stats" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="40%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn  DataField="name" HeaderText="Player" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="40%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="data" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="20%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </div>
                                        <div style="float:right;padding-left:0;padding-top:10;">
                                          <asp:DataGrid ID="dgrid_stats2" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="230"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn  DataField="name" HeaderText="Appearances" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="70%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="data" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="30%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            </div>                                     
                                        </div>        
                                        <div style="padding-left:0;padding-top:10;">
                                          <asp:DataGrid ID="dgrid_stats3" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="230"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn  DataField="name" HeaderText="Match Statistics" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="70%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="data" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="30%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                                </asp:DataGrid>
                                        </div>


                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Label ID="lblError" CssClass="infoLabel" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customTableTD1">
                                        &nbsp;
                                    </td>
                                    <td class="customTableTD2">
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
