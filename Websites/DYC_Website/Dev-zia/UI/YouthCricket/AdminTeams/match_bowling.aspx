<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.match_bowling" CodeFile="match_bowling.aspx.cs"
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
                                        Match Bowling
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Match ID:</span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblMatchId" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">Batting Team: </span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblBattingTeam" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Innings: </span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblInning" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">Bowling Team: </span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblBowlingTeam" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <span class="infoLabel">Match Bowling Statistics:</span>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <!-- datagrid -->
                                        <asp:DataGrid ID="dgrid_bowling" runat="server" AllowCustomPaging="false" AllowPaging="false"
                                            AllowSorting="false" EnableViewState="True" CssClass="rtTable" width="600"
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="seq_no" HeaderText="No">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Player Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="33%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="overs" HeaderText="Overs" DataFormatString="{0:##0.0}">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="maiden" HeaderText="Maiden">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="runs" HeaderText="Runs">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="wickets" HeaderText="Wickets">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="no_balls" HeaderText="No's">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="wide_balls" HeaderText="Wide's">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn Text="Edit" SortExpression="edit" HeaderText="Edit" CommandName="Edit">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="2%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                                <asp:ButtonColumn Text="Delete" SortExpression="delete" HeaderText="Delete" CommandName="Delete">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="2%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <asp:Label ID="lblBowlerStatus" CssClass="infoLabel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Select Bowler:</span>
                                                </td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddlPlayer" runat="server" TabIndex="1">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Overs:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOvers" TabIndex="2" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"
                                                        Operator="DataTypeCheck" Type="Double" ControlToValidate="txtOvers">Invalid value</asp:CompareValidator>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">Wickets:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtWickets" TabIndex="5" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="CompareValidator"
                                                        Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtWickets">Invalid value</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Maiden:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMaiden" TabIndex="3" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                                        Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtMaiden">Invalid value</asp:CompareValidator>
                                                </td>
                                                <td align="right" style="height: 25px">
                                                    <span class="infoLabel">Wide Balls:</span>
                                                </td>
                                                <td style="height: 25px">
                                                    <asp:TextBox ID="txtWides" TabIndex="6" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="CompareValidator"
                                                        Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtWides">Invalid value</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Runs:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRuns" TabIndex="4" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="CompareValidator"
                                                        Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtRuns">Invalid value</asp:CompareValidator>
                                                </td>
                                                <td align="right" style="height: 26px">
                                                    <span class="infoLabel">No Balls:</span>
                                                </td>
                                                <td style="height: 26px">
                                                    <asp:TextBox ID="txtNos" TabIndex="7" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="CompareValidator"
                                                        Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtNos">Invalid value</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="4">
                                                    <asp:Button ID="btnSubmit" TabIndex="8" runat="server" CssClass="btnAdmin" Text="Submit"
                                                        OnClick="btnSubmit_Click"></asp:Button>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnCancel" TabIndex="9" runat="server" CssClass="btnAdmin" Text="Cancel"
                                                        CausesValidation="False" OnClick="btnCancel_Click"></asp:Button>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="btnReturn" TabIndex="10" runat="server" Text="Return" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnReturn_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnMatchList" TabIndex="11" runat="server" Text="Match List" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnMatchList_Click"></asp:Button>
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
