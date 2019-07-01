---
layout: post
title: "Virtual Earth 6 Bug: GetDirections breaks when Start and End Address are the same"
date: 2007-10-28 00:28:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2007/10/28/Virtual-Earth-6-Bug-GetDirections-breaks-when-Start-and-End-Address-are-the-same
 -  /post/2007/10/28/virtual-earth-6-bug-getdirections-breaks-when-start-and-end-address-are-the-same
---
<!-- more -->
<p>
When using the new GetDirections method to get multi-point driving directions everything works fine if the Start and End address are different. But it shows unexpected results on the map when plotting a multi-point route that has&nbsp;an End address the same as its Start.
</p>
<p>
Here&#39;s some sample code to reproduce this issue:<br />
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;&gt;<br />
&lt;html&gt;<br />
&nbsp;&nbsp; &lt;head&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;title&gt;&lt;/title&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;script type=&quot;text/javascript&quot; src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script</a>&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;script type=&quot;text/javascript&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var map = null;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function GetMap()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map = new VEMap(&#39;myMap&#39;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.LoadMap();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.GetDirections([&quot;Microsoft&quot;, &quot;Everett WA&quot;, &quot;Bellingham WA&quot;, &quot;Microsoft&quot;]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/script&gt;<br />
&nbsp;&nbsp; &lt;/head&gt;<br />
&nbsp;&nbsp; &lt;body onload=&quot;GetMap();&quot;&gt;<br />
&nbsp;&nbsp; &lt;div id=&#39;myMap&#39; style=&quot;position:relative; width:400px; height:400px;&quot;&gt;&lt;/div&gt;<br />
&nbsp;&nbsp; &lt;/body&gt;<br />
&lt;/html&gt;
</p>
<p>
Here&#39;s a screenshot of the results displayed on the map:
</p>
<p>
&nbsp;
<img src="/images/postsVE6Bug_MultiPointDirections.png" alt="" />
</p>
<p>
This is the third bug in Virtual Earth 6 that I&#39;ve found since it was released almost 2 weeks ago.
</p>
