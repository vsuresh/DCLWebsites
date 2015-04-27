<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeFile="announcements.aspx.cs" Inherits="Cricket.Admin.announcements"  CodeFileBaseClass="Cricket.PageBaseAdmin"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td align="left" valign="top" >
				<table id="Table1" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Announcements
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" valign="top">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add New Announcement" OnClick="btnAdd_Click" />&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <span class="infoData2">(Displaying last <asp:Label ID="labelDisplayCount" runat="server" /> announcements. These announcements are displayed on the home page ordered by date)</span>
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
                                                <asp:BoundColumn DataField="title" HeaderText="Title">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="30%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="tournament_id" HeaderText="" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Tournament" >
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn Text="Edit" SortExpression="Edit" HeaderText="" CommandName="Edit">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                            </Columns>
                                            </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" valign="middle">
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
