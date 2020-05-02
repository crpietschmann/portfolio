---
layout: post
blogengineid: 9f89f1c0-eda9-4001-abf8-4a3f9b0b1dc6
title: "ASP.NET 2.0: Place JavaScript inside the Page.Header"
date: 2006-06-03 00:38:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "JavaScript"]
redirect_from: 
  - /post/2006/06/03/ASPNET-20-Place-JavaScript-inside-the-PageHeader.aspx
  - /post/2006/06/03/ASPNET-20-Place-JavaScript-inside-the-PageHeader
  - /post/2006/06/03/aspnet-20-place-javascript-inside-the-pageheader
  - /post.aspx?id=9f89f1c0-eda9-4001-abf8-4a3f9b0b1dc6
---

The Page.ClientScript object allows you to place JavaScript inside the Page, but it's limited in the fact that you cannot use it to place JavaScript inside the Head tags of the Page. But fortunately there is a way to do this.

Add a .js file include inside the page header:

```csharp
 HtmlGenericControl Include = new HtmlGenericControl("script");
 Include.Attributes.Add("type", "text/javascript");
 Include.Attributes.Add("src", "http://dev.virtualearth.net/mapcontrol/v3/mapcontrol.js");
 this.Page.Header.Controls.Add(Include);
 ```

Add some JavaScript inside the page header:

```csharp
 HtmlGenericControl Include2 = new HtmlGenericControl("script");
 Include2.Attributes.Add("type", "text/javascript");
 Include2.InnerHtml = "alert('JavaScript in Page Header');";
 this.Page.Header.Controls.Add(Include2);
 ```

It would be nice if there was a Page.Header.ClientScript object that you could use to place JavaScript within the header of the Page, but for now we'll just have to use the method stated above.
