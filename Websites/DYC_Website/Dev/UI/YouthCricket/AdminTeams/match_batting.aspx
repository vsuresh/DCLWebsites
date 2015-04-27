<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.match_batting" CodeFile="match_batting.aspx.cs"
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
                                        Match Batting
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
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
                                        <span class="infoLabel">Match Batting Statistics:</span>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <!-- datagrid -->
                                        <asp:DataGrid ID="dgrid_batting" runat="server" AllowCustomPaging="false" AllowPaging="false"
                                            AllowSorting="false" EnableViewState="True" CssClass="rtTable" 
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="player_id" HeaderText="PlayerId" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="seq_no" HeaderText="No">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="type_cd" HeaderText="No" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="4%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Player Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="status" HeaderText="Status">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="fielder_name" HeaderText="Fielder">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="bowler_name" HeaderText="Bowler">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="runs" HeaderText="Runs">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="balls" HeaderText="Balls">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="strike_rate" HeaderText="SR%">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="four" HeaderText="4's">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="8%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="six" HeaderText="6's">
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
                                    <td align="right">
                                    </td>
                                    <td align="right">
                                        <span class="infoLabel">Total Runs (Reference only):</span>
                                        <asp:Label ID="lblTotalRuns" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <asp:Label ID="lblBatsmanStatus" CssClass="infoLabel" runat="server"></asp:Label>
                                        <br>
                                        <span class="infoData">(Batting order cannot be changed. Please add in proper batting
                                            order)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Select Batsman:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPlayer" runat="server" TabIndex="1">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">Runs:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRuns" TabIndex="5" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"
                                                        ControlToValidate="txtRuns" Operator="DataTypeCheck" Type="Integer">Invalid value</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Batting Status:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlStatus" runat="server" TabIndex="2">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">Balls:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBalls" TabIndex="6" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                                        ControlToValidate="txtBalls" Operator="DataTypeCheck" Type="Integer">Invalid value</asp:CompareValidator>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Select Fielder:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlFielder" runat="server" TabIndex="3">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">4's:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFour" TabIndex="7" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="CompareValidator"
                                                        ControlToValidate="txtFour" Operator="DataTypeCheck" Type="Integer">Invalid value</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Select Bowler:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlBowler" runat="server" TabIndex="4">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right">
                                                    <span class="infoLabel">6's:</span>
                                                    <td>
                                                        <asp:TextBox ID="txtSix" TabIndex="8" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                                        <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="CompareValidator"
                                                            ControlToValidate="txtSix" Operator="DataTypeCheck" Type="Integer">Invalid value</asp:CompareValidator>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="4">
                                                    <asp:Button ID="btnSubmit" TabIndex="9" runat="server" CssClass="btnAdmin" Text="Submit"
                                                        OnClick="btnSubmit_Click"></asp:Button>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnCancel" TabIndex="10" runat="server" CssClass="btnAdmin" Text="Cancel Edit"
                                                        CausesValidation="False" OnClick="btnCancel_Click"></asp:Button>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="btnReturn" TabIndex="11" runat="server" Text="Return" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnReturn_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnMatchList" TabIndex="12" runat="server" Text="Match List" CssClass="btnAdmin"
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
