---
layout: post
blogengineid: c92d378c-b6cc-457e-a1e3-d3ef0993d4c5
title: "Why can't IIS implicitly share ASP Session state with ASP.NET??"
date: 2005-02-10 15:39:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/02/10/Why-cant-IIS-implicitly-share-ASP-Session-state-with-ASPNET
  - /post/2005/02/10/why-cant-iis-implicitly-share-asp-session-state-with-aspnet
  - /post.aspx?id=c92d378c-b6cc-457e-a1e3-d3ef0993d4c5
---
<!-- more -->
Why can't IIS implicitly share ASP Session state with <a title="ASP.NET" href="http://asp.net" target="_blank">ASP.NET</a>?? This is really a drag on starting to&nbsp;convert an ASP application to ASP.NET. Of course, you could use SQL Server to store your Sessions state, but then you'd have to rewrite that portion of your ASP application first. I don't want to, Why can't I just use <EM>Session(&#8221;myData&#8221;) </EM>in ASP and ASP.NET and have it point to the same Session value? C'mon guys!!
