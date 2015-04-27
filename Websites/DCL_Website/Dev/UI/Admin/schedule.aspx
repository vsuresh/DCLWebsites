<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.schedule" CodeFile="schedule.aspx.cs"
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
                                        Manage Tournament Schedule
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height: 22px" align="center">
                                        <span class="infoLabel">Select Tournament:</span> &nbsp;&nbsp;&nbsp;
                                        <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTournament_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        &nbsp;
                                        <asp:DataGrid ID="dgrid_schedule" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True" 
                                            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle BackColor="Azure" CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="match_id" HeaderText="No.">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="match_id" HeaderText="MatchId" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="match_dt" HeaderText="Date">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="type_cd" HeaderText="Type">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team1" HeaderText="Home Team">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team2" HeaderText="Visiting Team">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ground" HeaderText="Venue">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="umpiring_team" HeaderText="Umpiring1">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="umpiring_team2" HeaderText="Umpiring2">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="winning_team" HeaderText="Winner">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="umpiring_text" HeaderText="UmpiringText" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" CssClass="rtCellData"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn Text="Edit" SortExpression="Edit" HeaderText="Edit" CommandName="Edit">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Label ID="lblError" CssClass="infoLabel" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="btnAdd" runat="server" CssClass="btnAdmin" Text="Add Match" TabIndex="2"
                                            CausesValidation="False" OnClick="btnAdd_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customTableTD1">
                                        &nbsp;
                                    </td>
                                    <td class="customTableTD2">
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
