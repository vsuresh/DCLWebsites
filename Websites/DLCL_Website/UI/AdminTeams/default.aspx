<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.master" Inherits="Cricket.AdminTeams._default" CodeFile="default.aspx.cs" CodeFileBaseClass="Cricket.PageBaseAdmin" %>

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
                                        <span>Welcome to the Administration section of your team!</span>
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
                                            ChaukaLogin: <b><asp:Label ID="lblChaukaLogin" runat="server" CssClass="infoData2"></asp:Label></b>
                                            <br/>
                                            ChaukaPassword: <b><asp:Label ID="lblChaukaPassword" runat="server" CssClass="infoData2"></asp:Label></b>
                                        </span>
                                        <br/>
                                        <br />
                                        <span class="infoData">
                                            Please use the menu options above to perform the various administrative actions. 
                                            <br />
                                            <br />
                                            Additional options:
                                        </span>
                                        <br />
                                        <b class="infoData">
                                            <ul>    
                                            <!--
                                                <li>
                                                <a href="registration.aspx">Click here</a> To register for the Spring 2012 Tournament! 
                                                <br />
                                                </li>
                                                -->
                                               
 <li>
                                                <a href="teamcontacts.aspx">Click here</a> for Tournament Team Contacts! 
                                                <br />
                                                <br /> 
                                                </li>
                                                <!--
<li>
                                                <a href="ReserveGrounds.aspx">Click here</a> to Reserve Russel Creek Grounds for Practice! 
                                                <font color="green"><i>(New)</i></font>
                                                <br />
                                                <br />
                                                </li>                -->
                                                <li>
                                                <a href="paymentmisc.aspx">Click here</a> to make a payment to DCL!
                                                <br />
                                                 <br /> 
                                                </li>
                                                <li>
                                                <a href="DCL_Chauka_Coordinators.aspx">DCL DLCL DB and Chauka Coordinators</a> 
                                                <font color="green"><i>(New)</i></font>
                                                <br>
                                                <br>
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
                