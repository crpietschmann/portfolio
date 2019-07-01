---
layout: post
title: ".NET 3.5: How to Convert from one TimeZone to another"
date: 2007-06-23 11:46:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "C#"]
redirect_from: 
  - /post/2007/06/23/NET-35-How-to-Convert-from-one-TimeZone-to-another
 -  /post/2007/06/23/net-35-how-to-convert-from-one-timezone-to-another
---
<!-- more -->
<p>The ability to <a href="http://msdn2.microsoft.com/en-us/library/bb382770(VS.90).aspx">convert directly from one timezone to another </a>is coming (finally!) in .NET 3.5 via the addition of the <a href="http://msdn2.microsoft.com/en-us/library/system.timezoneinfo(VS.90).aspx">System.TimeZoneInfo</a> object.</p>
<p><strong>Example C# Code:</strong><br />DateTime oldTime = new DateTime(2007, 6, 23, 10, 0, 0);<br />TimeZoneInfo timeZone1 = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");<br />TimeZoneInfo timeZone2 = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");<br />DateTime newTime = TimeZoneInfo.ConvertTime(oldTime, timeZone1, timeZone2);</p>
