<%@Page Title="Division Teams" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.divisionTeams" CodeFile="divisionTeams.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td align="left" valign="top" class="bodyoutline">
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Team Rankings in various Divisions
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Label runat="server" CssClass="infoLabel3" Text="Select Year"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="subtitle">Division A</td>
                                    <td align="center" class="subtitle">Division B</td>
                                </tr>
                                <tr>
                                    <td width="50%" align="center">
                                        <asp:DataGrid ID="dgrid_divisionA" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width="70%"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="None" BorderWidth="1" >
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="rank" HeaderText="Rank" visible="true">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="5%" CssClass="rtCellData">
                                                    </ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="30%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>                                                
                                            </Columns>
                                            </asp:DataGrid>
                                    </td>
                                    <td align="center">
                                        <asp:DataGrid ID="dgrid_divisionB" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width="70%"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="None" BorderWidth="1" >
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                              <asp:BoundColumn DataField="rank" HeaderText="Rank" visible="true">
                                                <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="5%" CssClass="rtCellData">
                                                    </ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="30%" CssClass="rtCellDataLeft"></ItemStyle>
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
                                    <td align="center" class="subtitle">Division C</td>
                                    <td align="center" class="subtitle">Division D</td>
                                </tr>
                                <tr>
                                    <td width="50%" align="center">
                                        <asp:DataGrid ID="dgrid_divisionC" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width="70%"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="None" BorderWidth="1" >
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="rank" HeaderText="Rank" visible="true">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="5%" CssClass="rtCellData">
                                                    </ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="30%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>                                                
                                            </Columns>
                                            </asp:DataGrid>
                                    </td>
                                    <td align="center">
                                        <asp:DataGrid ID="dgrid_divisionD" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width="70%"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="None" BorderWidth="1" >
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                              <asp:BoundColumn DataField="rank" HeaderText="Rank" visible="true">
                                                <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="5%" CssClass="rtCellData">
                                                    </ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="left" Width="30%" CssClass="rtCellDataLeft"></ItemStyle>
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
                            </table>
                            <!-- custom code end -->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
