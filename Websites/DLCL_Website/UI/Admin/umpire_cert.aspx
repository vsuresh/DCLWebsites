<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.umpire_cert" CodeFile="umpire_cert.aspx.cs"
CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="../JS/jquery.blockUI.js"></script>
    <script type="text/javascript">
        $(function () {
            BlockUI("dvGrid");
            $.blockUI.defaults.css = {};
        });
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({ message: '<div align = "center">' + '<img src="images/loadingAnim.gif"/></div>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        };

    </script>
    <style type="text/css">
        .hiddencol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <h2>Umpire Cert Management</h2>
<div id="dvGrid" style="padding: 10px; width: 750px">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="CertGridView" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "20" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                      CellPadding="4"
                      CssClass="rtTable"
                      HeaderStyle-BackColor="LightGrey"
                      HeaderStyle-ForeColor="White"
                      AlternatingRowStyle-BackColor="#dddddd"
                      Width="80%"
                      ShowHeader="true" 
                      >
            <Columns>
                <asp:BoundField HeaderText="id" DataField="id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
                </asp:BoundField>
                <asp:TemplateField HeaderText="Name" ItemStyle-Width="300">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' Width="280"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TeamName" ItemStyle-Width="300">
                    <ItemTemplate>
                        <asp:Label ID="lblTeamName" runat="server" Text='<%# Eval("TeamName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTeamName" runat="server" Text='<%# Eval("TeamName") %>' Width="280"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CertifiedBy" ItemStyle-Width="300">
                    <ItemTemplate>
                        <asp:Label ID="lblCertifiedBy" runat="server" Text='<%# Eval("CertifiedBy") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCertifiedBy" runat="server" Text='<%# Eval("CertifiedBy") %>' Width="280"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PlayerId" ItemStyle-Width="300">
                    <ItemTemplate>
                        <asp:Label ID="lblPlayerId" runat="server" Text='<%# Eval("PlayerID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPlayerId" runat="server" Text='<%# Eval("PlayerID") %>' Width="280"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 150px">
                    Name:<br />
                    <asp:TextBox ID="txtName" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    CertifiedBy:<br />
                    <asp:TextBox ID="txtCertifiedBy" runat="server" Width="140"  />
                </td>
                <td style="width: 150px">
                    TeamName:<br />
                    <asp:TextBox ID="txtTeamName" runat="server" Width="140"  />
                </td>
                <td style="width: 150px">
                    PlayerID:<br />
                    <asp:TextBox ID="txtPlayerID" runat="server" Width="140"  />
                </td>
                <td style="width: 150px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
    </asp:Content>