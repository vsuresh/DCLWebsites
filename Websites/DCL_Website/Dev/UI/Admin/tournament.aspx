<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.tournament" CodeFile="tournament.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tr>
			<td align="left" valign="top" >
				<table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" align="left">
                            <!-- custom code start -->
                            <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td class="title" colspan="4">
                                        Manage Tournament
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customTableTD1">
                                    </td>
                                    <td class="customTableTD2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                    &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel">Select Tournament:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTournament_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnAdd" TabIndex="13" runat="server" CssClass="btnAdmin" Text="New Tournament"
                                            CausesValidation="False" OnClick="btnAdd_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament ID:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblId" runat="server" Width="200px" CssClass="infoData2"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament Name:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" TabIndex="1" runat="server" Width="304px" MaxLength="80"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator">Field is required</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament Group: </span><br />(group tournaments by season)
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtGroupName" TabIndex="1" runat="server" Width="304px" MaxLength="80"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator">Field is required</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Description:<br>
                                        </span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDesc" TabIndex="2" runat="server" Width="304px" MaxLength="255"
                                            Height="24px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                runat="server" ControlToValidate="txtDesc" ErrorMessage="RequiredFieldValidator">Field is required</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Maximum Overs:<br>
                                        </span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOvers" TabIndex="2" runat="server" Width="30px" MaxLength="2" 
                                            Height="24px"></asp:TextBox><asp:RequiredFieldValidator ID="Requiredfieldvalidator5"
                                                runat="server" ControlToValidate="txtDesc" ErrorMessage="RequiredFieldValidator">Field is required</asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Out of Range"
                                            ControlToValidate="txtOvers" Type="Integer" MinimumValue="0" MaximumValue="25"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Fees ($):<br>
                                        </span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFees" TabIndex="2" runat="server" Width="30px" MaxLength="3" 
                                            Height="24px"></asp:TextBox><asp:RequiredFieldValidator ID="Requiredfieldvalidator8"
                                                runat="server" ControlToValidate="txtFees" ErrorMessage="RequiredFieldValidator">Field is required</asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Out of Range"
                                            ControlToValidate="txtFees" Type="Integer" MinimumValue="0" MaximumValue="500"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                    <br />
                                    </td>
                                    <td align="left">
                                    <br />
                                        <span class="infoData2">(Please ensure these dates are accurate since the regsitration/score entry/award displays and other tournament pages depend on them)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament Start Date:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtStartDate" TabIndex="3" runat="server" Width="200px" MaxLength="50"></asp:TextBox>&nbsp;(MM/DD/YYYY)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStartDate"
                                            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament End Date:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEndDate" TabIndex="3" runat="server" Width="200px" MaxLength="50"></asp:TextBox>&nbsp;(MM/DD/YYYY)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEndDate"
                                            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Registration Start Date:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRegStartDate" TabIndex="3" runat="server" Width="200px" MaxLength="50"></asp:TextBox>&nbsp;(MM/DD/YYYY)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRegStartDate"
                                            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Registration End Date:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRegEndDate" TabIndex="3" runat="server" Width="200px" MaxLength="50"></asp:TextBox>&nbsp;(MM/DD/YYYY)
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRegEndDate"
                                            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    <br />
                                        <span class="infoLabel">Registration Information:</span>
                                    </td>
                                    <td colspan="left">
                                    <br />
                                        <span class="infoData2">(This is displayed on the tournament registration page)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" valign="middle">
                                        <cc1:Editor ID="editorRegInfo" runat="server" Width="80%" Height="350px" 
                                            AutoFocus="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament Format:</span>
                                    </td>
                                    <td colspan="left">
                                        <span class="infoData2">(This is displayed on the tournament format page)</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" valign="middle">
                                        <cc1:Editor ID="editorFormat" runat="server" Width="80%" Height="350px" 
                                            AutoFocus="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" TabIndex="13" runat="server" CssClass="btnAdmin" Text="Submit"
                                            OnClick="btnSubmit_Click"></asp:Button>
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
