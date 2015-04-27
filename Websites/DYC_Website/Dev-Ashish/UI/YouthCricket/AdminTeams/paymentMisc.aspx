<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteAdmin.master" Inherits="Cricket.AdminTeams.PaymentMisc" CodeFile="paymentMisc.aspx.cs" CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <tr>
            <td align="left" valign="top" >
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" align="left">
                            <!-- custom code start -->
                            <div id="Div1" runat="server">
							    <table id="Table1" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							        <tr>
								        <td colSpan="2" class="title">Payment Form
                                        </td>
							        </tr>
								    <tr>
									    <td align="center">
										    &nbsp; 
									    </td>
								    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span class="infoTitle">Note:</span>
                                            <br />
                                            <ul>
                                                <li>
                                                    Please verify the payment reason and amount with the DCL organizers before making any payment!
                                                </li>
                                                <li>
                                                    Use this form to make a payment to DCL for Umpiring penalties, Ground Reservations etc.
                                                </li>
                                                <li>
                                                    DO NOT use this form to pay TOURNAMENT REGISTRATION fees. Your team will not be registered for the tournament.
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="infoTitle" align="left">
                                        &nbsp;
                                        </td>
                                    </tr>
							        <tr>
								        <td align="left" colSpan="2">
									        <asp:label id="lblMessage" runat="server" Width="600px" ForeColor="DarkRed" CssClass="infoData"></asp:label>
									        <br>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Team Name:</span>
								        </td>
								        <td>
									        <asp:Label id="lblTeamName" tabIndex="1" runat="server" Width="304px" MaxLength="30"></asp:Label>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Amount: ($) </span>
								        </td>
								        <td>
									        <asp:textbox id="txtAmount" tabIndex="11" runat="server" Width="15%"  MaxLength="4"
										        TextMode="SingleLine"></asp:textbox>
									        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Field is required" ControlToValidate="txtAmount"></asp:RequiredFieldValidator></td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Description:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtComments" tabIndex="11" runat="server" Width="80%" 
										        TextMode="SingleLine"></asp:textbox>
									        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="Field is required" ControlToValidate="txtComments"></asp:RequiredFieldValidator></td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        &nbsp;
								        </td>
							        </tr>
							        <tr>
								        <td align="right"></td>
								        <td>
									        <span class="infoData">
                                            You will be taken to the secure PayPal website to complete the payment! 
									        <br>
                                            </span>
									        <br>
                                            <asp:button id="btnSubmit" Enabled="true" tabIndex="12" runat="server" CssClass="btnAdmin"
										        Text="Pay via PayPal" OnClick="btnSubmit_Click"></asp:button>
								        </td>
							        </tr>
						        </table>
                            </div>
							<br>
							<br>
                            <!-- custom code end -->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
