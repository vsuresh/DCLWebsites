<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeFile="announcements_edit.aspx.cs" Inherits="Cricket.Admin.announcements_edit"  CodeFileBaseClass="Cricket.PageBaseAdmin"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <style type="text/css">
        .style1
        {
            font-family: helvetica;
            font-size: 9pt;
            color: #000000;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td align="left" valign="top" >
				<table id="Table1" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Add/Update Announcement
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;
                                        <asp:Label ID="lblID" TabIndex="1" runat="server" CssClass="infoData2" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="1">
                                        <span class="infoLabel">Date:</span><span class="style1"> (Required)</span>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtDate" TabIndex="1" runat="server" CssClass="infoData2" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtDate" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToValidate="txtDate" ErrorMessage="Invalid Date" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="1">
                                        <span class="infoLabel">Title:</span><span class="style1"> (Required)</span>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtTitle" TabIndex="1" runat="server" Width="500" CssClass="infoData2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtTitle" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                            <span class="infoData2">(Displayed on the home page)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="1">
                                        <span class="infoLabel">Tournament: </span>
                                        <span class="style1">(Required)</span>
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <span class="infoLabel">Details:</span>
                                        (Required)
                                        </td>
                                    <td colspan="2">
                                            <span class="infoData2">(Displayed on the announcement page)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" valign="middle">
                                        <cc1:Editor ID="Editor1" runat="server" Width="100%" Height="350px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" valign="middle">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" valign="top">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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
