<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteTournament.master" Inherits="Cricket.Offerings.lanerentals" CodeFile="lanerentals.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
    
    <style type="text/css">
        .xl67 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
        }
        .auto-style1 {
            font-weight: bold;
        }
        .auto-style2 {
            font-weight: bold;
            color: #003399;
        }
        .auto-style3 {
            width: 145px;
        }
        .auto-style4 {
            color: #0033CC;
        }
        .auto-style5 {
            font-size: xx-small;
        }
    </style>
    
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
								        <td colSpan="2" class="title">Lane Rentals &amp; Reservations</td>
							        </tr>
								    <tr>
									    <td align="left" colSpan="2">
										    You can rent Lanes for practice with and without BOLA bowling machines to learn and/or refine your batting/bowling capabilities. There are 2 lanes equipped with BOLA professional bowling machines on stands. Lane rentals will be confirmed on a first come first basis
                                            <br />
                                            <br />
                                            <strong>Location</strong>: Indoor Cricket Academy/Extra Innings Address 2300 Coit Road Suite 400, Plano, TX 75075 
									    </td>
								    </tr>
							        <tr>
								        <td align="left" colSpan="2">
                                            <div  class="infoData">
                                                    <br />
                                                    <div class="yiv9721013991" >
                                                        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:444pt" width="591">
                                                            <colgroup>
                                                                <col style="mso-width-source:userset;mso-width-alt:10898;width:224pt" width="298" />
                                                                <col style="mso-width-source:userset;mso-width-alt:10715;width:220pt" width="293" />
                                                            </colgroup>
                                                            <tr height="20">
                                                                <td class="auto-style2" height="20" width="298">Weekday Option</td>
                                                                <td class="auto-style2" width="293">Weekend Option</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20"></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td class="auto-style1" height="20">Lanes</td>
                                                                <td class="auto-style1">Lanes</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Total Lanes: 5</td>
                                                                <td>Total Lanes: 2</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Lanes (with bowling machine): 2</td>
                                                                <td>Lanes (with bowling machine): 2</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Lanes (without bowling machine): 3</td>
                                                                <td>Length of each Lanes: 70 ft.</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Length of each Lanes: 115 ft.</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">&nbsp;</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td class="auto-style1" height="20">Timings</td>
                                                                <td class="auto-style1">Timings</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Friday: 8pm till 12:00 midnight.<span style="mso-spacerun:yes">&nbsp;</span></td>
                                                                <td>Monday to Thursday: 9am till 11pm</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Saturday: 8:30pm till 11:30 midnight</td>
                                                                <td>Friday: 9am till 7pm</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Sunday: 8:30pm till 11:30 midnight</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">&nbsp;</td>
                                                                <td></td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td class="xl65" height="20"><b>Pricing</b><span class="auto-style1" style="mso-spacerun:yes">&nbsp;</span></td>
                                                                <td class="auto-style1">Pricing</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Lane without bowling machine: $30/hr,<span style="mso-spacerun:yes">&nbsp;</span></td>
                                                                <td>Lane with bowling machine: $50/hr</td>
                                                            </tr>
                                                            <tr height="20">
                                                                <td height="20">Lane with bowling machine: $50/hr</td>
                                                                <td></td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </div>
                                                    <br />
                                                    <table id="TableCustom" width="96%" border="0" align="left" cellpadding="2" cellspacing="2">
                                                        <tr>
                                                            <td align="left" colspan="2"><b><span class="auto-style4">Lane Reservation</span><br />
                                                                <br />
                                                                </b>To Reserve the LANES, please send an email to icricketa@gmail.com and after availability confirmation, use the PayPal button below to make the payment. Your reservation is confirmed only after payment is received.
                                                                <br />
                                                                <br />
                                                                <span class="auto-style5">(Reservations will be updated on website until 
                                                                out lane booking solution becomes available.)&nbsp; </span>
                                                                <hr />
                                                                <br /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="auto-style3"><strong>Name:</strong></td>
                                                            <td>
                                                                <asp:textbox id="txtName" tabIndex="1" runat="server" Width="304px" MaxLength="50"></asp:textbox>
                                                                <asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="auto-style3"><strong>Slot Date and Time:</strong></td>
                                                            <td>
                                                                <asp:textbox id="txtStartDate" tabIndex="1" runat="server" Width="304px" MaxLength="50"></asp:textbox>
                                                                <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" ControlToValidate="txtStartDate" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
                                                                (Example: 1/1/2014 5PM-6PM)</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="auto-style3"><span class="infoLabel">Payment Amount: ($)</span> </td>
                                                            <td>
                                                                <asp:textbox id="txtAmount" tabIndex="1" runat="server" Width="113px" MaxLength="50"></asp:textbox>
                                                                <asp:requiredfieldvalidator id="Requiredfieldvalidator7" runat="server" ControlToValidate="txtAmount" ErrorMessage="RequiredFieldValidator">Field is required</asp:requiredfieldvalidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="auto-style3"></td>
                                                            <td>
                                                                <br /><span class="infoData">You will be taken to the secure PayPal website! 
									        <br>Your registration wiYour reservation will be confirmed only after you have successfully submitted the payment via PayPal! </span>
                                                                <br>
                                                                <br>
                                                                <asp:button id="btnSubmit" Enabled="true" tabIndex="12" runat="server" CssClass="btnAdmin"
										        Text="Pay via PayPal" OnClick="btnSubmit_Click"></asp:button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2">&nbsp;
                                                                <br />
                                                                <hr /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2">
                                                                <br />For any questions you can contact 
                                                        Kuljit Singh Nijjer at 972-814-3921or Jagannnath at 469-939-8329, or send an email to <a href="mailto:dyclmgmt@gmail.com" rel="nofollow" shape="rect" target="_blank"><span style="color: rgb(0, 0, 0);"> </span>knijjar@yahoo.com</a>.<br clear="none" />
                                                                </td>
                                                        </tr>
                                                    </table>
                                            </div>
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
