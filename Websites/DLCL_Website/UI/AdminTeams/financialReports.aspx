<%@ Page Language="c#" MasterPageFile="~/SiteAdmin.Master" Inherits="Cricket.AdminTeams.financialReports" CodeFile="financialReports.aspx.cs"
    CodeFileBaseClass="Cricket.PageBaseAdmin" %>

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
                                        <span>DCL Financial Reports</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
							    <tr>
								    <td  colspan="2" class="infoData" align="left"><font size="2">
									    The following links provide access to the yearly financial accounts. 
									    <br />
<br />
<a href="/Financials/DCL_Financials_2009_to_2016.xlsx">Year 2009 -2016</a>
<br />
<a href="/Financials/DCL-2010_2011_2012_2013-Accounting-01.xlsx">Year 2009 2010 2011 2012 2013</a>
									    <br />
									    <a href="/Financials/DCL-2009-Accounting-01.xls">Year 2009</a>
									    <br />
									    <a href="/Financials/DCL-2008-Accounting-03.xls">Year 2008</a>
									    <br />
									    <br />
									    Previous year financials will be uploaded soon!
									    </font>
								    </td>
							    </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
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
                