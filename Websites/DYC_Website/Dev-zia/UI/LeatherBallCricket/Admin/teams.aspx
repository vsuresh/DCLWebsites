<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.teams" CodeFile="teams.aspx.cs"
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
                                        Manage Teams
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
                                        <span class="infoLabel">Select Team:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTeams" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTeams_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnNewTeam" TabIndex="0" runat="server" CssClass="btnAdmin" Text="New Team"
                                            OnClick="btnNewTeam_Click" CausesValidation="False"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">TeamId:</span>
                                        </td>
                                    <td align="left">
                                        <asp:Label  ID="lblTeamId" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Name:</span>
                                        </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtName" TabIndex="1" runat="server" CssClass="infoData2" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Description:</span>
                                        </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtDesc" TabIndex="2" runat="server" CssClass="infoData2" Width="300"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Contact Name:</span>
                                        </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtContact" TabIndex="3" runat="server" CssClass="infoData2" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtContact" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Contact Email:</span>
                                        </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtEmail" TabIndex="3" runat="server" CssClass="infoData2" Width="300"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Ground Name:</span>
                                        </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtGroundName" TabIndex="4" runat="server" CssClass="infoData2" Width="300"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        <span class="infoLabel">Mark as Active:</span>
                                        </td>
                                    <td align="left">
                                    <asp:CheckBox runat=server ID="chkActive" TabIndex="5"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" >
                                        </td>
                                    <td align="left">
                                        <asp:Button ID="btnAddTeam" TabIndex="6" runat="server" CssClass="btnAdmin" Text="Submit"
                                            OnClick="btnAddTeam_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
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
