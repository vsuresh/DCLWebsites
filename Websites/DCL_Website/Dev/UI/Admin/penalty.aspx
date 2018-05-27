<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.penalty" CodeFile="penalty.aspx.cs"
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
                                    <td class="title" colspan="4">
                                        Manage Team Penalties/Bonus
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customTableTD1">
                                    </td>
                                    <td class="customTableTD2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel">Select Tournament:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTournament_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel">Select Team:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTeams" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Penalty Points: </span>
                                        </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlPenaltyPoints" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Description:</span>
                                        </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlDescription" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        </td>
                                    <td align="left">
                                        <br />
                                        (Please be sure before submitting as the total points will be updated for the team)<br />
                                        <br />
                                        <asp:Button ID="btnAddPenalty" TabIndex="6" runat="server" CssClass="btnAdmin" Text="Add Penalty"
                                            OnClick="btnAddPenalty_Click"></asp:Button>
                                    <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
										                  <asp:DataGrid ID="dgrid_penalty" runat="server" CssClass="rtTable" AllowCustomPaging="false"
											                  AllowPaging="false" AllowSorting="false" EnableViewState="True" Width="400px"
											                  ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                                              CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid"  >
											                  <EditItemStyle CssClass="rtRow1"></EditItemStyle>
											                  <AlternatingItemStyle CssClass="rtRow2" BackColor=""></AlternatingItemStyle>
											                  <ItemStyle CssClass="rtRow1" Height="22" BackColor=""></ItemStyle>
											                  <Columns>
												                  <asp:BoundColumn DataField="penalty_id" HeaderText="No." Visible="False">
													                  <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													                  <ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="8%" CssClass="rtCellData">
													                  </ItemStyle>
												                  </asp:BoundColumn>
												                  <asp:BoundColumn DataField="name" HeaderText="Team Name">
													                  <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													                  <ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="25%" CssClass="rtCellDataLeft">
													                  </ItemStyle>
												                  </asp:BoundColumn>
												                  <asp:BoundColumn DataField="type_code" HeaderText="TypeCode" Visible="False">
													                  <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													                  <ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													                  </ItemStyle>
												                  </asp:BoundColumn>
												                  <asp:BoundColumn DataField="verbose" HeaderText="Description">
													                  <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													                  <ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="25%" CssClass="rtCellData">
													                  </ItemStyle>
												                  </asp:BoundColumn>
												                  <asp:BoundColumn DataField="points" HeaderText="Points">
													                  <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
													                  <ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="5%" CssClass="rtCellData">
													                  </ItemStyle>
												                  </asp:BoundColumn>
											                    <asp:ButtonColumn CommandName="Delete" HeaderText="Delete item" Text="Delete"  >
											                      <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
											                      <ItemStyle HorizontalAlign="Right" Font-Bold="False" Width="25%" CssClass="rtCellData"/>
											                    </asp:ButtonColumn>
											                  </Columns>
										                  </asp:DataGrid>
									                  </td>
                                  </tr>
                                <tr>
                                    <td align="left" colspan="2" style="color:red">
                                        <br />
                                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
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
