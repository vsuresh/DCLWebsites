<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.tournament_team" CodeFile="tournament_team.aspx.cs"
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
                                        Manage Tournament Teams
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
                                        &nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel">Select Team:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTeam" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnAdd" TabIndex="13" runat="server" CssClass="btnAdmin" Text="Add Team"
                                            OnClick="btnAdd_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel"></span>
                                        <td align="left">
                                            <asp:DataGrid ID="dgrid_teams" runat="server" CellPadding="0" AutoGenerateColumns="False"
                                                ShowHeader="True" ShowFooter="False" Width="300px" EnableViewState="True" AllowSorting="false"
                                                AllowPaging="false" AllowCustomPaging="false" CssClass="rtTable"
                                                CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                                <AlternatingItemStyle CssClass="rtRow2"></AlternatingItemStyle>
                                                <ItemStyle CssClass="rtRow1"></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn DataField="team_id" HeaderText="No.">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn Visible="False" DataField="team_id" HeaderText="TeamId">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="name" HeaderText="Team Name">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Right" Width="45%" CssClass="rtCellDataLeft"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
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
