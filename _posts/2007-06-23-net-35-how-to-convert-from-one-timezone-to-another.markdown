---
layout: post
blogengineid: 5c01800e-2dc5-4223-832e-8b992db3116c
title: ".NET 3.5: How to Convert from one TimeZone to another"
date: 2007-06-23 11:46:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "C#"]
redirect_from: 
  - /post/2007/06/23/NET-35-How-to-Convert-from-one-TimeZone-to-another
  - /post/2007/06/23/net-35-how-to-convert-from-one-timezone-to-another
  - /post.aspx?id=5c01800e-2dc5-4223-832e-8b992db3116c
---
<!-- more -->

The ability to <a href="http://msdn2.microsoft.com/en-us/library/bb382770(VS.90).aspx">convert directly from one timezone to another </a>is coming (finally!) in .NET 3.5 via the addition of the <a href="http://msdn2.microsoft.com/en-us/library/system.timezoneinfo(VS.90).aspx">System.TimeZoneInfo</a> object.

**Example C# Code:**
DateTime oldTime = new DateTime(2007, 6, 23, 10, 0, 0);
TimeZoneInfo timeZone1 = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
TimeZoneInfo timeZone2 = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
DateTime newTime = TimeZoneInfo.ConvertTime(oldTime, timeZone1, timeZone2);
