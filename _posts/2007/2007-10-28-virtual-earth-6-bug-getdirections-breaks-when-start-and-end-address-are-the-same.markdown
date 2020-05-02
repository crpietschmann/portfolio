---
layout: post
blogengineid: 27a89208-b468-4efb-a1c7-ed9c96bc9632
title: "Virtual Earth 6 Bug: GetDirections breaks when Start and End Address are the same"
date: 2007-10-28 00:28:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2007/10/28/Virtual-Earth-6-Bug-GetDirections-breaks-when-Start-and-End-Address-are-the-same.aspx
  - /post/2007/10/28/Virtual-Earth-6-Bug-GetDirections-breaks-when-Start-and-End-Address-are-the-same
  - /post/2007/10/28/virtual-earth-6-bug-getdirections-breaks-when-start-and-end-address-are-the-same
  - /post.aspx?id=27a89208-b468-4efb-a1c7-ed9c96bc9632
---
<!-- more -->


When using the new GetDirections method to get multi-point driving directions everything works fine if the Start and End address are different. But it shows unexpected results on the map when plotting a multi-point route that has an End address the same as its Start.



Here&#39;s some sample code to reproduce this issue:

<!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;>

<html>

   <head>

      <title></title>

      <meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;>

      <script type=&quot;text/javascript&quot; src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;></script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;></script</a>>

      <script type=&quot;text/javascript&quot;>

         var map = null;

         function GetMap()

         {

            map = new VEMap(&#39;myMap&#39;);

            map.LoadMap();

            map.GetDirections([&quot;Microsoft&quot;, &quot;Everett WA&quot;, &quot;Bellingham WA&quot;, &quot;Microsoft&quot;]);

         }   

      </script>

   </head>

   <body onload=&quot;GetMap();&quot;>

   <div id=&#39;myMap&#39; style=&quot;position:relative; width:400px; height:400px;&quot;></div>

   </body>

</html>



Here&#39;s a screenshot of the results displayed on the map:



 
<img src="/files/VE6Bug_MultiPointDirections.png" alt="" />



This is the third bug in Virtual Earth 6 that I&#39;ve found since it was released almost 2 weeks ago.

