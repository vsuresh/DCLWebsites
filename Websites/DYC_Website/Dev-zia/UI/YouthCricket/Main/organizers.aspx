<%@ Page Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.organizers" CodeFile="organizers.aspx.cs" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td align="left" valign="top" class="bodyoutline">
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <%--<td class="outerTableTD1" valign="top">
						<uc2:navbarMain id="navbarMain1" runat="server" SelectedID="Organizers"></uc2:navbarMain>
					</td>--%>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Organizers
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table class="infoData" id="Table1" BorderColor="#2D7C97" border=1 cellspacing="0" cellpadding="5"
                                            width="500" bgcolor="white" border="1">
                                            <tr class="infoLabel">
                                                <td align="left" width="150">
                                                    Name
                                                </td>
                                                <td align="left" width="200">
                                                    Position
                                                </td>
                                                <td align="left" width="150">
                                                    Contact
                                                </td>
                                            </tr>
                                            <tr class="infoData">
                                                <td align="left" width="150">
                                                    Kuljit Singh Nijjar
                                                </td>
                                                <td align="left" width="200">
                                                    President & Treasurer
                                                </td>
                                                <td align="left" width="150">
                                                    (972-814-3921)
                                                </td>
                                            </tr>
<tr class="infoData">
                                                <td align="left" width="150">
                                                    Arun Vittala
                                                </td>
                                                <td align="left" width="200">
                                                    Vice President
                                                </td>
                                                <td align="left" width="150">
                                                    (972-727-4938)
                                                </td>
                                            </tr>
<tr class="infoData">
                                                <td align="left" width="150">
                                                    Zia Quadri
                                                </td>
                                                <td align="left" width="200">
                                                    Web Master
                                                </td>
                                                <td align="left" width="150">
                                                    
                                                </td>
                                            </tr>
                                            
                                                                                      
                                            
                                            </tr>
<tr class="infoData">
                                                <td align="left" width="200">
                                                    Srinidhi Kaniyar
                                                </td>
                                                <td align="left" width="200">
                                                    Ethics Officer
                                                </td>
                                                <td align="left" width="100">
                                                    (214-405-2988)
                                                </td>
                                            </tr>

<tr class="infoData">
                                                <td align="left" width="200">
                                                    Jagannath Poosarla
                                                </td>
                                                <td align="left" width="200">
                                                    <strong>Executive Secretary</Strong>
                                                </td>
                                                <td align="left" width="100">
                                                    (469-939-8329)
                                                </td>
                                            </tr>
<tr class="infoData">
                                                <td align="left" width="200">
                                                    Vamsi Krishna Chada
                                                </td>
                                                <td align="left" width="200">
                                                    Youth Umpire Training Coordinator
                                                </td>
                                                <td align="left" width="100">
                                                    (817-371-0801)
                                                </td>
                                            </tr>


                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <span class="infoData">For any questions and suggestions please contact any of the organizers
                                            above or send an email to: <span class="infoLabel">Kuljit-Singh Nijjar Email: knijjar@yahoo.com or DYCL Management Email: dyclmgmt@gmail.com</span>
                                            <br>
                                            <br>
                                        </span>
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
