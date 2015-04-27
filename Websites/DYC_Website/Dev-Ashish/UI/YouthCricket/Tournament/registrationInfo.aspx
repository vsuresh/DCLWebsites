<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteTournament.master" Inherits="Cricket.Tournament.registrationInfo" CodeFile="registrationInfo.aspx.cs" CodeFileBaseClass="Cricket.PageBaseTournament" %>

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
							<table id="Table1" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							    <tr>
								    <td colSpan="2" class="title">Player Registration Information
                                    </td>
							    </tr>
					            <tr>
						            <td class="infoData" align="left">
                                        <table width="100%">
                                            <tr>
                                                <td align="left">
                                                <br />
                                                    <span class="infoLabel">Registration Start Date: &nbsp;&nbsp;</span>
                                                    <asp:Label id="lblRegStartDate" CssClass="infoData" runat="server"></asp:Label>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <span class="infoLabel">Registration &nbsp;End &nbsp;Date: &nbsp;&nbsp;</span>
							                        <asp:Label id="lblRegEndDate" CssClass="infoData" runat="server"></asp:Label>
                                                </td>
                                            </tr>
							                <tr>
								                <td align="left" class="infoLabel" colspan="2">
                                                    Registration &nbsp;Fees:
                                                    &nbsp;&nbsp;$
								                    <span class="InfoData">
									                    <asp:Label id="lblFees" runat="server"></asp:Label>
                                                    </span>
								                </td>
							                </tr>
                                            <tr>
                                                <td align="left">
                                                    <span class="infoLabel">Registration &nbsp;Status: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							                        <asp:Label id="lblRegStatus" CssClass="infoLabel" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
						            </td>
					            </tr>
							    <tr>
								    <td align="center" colSpan="2">
									    <hr class="hr">
								    </td>
							    </tr>
							    <tr>
								    <td align="left" colSpan="2" class="infoData">
                                        Submit the <A href="registration.aspx">online registration form</A> to register the Youth Player in the tournament. 
								    </td>
							    </tr>
							    <tr>
								    <td align="center" colSpan="2">
									    <hr class="hr">
								    </td>
							    </tr>
	                            <tr>
		                            <td align="left" colspan="2">
				                        <br>
                                        <div id=divRegInfo>
                                         <asp:Label ID="lblRegInfo" runat="server"></asp:Label>
		                                </div>
                                    </td>
	                            </tr>
					            <tr>
						            <td class="infoData">
						            </td>
					            </tr>
                            </table>                           
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
