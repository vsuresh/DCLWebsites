<%@Page Title="Announcements" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.announcements" CodeFile="announcements.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

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
                                        Announcements
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="divAnnouncement" runat="server"  visible="false">
                                            <asp:Label ID="lblAnnouncementDate" runat="server"></asp:Label>
                                            <br /><br />
                                            <asp:Label ID="lblAnnouncementTitle" Font-Bold=true runat="server"></asp:Label>
                                            <br /><br />
                                            <asp:Label ID="lblAnnouncementDesc" runat="server"></asp:Label>
                                            <br />
                                            <br />
                                            <br />
                                            <a href="announcements.aspx">View all announcements</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="divNoAnnouncement" runat="server"  visible="false">
                                            <br />
                                            <span class="infoData">There are no announcements to display!</span>
                                            <br />
                                            <br />
                                            <a href="announcements.aspx">View all announcements</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <div id="divAnnouncementList" runat="server" visible="false">
                                        <span class="infoData2">(Displaying last <asp:Label ID="labelDisplayCount" runat="server"></asp:Label> announcements)</span>
                                        <br />
                                        <br />
                                            <asp:DataGrid ID="dgrid_announcements" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                                AllowPaging="false" AllowSorting="false" EnableViewState="True" 
                                                ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                                CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" OnItemCommand="dgrid_announcements_ItemCommand">
                                                <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                                <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                                <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn DataField="ID" HeaderText="" Visible="false">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="type" HeaderText="" Visible="false">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="created_dt" HeaderText="Date" DataFormatString="{0:d}">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellDataLeft"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataTextField="title"  HeaderText="Title" DataNavigateUrlField="ID" DataNavigateUrlFormatString="/Main/Announcements.aspx?AnnouncementID={0}">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="left" Width="80%" CssClass="gridHomeCellData">
                                                        </ItemStyle>
                                                    </asp:HyperLinkColumn>
                                                </Columns>
                                                </asp:DataGrid>
                                        </div>
                                    
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
