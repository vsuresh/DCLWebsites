<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteTournament.master" Inherits="Cricket.Tournament.registration" CodeFile="registration.aspx.cs" CodeFileBaseClass="Cricket.PageBaseTournament" %>

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
                            <div runat="server">
							    <table id="Table1" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							        <tr>
								        <td colSpan="2" class="title">Team Registration Form
                                        </td>
							        </tr>
								    <tr>
									    <td align="center">
										    &nbsp; 
									    </td>
								    </tr>
					                <tr>
						                <td class="infoData" align="left">
                                            <span class="infoLabel">Registration Start Date: &nbsp;&nbsp;</span>
                                            <asp:Label id="lblRegStartDate" CssClass="infoData" runat="server"></asp:Label>  
                                            <br />
                                            <span class="infoLabel">Registration &nbsp;End &nbsp;Date: &nbsp;&nbsp;</span>
							                <asp:Label id="lblRegEndDate" CssClass="infoData" runat="server"></asp:Label>
						                </td>
					                </tr>
							        <tr>
								        <td align="left" class="infoLabel">Registration Fees:&nbsp;&nbsp;
									        $<asp:Label id="lblFees" runat="server"></asp:Label>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <P align="left"></SPAN><SPAN class="infoData"><STRONG>Existing Teams</STRONG>: <EM><U>You do not have to fill all this information if you have played in DCL tournaments in the past.  
													    Please <a href="/adminteams/login.aspx?action=registration">Click here </a> to login with your team username/password and register for the tournament from there!
                                            </SPAN></P>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <P align="left"></SPAN><SPAN class="infoData"><STRONG>Note</STRONG>: <EM><U>All teams are 
													    required to register before the registration deadline and submit their registration fees by paypal 
                                            during the registration process</U></EM> . Teams can use a paypal account <U>OR </U>any credit 
											    card to pay the fees on the secured paypal website. A team will not be 
                                            considered as registered unless the registration fees has been payed in full via paypal.</SPAN></P>
									        <P align="left"><SPAN class="infoData"><STRONG>Note: </STRONG>After you submit this 
											        page you will be redirected to the confirmation and payment page where you can 
											        continue to paypal to complete the fees payment. After paypal payment 
                                                process is complete, you will see a confirmation message which will indicate 
                                                that your registration is complete. P</STRONG>lease inform the 
											        organizers, if you get any errors during this process.</SPAN></P>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
                                </table>                           
                            </div>

                            <div id="divRegClose" runat="server" visible="true">
							    <table id="Table2" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							        <tr>
								        <td align="center" colSpan="2">
									        &nbsp;
								        </td>
							        </tr>
							        <tr>
								        <td colspan="2">
                                            <div id="divNotStarted" runat="server" visible="false" class="infoLabel">
									            Registration will be open from 
                                                <asp:Label ID="lblStartDate" CssClass="infoData" Runat="server"></asp:Label>
                                                till 
                                                <asp:Label ID="lblEndDate" CssClass="infoData" Runat="server"></asp:Label>
                                            </div>
                                            <div id="divClosed" runat="server" visible="false" class="infoLabel">
									            Registration is now closed!
                                            </div>
								        </td>
							        </tr>
                                </table>
                            </div>

                            <div id="divRegOpen" runat="server" visible="false">
							    <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
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
									        <asp:textbox id="txtTeamName" tabIndex="1" runat="server" Width="304px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ControlToValidate="txtTeamName" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Preferred Location:</span>
								        </td>
								        <td style="HEIGHT: 22px"><asp:dropdownlist id="ddlLocation" Runat="server" tabIndex="2"></asp:dropdownlist>
								        </td>
							        </tr>
							        <tr>
								        <td colSpan="2">&nbsp;</td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact1 Name:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact1Name" tabIndex="3" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact1Name" id="Requiredfieldvalidator1" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact1 Title:</span>
								        </td>
								        <td style="HEIGHT: 22px"><asp:dropdownlist id="ddlContact1Title" Runat="server" tabIndex="4"></asp:dropdownlist>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact1 Email:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact1Email" tabIndex="5" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact1Email" id="Requiredfieldvalidator7" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right" style="HEIGHT: 26px"><span class="infoLabel">Contact1 Phone:</span>
								        </td>
								        <td style="HEIGHT: 26px">
									        <asp:textbox id="txtContact1Phone" tabIndex="6" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact1Phone" id="Requiredfieldvalidator8" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td colSpan="2">&nbsp;</td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact2 Name:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact2Name" tabIndex="7" runat="server" Width="200px" MaxLength="30"></asp:textbox>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact2 Title:</span>
								        </td>
								        <td style="HEIGHT: 22px"><asp:dropdownlist id="ddlContact2Title" Runat="server" tabIndex="8"></asp:dropdownlist>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact2 Email:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact2Email" tabIndex="9" runat="server" Width="200px" MaxLength="30"></asp:textbox>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Contact2 Phone:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact2Phone" tabIndex="10" runat="server" Width="200px" MaxLength="30"></asp:textbox>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
							        <tr>
								        <td align="left" colSpan="2">
									        <SPAN class="infoData"><STRONG>Please indicate your preference for each of the 
											        following items</STRONG></SPAN>
								        </td>
							        </tr>
							        <tr>
								        <td align="left" colspan="2" style="HEIGHT: 98px">
									        <SPAN class="infoData">
										        <br>
										        1. Please indicate if this is a new team
										        <BR>
										        2. Provide your team roster (11-14 players) with player names and the City they 
										        reside in. This will be submitted to the City of Plano and hence should be 
										        verifiable if required. We do understand that some teams do not have a defined 
										        roster, however we expect you to come up with atleast 11 players that you think 
										        would be playing in this tournament. <EM>Your registration will not be accepted 
											        unless you provide your team roster</EM> </SPAN></SPAN>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Comments:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtComments" tabIndex="11" runat="server" Width="100%" MaxLength="255" Height="98px"
										        TextMode="MultiLine"></asp:textbox>
									        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="Field is required" ControlToValidate="txtComments"></asp:RequiredFieldValidator></td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
							        <tr>
								        <td align="right"></td>
								        <td>
									        <span class="infoData">
                                            You will be taken to the secure PayPal website! 
									        <br>
                                            Your registration will be confirmed only after you have successfully submitted the payment via PayPal!
                                            </span>
									        <br>
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
