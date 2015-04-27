<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteTournament.master" Inherits="Cricket.Offerings.KidsPackage" CodeFile="KidsPackage.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <tr>
            <td align="left" valign="top" >
                <table id="TableMain" width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" align="left">
                            
                            <!-- custom code start -->

                            <div runat="server">
                                                        <table id="TableCustom" width="96%" border="0" align="left" cellpadding="2" cellspacing="2" >
                                                            <tr height="20" >
                                                                <td>
                                                                    <asp:label id="lblPRID" visible="false" runat="server" ForeColor="DarkRed" CssClass="infoData"></asp:label>
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr height="20" >
                                                                <td align="right"><span class="infoLabel">Select Kid:</span></td>
                                                                <td >
                                                                    <asp:DropDownList ID="ddlKids" runat="server" DataSourceID="sdsKids" DataTextField="PNAME" DataValueField="PLAYER_ID" Height="16px" Width="272px" OnSelectedIndexChanged="ddlKids_SelectedIndexChanged" AutoPostBack="True">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
								        <td align="right"><span class="infoLabel">Age:</span></td>
								        <td>
                                            <asp:Label ID="lblKidsAge" runat="server" Text=""></asp:Label>
                                                                </td>
							                                </tr>
                                                            <tr>
								        <td align="right"><span class="infoLabel">Membership Package:</span>
								        </td>
								        <td>
                                            <asp:DropDownList id="ddlPackageUnder8" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPackageUnder8_SelectedIndexChanged" DataSourceID="sdsPackageUnder8" DataTextField="PACKAGE_DISPLAY" DataValueField="PACKAGE_ID">                                               
                                            </asp:DropDownList>
                                            <asp:DropDownList id="ddlPackageAbove8" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlPackageAbove8_SelectedIndexChanged" DataSourceID="sdsPackageAbove8" DataTextField="PACKAGE_DISPLAY" DataValueField="PACKAGE_ID"> 
                                            </asp:DropDownList>
								        </td>
							                                </tr>
                                                            <tr>
								        <td align="right"><span class="infoLabel">First Slot Preference:</span>
								        </td>
								        <td>
                                            <asp:DropDownList id="ddlFirstSlot" runat="server" DataSourceID="sdsSlots" DataTextField="SESSION_DISPLAY" DataValueField="SESSION_ID">
                                                <asp:ListItem Text="A. Saturday 4:30 pm till 6:30 pm"  Value="A" Selected="True"/>
                                                <asp:ListItem Text="B. Saturday 6:30 pm till 8:30 pm"  Value="B"/>
                                                <asp:ListItem Text="C. Sunday 4:30 pm till 6:30 pm"  Value="C"/>
                                                <asp:ListItem Text="D. Sunday 6:30 pm till 8:30 pm"  Value="D"/>
                                            </asp:DropDownList>
								        </td>
							                                </tr>
                                                            <tr>
								        <td align="right"><span class="infoLabel">First Slot Preference:</span>
								        </td>
								        <td>
                                            <asp:DropDownList id="ddlSecondSlot" runat="server" DataSourceID="sdsSlots" DataTextField="SESSION_DISPLAY" DataValueField="SESSION_ID">
                                                <asp:ListItem Text="A. Saturday 4:30 pm till 6:30 pm"  Value="A"/>
                                                <asp:ListItem Text="B. Saturday 6:30 pm till 8:30 pm"  Value="B" Selected="True"/>
                                                <asp:ListItem Text="C. Sunday 4:30 pm till 6:30 pm"  Value="C"/>
                                                <asp:ListItem Text="D. Sunday 6:30 pm till 8:30 pm"  Value="D"/>
                                            </asp:DropDownList>

                                            <br />
								        </td>
							                                </tr>
                                                            <tr>
								        <td align="left" >
                                            </td>
								        <td align="left" >
                                            (Slots will be allocated based on your preference, age, other factors which will decided by the DYCL management)
								        </td>
                                                            </tr>
                                                            <tr height="20" >
                                                                <td >&nbsp;</td>
                                                                <td >
                                                                    <asp:CheckBox ID="chkYearlyRegFee" runat="server" Checked="True" Text="Add Yearly Registration Fee: $40" Enabled="False" OnCheckedChanged="chkYearlyRegFee_CheckedChanged" />
                                                                </td>
                                                            </tr>
                                                            <tr>
								        <td align="right"><span class="infoLabel">Payment Amount: ($)</span>
								        </td>
								        <td>
                                            <asp:Label ID="lblAmount" runat="server" Text="0"></asp:Label>
								        </td>
							                                </tr>
                                                            <tr height="20" >
                                                                <td >&nbsp;</td>
                                                                <td >
                                                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                                                                </td>
                                                            </tr>
                                                            <tr height="20" >
                                                                <td >&nbsp;</td>
                                                                <td >
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr height="20" >
                                                                <td colspan="2" >
                                                                    <asp:GridView ID="gvKidsPackage" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsKidsPackage" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                                                        <AlternatingRowStyle BackColor="White" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="TRAN_ID" HeaderText="TRAN_ID" SortExpression="TRAN_ID" Visible="False" />
                                                                            <asp:BoundField DataField="PR_ID" HeaderText="PR_ID" SortExpression="PR_ID" Visible="False" />
                                                                            <asp:BoundField DataField="PLAYER_ID" HeaderText="PLAYER_ID" SortExpression="PLAYER_ID" Visible="False" />
                                                                            <asp:BoundField DataField="PNAME" HeaderText="Player" ReadOnly="True" SortExpression="PNAME" />
                                                                            <asp:BoundField DataField="PACKAGE_ID" HeaderText="PACKAGE_ID" SortExpression="PACKAGE_ID" Visible="False" />
                                                                            <asp:BoundField DataField="PACKAGE_NAME" HeaderText="Package" SortExpression="PACKAGE_NAME" />
                                                                            <asp:BoundField DataField="SLOT1_ID" HeaderText="SLOT1_ID" SortExpression="SLOT1_ID" Visible="False" />
                                                                            <asp:BoundField DataField="SLOT1_TEXT" HeaderText="Slot-1" SortExpression="SLOT1_TEXT" />
                                                                            <asp:BoundField DataField="SLOT1_TIME" HeaderText="Time" SortExpression="SLOT1_TIME" />
                                                                            <asp:BoundField DataField="SLOT2_ID" HeaderText="SLOT2_ID" SortExpression="SLOT2_ID" Visible="False" />
                                                                            <asp:BoundField DataField="SLOT2_TEXT" HeaderText="Slot-2" SortExpression="SLOT2_TEXT" />
                                                                            <asp:BoundField DataField="SLOT2_TIME" HeaderText="Time" SortExpression="SLOT2_TIME" />
                                                                            <asp:BoundField DataField="AMOUNT" HeaderText="Amount" SortExpression="AMOUNT" />
                                                                            <asp:CheckBoxField DataField="YEARLY" HeaderText="Yearly" SortExpression="YEARLY" />
                                                                            <asp:BoundField DataField="START_DATE" HeaderText="Start Date" SortExpression="START_DATE" />
                                                                            <asp:BoundField DataField="END_DATE" HeaderText="End Date" SortExpression="END_DATE" />
                                                                            <asp:BoundField DataField="CREATED_DATE" HeaderText="CREATED_DATE" SortExpression="CREATED_DATE" Visible="False" />
                                                                            <asp:BoundField DataField="MODIFIED_DATE" HeaderText="MODIFIED_DATE" SortExpression="MODIFIED_DATE" Visible="False" />
                                                                            <asp:BoundField DataField="PAYMENT_STATUS" HeaderText="Payment Status" SortExpression="PAYMENT_STATUS" />
                                                                        </Columns>
                                                                        <EditRowStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                        <RowStyle BackColor="#EFF3FB" />
                                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                            <tr height="20" >
                                                                <td ><span class="infoLabel">Pending Amount: ($)</span></td>
                                                                <td >
                                                                    <asp:Label ID="lblPendingAmount" runat="server" Text="0"></asp:Label></td>
                                                            </tr>
                                                            <tr height="20" >
                                                                <td >&nbsp;</td>
                                                                <td >
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                        <br />

                                                </div>

                                            <br />

                                                    </div>
							        </tr>
							        <tr>
                        <td valign="top" align="left">
                            
                            <asp:SqlDataSource ID="sdsKids" runat="server" ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" SelectCommand="SELECT [PR_ID], [PLAYER_ID], [PNAME] FROM [CP_PLAYER] 
