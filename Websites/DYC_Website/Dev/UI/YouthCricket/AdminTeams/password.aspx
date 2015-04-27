<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.password" CodeFile="password.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

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
                                        Change Password
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="infoLagel">
                                        Please note that the website does not use SSL (secure transport) to send the password. Hence its recommended to <u>NOT</u> use your important personal passwords as the password for your team!
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right">
                                        <asp:Label ID="lblOldPwd" CssClass="infoLabel" runat="server">Enter Old Password:&nbsp;</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password" TabIndex="1" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field Required"
                                            Display="Dynamic" ControlToValidate="txtOldPwd" ValidationGroup="Req"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblNewPwd" CssClass="infoLabel" runat="server">Enter New Password:&nbsp;</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password" TabIndex="2" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field Required"
                                            Display="Dynamic" ControlToValidate="txtNewPwd"  ValidationGroup="Req"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblConfirmPwd" CssClass="infoLabel" runat="server">Confirm New Password:&nbsp;</asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" TabIndex="3" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field Required"
                                            Display="Dynamic" ControlToValidate="txtConfirmPwd" ValidationGroup="Req"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New and Confirm Password are not same"
                                            Display="Dynamic" ControlToValidate="txtConfirmPwd" ControlToCompare="txtNewPwd"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="lblMessage" CssClass="infoError" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="infoAction" CausesValidation="True"
                                            TabIndex="4" OnClick="btnSubmit_Click"  ValidationGroup="Req"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
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
                