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
                                                    <asp:TemplateField HeaderText="Date of Birth (mm/dd/yyyy)" SortExpression="dob">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox4" runat="server" MaxLength="15" Text='<%# Bind("dob") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox4" runat="server" MaxLength="15" Text='<%# Bind("dob") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox4" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" MaxLength="20" Text='<%# Bind("dob") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Phone-home" SortExpression="phone_home">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="20" Text='<%# Bind("phone_home") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="15" Text='<%# Bind("phone_home") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox5" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
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
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" MaxLength="20" Text='<%# Bind("phone_cell") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="School Name" SortExpression="school_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="20" Text='<%# Bind("school_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="50" Text='<%# Bind("school_name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox7" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" MaxLength="20" Text='<%# Bind("school_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="School Grade" SortExpression="school_grade">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox8" runat="server" MaxLength="20" Text='<%# Bind("school_grade") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox8" runat="server" MaxLength="15" Text='<%# Bind("school_grade") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox8" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" MaxLength="20" Text='<%# Bind("school_grade") %>'></asp:Label>
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
                                                    <asp:TemplateField HeaderText="Shirt Size (optional)" SortExpression="shirt_size">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox10" runat="server" MaxLength="20" Text='<%# Bind("shirt_size") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox10" runat="server" MaxLength="20" Text='<%# Bind("shirt_size") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label10" runat="server" MaxLength="20" Text='<%# Bind("shirt_size") %>'></asp:Label>
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
                                                    <asp:TemplateField HeaderText="Provide this info: Can your child bowl full arm over the shoulder? Which group should he play - under10/under12/under17?" SortExpression="comments">
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
                                                    <asp:TemplateField HeaderText="Guardian1 First Name" 
                                                        SortExpression="g1_first_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox13" runat="server" MaxLength="20" Text='<%# Bind("g1_first_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox13" runat="server" MaxLength="20" Text='<%# Bind("g1_first_name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox13" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label13" runat="server" MaxLength="20" Text='<%# Bind("g1_first_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian1 Last Name" 
                                                        SortExpression="g1_last_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox14" runat="server" MaxLength="20" Text='<%# Bind("g1_last_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox14" runat="server" MaxLength="20" Text='<%# Bind("g1_last_name") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox14" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label14" runat="server" MaxLength="20" Text='<%# Bind("g1_last_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian1 Male/Female" 
                                                        SortExpression="g1_male_female">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox15" runat="server" MaxLength="20" Text='<%# Bind("g1_male_female") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox15" runat="server" MaxLength="10" Text='<%# Bind("g1_male_female") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox15" ID="RequiredFieldValidator14" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label15" runat="server" MaxLength="20" Text='<%# Bind("g1_male_female") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian1  Phone-cell" 
                                                        SortExpression="g1_phone_cell">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox16" runat="server" MaxLength="20" Text='<%# Bind("g1_phone_cell") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox16" runat="server" MaxLength="15" Text='<%# Bind("g1_phone_cell") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox16" ID="RequiredFieldValidator15" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label16" runat="server" MaxLength="20" Text='<%# Bind("g1_phone_cell") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian1 Phone-work (optional)" 
                                                        SortExpression="g1_phone_work">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox17" runat="server" MaxLength="20" Text='<%# Bind("g1_phone_work") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox17" runat="server" MaxLength="15" Text='<%# Bind("g1_phone_work") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label17" runat="server" MaxLength="20" Text='<%# Bind("g1_phone_work") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian1 Email" SortExpression="g1_email1">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox18" runat="server" MaxLength="20" Text='<%# Bind("g1_email1") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox18" runat="server" MaxLength="40" Text='<%# Bind("g1_email1") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ControlToValidate="TextBox18" ID="RequiredFieldValidator17" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label18" runat="server" MaxLength="20" Text='<%# Bind("g1_email1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian1 - Available to Volunteer?" 
                                                        SortExpression="g1_volunteer">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox20" runat="server" MaxLength="20" Text='<%# Bind("g1_volunteer") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox20" runat="server" MaxLength="100" Text='<%# Bind("g1_volunteer") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label20" runat="server" MaxLength="20" Text='<%# Bind("g1_volunteer") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian2 First Name (optional)" 
                                                        SortExpression="g2_first_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox21" runat="server" MaxLength="20" Text='<%# Bind("g2_first_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox21" runat="server" MaxLength="20" Text='<%# Bind("g2_first_name") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label21" runat="server" MaxLength="20" Text='<%# Bind("g2_first_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian2 Last Name (optional)" 
                                                        SortExpression="g2_last_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox22" runat="server" MaxLength="20" Text='<%# Bind("g2_last_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox22" runat="server" MaxLength="20" Text='<%# Bind("g2_last_name") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label22" runat="server" MaxLength="20" Text='<%# Bind("g2_last_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian2 Male/Female (optional)" 
                                                        SortExpression="g2_male_female">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox23" runat="server" MaxLength="20" Text='<%# Bind("g2_male_female") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox23" runat="server" MaxLength="10" Text='<%# Bind("g2_male_female") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23" runat="server" MaxLength="20" Text='<%# Bind("g2_male_female") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian2 Phone-cell (optional)" 
                                                        SortExpression="g2_phone_cell">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox24" runat="server" MaxLength="20" Text='<%# Bind("g2_phone_cell") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox24" runat="server" MaxLength="15" Text='<%# Bind("g2_phone_cell") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label24" runat="server" MaxLength="20" Text='<%# Bind("g2_phone_cell") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian2 Phone-work (optional)" 
                                                        SortExpression="g2_phone_work">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox25" runat="server" MaxLength="20" Text='<%# Bind("g2_phone_work") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox25" runat="server" MaxLength="15" Text='<%# Bind("g2_phone_work") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label25" runat="server" MaxLength="20" Text='<%# Bind("g2_phone_work") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Guardian2 Email (optional)" SortExpression="g2_email1">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox26" runat="server" MaxLength="20" Text='<%# Bind("g2_email1") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox26" runat="server" MaxLength="40" Text='<%# Bind("g2_email1") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label26" runat="server" MaxLength="20" Text='<%# Bind("g2_email1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Fields>
                                            </asp:DetailsView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
                                                SelectCommand="SELECT * FROM [player_registration]" 
                                                InsertCommand="INSERT INTO player_registration(g2_email2, g2_email1, g2_phone_work, g2_male_female, g2_last_name, g2_first_name, g1_volunteer, g1_email2, g1_email1, g1_phone_work, g1_phone_cell, g1_male_female, g1_last_name, g1_first_name, comments, address, shirt_size, skill_level, school_grade, school_name, phone_cell, phone_home, dob, male_female, last_name, first_name, g2_phone_cell) VALUES ('', @g2_email1, @g2_phone_work, @g2_male_female, @g2_last_name, @g2_first_name, @g1_volunteer, '', @g1_email1, @g1_phone_work, @g1_phone_cell, @g1_male_female, @g1_last_name, @g1_first_name, @comments, @address, @shirt_size, @skill_level, @school_grade, @school_name, @phone_cell, @phone_home, @dob, @male_female, @last_name, @first_name, @g2_phone_cell)">
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
