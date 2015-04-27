<%@Page Title="Statistics" Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.statistics" CodeFile="statistics.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

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
                                        Team and Player Statistics
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        [TBD]
                                        <br />
                                        <b>Team Statistics: </b>
                                        <br />
                                        Tournaments and positions in each tournament (ranking and results)
                                        <br />
                                        all time matches played 
                                        <br />
                                        all time win/loose record 
                                        <br />
                                        all time penalties
                                        <br />
                                        best position
                                        <br />
                                        worst position
                                        <br />
                                        <br />
                                        <b>Player Statistics: </b>
                                        <br />
                                        player Search 
                                        <br />
                                        ALl teams played
                                        <br />
                                        all time record
                                        <br />
                                        all warnings issued
                                        <br />
                                        Awards
                                        <br />
                                        all tournament played
                                        <br />
                                        all matches played
                                        <br />
                                        win/loose record for all matches played
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
