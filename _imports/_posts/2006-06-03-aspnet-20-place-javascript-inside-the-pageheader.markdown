---
layout: post
id: 9f89f1c0-eda9-4001-abf8-4a3f9b0b1dc6
title: "ASP.NET 2.0: Place JavaScript inside the Page.Header"
date: 2006-06-03 00:38:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "JavaScript"]
redirect_from: 
  - /post/2006/06/03/ASPNET-20-Place-JavaScript-inside-the-PageHeader
  - /post/2006/06/03/aspnet-20-place-javascript-inside-the-pageheader
  - /post.aspx?id=9f89f1c0-eda9-4001-abf8-4a3f9b0b1dc6
---
<!-- more -->
<p>The Page.ClientScript object allows you to place JavaScript inside the Page, but it's limited in the fact that you cannot use it to place JavaScript inside the Head tags of the Page. But fortunately there is a way to do this.</p>
<p>Add a .js file include inside the page header:</p>
<p>[code:c#]<br /> HtmlGenericControl Include = new HtmlGenericControl("script");<br /> Include.Attributes.Add("type", "text/javascript");<br /> Include.Attributes.Add("src", "http://dev.virtualearth.net/mapcontrol/v3/mapcontrol.js");<br /> this.Page.Header.Controls.Add(Include);<br /> [/code]</p>
<p>Add some JavaScript inside the page header:</p>
<p>[code:c#]<br /> HtmlGenericControl Include2 = new HtmlGenericControl("script");<br /> Include2.Attributes.Add("type", "text/javascript");<br /> Include2.InnerHtml = "alert('JavaScript in Page Header');";<br /> this.Page.Header.Controls.Add(Include2);<br /> [/code]</p>
<p>It would be nice if there was a Page.Header.ClientScript object that you could use to place JavaScript within the header of the Page, but for now&nbsp;we'll just have to use the method stated above.</p>
