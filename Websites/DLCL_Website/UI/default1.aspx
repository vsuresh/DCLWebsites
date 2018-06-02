<%@ Page Title="Home Page" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket._default" CodeFile="default.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td align="center" valign="top">
                <!--
                <span class="subtitle">Welcome to the new Dallas Cricket League website! </span>
                <span class="infoData">(Click on the tournament link below to see the tournament details)</span>
                <br />
                -->
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <table width="900" height="225" border="0" cellpadding="0" cellspacing="10">
                    <tr>
                        <td colspan="2" align="center">

                            <span class="subtitle">
                                Fall Tournament 2011 Registration is Open! 
                                <a href="/tournament/registrationinfo.aspx?TournamentID=1086433301">Click here</a> to register your team!
                                <br />
                                Registration will close on Friday August 12th 2011!
                            </span>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" >
                            <table width="100%" height=225 border="1" cellpadding="0" cellspacing="0">
                                <tr align="left" valign="top" width="600">
                                    <td>
                                        <a href="/Main/Announcements.aspx"><span class="title2">Announcements</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="100%" class="" valign="top">
                                        <table id="1" border="0" cellpadding="10" cellspacing="1" width="100%">
                                            <tr>
                                                <td class="txt">
                                                <!--
                                                    <asp:Panel ID="ImgScroller" runat="server" Height="250px" Width="100%" ScrollBars=Auto >
                                                        <asp:Label ID="lblAnnouncement" runat="server"></asp:Label>
                                                    </asp:Panel>
                                                -->
                                                    <asp:DataGrid ID="dgrid_announcements" runat="server" CssClass="" AllowCustomPaging="false"
                                                        AllowPaging="false" AllowSorting="false" EnableViewState="False" Width="100%"
                                                        ShowFooter="False" ShowHeader="false" AutoGenerateColumns="False" CellPadding="0"
                                                        CellSpacing="0" GridLines="None" BorderStyle="None">
                                                        <AlternatingItemStyle CssClass="gridHomeRow2"></AlternatingItemStyle>
                                                        <ItemStyle CssClass="gridHomeRow1" ></ItemStyle>
                                                        <Columns>
                                                            <asp:BoundColumn DataField="created_dt" HeaderText="" DataFormatString="{0:MMM d, yyyy}">
                                                                <ItemStyle HorizontalAlign="left" Width="20%" CssClass="gridHomeCellData">
                                                                </ItemStyle>
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataTextField="title"  DataNavigateUrlField="ID" DataNavigateUrlFormatString="/Main/Announcements.aspx?AnnouncementID={0}">
                                                                <ItemStyle HorizontalAlign="left" Width="80%" CssClass="gridHomeCellData">
                                                                </ItemStyle>
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="ID" HeaderText="" Visible="false" >
                                                                <ItemStyle HorizontalAlign="left" Width="0%" CssClass="gridHomeCellData">
                                                                </ItemStyle>
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                     </asp:DataGrid>
                                                     <!--
                                                    <table width=100%><tr><td width="100%" align="right"><a href="/Main/Announcements.aspx">more</a></td></tr></table>
                                                    -->
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="310" align="left" valign="top" bgcolor="#FFFFFF">
                            <table width="100%" height=225 border="1" cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td align="center" valign="middle" class="">
                                        <a href="/Main/Tournaments.aspx"><span class="title2">Tournaments</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" align="center" class="">
                                        <table id="Table1" border="0" cellpadding="10" cellspacing="1" width="100%">
                                            <tr>
                                                <td class="" align="center">
                                        <asp:DataGrid ID="dgrid_tournaments" runat="server" CssClass="" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="False" Width="100%"
                                            ShowFooter="False" ShowHeader="false" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" GridLines="None" BorderStyle="None" 
                                                        onitemdatabound="dgrid_tournaments_ItemDataBound">
                                            <AlternatingItemStyle CssClass="gridRow2" ></AlternatingItemStyle>
                                            <ItemStyle CssClass="gridRow1" ></ItemStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="tournament_id" HeaderText="TournamentId" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn  DataTextField="name" DataNavigateUrlField="tournament_id" DataNavigateUrlFormatString="/Tournament/default.aspx?TournamentID={0}">
                                                    <ItemStyle HorizontalAlign="center" Width="100%" CssClass="gridCellData" >
                                                    </ItemStyle>
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="current" HeaderText="" Visible="false">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="0%" CssClass="rtCellDataRight"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                         </asp:DataGrid>
                                         <!--
                                        <table width=100%><tr><td width="100%" align="right"><a href="/Main/Tournaments.aspx">more</a></td></tr></table>
                                        -->
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <table width="900" border="0" align="center" cellpadding="0" cellspacing="10">
                    <tr>
                        <td align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr align="left" valign="top" width="600">
                                    <td>
                                        <span class="title2">Images</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="37%" align="left" valign="top">
                                                    <table width="100%" border="0" cellspacing="10" cellpadding="0">
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                                <img src="Img/video.jpg" width="197" height="165" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="63%" align="left" valign="top">
                                                    <table width="44%" border="0" align="center" cellpadding="0" cellspacing="10">
                                                        <tr>
                                                            <td width="5%" align="left" valign="top">
                                                                    <img src="Img/p1.jpg" width="129" height="84" alt="SlideShow Layout" />
                                                            </td>
                                                            <td width="95%" align="left" valign="top">
                                                                    <img src="Img/p2.jpg" width="129" height="84" alt="Classic Layout" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                    <img src="Img/p3.jpg" width="129" height="84" alt="Rainbow Theme" />
                                                            </td>
                                                            <td align="left" valign="top">
                                                                    <img src="Img/p3.jpg" width="129" height="84" alt="Element Theme" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="307" align="left" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr align="left" valign="top" width="600">
                                    <td>
                                        <span class="title2">Sponsors</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="10" class="sponcerbg">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <img src="Img/s1.jpg" width="136" height="83" />
                                                </td>
                                                <td align="left" valign="top">
                                                    <img src="Img/s2.jpg" width="136" height="83" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <img src="Img/s3.jpg" width="136" height="83" />
                                                </td>
                                                <td align="left" valign="top">
                                                    <img src="Img/s4.jpg" width="136" height="83" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
</asp:Content>
