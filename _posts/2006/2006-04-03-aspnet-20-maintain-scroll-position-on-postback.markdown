---
layout: post
blogengineid: bbf3e22c-f86d-487f-80d5-e5d69417172e
title: "ASP.NET: Maintain Scroll Position On Postback"
date: 2006-04-03 22:09:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2006/04/03/ASPNET-20-Maintain-Scroll-Position-On-Postback.aspx
  - /post/2006/04/03/ASPNET-20-Maintain-Scroll-Position-On-Postback
  - /post/2006/04/03/aspnet-20-maintain-scroll-position-on-postback
  - /post.aspx?id=bbf3e22c-f86d-487f-80d5-e5d69417172e
---

The `MaintainScrollPositionOnPostback` page directive attribute allows pages to automatically maintain the current scroll position across postbacks. This feature is useful for large pages where scrolling is necessary to view input controls down further on the page. This works in ASP.NET 2.0 and later.

```html
 <%@ Page MaintainScrollPositionOnPostback="true" %>
```

A simple but very useful feature.
