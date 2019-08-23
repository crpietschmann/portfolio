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
  - /post/2007/12/27/Virtual-Earth-Align-Mini-Map-in-the-Top-Right-corner-of-the-Map.aspx
  - /post/2007/12/27/Virtual-Earth-Align-Mini-Map-in-the-Top-Right-corner-of-the-Map
  - /post/2007/12/27/virtual-earth-align-mini-map-in-the-top-right-corner-of-the-map
  - /post.aspx?id=edce98b3-6f8d-46d8-a5d4-84599de9635b
---
<!-- more -->

If you take a look at <a href="http://maps.live.com/">maps.live.com</a> you'll see the Mini Map is in the Top Right corner of the map. Virtual Earth doesn't have any alignment options built in when showing the Mini Map. It just allows you to position the mini map using x and y offset coordinates relating to the top left corner of the map. This makes it really easy to show the mini map in relation to the top left corner, but what makes this tricky is the dashboard is already there.

Here's small example I wrote up on how to align the Mini Map in the Top Right corner of the map. This code also hooks into the Maps onresize event so it can move the Mini Map to the desired location when ever the map is resized.

Here's a screenshot of it in action:

<img src="/files/2009/6/20091227_Virtual_Earth_MiniMap_Align_Top_Right_Corner.png" alt="" />

Here's the code:

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>" mce_src="<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;></script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6"></script</a>>
 </head>

<body onload="PageLoad()">

<script type="text/javascript">
 var map = null;

var MiniMapSize = VEMiniMapSize.Small; // can also be set to VEMiniMapSize.Large

function PageLoad()
 {
     // Load the Map on the page when the page loads
     map = new VEMap('myMap');
     map.LoadMap(new VELatLong(47.6, -122.33), 7, VEMapStyle.Road);
     
     // Attach our onresize event handler
     map.AttachEvent("onresize", MapResize);
     
     // Show the Mini Map
     map.ShowMiniMap(0,0,MiniMapSize);
     
     // Align the position of the Mini Map where we want it
     RealignMiniMap();
 }

function MapResize(e)
 {
     // When the map is resized, Realign the position of the Mini Map
     RealignMiniMap();
 }

function RealignMiniMap()
 {
     // Realign the position of the Mini Map so it appears
     // where we want it - The Upper Right Corner
     var minimap = document.getElementById("MSVE_minimap");
     var xoffset = (GetMapWidth() - minimap.offsetWidth);
     map.ShowMiniMap(xoffset, 0, MiniMapSize);
     
     /// Hide the Mini Map resizer so the Mini Map cannot be resized
     document.getElementById("MSVE_minimap_resize").style.display = "none";
 }

function GetMapWidth()
 {   
     // Get the Width of the Map as an integer
     return document.getElementById("myMap").offsetWidth;
 }
 function GetMapHeight()
 {
     // Get the Height of the Map as an integer
     return document.getElementById("myMap").offsetHeight;
 }
 </script>

<div id="myMap" style="position:relative; width:550px; height:400px;"></div>



 **Resize Map:**&amp;nbsp;
 <a href="javascript:MakeMapBigger();" mce_href="javascript:MakeMapBigger();">Bigger</a>&amp;nbsp;&amp;nbsp;
 <a href="javascript:MakeMapSmaller();" mce_href="javascript:MakeMapSmaller();">Smaller</a>
 <script type="text/javascript">
     function MakeMapBigger()
     {
         var width = GetMapWidth();
         var height = GetMapHeight();
         map.Resize(width + 50, height);
     }
     function MakeMapSmaller()
     {
         var width = GetMapWidth();
         var height = GetMapHeight();
         map.Resize(width - 50, height);
     }
 </script>




 **Change Mini Map Size:**&amp;nbsp;
 <a href="javascript:SetMiniMapSize(VEMiniMapSize.Small);" mce_href="javascript:SetMiniMapSize(VEMiniMapSize.Small);">Small</a>&amp;nbsp;&amp;nbsp;
 <a href="javascript:SetMiniMapSize(VEMiniMapSize.Large);" mce_href="javascript:SetMiniMapSize(VEMiniMapSize.Large);">Large</a>
 <script type="text/javascript">
     function SetMiniMapSize(s)
     {
         // Set our global variable to the size we want
         MiniMapSize = s;
         
         // Show the Mini Map as our desired size
         map.ShowMiniMap(0,0,s);
         
         // Realign the Mini Map so it's in the desired position
         RealignMiniMap();
     }
 </script>

</body>
 </html>

This code works in IE, Firefox and Safari 3 on Windows. I haven't tested any other browsers, but I assume it'll work in others as well. Another thing to note is that this code will only work if there is only a single Virtual Earth map on the page; it'll break with multiple maps on the same page.

Sorry, I didn't have time to write up a nice article surrounding this code. But, I did add a bunch of comments to make it more readable.

 
