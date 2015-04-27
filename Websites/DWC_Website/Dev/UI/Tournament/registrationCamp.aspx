<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteTournament.master" Inherits="Cricket.Tournament.registrationCamp" CodeFile="registrationCamp.aspx.cs" CodeFileBaseClass="Cricket.PageBaseTournament" %>

<asp:Content ID="Control1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <tr>
            <td align="left" valign="top" >
                <table id="TableMain" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" align="left">
                            <!-- custom code start -->
                            <div runat="server">
							    <table id="Table1" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							        <tr>
								        <td colSpan="2" class="title">Player Registration Form
                                        </td>
							        </tr>
								    <tr>
									    <td align="center">
										    &nbsp; 
									    </td>
								    </tr>
					                <tr>
						                <td class="infoData" align="left">
                                            <span class="infoLabel">Registration Start Date: &nbsp;&nbsp;</span>
                                            <asp:Label id="lblRegStartDate" CssClass="infoData" runat="server"></asp:Label>  
                                            <br />
                                            <span class="infoLabel">Registration &nbsp;End &nbsp;Date: &nbsp;&nbsp;</span>
							                <asp:Label id="lblRegEndDate" CssClass="infoData" runat="server"></asp:Label>
						                </td>
					                </tr>
							        <tr>
								        <td align="left" class="infoLabel">Registration Fees:&nbsp;&nbsp;
									        $<asp:Label id="lblFees" runat="server"></asp:Label>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        &nbsp;</td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <P align="left"></SPAN><SPAN class="infoData"><STRONG>Note</STRONG>: <EM><U>All 
                                                players are 
													    required to register before the registration deadline and submit their registration fees by paypal 
                                            during the registration process</U></EM> . Players can use a paypal account <U>OR </U>any credit 
											    card to pay the fees on the secured paypal website. A player will not be 
                                            considered as registered unless the registration fees has been payed in full via paypal.</SPAN></P>
									        <P align="left"><SPAN class="infoData"><STRONG>Note: </STRONG>After you submit this 
											        page you will be redirected to the confirmation and payment page where you can 
											        continue to paypal to complete the fees payment. After paypal payment 
                                                process is complete, you will see a confirmation message which will indicate 
                                                that your registration is complete. P</STRONG>lease inform the 
											        organizers, if you get any errors during this process.</SPAN></P>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
                                </table>                           
                            </div>

                            <div id="divRegClose" runat="server" visible="true">
							    <table id="Table2" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							        <tr>
								        <td align="center" colSpan="2">
									        &nbsp;
								        </td>
							        </tr>
							        <tr>
								        <td colspan="2">
                                            <div id="divNotStarted" runat="server" visible="false" class="infoLabel">
									            Registration will be open from 
                                                <asp:Label ID="lblStartDate" CssClass="infoData" Runat="server"></asp:Label>
                                                till 
                                                <asp:Label ID="lblEndDate" CssClass="infoData" Runat="server"></asp:Label>
                                            </div>
                                            <div id="divClosed" runat="server" visible="false" class="infoLabel">
									            Registration is now closed!
                                            </div>
								        </td>
							        </tr>
                                </table>
                            </div>

                            <div id="divRegOpen" runat="server" visible="false">
							    <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
							        <tr>
								        <td align="left" colSpan="2">
									        <asp:label id="lblMessage" runat="server" Width="600px" ForeColor="DarkRed" CssClass="infoData"></asp:label>
									        <br />
                                            <strong>Please enter all the fields...</strong>
                                            <br />
                                            <br />
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                                DataSourceID="SqlDataSource1" DefaultMode="Insert" EnableModelValidation="True" 
                                                Height="50px" Width="532px" BorderStyle="Solid">
                                                <Fields>
                                                    <asp:TemplateField HeaderText="Player First Name" SortExpression="first_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20" Text='<%# Bind("first_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20" Text='<%# Bind("first_name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" MaxLength="20" Text='<%# Bind("first_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Player Last Name" SortExpression="last_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Text='<%# Bind("last_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Text='<%# Bind("last_name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" MaxLength="20" Text='<%# Bind("last_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Male/Female" SortExpression="male_female">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Text='<%# Bind("male_female") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Text='<%# Bind("male_female") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox3" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" MaxLength="20" Text='<%# Bind("male_female") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Phone-home" SortExpression="phone_home">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="20" Text='<%# Bind("phone_home") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="15" Text='<%# Bind("phone_home") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" MaxLength="20" Text='<%# Bind("phone_home") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Phone-cell (optional)" SortExpression="phone_cell">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="20" Text='<%# Bind("phone_cell") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="15" Text='<%# Bind("phone_cell") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox6" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" MaxLength="20" Text='<%# Bind("phone_cell") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Enter Team Name (if known)" SortExpression="school_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="20" Text='<%# Bind("school_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="50" Text='<%# Bind("school_name") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" MaxLength="20" Text='<%# Bind("school_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Skill Level (Beginner/Average/Expert) (optional)" 
                                                        SortExpression="skill_level">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox9" runat="server" MaxLength="20" Text='<%# Bind("skill_level") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox9" runat="server" MaxLength="15" Text='<%# Bind("skill_level") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label9" runat="server" MaxLength="20" Text='<%# Bind("skill_level") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address" SortExpression="address">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox11" runat="server" MaxLength="20" Text='<%# Bind("address") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox11" runat="server" MaxLength="100" Text='<%# Bind("address") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox11" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label11" runat="server" MaxLength="20" Text='<%# Bind("address") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Provide this info: Can you bowl full arm over the shoulder?" SortExpression="comments">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox12" runat="server" MaxLength="100" Text='<%# Bind("comments") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox12" runat="server" MaxLength="100" Text='<%# Bind("comments") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox12" ID="RequiredFieldValidator121" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label12" runat="server" MaxLength="20" Text='<%# Bind("comments") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Fields>
                                            </asp:DetailsView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
                                                SelectCommand="SELECT * FROM [player_registration]" 
                                                InsertCommand="INSERT INTO player_registration(comments, address, skill_level, school_name, phone_cell, phone_home, male_female, last_name, first_name) 
                                                VALUES (@comments, @address, @skill_level, @school_name, @phone_cell, @phone_home, @male_female, @last_name, @first_name)">
                                            </asp:SqlDataSource>
									        <br>
								        </td>
							        </tr>
							        <tr>
								        <td align="center" colSpan="2">
									        <hr class="hr">
								        </td>
							        </tr>
							        <tr>
								        <td align="right"></td>
								        <td>
									        <span class="infoData">
                                            You will be taken to the secure PayPal website! 
									        <br>
                                            Your registration will be confirmed only after you have successfully submitted the payment via PayPal!
                                            </span>
									        <br>
									        <br>
                                            <asp:button id="btnSubmit" Enabled="true" tabIndex="12" runat="server" CssClass="btnAdmin"
										        Text="Pay via PayPal" OnClick="btnSubmit_Click"></asp:button>
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
            </td>
        </tr>
    </table>
</asp:Content>
