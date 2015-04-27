<%@Page Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.coaches" CodeFile="coaches.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

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
                                    <td class="title" width="100%">
                                        Coach Profiles
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%">
                                    <table border=0 width="100%">
                                        <tr>
                                            <td width="20%">
                                                <asp:DataGrid ID="dgrid_grounds" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                                    AllowPaging="false" AllowSorting="false" EnableViewState="True" width="100%"
                                                    ShowFooter="False" ShowHeader="False" AutoGenerateColumns="False" CellPadding="0"
                                                    CellSpacing="0" BorderColor="#2D7C97" BorderStyle="None" BorderWidth="0" 
                                                    onitemdatabound="dgrid_grounds_ItemDataBound" >
                                                    <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                                    <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                                    <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                                    <Columns>
                                                        <asp:BoundColumn DataField="coach_id" HeaderText="" visible="false">
                                                            <ItemStyle HorizontalAlign="left" Width="0%" CssClass="rtCellData">
                                                            </ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataTextField="name" HeaderText="" DataNavigateUrlField="coach_id" DataNavigateUrlFormatString="/Main/coaches.aspx?coachId={0}">
                                                            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                            <ItemStyle HorizontalAlign="left" Width="30%" CssClass="rtCellDataLeft" Font-Size="9pt"></ItemStyle>
                                                        </asp:HyperLinkColumn>                                                
                                                    </Columns>
                                                    </asp:DataGrid>
                                            </td>
                                            <td width="50%">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" CssClass="infoLabel" Text="Name" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblName" CssClass="infoData" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" CssClass="infoLabel" Text="Title" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblTitle" CssClass="infoData" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" CssClass="infoLabel" Text="Address" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAddress" CssClass="infoData" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label CssClass="infoLabel" Text="Description" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblDescription" CssClass="infoData" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <br />
                                                        <div id="divMap" runat="server"></div>
                                                        <br />
                                                        <br />
                                                        <asp:Image id="imageGround" runat="server" ImageUrl="" />
                                                    </td>
                                                </tr>
                                            </table>
                                            </td>
                                        </tr>
                                    </table>
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
