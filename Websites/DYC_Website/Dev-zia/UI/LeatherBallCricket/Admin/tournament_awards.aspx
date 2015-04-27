<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.tournament_awards" CodeFile="tournament_awards.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
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
                                        Manage Tournament Awards
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
                                    <td align="center" colspan="2">
                                        <span class="infoData2">
                                        (These awards are displayed on the tournament home page)
                                        </span>
                                    </td>
                                </tr>
					            <tr>
						            <td colspan="2" align="center">
							            <asp:DataGrid ID="dgrid_awards" runat="server" CssClass="rtTable" AllowCustomPaging="false" 
								            AllowPaging="false" AllowSorting="false" EnableViewState="False" Width="700"
								            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemcommand="dgrid_awards_ItemCommand">
								            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
								            <AlternatingItemStyle CssClass="rtRow2" ></AlternatingItemStyle>
								            <ItemStyle CssClass="rtRow1"></ItemStyle>
								            <Columns>
									            <asp:BoundColumn DataField="rec_id" HeaderText=""  Visible="false">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="0%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="award_id" HeaderText="" Visible="false">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="0%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="award_type" HeaderText="Award Type">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Width="20%" Font-Bold="true" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="team_id" HeaderText="" Visible="false" >
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="0%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="name" HeaderText="Team Name">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="20%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="player_id" HeaderText="" Visible="false">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="0%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="player_name" HeaderText="Player Name">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="20%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="stats" HeaderText="Statistics">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="20%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
                                                <asp:ButtonColumn Text="Edit" SortExpression="Edit" HeaderText="Edit" CommandName="Edit">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
								            </Columns>
							            </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <div id="divAwards" runat="server" visible="false">
                                        <table>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">RecID:</span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRecId" runat="server" Width="200px" CssClass="infoData2"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Award Type:</span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblAwardType" runat="server" Width="200px" CssClass="infoData2"></asp:Label>
                                                    <asp:Label ID="lblAwardId" runat="server" Width="200px" Visible="false" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Team:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTeam" runat="server" AutoPostBack="True" 
                                                        onselectedindexchanged="ddlTeam_SelectedIndexChanged"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Player:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPlayer" runat="server" AutoPostBack="True" 
                                                        onselectedindexchanged="ddlPlayer_SelectedIndexChanged"></asp:DropDownList>
                                                    <span class="infoData2">(Required for individual awards)</span>
                                                    <br />
                                                    <asp:TextBox ID="txtPlayerName" TabIndex="2" runat="server" Width="304px" ReadOnly="true" MaxLength="100" Height="24px"></asp:TextBox>
                                                    <span class="infoData2">(Required for individual awards)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Statistics:
                                                    </span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtStats" TabIndex="2" runat="server" Width="304px" MaxLength="20" Height="24px"></asp:TextBox>
                                                    <span class="infoData2">(Required for individual awards)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit" TabIndex="13" runat="server" CssClass="btnAdmin" Text="Submit"
                                                        OnClick="btnSubmit_Click"></asp:Button>
                                                </td>
                                            </tr>
                                        </table>
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
