---
layout: post
blogengineid: 6bab78ff-5648-472f-b7ef-1c8ab758a26e
title: "Virtual Earth: Center Map to Shape during OnClick Event"
date: 2008-04-24 22:02:00 -0500
comments: true
published: true
categories: ["Virtual Earth", "GIS"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/04/24/Virtual-Earth-Center-Map-to-Shape-during-OnClick-Event.aspx
  - /post/2008/04/24/Virtual-Earth-Center-Map-to-Shape-during-OnClick-Event
  - /post/2008/04/24/virtual-earth-center-map-to-shape-during-onclick-event
  - /post.aspx?id=6bab78ff-5648-472f-b7ef-1c8ab758a26e
---
<!-- more -->


Here&#39;s a short, simple example of wiring up Virtual Earth to zoom/pan the map to showing the best fit to center on a specific Shape object that is clicked on by the user. 



This example works in both 2D and 3D map modes. 



[code:html] 



<!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;>

<html>

<head>

<title></title>

<meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;>

<script type=&quot;text/javascript&quot; src=&quot;http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1&quot;></script>

<script type=&quot;text/javascript&quot;>

var map = null; 



function GetMap()

{

    map = new VEMap(&#39;myMap&#39;);

    map.LoadMap(); 





    /// Attach a handler to the Maps OnClick Event 



    map.AttachEvent(&quot;onclick&quot;, Map_OnClick); 



 



    /// Add a couple Pushpin Shapes to the map 



    var shape1 = new VEShape(VEShapeType.Pushpin, new VELatLong(49.74999, -99.71));

    shape1.SetTitle(&quot;Shape 1&quot;);

    shape1.SetDescription(&quot;Test Shape 1&quot;);

    map.AddShape(shape1); 



    var shape2 = new VEShape(VEShapeType.Pushpin, new VELatLong(39.74999, -96.71));

    shape2.SetTitle(&quot;Shape 2&quot;);

    shape2.SetDescription(&quot;Test Shape2&quot;);

    map.AddShape(shape2); 



    /// Add a Polygon Shape to the map 



    var shape3points = new Array();

    shape3points[shape3points.length] = new VELatLong(37.74999, -99.71);

    shape3points[shape3points.length] = new VELatLong(37.74999, -110.71);

    shape3points[shape3points.length] = new VELatLong(32.74999, -111.71);

    var shape3 = new VEShape(VEShapeType.Polygon, shape3points);

    shape3.HideIcon(); // Hide the Polygons Icon Image

    map.AddShape(shape3); 



} 



function Map_OnClick(e)

{

    // Check if a Shape was clicked

    if (e.elementID != null)

    {

        // Get a reference to the Shape that was clicked

        var shape = map.GetShapeByID(e.elementID); 



        // Set the MapView to the Shapes collection of VELatLong points

        // This will zoom and pan the map to the best view to show all the points of this Shape

        map.SetMapView(shape.GetPoints());

    }

}

</script>

</head>

<body onload=&quot;GetMap();&quot;>

<div id=&#39;myMap&#39; style=&quot;position:relative; width:400px; height:400px;&quot;></div>

</body>

</html> 



``` 

