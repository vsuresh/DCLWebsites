<%@ Control Language="c#" Inherits="Cricket.controls.navData" CodeFile="navData.ascx.cs" %>

<table width="100%" border=0>
    <tr>
        <td align="left" width="30%">
            <asp:HyperLink ID="anchorTeamName" CssClass="headerTitle2" runat="server" NavigateUrl=""></asp:HyperLink>
        </td>
        <td align="center" width="40%">
            <asp:HyperLink ID="anchorTitle" CssClass="headerTitle" runat="server" NavigateUrl=""></asp:HyperLink>
        </td>
        <td align="right" width="30%">
            <asp:HyperLink ID="anchorAdmin" runat="server" NavigateUrl="/AdminTeams/default.aspx"></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td align="left" width="100%" colspan="3" >
        <!--
        <asp:SiteMapPath ID="SiteMapPath1" runat="server">
            <RootNodeTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("title") %>' NavigateUrl='<%# Eval("url") %>' />
            </RootNodeTemplate>
            <NodeTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("title") %>' NavigateUrl='<%# Eval("url") %>' />
            </NodeTemplate>
        </asp:SiteMapPath>
        -->
        </td>
    </tr>
</table>
