<%@ Page Title="Home Page" Language="c#" MasterPageFile="~/Site.master"  %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 301px;
        }
    </style>

<link rel="stylesheet" type="text/css" href="/JS/style.css">
<link rel="stylesheet" type="text/css" href="/Financials/jcarousel.basic.css">

<script type="text/javascript" src="/JS/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/JS/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="/JS/jcarousel.basic.js"></script>

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="bodyoutline">
        <tr>
            <td>

        <div class="wrapper">
            <h1>Basic carousel</h1>

            <p>This example shows how to setup a basic carousel with prev/next controls and pagination.</p>

            <div class="jcarousel-wrapper">
                <div class="jcarousel">
                    <ul>
                        <li><img src="/Images/sponsors/sponsor2.jpg" alt="" width="800" height="150" ></li>
                        <li><img src="/Images/sponsors/sponsor1.jpg" alt="" width="800" height="150" ></li>
                    </ul>
                </div>

                <p class="photo-credits">
                    Photos by <a href="http://www.mw-fotografie.de">Marc Wiegelmann</a>
                </p>

                <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                <a href="#" class="jcarousel-control-next">&rsaquo;</a>
                
                <p class="jcarousel-pagination">
                    
                </p>
            </div>
        </div>

    </body>
</html>


            </td>

        </tr>


        </table>
    
</asp:Content>
