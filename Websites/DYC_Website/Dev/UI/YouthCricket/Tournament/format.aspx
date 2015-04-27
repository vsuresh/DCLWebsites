<%@ Page Language="c#" MasterPageFile="~/SiteTournament.Master" Inherits="Cricket.Tournament.format" CodeFile="format.aspx.cs" CodeFileBaseClass="Cricket.PageBaseTournament" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
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
                                        Tournament Format
                                    </td>
                                </tr>
							    <tr>
								    <td align="center" colSpan="2">
									    &nbsp;
								    </td>
							    </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblFormat" runat="server"></asp:Label>
                                    </td>
                                </tr>
							    <tr>
								    <td align="center" colSpan="2">
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
