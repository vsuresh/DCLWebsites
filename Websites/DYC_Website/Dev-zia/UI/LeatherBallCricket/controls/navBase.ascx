<%@ Control Language="c#" Inherits="Cricket.controls.navBase" CodeFile="navBase.ascx.cs" %>

<script language="JavaScript" type="text/javascript" src="/JS/mm_menu.js"></script>
<script language="JavaScript" type="text/javascript">
<!--

    //TODO = put this in a nav control and make it configurable

    function mmLoadMenus() {
        if (window.mm_menu_0204112913_0) return;

        // Tournament menu
        window.mm_menu_0204114441_0 = new Menu("root", 139, 23, "Arial, Helvetica, sans-serif", 11, "#FFFFFF", "#FFFFFF", "#005A7D", "#0094D2", "left", "middle", 6, 0, 500, -5, 7, true, true, true, 0, true, true);
        mm_menu_0204114441_0.addMenuItem("Tournament&nbsp;List", "location='/Main/Tournaments.aspx'");
        mm_menu_0204114441_0.addMenuItem("Tournament&nbsp;Rules", "location='/Main/TournamentRules.aspx'");
        mm_menu_0204114441_0.addMenuItem("Tournament&nbsp;Format", "location='/Main/TournamentFormat.aspx'");
        mm_menu_0204114441_0.fontWeight = "bold";
        mm_menu_0204114441_0.hideOnMouseOut = true;
        mm_menu_0204114441_0.bgColor = '#E2E2E2';
        mm_menu_0204114441_0.menuBorder = 1;
        mm_menu_0204114441_0.menuLiteBgColor = '#000000';
        mm_menu_0204114441_0.menuBorderBgColor = '#035376';


        // create the sub menus
        mm_menu_0204114441_0.writeMenus();
    } 
//-->
</script>
<script language="JavaScript" type="text/javascript">

    mmLoadMenus();

</script>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
    <tr>
        <td height="30" align="left" valign="top" class="menubg">
            <table width="900" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="75" align="center" valign="middle" class="menuline">
                        <a href="/default.aspx" class="menuline">Home</a>
                    </td>
                    <td width="80" align="center" valign="middle" class="menuline">
                        <a href="/Teams/team_list.aspx" class="menuline" style="color:Orange">Teams</a>
                    </td>
                    <td width="126" align="center" valign="middle" class="menuline">
                        <a href="/Main/Tournaments.aspx" class="menuline" id="link3" onmouseover="MM_showMenu(window.mm_menu_0204114441_0,-10,20,null,'link3')"
                            onmouseout="MM_startTimeout();">Tournaments<span class="Arrowsmall">&#9660;</span></a>
                    </td>
                    <td width="127" align="center" valign="middle" class="menuline">
                        <a href="/Main/documents.aspx" class="menuline">Documents</a>
                    </td>
                    <td width="126" align="center" valign="middle" class="menuline">
                        <a href="/Main/grounds.aspx" class="menuline">Grounds</a>
                    </td>
                    <td width="119" align="center" valign="middle" class="menuline">
                        <a href="/Main/Awards.aspx" class="menuline">Awards</a>
                    </td>
                    <td width="90" align="center" valign="middle" class="menuline">
                        <a href="/Main/groups.aspx" class="menuline">Forums</a>
                    </td>
                    <td width="108" align="center" valign="middle" class="menuline">
                        <a href="/Main/aboutus.aspx" class="menuline">About Us</a>
                    </td>
                    <td width="70" align="center" valign="middle">
                        <a href="/AdminTeams/Login.aspx" class="aboutustext">Login</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table width="900" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="300" align="right" valign="middle" class="menuline2">
            <a href="http://dallascricket.com/" class="menuline2">Dallas Cricket League</a>
        </td>
        <td width="300" align="center" valign="middle" class="menuline2">
            <a href="http://dallasyouthcricket.com/" class="menuline2">Dallas Youth Cricket</a>
        </td>
        <td width="300" align="left" valign="middle" class="menuline2">
            <a href="http://dallaswomenscricket.com/" class="menuline2">Dallas Women's Cricket</a>
        </td>
    </tr>
</table>
<hr />