WHERE ([PR_ID] = @PRID) OR [PLAYER_ID] = -1
ORDER BY [PLAYER_ID]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblPRID" DefaultValue="" Name="PRID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
							        <asp:SqlDataSource ID="sdsKidsPackage" runat="server" ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" SelectCommand="SELECT [TRAN_ID],CP_PLAYER_PACKAGE.[PR_ID],CP_PLAYER_PACKAGE.[PLAYER_ID],[PNAME],CP_PLAYER_PACKAGE.[PACKAGE_ID],[PACKAGE_NAME],[SLOT1_ID],S1.[SESSION_NAME] AS [SLOT1_TEXT],S1.[SESSION_TIME] AS SLOT1_TIME,
	[SLOT2_ID],S2.[SESSION_NAME] AS [SLOT2_TEXT],S2.[SESSION_TIME] AS SLOT2_TIME,[AMOUNT],[YEARLY],[START_DATE],[END_DATE],CP_PLAYER_PACKAGE.[CREATED_DATE],[MODIFIED_DATE],PAYMENT_STATUS
FROM [dbo].[CP_PLAYER_PACKAGE]
INNER JOIN CP_PLAYER ON CP_PLAYER.PLAYER_ID = CP_PLAYER_PACKAGE.PLAYER_ID
INNER JOIN CP_PACKAGE ON CP_PACKAGE.PACKAGE_ID = CP_PLAYER_PACKAGE.PACKAGE_ID
INNER JOIN CP_SESSION S1 ON S1.SESSION_ID = CP_PLAYER_PACKAGE.[SLOT1_ID]
INNER JOIN CP_SESSION S2 ON S2.SESSION_ID = CP_PLAYER_PACKAGE.[SLOT2_ID]
WHERE CP_PLAYER_PACKAGE.[PR_ID] = @PRID">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblPRID" Name="PRID" PropertyName="Text" />
                                        </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsPackageUnder8" runat="server" ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" SelectCommand="SELECT [PACKAGE_ID],[PACKAGE_NAME]+' Package = $'+CONVERT(NVARCHAR,[PACKAGE_PRICE]) as PACKAGE_DISPLAY
