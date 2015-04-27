<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.ReserveGrounds" CodeFile="ReserveGrounds.aspx.cs"
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
                                    <td class="title" colspan="2">
                                       Reserve Grounds for Practice
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                       &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <span class="infoData"> &nbsp;
	                                        <b>Notes</b>
<ul>
    <li>
    Reservations can be requested until <b>Monday 5PM</b> for the following week
    </li>
    <li>
    Once Reservation requests is approved it cannot be cancelled (No Refund)
    </li>
    <li>
    Reservation confirmations/rejections will be updated on the website by <b>Friday 5PM</b> for the following week
    </li>
    <li>
    Reservations status for current week and the following week is shown. Only Russel Creek Grounds are currently available for reservations
    </li>
    <li>
    Teams are liable to pay the fees for confirmed reservations irrespective of whether they use the ground or not (as per City of Plano)
    </li>
    <li>
    Ground fees for practice is $6/- per hour per ground. This includes the City of Plano charges and paypal fees
    </li>
    <li>
    Reservations requests does not guarantee reservations. We will send the list of reservation requests on Tuesday to City of Plano.
    They will confirm/reject the reservation by Friday and the website will be updated accordingly
    </li>
</ul>
                                        </span>
                                    </td>                                
                                </tr>
                                <tr>
                                    <td align="center" width="100%" colspan="2">
                                    <table cellspacing="2">
                                        <tr>
                                            <td class="infoLabel">
                                                Reservation Request Last Date: 
                                            </td>
                                            <td class="infoData">
                                                <asp:Label ID="lblRequestEndDate"  ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="infoLabel">
                                                Reservation Cancellation Last Date:
                                            </td>
                                            <td class="infoData">
                                                <asp:Label ID="lblCancelDate"  ForeColor="DarkOrange" Font-Bold="true" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="infoLabel">
                                                Reservations Avaialble From: 
                                            </td>
                                            <td class="infoData">
                                                <asp:Label ID="lblReservationStart" ForeColor="Green" Font-Bold="true" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="infoLabel">
                                                Reservations Available Till: 
                                            </td>
                                            <td class="infoData">
                                                <asp:Label ID="lblReservationEnd"  ForeColor="Green" Font-Bold="true" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    </td>                                
                                </tr>
                                <tr>
                                    <td align="center"  colspan="2">
                                        <br />
                                       <asp:HyperLink ID="myReservations" NavigateUrl="ReserveGroundsHistory.aspx" runat="server">Click here</asp:HyperLink> to see the past Reservation Histrory!
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <br />
                                        &nbsp;
                                        <asp:DataGrid ID="dgrid_reservations" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width=700
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemcommand="dgrid_reservations_ItemCommand" 
                                            onitemdatabound="dgrid_reservations_ItemDataBound">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="reservation_id" HeaderText="MatchId" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="srno" HeaderText="#">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="date" HeaderText="Date" Visible="True">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="time" HeaderText="Time" Visible="True">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="status" HeaderText="Status">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                          
                                                <asp:ButtonColumn Text="Request" SortExpression="Request" HeaderText="Request" CommandName="Request">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                                <asp:ButtonColumn Text="Cancel" SortExpression="Cancel" HeaderText="Cancel" CommandName="Cancel">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                                <asp:ButtonColumn Text="" SortExpression="AdminAction" HeaderText="AdminAction" CommandName="AdminAction">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                                <asp:BoundColumn DataField="ground_name" HeaderText="GroundName" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                        <asp:Label ID="lblMessage" CssClass="infoLabel" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
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
                