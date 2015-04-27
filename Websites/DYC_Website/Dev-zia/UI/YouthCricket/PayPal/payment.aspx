<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="Cricket.Paypal.payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<body onload="document.Paypal.submit();">
    <form id="Paypal" name="Paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
	    <input type="hidden" name="cmd" value="_cart" /> 
        <input type="hidden" name="upload" value="1" />
	    <input type="hidden" name="item_name" value="<%=Session["Paypal_TeamName"]%>" />
	    <input name="item_number" type="hidden" id="item_number" value="1" /> 
        <input type="hidden" name="item_name_1" value="<%=Session["Paypal_TeamName"]%>" />
	    <input type="hidden" name="amount_1" value="<%=Session["Paypal_Fees"]%>" /> 
	    <input type="hidden" name="tax_cart" value="0.00" /> 
	    <input type="hidden" name="business" value="icricketa@gmail.com" /> 
        <input type="hidden" name="invoice" value="<%=Session["Paypal_OrderId"]%>" />
	    <input type="hidden" name="no_note" value="0" /> 
        <input type="hidden" name="currency_code" value="USD" />
	    <input type="hidden" name="lc" value="0" />
        <input type="hidden" name="return" value="http://www.youthcricket.net/PayPal/paymentSuccess.aspx" />
	    <input type="hidden" name="cancel_return" value="http://www.youthcricket.net/Paypal/paymentCancel.aspx" />
	    <input type="hidden" name="notify_url" value="http://www.youthcricket.net/PayPal/paymentSuccess.aspx" />
    </form>
</body>
</html>

