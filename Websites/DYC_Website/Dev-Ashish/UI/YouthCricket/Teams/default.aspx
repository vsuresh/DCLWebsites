<%@ Page Language="c#" MasterPageFile="~/SiteTeam.master" Inherits="Cricket.Teams._default" CodeFile="default.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="navbarTeam" Src="~/controls/navTeam.ascx" %>

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
                                    <td class="infoData" colspan="4">
                                        <uc1:navbarTeam ID="navbarTeam1" runat="server" ></uc1:navbarTeam>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infoData">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title" colspan="4">Team Home 
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">

                                        <table>
                                            <tr  align="center">
                                                <td width="30%" >
                                        <div style="padding-top:10;">
                                          <asp:DataGrid ID="dgrid_stats3" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="230"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn  DataField="name" HeaderText="Match Statistics" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="70%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="data" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="30%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                                </asp:DataGrid>
                                        </div>
                                                </td>
                                                <td width="30%" >
                                        <div style="padding-top:10;">
                                          <asp:DataGrid ID="dgrid_stats" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="230"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn  DataField="name" HeaderText="Achievements" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="70%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="data" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="30%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </div>

                                                </td>
                                                <td width="30%" >
                                        <div style="padding-top:10;">
                                          <asp:DataGrid ID="dgrid_stats2" runat="server" CssClass="rtTable" AllowCustomPaging="false"
                                            AllowPaging="false" AllowSorting="false" EnableViewState="True"  Width="230"
                                            ShowFooter="False" ShowHeader="true" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid">
                                                <AlternatingItemStyle BackColor="LightYellow" CssClass="gridRow2" ></AlternatingItemStyle>
                                                <ItemStyle BackColor="Azure" CssClass="gridRow1" ></ItemStyle>
                                                <Columns>
                                                    <asp:BoundColumn  DataField="name" HeaderText="Appearances" >
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="70%" CssClass="rtCellDataLeft" >
                                                        </ItemStyle>
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="data" HeaderText="" Visible="true">
                                                        <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                        <ItemStyle Width="30%" CssClass="rtCellData"></ItemStyle>
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            </div>                                     

                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblTeamDesc" CssClass="infoData" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">


                                    <div class="left-container" >

                                        Coming soon...<br />Team's Facebook/Twitter/Flickr Feeds/photos will be shown here...
                          
                                    </div>

                                    <div class="right-container" >
                                    
                                    </div>                                        
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
