<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" CodeFile="unlock_scoresheets.aspx.cs" Inherits="Cricket.Admin.unlock_scoresheets"  EnableViewState="true"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    </style>
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
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
                                        Unlock Score Sheet
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
                                <%--<tr>
                                    <td style="height: 22px" align="right">
                                        <span class="infoLabel">Select Tournament:</span>
                                    </td>
                                    <td style="height: 22px">
                                        <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTournament_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td align="center" colspan="2">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <span class="infoData2">
                                        <%--(These awards are displayed on the tournament home page)--%>
                                        </span>
                                    </td>
                                </tr>
					            <tr>
						            <td colspan="2" align="center">
							            <asp:DataGrid ID="dgrid_unlock" runat="server" CssClass="rtTable" AllowCustomPaging="false" ViewStateMode="Enabled"
								            AllowPaging="false" AllowSorting="false" EnableViewState="False" Width="700"
								            ShowFooter="False" ShowHeader="True" AutoGenerateColumns="False" CellPadding="0"
                                            CellSpacing="0" BorderColor="#2D7C97" BorderStyle="Solid" 
                                            onitemcommand="dgrid_unlock_ItemCommand">
								            <EditItemStyle CssClass="rtRow1"></EditItemStyle>
								            <AlternatingItemStyle CssClass="rtRow2" ></AlternatingItemStyle>
								            <ItemStyle CssClass="rtRow1"></ItemStyle>
								            <Columns>
									            <asp:BoundColumn DataField="id" HeaderText=""  Visible="false">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="10%" CssClass="rtCellDataLeft">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="match_id" HeaderText="Match Id">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Width="15%" Font-Bold="true" CssClass="rtCellData">
										            </ItemStyle>
									            </asp:BoundColumn>
                                               <%-- <asp:TemplateField HeaderText="IsActive?" >
                                                    <headerstyle  CssClass="rtColHeader2"></headerstyle>
                                                    <ItemTemplate><%# (Boolean.Parse(Eval("is_active").ToString())) ? "Yes" : "No" %></ItemTemplate>
                                                    <ItemStyle Font-Bold="False" Width="20%" CssClass="rtCellDataLeft"> </ItemStyle>
                                                </asp:TemplateField>--%>
									            <asp:BoundColumn DataField="is_active" HeaderText="Active?">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="10%" CssClass="rtCellData">
										            </ItemStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="group_name" HeaderText="Season" Visible="True">
										            <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
										            <ItemStyle Font-Bold="False" Width="40%" CssClass="rtCellData">
										            </ItemStyle>
									            </asp:BoundColumn>
                                                <asp:BoundColumn DataField="team_requesting" HeaderText="Team Requesting" Visible="True">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle Font-Bold="False" Width="25%" CssClass="rtCellData">
                                                    </ItemStyle>
                                                </asp:BoundColumn>
									            <asp:ButtonColumn Text="Edit" SortExpression="Edit" HeaderText="Edit" CommandName="Edit">
                                                    <HeaderStyle CssClass="rtColHeader2"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Right" Width="15%" CssClass="rtCellData"></ItemStyle>
                                                </asp:ButtonColumn>
								            </Columns>
							            </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" class="auto-style1">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title" align="left" colspan="2">
                                        Add/Update MatchId To Unlock
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <div id="divUnlock" runat="server" visible="true">
                                        <table>
                                       <%--     <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Id:</span>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblId" runat="server" Width="200px" CssClass="infoData2"></asp:Label>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">IsActive:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlActive" runat="server" ViewStateMode="Enabled" OnSelectedIndexChanged="ddlActive_SelectedIndexChanged">
                                                        <asp:ListItem Text="--Select One--" Value="" />   
                                                        <asp:ListItem Text="Yes" Value="true" />
                                                        <asp:ListItem Text="No" Value="false" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">MatchId:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMatchId" TabIndex="2" runat="server" Width="304px" onkeypress="return isNumberKey(event)" ReadOnly="False" MaxLength="100" Height="24px" ></asp:TextBox>
                                                    <span class="infoData2">(Required)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Team Requesting:</span>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTeamRequesting" TabIndex="2" runat="server" Width="304px" ReadOnly="False" MaxLength="100" Height="24px"></asp:TextBox>
                                                    <span class="infoData2">(Optional)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span class="infoLabel">Season:</span>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTournament" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTournament_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit" TabIndex="13" runat="server" CssClass="btnAdmin" Text="Add"
                                                        OnClick="btnSubmit_Click"></asp:Button>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="btnCancel" TabIndex="14" runat="server" CssClass="btnAdmin" Text="Cancel"
                                                                OnClick="btnCancel_Click"></asp:Button>
                                                </td>
                                            </tr>
                                        </table>
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
