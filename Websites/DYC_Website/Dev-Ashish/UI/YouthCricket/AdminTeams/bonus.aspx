<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.bonus" CodeFile="bonus.aspx.cs"
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
                                       Add Bonus Points
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center"  colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <span class="infoError">&nbsp;</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <span class="infoLabel">
                                            <asp:Label ID="lblTournament" runat="server"></asp:Label></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Select the team:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTeam" runat="server" TabIndex="1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Select Bonus Point Reason:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlReason" runat="server" TabIndex="1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Description:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDesc" TabIndex="25" runat="server" Width="399px" MaxLength="100" Height="53px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" TabIndex="26" runat="server" Text="Add Point" CssClass="btnAdmin"
                                            OnClick="btnSubmit_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" TabIndex="35" runat="server" Text="Back" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnCancel_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                        <asp:DataGrid ID="dgrid_bonus" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" width=700
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="bonus_id" HeaderText="Team1Id" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team_id" HeaderText="Team1Id" Visible="False">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Team">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="reason" HeaderText="Reason">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="description" HeaderText="Description">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="points" HeaderText="Points">
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
                