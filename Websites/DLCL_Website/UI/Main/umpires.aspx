<%@Page Language="c#" MasterPageFile="~/Site.master" Inherits="Cricket.Main.umpires" CodeFile="umpires.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../styles/Gridstyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:TextBox ID="searchBox" runat="server"></asp:TextBox>
    <asp:Button ID="searchButton" runat="server" Text="search" OnClick="searchButton_Click" />
    <asp:Button ID="reset" runat="server" Text="reset" OnClick="resetSearchButton_Click" />
    <br />
    <br />
  
        <asp:GridView ID="CertGridView" runat="server" AutoGenerateColumns="false"  CellPadding="4"
                      CssClass="rtTable"
                      HeaderStyle-BackColor="LightGrey"
                      HeaderStyle-ForeColor="White"
                      AlternatingRowStyle-BackColor="#dddddd"
                      Width="100%"
                      ShowHeader="true">
            <Columns>
                <asp:BoundField DataField="Name" ItemStyle-Width="30%" HeaderText="Umpire Name" />
                <asp:BoundField DataField="TeamName" ItemStyle-Width="30%" HeaderText="Team Name" />
                <asp:BoundField DataField="CertifiedBy" ItemStyle-Width="30%" HeaderText="Certified By" />
            </Columns>
        </asp:GridView>

 
</asp:Content>
