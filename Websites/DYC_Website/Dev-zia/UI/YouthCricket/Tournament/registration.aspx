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
								        <td align="right"><span class="infoLabel">Club Name:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtTeamName" tabIndex="1" runat="server" Width="304px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ControlToValidate="txtTeamName" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Age Category:</span>
								        </td>
								        <td style="HEIGHT: 22px">
                                            <asp:dropdownlist id="ddlAgeCategory" Runat="server" tabIndex="2" AutoPostBack="true" OnSelectedIndexChanged="ddlAgeCategory_SelectedIndexChanged">
                                                <asp:ListItem Text="U12" Value="U12" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="U14" Value="U14" ></asp:ListItem>
                                                <asp:ListItem Text="U16" Value="U16" ></asp:ListItem>
								            </asp:dropdownlist>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Overs:</span>
								        </td>
								        <td>
									        <asp:Label id="lblOvers" runat="server" Text="20 overs"></asp:Label>
								        </td>
							        </tr>
                                    <tr>
								        <td align="right"><span class="infoLabel">Club City:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtClubCity" tabIndex="1" runat="server" Width="304px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ControlToValidate="txtClubCity" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
                                    <tr>
								        <td align="right"><span class="infoLabel">Club State:</span>
								        </td>
								        <td style="HEIGHT: 22px">
                                            <asp:dropdownlist id="ddlClubState" Runat="server" tabIndex="2" OnSelectedIndexChanged ="ddlClubState_SelectedIndexChanged" AutoPostBack="true">
 <asp:ListItem Text="Select State" Value="0" ></asp:ListItem> 
