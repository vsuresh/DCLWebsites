<%@Page Title="Awards" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.awards" CodeFile="awards.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

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
                                        Awards 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
The following awards will be distributed for each tournament:
<br />
<br />
<strong>Team Trophies
</strong>
<ol>
<li>
Championship Team Trophy 
</li>
<li>
Runners Up Team Trophy
</li>
</ol>

<strong>Individual Trophies
</strong>
<ol>
<li>
Championship Individual Trophies (14)
</li>
<li>
Runners Up Individual Trophies (14)
</li>
<li>
Man of the Match for Finals Trophy
</li>
<li>
Best Batsman Trophy 
</li>
<li>
Best Bowler Trophy 
</li>
<li>
Best Batting Score Trophy 
</li>
<li>
Best Bowling Figure Trophy 
</li>
<li>
Best Catcher Trophy 
</li>
<li>
Centurion award (each 100’s)
</li>
<li>
5 wickets award (per innings)
</li>
<li>
Bowler Hatrick award
</li>
<li>
5 catches award (per Innings)
</li>
</ol>

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
