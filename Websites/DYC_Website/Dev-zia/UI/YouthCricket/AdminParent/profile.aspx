<%@ Page language="c#" AutoEventWireup="true" MasterPageFile="~/SiteTournament.master" Inherits="Cricket.AdminParent.profile" CodeFile="profile.aspx.cs" CodeFileBaseClass="Cricket.PageBase" %>

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
								        <td colSpan="2" class="title">Manage Profiles</td>
							        </tr>
								    <tr>
									    <td align="left">
                                            &nbsp; 
									    </td>
								    </tr>
                                </table>                           
                            </div>

                            <div id="divParent" runat="server" visible="true">
							    <table id="TableCustom" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
								    <tr>
									    <td align="left" colSpan="2">
										    <br />
                                            <b>Parent Profile</b>
                                            &nbsp; 
									    </td>
								    </tr>
							        <tr>
								        <td align="left" colSpan="2">
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="pr_id"
                                                DataSourceID="SqlDataSource1" EnableModelValidation="True" 
                                                Height="50px" Width="532px" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                                <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White" />
                                                <Fields>
                                                    <asp:BoundField DataField="pr_id" HeaderText="pr_id" SortExpression="pr_id" Visible="False" />
                                                    <asp:BoundField DataField="g1_name" HeaderText="Mother's Name" SortExpression="g1_name" />
                                                    <asp:BoundField DataField="g2_name" HeaderText="Father's Name" SortExpression="g2_name" />
                                                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                                                    <asp:BoundField DataField="g1_phone_home" HeaderText="Phone (Home)" SortExpression="g1_phone_home" />
                                                    <asp:BoundField DataField="g1_phone_cell" HeaderText="Phone (Cell)" SortExpression="g1_phone_cell" />
                                                    <asp:BoundField DataField="g1_phone_work" HeaderText="Phone (Work)" SortExpression="g1_phone_work" />
                                                    <asp:BoundField DataField="g1_email" HeaderText="Email" SortExpression="g1_email" />
                                                    <asp:BoundField DataField="emergency_name" HeaderText="Emergency Name" SortExpression="emergency_name" />
                                                    <asp:BoundField DataField="emergency_contact" HeaderText="Emergency Contact" SortExpression="emergency_contact" />
                                                    <asp:BoundField DataField="created_dt" HeaderText="created_dt" SortExpression="created_dt"  Visible="False"/>
                                                    <asp:BoundField DataField="mod_dt" HeaderText="mod_dt" SortExpression="mod_dt"  Visible="False"/>
                                                    <asp:CommandField ButtonType="Button" DeleteText="" ShowEditButton="True" />
                                                </Fields>
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                            </asp:DetailsView>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
                                                SelectCommand="SELECT * FROM [parent_registration] where [pr_id] = @PRID" 
                                                UpdateCommand="UPDATE [parent_registration] set 
                                                g1_name = @g1_name,
                                                address = @address,
                                                g1_phone_cell = @g1_phone_cell,
                                                g1_phone_work = @g1_phone_work,
                                                g1_phone_home = @g1_phone_home,
                                                g1_email = @g1_email,
                                                g2_name = @g2_name,
                                                emergency_name = @emergency_name,
                                                emergency_contact = @emergency_contact,
                                                mod_dt = GetDate()
                                                where [pr_id] = @PRID"
                                                >
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="PRID" Type="Int32" ControlID="lblPRID" PropertyName="Text"></asp:ControlParameter>
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:ControlParameter Name="PRID" Type="Int32" ControlID="lblPRID" PropertyName="Text"></asp:ControlParameter>
                                                    <asp:Parameter Name="g1_name" />
                                                    <asp:Parameter Name="g1_address" />
                                                    <asp:Parameter Name="g1_phone_cell" />
                                                    <asp:Parameter Name="g1_phone_work" />
                                                    <asp:Parameter Name="g1_phone_home" />
                                                    <asp:Parameter Name="g1_email" />
                                                    <asp:Parameter Name="g2_name" />
                                                    <asp:Parameter Name="emergency_name" />
                                                    <asp:Parameter Name="emergency_contact" />
                                                </UpdateParameters>
                                             
                                            </asp:SqlDataSource>
									        <br>
								        </td>
							        </tr>

								    <tr>
									    <td align="left" colSpan="2">
                							<asp:label id="lblMessage" runat="server" Width="600px" ForeColor="DarkRed" CssClass="infoData"></asp:label>
                							<asp:label id="lblPRID" visible="false" runat="server" Width="600px" ForeColor="DarkRed" CssClass="infoData"></asp:label>
									    </td>
								    </tr>

						        </table>
                            </div>
							<br>
							<br>
                            <div id="divKids" runat="server" visible="true">
							    <table id="Table2" width="96%" border="0" align="center" cellpadding="2" cellspacing="2">
								    <tr>
									    <td align="left" colSpan="2">
                                            <b>Kid Profiles</b><br />
									    </td>
								    </tr>
								    <tr>
									    <td align="left" colSpan="2" >
										    <asp:Button ID="btnAddKid" runat="server" Text="Add New Kid" OnClick="btnAddKid_Click" />
										    <br />
									    </td>
								    </tr>
								    <tr>
									    <td align="left" colSpan="2">

                                             <asp:GridView ID="GridView1" Runat="server" AutoGenerateColumns="False" DataKeyNames="kid_id"
                                               DataSourceID="SqlDataSource2" CellPadding="4" AllowSorting="True" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                                               <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775"></PagerStyle>
                                               <HeaderStyle ForeColor="White" Font-Bold="True" BackColor="#5D7B9D"></HeaderStyle>
                                                 <EditRowStyle BackColor="#999999" />
                                               <EmptyDataTemplate>
                                                    No kids have been registered yet. Please select the option above to register a kid!
                                               </EmptyDataTemplate>
                                                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                               <Columns>
                                                    <asp:BoundField DataField="kid_id" HeaderText="kid_id" SortExpression="kid_id" Visible="False" />
                                                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                                    <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" />
                                                    <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
                                                    <asp:BoundField DataField="phone_cell" HeaderText="Phone (Cell)" SortExpression="phone_cell" />
                                                    <asp:BoundField DataField="shirt_size" HeaderText="T.Shirt Size" SortExpression="shirt_size" />
                                                    <asp:BoundField DataField="skills_bowling" HeaderText="Bowling Skills Level" SortExpression="skills_bowling" />
                                                    <asp:BoundField DataField="skills_batting" HeaderText="Batting Skills Level" SortExpression="skills_batting" />
                                                    <asp:BoundField DataField="skills_wktkeeper" HeaderText="Wicket Keeping Skills Level" SortExpression="skills_wktkeeper" />
                                                    <asp:BoundField DataField="skills_fielding" HeaderText="Fielding Skills Level" SortExpression="skills_fielding" />
                                                    <asp:BoundField DataField="created_dt" HeaderText="created_dt" SortExpression="created_dt" Visible="False" />
                                                    <asp:BoundField DataField="mod_dt" HeaderText="mod_dt" SortExpression="mod_dt" Visible="False" />
                                                    <asp:CommandField ShowSelectButton="True" />

                                                </Columns>
                                                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle ForeColor="#333333" Font-Bold="True" BackColor="#E2DED6"></SelectedRowStyle>
                                            </asp:GridView>
 
                                            <br />
                                            <br />

                                            <asp:DetailsView ID="DetailsView3" Runat="server" DataKeyNames="kid_id" DataSourceID="SqlDataSource3"
                                            CellPadding="3" BorderStyle="Solid" BorderColor="#999999" BorderWidth="1px" BackColor="White" AutoGenerateRows="False" 
                                                Height="50px" Width="532px" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" OnItemDeleted="DetailsView3_ItemDeleted" OnItemUpdated="DetailsView3_ItemUpdated" >

                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <Fields>
                                                    <asp:BoundField DataField="kid_id" HeaderText="kid_id" SortExpression="kid_id" Visible="False" />
                                                    <asp:TemplateField HeaderText="Name" SortExpression="name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                                    <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" />
                                                    <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
                                                    <asp:BoundField DataField="phone_cell" HeaderText="Phone (Cell)" SortExpression="phone_cell" />
                                                    <asp:BoundField DataField="shirt_size" HeaderText="T.Shirt Size" SortExpression="shirt_size" />
                                                    <asp:BoundField DataField="skills_bowling" HeaderText="Bowling Skills Level" SortExpression="skills_bowling" />
                                                    <asp:BoundField DataField="skills_batting" HeaderText="Batting Skills Level" SortExpression="skills_batting" />
                                                    <asp:BoundField DataField="skills_wktkeeper" HeaderText="Wicket Keeping Skills Level" SortExpression="skills_wktkeeper" />
                                                    <asp:BoundField DataField="skills_fielding" HeaderText="Fielding Skills Level" SortExpression="skills_fielding" />
                                                    <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />
                                                    <asp:BoundField DataField="created_dt" HeaderText="created_dt" SortExpression="created_dt" Visible="False" />
                                                    <asp:BoundField DataField="mod_dt" HeaderText="mod_dt" SortExpression="mod_dt" Visible="False" />
                                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowDeleteButton="True" />
                                           </Fields>
                                           <HeaderStyle ForeColor="White" Font-Bold="True" BackColor="Black"></HeaderStyle>
                                             <AlternatingRowStyle BackColor="#CCCCCC" />
                                           <EditRowStyle ForeColor="White" Font-Bold="True" BackColor="Gray"></EditRowStyle>
                                         </asp:DetailsView> 

									    </td>
								    </tr>
							        <tr>
								        <td align="left" colSpan="2">
                                            <br />


 <asp:SqlDataSource ID="SqlDataSource2" Runat="server" ConflictDetection="CompareAllValues"
   ConnectionString="<%$ ConnectionStrings:dallascricketleague %>" 
   SelectCommand="SELECT * FROM [parent_kids] WHERE ([pr_id] = @PRID)" 
   >
   <SelectParameters>
     <asp:ControlParameter Name="PRID" Type="Int32" ControlID="DetailsView1" PropertyName="SelectedValue"></asp:ControlParameter>
   </SelectParameters>
   <DeleteParameters>
     <asp:ControlParameter Name="ID" Type="Int32" ControlID="GridView1" PropertyName="SelectedValue"></asp:ControlParameter>
   </DeleteParameters>
 </asp:SqlDataSource> 


 <asp:SqlDataSource ID="SqlDataSource3" Runat="server" ConnectionString="<%$ ConnectionStrings:dallascricketleague %>"
     SelectCommand="SELECT * FROM [parent_kids] WHERE ([kid_id] = @ID)" 
     DeleteCommand="DELETE [parent_kids] WHERE ([kid_id] = @ID)" 
     UpdateCommand="UPDATE [parent_kids] SET 
     Name = @Name, 
     gender = @gender, 
     dob = @dob, 
     age = @age, 
     phone_cell = @phone_cell , 
     shirt_size = @shirt_size , 
     skills_bowling = @skills_bowling, 
     skills_batting = @skills_batting, 
     skills_wktkeeper = @skills_wktkeeper, 
     skills_fielding = @skills_fielding, 
     comments = @comments, 
     mod_dt = GetDate()
     WHERE kid_id = @ID" 
    >
   <SelectParameters>
     <asp:ControlParameter Name="ID" Type="Int32" ControlID="GridView1" PropertyName="SelectedValue"></asp:ControlParameter>
   </SelectParameters>
   <DeleteParameters>
     <asp:ControlParameter Name="ID" Type="Int32" ControlID="GridView1" PropertyName="SelectedValue"></asp:ControlParameter>
   </DeleteParameters>
   <UpdateParameters>
     <asp:ControlParameter Name="ID" Type="Int32" ControlID="GridView1" PropertyName="SelectedValue"></asp:ControlParameter>
    <asp:Parameter Name="name" />
    <asp:Parameter Name="gender" />
    <asp:Parameter Name="dob" />
    <asp:Parameter Name="age" />
    <asp:Parameter Name="phone_cell" />
    <asp:Parameter Name="skills_bowling" />
    <asp:Parameter Name="skills_batting" />
    <asp:Parameter Name="skills_wktkeeper" />
    <asp:Parameter Name="skills_fielding" />
    <asp:Parameter Name="comments" />
   </UpdateParameters>
 </asp:SqlDataSource> 

									        <br>
								        </td>
							        </tr>

						        </table>
                            </div>
                            <!-- custom code end -->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
