<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.master" Inherits="Cricket.AdminParent._default" CodeFile="default.aspx.cs" CodeFileBaseClass="Cricket.PageBaseAdmin" %>

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
                                        <span>Parent Account Management</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <span class="infoData">
                                            Please use the options above to manage your account. 
                                            <br />
                                        </span>
                                        <br />
                                        <b class="infoData">
                                            <ul>    
                                                <li>
                                                <a href="Profile.aspx">Manage Profiles</a>
                                                <br />
                                                </li>
                                                <li>
                                                <a href="Registration.aspx">Register Kids for Coaching</a>
                                                <br />
                                                </li>
                                                <li>
                                                <a href="">Manage Payments</a>
                                                <br />
                                                </li>
                                            </ul>
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoTitle" align="left">
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
                