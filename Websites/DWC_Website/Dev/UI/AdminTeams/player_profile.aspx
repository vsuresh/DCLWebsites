<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.player_profile" CodeFile="player_profile.aspx.cs"
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
                                        Players Profile
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <span class="infoLabel">For security purpose, players email address and phone number
                                            can be viewed only by the administrator of the team. </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMessage" TabIndex="1" runat="server" CssClass="infoError"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Player ID:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPlayerId" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">First Name:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" TabIndex="1" runat="server" Width="200px" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtFirstName">Required Field</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Last Name:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" TabIndex="2" runat="server" Width="200px" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtLastName">Required Field</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Designation:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlDesignation" runat="server" TabIndex="3">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Batting Style:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBattingStyle" TabIndex="4" runat="server" Width="200px" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Bowling Style:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBowlingStyle" TabIndex="5" runat="server" Width="200px" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Batting Position:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBattingPos" TabIndex="6" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Wicket Keeper:</span>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkKeeper" TabIndex="7" runat="server"></asp:CheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Email Address:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" TabIndex="8" runat="server" Width="200px" MaxLength="30"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator"
                                            ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid Email</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Phone Number:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhone" TabIndex="9" runat="server" Width="200px" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top">
                                        <span class="infoLabel">Select Photo:</span>
                                    </td>
                                    <td>
                                        <input id="filePhoto" type="file" runat="server" name="filePhoto" />
                                        <br />
                                        <span class="infoData">(Size: &lt;= 100KB / Dimension: 200x150pixels)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">InActive:</span>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkInActive" TabIndex="20" runat="server"></asp:CheckBox>
                                        &nbsp;<span class='infoData"'>(Player will not be available for selection when entering
                                            match scores)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" TabIndex="11" runat="server" Text="Submit" CssClass="btnAdmin"
                                            OnClick="btnSubmit_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" TabIndex="15" runat="server" Text="Cancel" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnCancel_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <!-- custom code start -->
                            <asp:Panel ID="playerGuardianSection" runat="server">
                            <table id="Table1" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Players Guardian Information
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <span class="infoLabel">For security purpose, all the guardian information 
                                            can be viewed only by the administrator of the team. </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                    <td align="left" colspan="3">
                                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Visible="true" 
                                            DataSourceID="SqlDataSource1" EnableModelValidation="True" Height="50px" 
                                            Width="187px" AutoGenerateInsertButton="True" >
                                            <Fields>
                                                <asp:BoundField DataField="player_id" HeaderText="player_id" 
                                                    SortExpression="player_id" />
                                                <asp:BoundField DataField="g1_first_name" HeaderText="g1_first_name" 
                                                    SortExpression="g1_first_name" />
                                                <asp:BoundField DataField="g1_last_name" HeaderText="g1_last_name" 
                                                    SortExpression="g1_last_name" />
                                                <asp:BoundField DataField="g1_phone_home" HeaderText="g1_phone_home" 
                                                    SortExpression="g1_phone_home" />
                                                <asp:BoundField DataField="g1_phone_cell" HeaderText="g1_phone_cell" 
                                                    SortExpression="g1_phone_cell" />
                                                <asp:BoundField DataField="g1_phone_work" HeaderText="g1_phone_work" 
                                                    SortExpression="g1_phone_work" />
                                                <asp:BoundField DataField="g1_email1" HeaderText="g1_email1" 
                                                    SortExpression="g1_email1" />
                                                <asp:BoundField DataField="g1_email2" HeaderText="g1_email2" 
                                                    SortExpression="g1_email2" />
                                                <asp:BoundField DataField="g2_first_name" HeaderText="g2_first_name" 
                                                    SortExpression="g2_first_name" />
                                                <asp:BoundField DataField="g2_last_name" HeaderText="g2_last_name" 
                                                    SortExpression="g2_last_name" />
                                                <asp:BoundField DataField="g2_phone_home" HeaderText="g2_phone_home" 
                                                    SortExpression="g2_phone_home" />
                                                <asp:BoundField DataField="g2_phone_cell" HeaderText="g2_phone_cell" 
                                                    SortExpression="g2_phone_cell" />
                                                <asp:BoundField DataField="g2_phone_work" HeaderText="g2_phone_work" 
                                                    SortExpression="g2_phone_work" />
                                                <asp:BoundField DataField="g2_email1" HeaderText="g2_email1" 
                                                    SortExpression="g2_email1" />
                                                <asp:BoundField DataField="g2_email2" HeaderText="g2_email2" 
                                                    SortExpression="g2_email2" />
                                                <asp:BoundField DataField="address" HeaderText="address" 
                                                    SortExpression="address" />
                                                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                                            </Fields>
                                        </asp:DetailsView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
                                            SelectCommand="SELECT * FROM [player_guardians] WHERE ([player_id] = @player_id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblPlayerId" Name="player_id" 
                                                    PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
                                            SelectCommand="SELECT * FROM [player] WHERE ([player_id] = @player_id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblPlayerId" Name="player_id" 
                                                    PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <!-- custom code end -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
