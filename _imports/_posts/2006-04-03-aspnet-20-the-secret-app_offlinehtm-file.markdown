---
layout: post
blogengineid: a0c5affd-96a2-4370-a3ac-3a704f2de439
title: "ASP.NET: The secret App_Offline.htm file"
date: 2006-04-03 21:50:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2006/04/03/ASPNET-20-The-secret-App_Offlinehtm-file
  - /post/2006/04/03/aspnet-20-the-secret-app_offlinehtm-file
  - /post.aspx?id=a0c5affd-96a2-4370-a3ac-3a704f2de439
---
<!-- more -->

If you place a file named app_offline.htm into the root of an ASP.NET 2.0 application, the application will shutdown and any page request for the application will return this file instead. This feature makes it extremely easy to take down an application while a large update is being made. As soon as you remove the file any page requests to the application will continue as normal. This works with ASP.NET 2.0 and later.

<a href="http://weblogs.asp.net/scottgu/archive/2005/10/06/426755.aspx">http://weblogs.asp.net/scottgu/archive/2005/10/06/426755.aspx</a>
