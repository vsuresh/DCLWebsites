<%@ Page Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.groups" CodeFile="groups.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td align="left" valign="top" class="bodyoutline">
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <%--<td class="outerTableTD1" vAlign="top">
						<uc2:navbarMain id="navbarMain1" runat="server" SelectedID="ForumsAndGroups"></uc2:navbarMain>
					    </td>--%>
                        <td class="outerTableTD2" valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Forums and Groups
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <span class="summertext">DCL Announcements</span>
                                        <br />
                                        Please join this Yahoo! group to receive announcements regarding new tournaments/activities.
                                        <br />
                                        <a href="http://groups.yahoo.com/group/dclannouncements" target="_blank">Yahoo! group</a> | <a href="mailto:dclannouncements-subscribe@yahoogroups.com">
                                            subscribe</a> | <a href="mailto:dclannouncements-unsubscribe@yahoogroups.com">unsubscribe</a>
                                        <br />
                                        <br />
                                        <br />
                                        <span class="summertext">DCL Available Players</span>
                                        <br />
                                        Are you a new player wanting to join a team? Are you a team looking for new players?
                                        You can now join this Yahoo! group to collaborate between teams and available players.
                                        All members can send messages to this group.
                                        <br />
                                        <a href="http://groups.yahoo.com/group/dclplayers" target="_blank">Yahoo! group</a> | <a href="mailto:dclplayers-subscribe@yahoogroups.com">
                                            subscribe</a> | <a href="mailto:dclplayers-unsubscribe@yahoogroups.com">unsubscribe</a>
                                        <br />
                                        <br />
                                        <br />
                                        <span class="summertext">DCL Available Umpires</span>
                                        <br />
                                        Are you available to umpire in a DCL match? Are you a team looking for available
                                        umpires? You can now join this Yahoo! group to collaborate between teams and available
                                        umpires. All members can send messages to this group.
                                        <br />
                                        <a href="http://groups.yahoo.com/group/dclumpires" target="_blank">Yahoo! group</a> | <a href="mailto:dclumpires-subscribe@yahoogroups.com">
                                            subscribe</a> | <a href="mailto:dclumpires-unsubscribe@yahoogroups.com">unsubscribe</a>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
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
