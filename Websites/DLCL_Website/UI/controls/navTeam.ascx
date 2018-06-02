<%@ Control Language="c#" Inherits="Cricket.controls.navTeam" CodeFile="navTeam.ascx.cs" %>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30" align="left" valign="top">
            <table width="100%" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" valign="middle" class="bigtitle">
                        <asp:Label ID="lblTeamName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="middle">
                        <a href="/teams/default.aspx" class="menulineNoBorder">Team Home</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/teams/tournaments.aspx" class="menulineNoBorder">Tournaments</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/teams/players.aspx" class="menulineNoBorder">Players</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
