---
layout: post
blogengineid: d414be9d-1bdf-4345-8001-cce09c485584
title: "Virtual Earth: Calculate Distance of User-Drawn Polyline"
date: 2008-02-06 01:28:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/02/06/Virtual-Earth-Calculate-Distance-of-User-Drawn-Polyline
  - /post/2008/02/06/virtual-earth-calculate-distance-of-user-drawn-polyline
  - /post.aspx?id=d414be9d-1bdf-4345-8001-cce09c485584
---
<!-- more -->


A couple days ago I posted some code to &quot;<a href="/Blog/Post.aspx?PostID=1452">Calculate Distance Between Geocodes in C# and JavaScript</a>&quot;, so today I decided to post a small sample program that shows a more &quot;real world&quot; example of puting that code to use.



Here&#39;s a small program I wrote (in pure HTML and JavaScript) that allows the user to draw a polyline, and it automatically calculates the total distance between the points being plotted.



<a href="http://pietschsoft.net/Download/Blog/1453/DistanceCalculator.zip">Download the Distance Calculator Program Here</a>



<img src="http://pietschsoft.net/Download/Blog/1453/Screenshot.png" border="0" alt="" width="400" height="292" align="baseline" />

<h4>A Web.Maps.VE Implementation</h4>


I have also posted an example over at <a href="http://simplovation.com/">Simplovation.com</a> showing how to implement the same functionality using the <a href="http://simplovation.com/Page/WebMapsVE.aspx">Simplovation Web.Maps.VE ASP.NET AJAX Mapping Component</a>. You can get that example <a href="http://simplovation.com/Page/WebMapsVE10/Tutorials/Samples/DistanceCalculator.aspx">here</a>. This one contains an example using only Server-Side .NET code code to manipulate the map via the full ASP.NET AJAX support built into Web.Maps.VE, and another example using JavaScript code that utilizes the Web.Maps.VE component.

<h4>Benefit of using Web.Maps.VE over Virtual Earth directly</h4>


One benefit in particular is pretty clear when implementing this functionality using Web.Maps.VE instead of using Virtual Earth directly. This benefit is the fact that Web.Maps.VE JavaScript Event Handlers are passed not only the Event Arguments, but also the Sender object just like .NET. This allows for better object oriented code to be written when implementing Virtual Earth, and eliminates the need to hold on to a global reference to the Virtual Earth map object.



Here&#39;s an event handler using Virtual Earth directly:

<font size="2" color="#0000ff">


var<font size="2"> map;<br />
</font><font size="2" color="#0000ff">function</font><font size="2"> Map_Click(eventArgs){map.ZoomIn();}</font>

</font>


Here&#39;s an event handler using Web.Maps.VE:

<font size="2" color="#0000ff">


function<font size="2"> Map1_Click(sender, eventArgs){sender.ZoomIn();}</font>

</font>


This is one of the many features that <a href="http://simplovation.com/Page/WebMapsVE.aspx">Web.Maps.VE</a> brings to enhance the Virtual Earth development experience.

