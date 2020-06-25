<%@ Control Language="c#" Inherits="Cricket.controls.navAdmin" CodeFile="navAdmin.ascx.cs" %>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30" align="left" valign="top" class="menubg">
            <table width="900" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" valign="middle" class="menuline">
                        <a href="/default.aspx" class="menuline">Home</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="/AdminTeams/default.aspx" class="menuline">Admin Home</a>
                    </td>
                  <td align="center" valign="middle">
                        <a href="http://182.71.233.146:151/" class="menuline">Umpire Portal</a>
                    </td>
                    <td align="center" valign="middle" class="menuline">
                        <a href="/AdminTeams/password.aspx" class="menuline">Change Password</a>
                    </td>
                    <td align="center" valign="middle" class="menuline">
                        <div id="divScoresheets" runat="server">
                            <a href="/AdminTeams/matches.aspx" class="menuline">Scoresheets</a>
                        </div>
                    </td>
                    <td align="center" valign="middle">
                        <div id="divPlayers" runat="server">
                            <a href="/AdminTeams/players.aspx" class="menuline">Players</a>
                        </div>
                    </td>
                    <td align="center" valign="middle">
                        <a href="/AdminTeams/financialReports.aspx" class="menuline">Financial Reports</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="/AdminTeams/PlayerReports.aspx" class="menuline">Player Reports</a>
                    </td>
                    <td align="center" valign="middle" class="aboutustext">
                        <a href="" id="aLogout" runat="server" class="menuline" onserverclick="aLogOut_OnClick">Logout</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
