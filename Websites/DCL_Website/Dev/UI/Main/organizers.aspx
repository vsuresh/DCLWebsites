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
                                                    Zia Quadri
                                                </td>
                                                <td align="left" width="200">
                                                    President - Website Manager
                                                </td>
                                                <td align="left" width="150">
                                                    (214-282-2963)
                                                </td>
                                            </tr>
                                            <tr class="infoData">
                                                <td align="left" width="200">
                                                    Kuljit Singh Nijjar
                                                </td>
                                                <td align="left" width="200">
                                                    Coordinator - Treasurer
                                                </td>
                                                <td align="left" width="100">
                                                    (972-814-3921)
                                                </td>
                                            </tr>
                                            <tr class="infoData">
                                                <td align="left" width="200">
                                                    Mohan Vamsi
                                                </td>
                                                <td align="left" width="250">
                                                    Coordinator - Schedule Manager
                                                </td>
                                                <td align="left" width="100">
                                                    (919-744-1382)
                                                </td>
                                            </tr>
                                            <tr class="infoData">
                                                <td align="left" width="200">
                                                    Krishna Kumar
                                                </td>
                                                <td align="left" width="200">
                                                    Coordinator - Inventory Manager
                                                </td>
                                                <td align="left" width="100">
                                                    (972 398 8028)
                                                </td>
                                            </tr>
                                            <tr class="infoData">
                                                <td align="left" width="200">
                                                    Mukund Ravikumar
                                                </td>
                                                <td align="left" width="200">
                                                    Coordinator - Accounts Manager
                                                </td>
                                                <td align="left" width="100">
                                                    (214-773-5663)
                                                </td>
                                            </tr>
                                            <tr class="infoData">
                                                <td align="left" width="200">
                                                    Manoj Prakasam
                                                </td>
                                                <td align="left" width="200">
                                                    Coordinator
                                                </td>
                                                <td align="left" width="100">
                                                    (214-536-7167)
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
                                            above or send an email to: <span class="infoLabel">Kuljit-Singh Nijjar Email: knijjar@yahoo.com or Zia Quadri Email: ziaq@yahoo.com </span>
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