<asp:ListItem Text="Alabama" Value="Alabama" ></asp:ListItem> 
 <asp:ListItem Text="Alaska" Value="Alaska" ></asp:ListItem>  
 <asp:ListItem Text="Arizona" Value="Arizona" ></asp:ListItem>  
 <asp:ListItem Text="Arkansas" Value="Arkansas" ></asp:ListItem>  
 <asp:ListItem Text="California" Value="California" ></asp:ListItem>  
 <asp:ListItem Text="Colorado" Value="Colorado" ></asp:ListItem>  
 <asp:ListItem Text="Connecticut" Value="Connecticut" ></asp:ListItem>  
 <asp:ListItem Text="Delaware" Value="Delaware" ></asp:ListItem>  
 <asp:ListItem Text="Florida" Value="Florida" ></asp:ListItem>  
 <asp:ListItem Text="Georgia" Value="Georgia" ></asp:ListItem>  
 <asp:ListItem Text="Hawaii" Value="Hawaii" ></asp:ListItem>  
 <asp:ListItem Text="Idaho" Value="Idaho" ></asp:ListItem>  
 <asp:ListItem Text="Illinois" Value="Illinois" ></asp:ListItem>  
 <asp:ListItem Text="Indiana" Value="Indiana" ></asp:ListItem>  
 <asp:ListItem Text="Iowa" Value="Iowa" ></asp:ListItem>  
 <asp:ListItem Text="Kansas" Value="Kansas" ></asp:ListItem>  
 <asp:ListItem Text="Kentucky" Value="Kentucky" ></asp:ListItem>  
 <asp:ListItem Text="Louisiana" Value="Louisiana" ></asp:ListItem>  
 <asp:ListItem Text="Maine" Value="Maine" ></asp:ListItem>  
 <asp:ListItem Text="Maryland" Value="Maryland" ></asp:ListItem>  
 <asp:ListItem Text="Massachusetts" Value="Massachusetts" ></asp:ListItem>  
 <asp:ListItem Text="Michigan" Value="Michigan" ></asp:ListItem> 
 <asp:ListItem Text="Minnesota" Value="Minnesota" ></asp:ListItem>  
 <asp:ListItem Text="Mississippi" Value="Mississippi" ></asp:ListItem>  
 <asp:ListItem Text="Missouri" Value="Missouri" ></asp:ListItem>  
 <asp:ListItem Text="Montana" Value="Montana" ></asp:ListItem>  
 <asp:ListItem Text="Nebraska" Value="Nebraska" ></asp:ListItem>  
 <asp:ListItem Text="Nevada" Value="Nevada" ></asp:ListItem>  
 <asp:ListItem Text="New Hampshire" Value="New Hampshire" ></asp:ListItem>  
 <asp:ListItem Text="New Jersey" Value="New Jersey" ></asp:ListItem>  
 <asp:ListItem Text="New Mexico" Value="New Mexico" ></asp:ListItem>  
 <asp:ListItem Text="New York" Value="New York" ></asp:ListItem>  
 <asp:ListItem Text="North Carolina" Value="North Carolina" ></asp:ListItem>  
 <asp:ListItem Text="North Dakota" Value="North Dakota" ></asp:ListItem>  
 <asp:ListItem Text="Ohio" Value="Ohio" ></asp:ListItem>  
 <asp:ListItem Text="Oklahoma" Value="Oklahoma" ></asp:ListItem>  
 <asp:ListItem Text="Oregon" Value="Oregon" ></asp:ListItem>  
 <asp:ListItem Text="Pennsylvania" Value="Pennsylvania" ></asp:ListItem>  
 <asp:ListItem Text="Rhode Island" Value="Rhode Island" ></asp:ListItem>  
 <asp:ListItem Text="South Carolina" Value="South Carolina" ></asp:ListItem>  
 <asp:ListItem Text="South Dakota" Value="South Dakota" ></asp:ListItem>  
 <asp:ListItem Text="Tennessee" Value="Tennessee" ></asp:ListItem>  
 <asp:ListItem Text="Texas" Value="Texas"  runat="server" ></asp:ListItem>  
 <asp:ListItem Text="Utah" Value="Utah" ></asp:ListItem>  
 <asp:ListItem Text="Vermont" Value="Vermont" ></asp:ListItem>  
 <asp:ListItem Text="Virginia" Value="Virginia" ></asp:ListItem>  
 <asp:ListItem Text="Washington" Value="Washington" ></asp:ListItem>  
 <asp:ListItem Text="West Virginia" Value="West Virginia" ></asp:ListItem>  
 <asp:ListItem Text="Wisconsin" Value="Wisconsin" ></asp:ListItem>  
 <asp:ListItem Text="Wyoming" Value="Wyoming" ></asp:ListItem>  
								            </asp:dropdownlist>
									        <asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" ControlToValidate="ddlClubState" InitialValue="0" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Fees:</span>
								        </td>
								        <td style="HEIGHT: 22px">
 $<asp:Label id="lblFees" runat="server" Text=""></asp:Label>
								        </td>
							        </tr>

							        <tr>
								        <td colSpan="2">&nbsp;</td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Primary Contact Name:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact1Name" tabIndex="3" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact1Name" id="Requiredfieldvalidator1" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Primary Contact Email:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact1Email" tabIndex="5" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact1Email" id="Requiredfieldvalidator7" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right" style="HEIGHT: 26px"><span class="infoLabel">Primary Contact Phone:</span>
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
								        <td align="right"><span class="infoLabel">Secondary Contact Name:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact2Name" tabIndex="7" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact2Name" id="Requiredfieldvalidator4" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Secondary Contact Email:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact2Email" tabIndex="9" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact2Email" id="Requiredfieldvalidator6" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>
							        <tr>
								        <td align="right"><span class="infoLabel">Secondary Contact Phone:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtContact2Phone" tabIndex="10" runat="server" Width="200px" MaxLength="30"></asp:textbox>
									        <asp:requiredfieldvalidator ControlToValidate="txtContact2Phone" id="Requiredfieldvalidator9" runat="server"
										        ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
								        </td>
							        </tr>

							        <tr>
								        <td align="right"><span class="infoLabel">Comments:</span>
								        </td>
								        <td>
									        <asp:textbox id="txtComments" tabIndex="11" runat="server" Width="60%" MaxLength="255" Height="98px"
										        TextMode="MultiLine"></asp:textbox>
                                            </td>
							        </tr>

							        <tr>
								        <td align="right"><span class="infoLabel">Disclaimer: </span>
								        </td>
								        <td>
                                            I, hereby state that I have read all the Rules, Regulations of Discipline &amp; Instructions and I promise to comply with all the rules &amp; regulations and discipline of DYCL and NYCL!
                                            <br />
                                            <asp:CheckBox ID="chkAgree" runat="server" Checked="false"  Text="I agree to the disclaimer" OnCheckedChanged="chkAgree_CheckedChanged" AutoPostBack="True" />
								        </td>
							        </tr>
							        <tr>
								        <td align="right"></td>
								        <td>
                                            <asp:button id="btnSubmit" Enabled="false" tabIndex="12" runat="server" CssClass="btnAdmin"
										        Text="Pay via PayPal" OnClick="btnSubmit_Click"></asp:button>
                                            <br />
                                            <br />
									        <span class="infoData">
                                            You will be taken to the secure PayPal website! 
									        <br>
                                            Your registration will be confirmed only after you have successfully submitted the payment via PayPal!
                                            </span>
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
