<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.player_registration" CodeFile="player_registration.aspx.cs"
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
                                    <td align="center" colspan="2">
                                        &nbsp;
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="700px">
                                            <Columns>
                                                <asp:BoundField DataField="first_name" HeaderText="first_name" 
                                                    SortExpression="first_name" />
                                                <asp:BoundField DataField="last_name" HeaderText="last_name" 
                                                    SortExpression="last_name" />
                                                <asp:BoundField DataField="male_female" HeaderText="male_female" 
                                                    SortExpression="male_female" />
                                                <asp:BoundField DataField="phone_home" HeaderText="phone_home" 
                                                    SortExpression="phone_home" />
                                                <asp:BoundField DataField="phone_cell" HeaderText="phone_cell" 
                                                    SortExpression="phone_cell" />
                                                <asp:BoundField DataField="school_name" HeaderText="school_name" 
                                                    SortExpression="school_name" />
                                                <asp:BoundField DataField="skill_level" HeaderText="skill_level" 
                                                    SortExpression="skill_level" />
                                                <asp:BoundField DataField="address" HeaderText="address" 
                                                    SortExpression="address" />
                                                <asp:BoundField DataField="comments" HeaderText="comments" 
                                                    SortExpression="comments" />
                                                <asp:BoundField DataField="created_dt" HeaderText="Created Date" 
                                                    SortExpression="created_dt" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
                                            SelectCommand="SELECT * FROM [player_registration] WHERE ([tournament_id] is null)">
                                        </asp:SqlDataSource>

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
