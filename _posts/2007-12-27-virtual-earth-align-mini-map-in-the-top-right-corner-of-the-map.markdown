---
layout: post
blogengineid: edce98b3-6f8d-46d8-a5d4-84599de9635b
title: "Virtual Earth 6: Align Mini Map in the Top Right corner of the Map"
date: 2007-12-27 18:35:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2007/12/27/Virtual-Earth-Align-Mini-Map-in-the-Top-Right-corner-of-the-Map
  - /post/2007/12/27/virtual-earth-align-mini-map-in-the-top-right-corner-of-the-map
  - /post.aspx?id=edce98b3-6f8d-46d8-a5d4-84599de9635b
---
<!-- more -->

If you take a look at <a href="http://maps.live.com/">maps.live.com</a> you'll see the Mini Map is in the Top Right corner of the map. Virtual Earth doesn't have any alignment options built in when showing the Mini Map. It just allows you to position the mini map using x and y offset coordinates relating to the top left corner of the map. This makes it really easy to show the mini map in relation to the top left corner, but what makes this tricky is the dashboard is already there.

Here's small example I wrote up on how to align the Mini Map in the Top Right corner of the map. This code also hooks into the Maps onresize event so it can move the Mini Map to the desired location when ever the map is resized.

Here's a screenshot of it in action:

<img src="/images/posts2009/6/20091227_Virtual_Earth_MiniMap_Align_Top_Right_Corner.png" alt="" />

Here's the code:

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>"&gt;<br /> &lt;html&gt;<br /> &lt;head&gt;<br /> &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8"&gt;<br /> &lt;script type="text/javascript" src="<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>" mce_src="<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6"&gt;&lt;/script</a>&gt;<br /> &lt;/head&gt;

&lt;body onload="PageLoad()"&gt;

&lt;script type="text/javascript"&gt;<br /> var map = null;

var MiniMapSize = VEMiniMapSize.Small; // can also be set to VEMiniMapSize.Large

function PageLoad()<br /> {<br />     // Load the Map on the page when the page loads<br />     map = new VEMap('myMap');<br />     map.LoadMap(new VELatLong(47.6, -122.33), 7, VEMapStyle.Road);<br />     <br />     // Attach our onresize event handler<br />     map.AttachEvent("onresize", MapResize);<br />     <br />     // Show the Mini Map<br />     map.ShowMiniMap(0,0,MiniMapSize);<br />     <br />     // Align the position of the Mini Map where we want it<br />     RealignMiniMap();<br /> }

function MapResize(e)<br /> {<br />     // When the map is resized, Realign the position of the Mini Map<br />     RealignMiniMap();<br /> }

function RealignMiniMap()<br /> {<br />     // Realign the position of the Mini Map so it appears<br />     // where we want it - The Upper Right Corner<br />     var minimap = document.getElementById("MSVE_minimap");<br />     var xoffset = (GetMapWidth() - minimap.offsetWidth);<br />     map.ShowMiniMap(xoffset, 0, MiniMapSize);<br />     <br />     /// Hide the Mini Map resizer so the Mini Map cannot be resized<br />     document.getElementById("MSVE_minimap_resize").style.display = "none";<br /> }

function GetMapWidth()<br /> {   <br />     // Get the Width of the Map as an integer<br />     return document.getElementById("myMap").offsetWidth;<br /> }<br /> function GetMapHeight()<br /> {<br />     // Get the Height of the Map as an integer<br />     return document.getElementById("myMap").offsetHeight;<br /> }<br /> &lt;/script&gt;

&lt;div id="myMap" style="position:relative; width:550px; height:400px;"&gt;&lt;/div&gt;

&lt;br /&gt;<br /> &lt;strong&gt;Resize Map:&lt;/strong&gt;&amp;nbsp;<br /> &lt;a href="javascript:MakeMapBigger();" mce_href="javascript:MakeMapBigger();"&gt;Bigger&lt;/a&gt;&amp;nbsp;&amp;nbsp;<br /> &lt;a href="javascript:MakeMapSmaller();" mce_href="javascript:MakeMapSmaller();"&gt;Smaller&lt;/a&gt;<br /> &lt;script type="text/javascript"&gt;<br />     function MakeMapBigger()<br />     {<br />         var width = GetMapWidth();<br />         var height = GetMapHeight();<br />         map.Resize(width + 50, height);<br />     }<br />     function MakeMapSmaller()<br />     {<br />         var width = GetMapWidth();<br />         var height = GetMapHeight();<br />         map.Resize(width - 50, height);<br />     }<br /> &lt;/script&gt;

&lt;br /&gt;&lt;br /&gt;<br /> &lt;strong&gt;Change Mini Map Size:&lt;/strong&gt;&amp;nbsp;<br /> &lt;a href="javascript:SetMiniMapSize(VEMiniMapSize.Small);" mce_href="javascript:SetMiniMapSize(VEMiniMapSize.Small);"&gt;Small&lt;/a&gt;&amp;nbsp;&amp;nbsp;<br /> &lt;a href="javascript:SetMiniMapSize(VEMiniMapSize.Large);" mce_href="javascript:SetMiniMapSize(VEMiniMapSize.Large);"&gt;Large&lt;/a&gt;<br /> &lt;script type="text/javascript"&gt;<br />     function SetMiniMapSize(s)<br />     {<br />         // Set our global variable to the size we want<br />         MiniMapSize = s;<br />         <br />         // Show the Mini Map as our desired size<br />         map.ShowMiniMap(0,0,s);<br />         <br />         // Realign the Mini Map so it's in the desired position<br />         RealignMiniMap();<br />     }<br /> &lt;/script&gt;

&lt;/body&gt;<br /> &lt;/html&gt;

This code works in IE, Firefox and Safari 3 on Windows. I haven't tested any other browsers, but I assume it'll work in others as well. Another thing to note is that this code will only work if there is only a single Virtual Earth map on the page; it'll break with multiple maps on the same page.

Sorry, I didn't have time to write up a nice article surrounding this code. But, I did add a bunch of comments to make it more readable.

 
