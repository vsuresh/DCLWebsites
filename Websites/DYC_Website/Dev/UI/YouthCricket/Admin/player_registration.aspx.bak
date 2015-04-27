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
                                                <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                                                <asp:BoundField DataField="phone_home" HeaderText="phone_home" 
                                                    SortExpression="phone_home" />
                                                <asp:BoundField DataField="phone_cell" HeaderText="phone_cell" 
                                                    SortExpression="phone_cell" />
                                                <asp:BoundField DataField="school_name" HeaderText="school_name" 
                                                    SortExpression="school_name" />
                                                <asp:BoundField DataField="school_grade" HeaderText="school_grade" 
                                                    SortExpression="school_grade" />
                                                <asp:BoundField DataField="skill_level" HeaderText="skill_level" 
                                                    SortExpression="skill_level" />
                                                <asp:BoundField DataField="shirt_size" HeaderText="shirt_size" 
                                                    SortExpression="shirt_size" />
                                                <asp:BoundField DataField="address" HeaderText="address" 
                                                    SortExpression="address" />
                                                <asp:BoundField DataField="comments" HeaderText="comments" 
                                                    SortExpression="comments" />
                                                <asp:BoundField DataField="g1_first_name" HeaderText="g1_first_name" 
                                                    SortExpression="g1_first_name" />
                                                <asp:BoundField DataField="g1_last_name" HeaderText="g1_last_name" 
                                                    SortExpression="g1_last_name" />
                                                <asp:BoundField DataField="g1_male_female" HeaderText="g1_male_female" 
                                                    SortExpression="g1_male_female" />
                                                <asp:BoundField DataField="g1_phone_cell" HeaderText="g1_phone_cell" 
                                                    SortExpression="g1_phone_cell" />
                                                <asp:BoundField DataField="g1_phone_work" HeaderText="g1_phone_work" 
                                                    SortExpression="g1_phone_work" />
                                                <asp:BoundField DataField="g1_email1" HeaderText="g1_email1" 
                                                    SortExpression="g1_email1" />
                                                <asp:BoundField DataField="g1_volunteer" HeaderText="g1_volunteer" 
                                                    SortExpression="g1_volunteer" />
                                                <asp:BoundField DataField="g2_first_name" HeaderText="g2_first_name" 
                                                    SortExpression="g2_first_name" />
                                                <asp:BoundField DataField="g2_last_name" HeaderText="g2_last_name" 
                                                    SortExpression="g2_last_name" />
                                                <asp:BoundField DataField="g2_male_female" HeaderText="g2_male_female" 
                                                    SortExpression="g2_male_female" />
                                                <asp:BoundField DataField="g2_phone_cell" HeaderText="g2_phone_cell" 
                                                    SortExpression="g2_phone_cell" />
                                                <asp:BoundField DataField="g2_phone_work" HeaderText="g2_phone_work" 
                                                    SortExpression="g2_phone_work" />
                                                <asp:BoundField DataField="g2_email1" HeaderText="g2_email1" 
                                                    SortExpression="g2_email1" />
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