FROM [dbo].[CP_PACKAGE]
WHERE [AGE_LIMIT] &lt;= 8
ORDER BY [PACKAGE_ID]
"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsPackageAbove8" runat="server" ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" SelectCommand="SELECT [PACKAGE_ID],[PACKAGE_NAME]+' Package = $'+CONVERT(NVARCHAR,[PACKAGE_PRICE]) as PACKAGE_DISPLAY
FROM [dbo].[CP_PACKAGE]
WHERE [AGE_LIMIT] &gt;= 8
ORDER BY [PACKAGE_ID]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsSlots" runat="server" ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" SelectCommand="SELECT [SESSION_ID],[SESSION_NAME]+': '+[SESSION_TIME] AS SESSION_DISPLAY
FROM [dbo].[CP_SESSION]
WHERE [SESSION_ID] &gt;= 100 OR [SESSION_ID] = -1
ORDER BY [SESSION_ID]"></asp:SqlDataSource>
                            <br />
                                        </tr>
							        <tr>
								        <td align="center">
									        <hr class="hr">
								        </td>
							        </tr>
                                </table>                           
                            </div>

                            <br>
							<br>
                            <!-- custom code end -->
                        </td>
                    </tr>
                </table>

<table>
    <tr>
        <td>
							        <tr>
								        <td align="right"></td>
								        <td>
                                            <asp:button id="Button1" Enabled="false" tabIndex="12" runat="server" CssClass="btnAdmin"
										        Text="Pay via PayPal" OnClick="btnSubmit_Click"></asp:button>
                                            <br />
                                            <br />
									        <span class="infoData">
                                            You will be taken to the secure PayPal website! 
									        <br>
                                            Your registration will be confirmed only after you have successfully submitted the payment via PayPal!
                                            </span>
								        </td>
							        </tr>

            </td>
        </tr>
    </table>
</asp:Content>
