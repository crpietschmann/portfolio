---
layout: post
id: f1e2ea63-fdc5-42f4-9cc9-68cf4586d61d
title: "ASP.NET: Registration of Controls in Web.Config"
date: 2006-04-03 22:36:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2006/04/03/ASPNET-20-Registration-of-Controls-in-WebConfig
  - /post/2006/04/03/aspnet-20-registration-of-controls-in-webconfig
  - /post.aspx?id=f1e2ea63-fdc5-42f4-9cc9-68cf4586d61d
---
<!-- more -->
<p>In ASP.NET 1.x controls had to be registered in each page they were used. New since ASP.NET 2.0, controls can be registered in the web.config file. Visual Studio 2005 supports full intellisense when editing .aspx pages. This feature allows commonly used controls to be more easily used through out your application.</p>
<p><strong>Web.Config</strong></p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;system.web&gt;
    &lt;pages&gt;
        &lt;controls&gt;
            &lt;add tagPrefix="mycontrol" src="~/Controls/Header.ascx" tagName="header"/&gt;
            &lt;add tagPrefix="mycontrol" src="~/Controls/Footer.ascx" tagName="footer"/&gt;
        &lt;/controls&gt;
    &lt;/pages&gt;
&lt;/system.web&gt;</pre>
<p><strong>Use the control in an .aspx page</strong></p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "> &lt;mycontrol:header id="Header" runat="server" /&gt;</pre>
