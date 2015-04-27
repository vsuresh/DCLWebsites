<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Cricket.AdminParent.CreateUser" %>

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
									<td class="title" colspan="4">Create Parent Account
									</td>
								</tr>
								<tr>
									<td align="center">
										&nbsp;
									</td>
								</tr>
                                <tr>
                                    <td align="left" valign="top" class="loginpadding1">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="15">
                                            <tr>
                                                <td align="left" valign="top">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top" bgcolor="#e6f7ff">
                                                    <table width="450" height="190" border="0" align="center" cellpadding="0" cellspacing="20">
                                                        <tr>
                                                            <td align="right" valign="bottom" class="loginpage">
                                                                <table width="100" border="0" cellspacing="15" cellpadding="0">
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            <span class="style2">Enter Username</span>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtLogin" TabIndex="1" runat="server" Width="150px"></asp:TextBox>
                                                                            <br />
                                                                            <asp:Label Font-Size="Small">(6 characters minimum)</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            <span class="style2">Enter Password</span>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtPassword" TabIndex="2" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                                                            <br />
                                                                            <asp:Label Font-Size="Small">(6 characters minimum)</asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            <span class="style2">Reenter Password</span>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtPassword2" TabIndex="3" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="middle">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="left" valign="top">
                                                                              <asp:button id="btnCreate" Enabled="true" tabIndex="12" runat="server" CssClass="btnAdmin2"
										                                            Text="Create User Account" OnClick="btnCreateUser_Click"></asp:button>
                                                                        </td>
                                                                    </tr>
                                                                
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" valign="middle">
                                                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
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
                