<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.Admin.schedule_edit" CodeFile="schedule_edit.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
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
                                        Scheduled Edit Page
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Match ID:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMatchId" CssClass="infoData2" runat="server" Width="200px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Tournament:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlTournament">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Match Type:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlTypecd">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Match Date:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlMatchDt">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Start and End Time:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtStartTime" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtEndTime" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Team1:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlTeam1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Team2:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlTeam2">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Ground:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlGround">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Umpiring Team:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlUmpireTeam">
                                        </asp:DropDownList>
                                        <asp:DropDownList runat="server" ID="ddlUmpireTeam2">
                                        </asp:DropDownList>
                                        <br />
                                        <span class="infoLabel"><b>OR</b></span>
                                        <br />
                                        <asp:DropDownList runat="server" ID="ddlUmpiringText">
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Winning Team:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlWinTeam">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Result:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtResult" runat="server" Width="400px" MaxLength="5000"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Man of the Match:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlMOM">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btnAdmin" Text="Submit" OnClick="btnSubmit_Click">
                                        </asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" CssClass="btnAdmin" Text="Cancel" CausesValidation="False"
                                            OnClick="btnCancel_Click"></asp:Button>
                                            <br />
                                            <br />
                                            <span class="infoLabel2">(Note: Updates are not allowed once the scores have been entered)</span>
                                    </td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                            </table>
                            <!-- custom code end -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
