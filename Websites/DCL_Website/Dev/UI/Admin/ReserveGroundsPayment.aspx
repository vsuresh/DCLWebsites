<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.ReserveGroundsPayment" CodeFile="ReserveGroundsPayment.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td align="left" valign="top" >
				<table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title">
                                       Ground Reservation Payments
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                        <span class="infoLabel">Start Date: </span>
                                        <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                        <span class="infoLabel">End Date: </span>
                                        <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btnAction" 
                                            onclick="btnSearch_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <br />
             
                                        &nbsp;
                                        <asp:DataGrid ID="dgrid_reservations" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width=700
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemdatabound="dgrid_reservations_ItemDataBound" 
                                           >
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="name" HeaderText="#">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="confirmed_hours" HeaderText="Confirmed Practice Hours">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="confirmed_hours" HeaderText="Cost">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                          
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        &nbsp;
                                        <asp:Label ID="lblErrorMatches" CssClass="infoLabel" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                            </table>
                            <!-- custom code end -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
                