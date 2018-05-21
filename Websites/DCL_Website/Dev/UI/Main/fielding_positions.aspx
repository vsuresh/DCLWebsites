<%@ Page Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.fielding_positions" CodeFile="fielding_positions.aspx.cs"
    CodeFileBaseClass="Cricket.PageBase" %>

    <asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
    <asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
            <tr>
                <td align="left" valign="top" class="bodyoutline">
                    <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="outerTableTD2" valign="top" align="left">
                                <!-- custom code start -->
                                <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td class="title" colspan="4">
                                            Fielding Positions
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="infoData">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <img src="/Images/fieldingpositions.jpg" width="600" height="710" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
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