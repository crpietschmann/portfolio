---
layout: post
blogengineid: de36b5e8-c030-40ec-8e24-3e458da8340b
title: "Google Charts API: an ASP.NET 2.0 Server Control"
date: 2007-12-07 17:53:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2007/12/07/Google-Charts-API-an-ASPNET-20-Server-Control
  - /post/2007/12/07/google-charts-api-an-aspnet-20-server-control
  - /post.aspx?id=de36b5e8-c030-40ec-8e24-3e458da8340b
---
<!-- more -->

<img style="width: 210px; height: 331px;" src="http://pietschsoft.net/download/blog/1429/SimpleASPNETGoogleChartAPIControl.png" border="0" alt="" width="210" height="331" align="right" />Today, I just saw that <a href="http://code.google.com/apis/chart">Google released their Chart API</a>. Basically, the Google Chart API allows you to dynamically generate charts for use in your web applications. All you do is pass your data in the querystring and an image is returned. This isn't really a service to get too excited about, but it is pretty simple to use. And, it's Free.

I decided to code up a small ASP.NET Server Control that uses the Google Chart API to put simple line graph charts on a page. The image on the right is actually a screenshot I took after using my new control to add a couple charts to a page.
<h3>How to use this control:</h3>

Put the Chart control on the page:

<span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #a31515; font-size: x-small;">GoogleAPI</span><span style="color: #0000ff; font-size: x-small;">:</span><span style="color: #a31515; font-size: x-small;">Chart</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">runat</span><span style="color: #0000ff; font-size: x-small;">="server"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">id</span><span style="color: #0000ff; font-size: x-small;">="Chart1"</span><span style="font-size: x-small;"> 
 </span><span style="color: #ff0000; font-size: x-small;">Width</span><span style="color: #0000ff; font-size: x-small;">="200"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Height</span><span style="color: #0000ff; font-size: x-small;">="150"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">LineColor</span><span style="color: #0000ff; font-size: x-small;">="ff0000"
 </span><span style="color: #ff0000; font-size: x-small;">BackgroundColor</span><span style="color: #0000ff; font-size: x-small;">="efefef"
 </span><span style="color: #ff0000; font-size: x-small;">ToolTip</span><span style="color: #0000ff; font-size: x-small;">="Hello World">
 </span><span style="color: #0000ff; font-size: x-small;"></</span><span style="color: #a31515; font-size: x-small;">GoogleAPI</span><span style="color: #0000ff; font-size: x-small;">:</span><span style="color: #a31515; font-size: x-small;">Chart</span><span style="color: #0000ff; font-size: x-small;">></span>
</span>

In the page load event define the values to be charted

<span style="color: #0000ff; font-size: x-small;"><span style="font-size: x-small;">

Chart1.MaxValue = 60;
 
 Chart1.Values.Clear();
 
 Chart1.Values.Add(<span style="color: #a31515; font-size: x-small;">"Jan"</span><span style="font-size: x-small;">, 10);
 Chart1.Values.Add(</span><span style="color: #a31515; font-size: x-small;">"Feb"</span><span style="font-size: x-small;">, 20);
 Chart1.Values.Add(</span><span style="color: #a31515; font-size: x-small;">"Mar"</span><span style="font-size: x-small;">, 30);
 Chart1.Values.Add(</span><span style="color: #a31515; font-size: x-small;">"Apr"</span><span style="font-size: x-small;">, 50);
 Chart1.Values.Add(</span><span style="color: #a31515; font-size: x-small;">"May"</span><span style="font-size: x-small;">, 5);
 Chart1.YAxisLabels.Add(</span><span style="color: #a31515; font-size: x-small;">"0 Kb"</span><span style="font-size: x-small;">);
 Chart1.YAxisLabels.Add(</span><span style="color: #a31515; font-size: x-small;">"25+ Kb"</span><span style="font-size: x-small;">);
 Chart1.YAxisLabels.Add(</span><span style="color: #a31515; font-size: x-small;">"50+ Kb"</span><span style="font-size: x-small;">);</span>
</span></span>

And, that's all you have to do to put a Chart on your page using my little control.

<a href="/download/blog/1429/SimpleASPNETGoogleChartAPIControl.zip">Download the Source Code here</a>

This source code is licensed under the <a href="http://creativecommons.org/licenses/by/3.0/us/">Creative Commons Attribution 3.0 United States License</a>.
