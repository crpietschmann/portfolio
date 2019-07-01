---
layout: post
blogengineid: 6bab78ff-5648-472f-b7ef-1c8ab758a26e
title: "Virtual Earth: Center Map to Shape during OnClick Event"
date: 2008-04-24 22:02:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/04/24/Virtual-Earth-Center-Map-to-Shape-during-OnClick-Event
  - /post/2008/04/24/virtual-earth-center-map-to-shape-during-onclick-event
  - /post.aspx?id=6bab78ff-5648-472f-b7ef-1c8ab758a26e
---
<!-- more -->


Here&#39;s a short, simple example of wiring up Virtual Earth to zoom/pan the map to showing the best fit to center on a specific Shape object that is clicked on by the user. 



This example works in both 2D and 3D map modes. 



[code:html] 



<!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;><br />
<html><br />
<head><br />
<title></title><br />
<meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;><br />
<script type=&quot;text/javascript&quot; src=&quot;http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1&quot;></script><br />
<script type=&quot;text/javascript&quot;><br />
var map = null; 



function GetMap()<br />
{<br />
    map = new VEMap(&#39;myMap&#39;);<br />
    map.LoadMap(); 



<br />
    /// Attach a handler to the Maps OnClick Event 



    map.AttachEvent(&quot;onclick&quot;, Map_OnClick); 



 



    /// Add a couple Pushpin Shapes to the map 



    var shape1 = new VEShape(VEShapeType.Pushpin, new VELatLong(49.74999, -99.71));<br />
    shape1.SetTitle(&quot;Shape 1&quot;);<br />
    shape1.SetDescription(&quot;Test Shape 1&quot;);<br />
    map.AddShape(shape1); 



    var shape2 = new VEShape(VEShapeType.Pushpin, new VELatLong(39.74999, -96.71));<br />
    shape2.SetTitle(&quot;Shape 2&quot;);<br />
    shape2.SetDescription(&quot;Test Shape2&quot;);<br />
    map.AddShape(shape2); 



    /// Add a Polygon Shape to the map 



    var shape3points = new Array();<br />
    shape3points[shape3points.length] = new VELatLong(37.74999, -99.71);<br />
    shape3points[shape3points.length] = new VELatLong(37.74999, -110.71);<br />
    shape3points[shape3points.length] = new VELatLong(32.74999, -111.71);<br />
    var shape3 = new VEShape(VEShapeType.Polygon, shape3points);<br />
    shape3.HideIcon(); // Hide the Polygons Icon Image<br />
    map.AddShape(shape3); 



} 



function Map_OnClick(e)<br />
{<br />
    // Check if a Shape was clicked<br />
    if (e.elementID != null)<br />
    {<br />
        // Get a reference to the Shape that was clicked<br />
        var shape = map.GetShapeByID(e.elementID); 



        // Set the MapView to the Shapes collection of VELatLong points<br />
        // This will zoom and pan the map to the best view to show all the points of this Shape<br />
        map.SetMapView(shape.GetPoints());<br />
    }<br />
}<br />
</script><br />
</head><br />
<body onload=&quot;GetMap();&quot;><br />
<div id=&#39;myMap&#39; style=&quot;position:relative; width:400px; height:400px;&quot;></div><br />
</body><br />
</html> 



``` 

