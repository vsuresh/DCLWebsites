<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.tournament_registration" CodeFile="tournament_registration.aspx.cs"
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
                                        View Tournament Registrations
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
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Total Teams: </span>
                                    </td>
                                    <td align="left" >
                                        <asp:Label ID="lblTotalTeams" CssClass="infoData2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Registrations Status: </span>
                                    </td>
                                    <td align="left">
                                        <asp:RadioButtonList id="rblRegistrationStatus" runat="server" 
                                            RepeatDirection="Horizontal" Width="184px" AutoPostBack="True" 
                                            onselectedindexchanged="rblRegistrationStatus_SelectedIndexChanged">
                                            <asp:ListItem  Text="Active" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem  Text="In Active (Duplicates)" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                        <asp:DataGrid ID="dgrid_registrations" runat="server" CssClass="rtTable" 
                                            CellPadding="0" AutoGenerateColumns="False" ShowHeader="True"
                                            ShowFooter="False" EnableViewState="True" AllowSorting="false" AllowPaging="false"
                                            AllowCustomPaging="false"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemcommand="dgrid_registrations_ItemCommand">
                                            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
                                            <AlternatingItemStyle BackColor="Azure" CssClass="rtRow2"></AlternatingItemStyle>
                                            <ItemStyle Height="20px" CssClass="rtRow1"></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="sr_no" HeaderText="No.">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team_id" HeaderText="TeamId" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="rec_id" HeaderText="RecId" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="name" HeaderText="Name">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="location" HeaderText="Location">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="contacts" HeaderText="Contacts">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="comments" HeaderText="Comments">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="35%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="created_dt" HeaderText="Date">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" CssClass="rtCellDataLeft"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn Text="Toggle" Visible="true" SortExpression="Edit" HeaderText="Toggle Status"
                                                    CommandName="Edit">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Label ID="lblError" runat="server" CssClass="infoLabel"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
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
