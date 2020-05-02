---
layout: post
blogengineid: 600a0bbc-5e22-4bd2-bef2-542d70e682b2
title: "Virtual Earth Plus ASP.NET AJAX Breaks In Safari!"
date: 2008-02-07 00:51:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/02/07/Virtual-Earth-Plus-ASPNET-AJAX-Breaks-In-Safari!.aspx
  - /post/2008/02/07/Virtual-Earth-Plus-ASPNET-AJAX-Breaks-In-Safari!
  - /post/2008/02/07/virtual-earth-plus-aspnet-ajax-breaks-in-safari!
  - /post.aspx?id=600a0bbc-5e22-4bd2-bef2-542d70e682b2
---
<!-- more -->

**Update 5/17/2008:** This issue has since been fixed with the release of the Virtual Earth v6.1 release. There is still a small issue related to the CalendarExtender and Virtual Earth that only occurs in Safari. You can read more about it <a href="/post.aspx?id=c75cbc89-6abf-4869-914d-6176bb6c7736">here</a>.

 

I do alot of development with ASP.NET AJAX and Virtual Earth, and each of them work fine by themselves in Safari 3 on Windows. However, if you use them both on the same page, it will cause ASP.NET AJAX to break and stop working in Safari.

This issue comes up when you include the Virtual Earth API JavaScript file in the page. You don't even need to create an instance of VE on the page to cause the issue to occur.

I don't have a Mac, so keep in mind that I haven't tested this in Safari on the Mac. I've only verified this issue in Safari 3 on Windows.

Below is a code example using the CalendarExtender in the Ajax Control Toolkit to demonstrate the issue. If you run the following code, you will notice that when you click on the textbox in Safari, the calendar never pops up, and the JavaScript console will register a couple exceptions in the ASP.NET AJAX Extensions JavaScript code.

[code:html]
 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="SafariTest.aspx.cs" Inherits="SafariTest" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
 <title>Untitled Page</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6" mce_src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6"></script>
 <script type="text/javascript"> var map = null; function GetMap() { map = new VEMap('myMap'); map.LoadMap(); } </script>
 </head>
 <body onload="GetMap();">
 <form id="form1" runat="server">
 <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
 <div>
 <asp:TextBox runat="server" id="txtDate"></asp:TextBox>
 <ajaxToolkit:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="txtDate"></ajaxToolkit:CalendarExtender>
 


 <div id='myMap' style="position:relative; width:400px; height:400px;"></div>
 </div>
 </form>
 </body>
 </html>
 ```

This is a real issue for me, since I can not add Safari support to my <a href="http://simplovation.com/Page/WebMapsVE.aspx">Web.Maps.VE</a> product because of this issue. I know it's probably an issue with Safari, since everything works perfect in IE and Firefox, but I hope it gets fixed soon.
