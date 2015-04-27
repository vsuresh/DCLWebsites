<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.match_score" CodeFile="match_score.aspx.cs"
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
                                        Match Score
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="4">
                                        <span class="infoLabel">Please enter the match details and the player's batting and
                                            bowling statistics for your team. </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Match ID:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMatchId" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Match Date:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMatchDate" runat="server" CssClass="infoData"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Teams:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTeams" TabIndex="1" runat="server" CssClass="infoData"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr class="hr">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="infoLabel">
                                        <font color="blue">Match Result:</font>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Winning Team:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlWinningTeam" runat="server" TabIndex="1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Result Summary:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtResult" TabIndex="2" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                                        <span class="infodata"><font size="1">(Example: won by 6 wkts)</font></span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtResult"
                                            ErrorMessage="RequiredFieldValidator">Required Field</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Total Match Overs:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalMatchOvers" TabIndex="25" runat="server" Width="50px" MaxLength="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtTotalMatchOvers"
                                            ErrorMessage="RequiredFieldValidator">Required Field</asp:RequiredFieldValidator>
                                        <br />
                                        <span class="infodata"><font size="1">(if it was a reduced overs match, inform the organizers as the system admin can change this setting
                                            to accurately calculate the net run rate)</font></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="infoLabel">
                                        <font color="blue">Inning I Statistics:</font>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnBatting1" TabIndex="30" runat="server" CssClass="btnAdmin" Text="Batting Details"
                                            OnClick="btnBatting1_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnBowling1" TabIndex="31" runat="server" Text="Bowling Details"
                                            CssClass="btnAdmin" OnClick="btnBowling1_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 23px">
                                        <span class="infoLabel">Batting Team:</span>
                                    </td>
                                    <td style="height: 23px">
                                        <asp:DropDownList ID="ddlInning1" runat="server" TabIndex="3">
                                        </asp:DropDownList>
                                        <asp:CompareValidator ID="CompareValidator16" runat="server" Operator="NotEqual"
                                            ControlToValidate="ddlInning1" ErrorMessage="CompareValidator" ControlToCompare="ddlInning2">Cannot have same team name for both innings</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Runs:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRuns1" TabIndex="4" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtRuns1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Wickets:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWickets1" TabIndex="5" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtWickets1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                        <br />
                                        <span class="infodata"><font size="1">(Enter 10 if you played with < 11 players and
                                            all players got out)</font></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Overs:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOvers1" TabIndex="6" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtOvers1" Operator="DataTypeCheck" Type="Double">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Extras:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtExtras1" TabIndex="7" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtExtras1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">No Balls:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNos1" TabIndex="8" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtNos1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Wide Balls:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWides1" TabIndex="9" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="Comparevalidator1" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtWides1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Byes:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtByes1" TabIndex="10" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator10" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtByes1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 24px">
                                        <span class="infoLabel">Over Throws:</span>
                                    </td>
                                    <td style="height: 24px">
                                        <asp:TextBox ID="txtOverThrow1" TabIndex="11" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="Comparevalidator17" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtOverThrow1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="infoLabel" style="height: 22px">
                                        <font color="blue">Inning II Statistics:</font>
                                    </td>
                                    <td align="right" style="height: 22px">
                                        <asp:Button ID="btnBatting2" TabIndex="27" runat="server" CssClass="btnAdmin" Text="Batting Details"
                                            OnClick="btnBatting2_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnBowling2" TabIndex="28" runat="server" Text="Bowling Details"
                                            CssClass="btnAdmin" OnClick="btnBowling2_Click"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Batting Team:</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlInning2" runat="server" TabIndex="17">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Runs:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRuns2" TabIndex="18" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator11" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtByes1" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Wickets:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWickets2" TabIndex="19" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator12" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtWickets2" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                        <br>
                                        <span class="infodata"><font size="1">(Enter 10 if you played with < 11 players and
                                            all players got out)</font></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Overs:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOvers2" TabIndex="20" runat="server" Width="100px" MaxLength="5"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtOvers2" Operator="DataTypeCheck" Type="Double">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Extras:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtExtras2" TabIndex="21" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator13" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtExtras2" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">No Balls:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNos2" TabIndex="22" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="Comparevalidator4" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtNos2" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Wide Balls:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWides2" TabIndex="23" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="Comparevalidator5" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtWides2" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Byes:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtByes2" TabIndex="24" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator15" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtByes2" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="infoLabel">Over Throws:</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOverThrow2" TabIndex="25" runat="server" Width="100px" MaxLength="3"></asp:TextBox>
                                        <asp:CompareValidator ID="Comparevalidator14" runat="server" ErrorMessage="CompareValidator"
                                            ControlToValidate="txtOverThrow2" Operator="DataTypeCheck" Type="Integer">Invalid Value</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr class="hr" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSubmit" TabIndex="26" runat="server" Text="Submit" CssClass="btnAdmin"
                                            OnClick="btnSubmit_Click"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" TabIndex="35" runat="server" Text="Cancel" CssClass="btnAdmin"
                                            CausesValidation="False" OnClick="btnCancel_Click"></asp:Button>
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
