<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Cricket.Student._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <ajaxtoolkit:toolkitscriptmanager id="ToolKitScriptManager1" runat="server"></ajaxtoolkit:toolkitscriptmanager>
    <style>
        videoWrapper {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            padding-top: 5px;
            height: 0;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .videoWrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .video-wrapper {
            position: relative;
            padding-bottom: 20%;
            height: 0;
        }

        .video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #ccc; /* Random BG colour for unloaded video elements */
        }
    </style>
    <style type="text/css">
        body
        {
            font-family: Verdana;
            font-size: 14px;
        }
        /* Accordion */
        .accordionHeader
        {
            border: 1px solid #2F4F4F;
            color: white;
            background-color: #2E4d7B;
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top: 5px;
            cursor: pointer;
        }
 
        #master_content .accordionHeader a
        {
            color: #FFFFFF;
            background: none;
            text-decoration: none;
        }
 
        #master_content .accordionHeader a:hover
        {
            background: none;
            text-decoration: underline;
        }
 
        .accordionHeaderSelected
        {
            border: 1px solid #2F4F4F;
            color: white;
            background-color: #5078B3;
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top: 5px;
            cursor: pointer;
        }
    </style>
    <style>
        html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,abbr,address,cite,code,del,dfn,em,img,ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;outline:0;font-size:100%;vertical-align:baseline;background:transparent}
        body{line-height:1; font-family: arial;}
        h1{font-size: 25px;}h2{font-size: 21px;}h3{font-size: 18px;}h4{font-size: 16px;}
        article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}
        nav ul{list-style:none}
        blockquote,q{quotes:none}
        blockquote:before,blockquote:after,q:before,q:after{content:none}
        a{margin:0;padding:0;font-size:100%;vertical-align:baseline;background:transparent}
        ins{background-color:#ff9;color:#000;text-decoration:none}
        mark{background-color:#ff9;color:#000;font-style:italic;font-weight:bold}
        del{text-decoration:line-through}
        abbr[title],dfn[title]{border-bottom:1px dotted;cursor:help}
        table{border-collapse:collapse;border-spacing:0}
        hr{display:block;height:1px;border:0;border-top:1px solid #ccc;margin:1em 0;padding:0}
        input,select{vertical-align:middle}

        body,html {
            background-color: #FFF;
        }
        header {
            background: #AEC6CF;
            padding: 20px 30px;
            max-width: 940px;
            margin: auto;
        }
        nav {
            display: inline-block;
        }
        nav ul li a {
            background: #EEE;
            padding: 2px 10px;
            font-size: 20px;
            text-decoration: none;
            font-weight: bold;
            color: #444;
            border-radius: 10px;
        }
        nav ul li a:hover {
            background: #FFF;
        }
        nav ul li {
            display: inline-block;
            margin: 10px;
        }
        nav ul {
            list-style: none;
        }
        #pageContent {
            max-width: 1000px;
            margin: auto;
            border: none;
        }
        main {
            float: left;
            width: 70%;
        }
        aside {
            float: right;
            width: 20%;
        }
        article {
            border-bottom: 2px dotted #999;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        article h2 {
            font-weight: normal;
            margin-bottom: 12px;
        }
        article p {
	
        }
        main section {
	
        }
        footer {
            background: #AEC6CF;
            max-width: 1000px;
            margin: auto;
            clear: both;
            text-align: right;
        }
        footer p {
            padding: 20px;
        }
        address {
            padding: 10px 20px 30px 10px;
        }
        aside > div {
            margin: 10px auto;
            background: #AEC6CF;
            min-height: 100px;
        }
        #logo {
            display: inline-block;
            vertical-align: middle;
            font-size: 30px;
            margin-right: 75px;
            color: #FFF;
        }
        #logo img {
            width: 50px;
            vertical-align: middle;
            margin-right: 10px;
        }
        body > section {
            max-width: 1000px;
            margin: auto;
            padding: 30px 0px;
            border-bottom: 1px solid #999;
            color: #333;
        }

        @media screen and (max-width: 1000px) {
            body > section {
                padding: 30px 20px;
            }
        }
        @media screen and (max-width: 600px) {
            main {
                float: none;
                width: 100%;
            }
            aside {
                float: none;
                width: 100%;
            }

        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    
    <header>
		<div id="logo"><img src="../img/DCLNewLogo.jpg">Umpiring Videos&nbsp;</div>
	<%--	<nav>  
			<ul>
				<li><a href="/">Home</a>
				<li><a href="https://html-css-js.com/">HTML</a>
				<li><a href="https://html-css-js.com/css/code/">CSS</a>
				<li><a href="https://htmlcheatsheet.com/js/">JS</a>
			</ul>
		</nav>--%>
	</header>
<%--	<section>
		<strong>Demonstration of a simple page layout using HTML5 tags: header, nav, section, main, article, aside, footer, address.</strong>
	</section>--%>
	<section id="pageContent">
		<main role="main">
            <article></article>
            <article>
                <div>
              <ajaxtoolkit:accordion id="Accordion1" autosize="None" runat="server" width="600px" suppressheaderpostbacks="true" requireopenedpane="false" transitionduration="250" framespersecond="40" fadetransitions="false" contentcssclass="accordionContent" headerselectedcssclass="accordionHeaderSelected" headercssclass="accordionHeader" selectedindex="0">
     <panes>
         <ajaxtoolkit:accordionpane id="AccordionPane5" runat="server">
             <header>
                 <%--//--- Heading -----%>
                 <span class="accordionLink">1. First Video</span>
             </header>
             <%--//--- Content -----%>
             <content>
                 <h2>
                     Introduction
                 </h2>
                 <p>
                     View videos below
                 </p>
                 <video src="../Videos/DCLUmpiringIntroduction1.mp4" controls="controls" />
          
                 
             
             </content>
         </ajaxtoolkit:accordionpane>
         <ajaxtoolkit:accordionpane id="AccordionPane6" runat="server">
             <%--//--- Heading -----%>
             <header>
                 <span class="accordionLink">2. Second Video</span>
             </header>
             <%--//--- Content -----%>
             <content>
                 <h2>
                    Introduction
                 </h2>
                 <p>
                    View videos below
                 </p>
                 <video src="../Videos/2DCLGroup1Rules" controls="controls" />

             </content>
         </ajaxtoolkit:accordionpane>
         <ajaxtoolkit:accordionpane id="AccordionPane7" runat="server">
             <%--//--- Heading -----%>
             <header>
                 <span class="accordionLink">3. Third Video</span>
             </header>
             <%--//--- Content -----%>
             <content>
                 <h2>
                     Introduction
                 </h2>
                 <p>
                     View videos below
                 </p>
                 <video src="../Videos/3DCLGroup2Rules" controls="controls" />

             </content>
         </ajaxtoolkit:accordionpane>
         <ajaxtoolkit:accordionpane id="AccordionPane8" runat="server">
             <%--//--- Heading -----%>
             <header>
                 <span class="accordionLink">4. Fourth Video</span>
             </header>
             <%--//--- Content -----%>
             <content>
                More info about fourth video.
             </content>
         </ajaxtoolkit:accordionpane>
     </panes>
 </ajaxtoolkit:accordion>
    </div>
            </article>
			
		
		</main>
		<aside>
			<div><a href="~/default.aspx">DLCL Page</a></div>
			
		</aside>
	</section>
	<footer>
		<p>&copy; Copyright ©DCL All Rights Reserved.</p>
		<address>
			Contact: <a href="dclmgmnt@gmail.com">Contact Us</a>
		</address>
	</footer>

    </form>
</body>
</html>

