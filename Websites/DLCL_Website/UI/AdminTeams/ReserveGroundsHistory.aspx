<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.ReserveGroundsHistory" CodeFile="ReserveGroundsHistory.aspx.cs"
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
                                       Ground Reservation History
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                        &nbsp;
                                    </td>
                                </tr>
							    <tr>
								    <td align="left"><span class="infoData"> &nbsp;
										    <b>Note</b>
                                            <ul>
                                                <li>
                                                Teams are liable to pay the fees for confirmed reservations irrespective of whether they use the ground or not (as per City of Plano)
                                                </li>
                                                <li>
                                                Ground fees for practice is $6/- per hour per ground. This includes the City of Plano charges and paypal fees
                                                </li>
                                            </ul>
									    </span>
								    </td>
							    </tr>
                                <tr>
                                    <td align="center" >
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                    <br />
                                       <asp:HyperLink ID="reservations" href="ReserveGrounds.aspx" runat="server">Click here</asp:HyperLink> to go back to Reservations Page!
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                       <asp:Label ID="lblTotalCharges" runat="server" ></asp:Label>
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
                                            onitemdatabound="dgrid_reservations_ItemDataBound">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="reservation_id" HeaderText="MatchId" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="reservation_id" HeaderText="#">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="practice_dt" HeaderText="Date" Visible="True">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="practice_time" HeaderText="Time" Visible="True">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="status" HeaderText="Status">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                          
                                              <asp:ButtonColumn Text="" SortExpression="AdminAction" HeaderText="AdminAction" CommandName="AdminAction" Visible="false">
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
                                    <td align="center">
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
                