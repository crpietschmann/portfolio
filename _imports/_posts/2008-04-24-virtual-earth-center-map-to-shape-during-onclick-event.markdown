---
layout: post
id: 6bab78ff-5648-472f-b7ef-1c8ab758a26e
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
<p>
Here&#39;s a short, simple example of wiring up Virtual Earth to zoom/pan the map to showing the best fit to center on a specific Shape object that is clicked on by the user. 
</p>
<p>
This example works in both 2D and 3D map modes. 
</p>
<p>
[code:html] 
</p>
<p>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;title&gt;&lt;/title&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;&gt;<br />
&lt;script type=&quot;text/javascript&quot; src=&quot;http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1&quot;&gt;&lt;/script&gt;<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
var map = null; 
</p>
<p>
function GetMap()<br />
{<br />
&nbsp;&nbsp;&nbsp; map = new VEMap(&#39;myMap&#39;);<br />
&nbsp;&nbsp;&nbsp; map.LoadMap(); 
</p>
<p>
<br />
&nbsp;&nbsp;&nbsp; /// Attach a handler to the Maps OnClick Event 
</p>
<p>
&nbsp;&nbsp;&nbsp; map.AttachEvent(&quot;onclick&quot;, Map_OnClick); 
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;&nbsp;&nbsp; /// Add a couple Pushpin Shapes to the map 
</p>
<p>
&nbsp;&nbsp;&nbsp; var shape1 = new VEShape(VEShapeType.Pushpin, new VELatLong(49.74999, -99.71));<br />
&nbsp;&nbsp;&nbsp; shape1.SetTitle(&quot;Shape 1&quot;);<br />
&nbsp;&nbsp;&nbsp; shape1.SetDescription(&quot;Test Shape 1&quot;);<br />
&nbsp;&nbsp;&nbsp; map.AddShape(shape1); 
</p>
<p>
&nbsp;&nbsp;&nbsp; var shape2 = new VEShape(VEShapeType.Pushpin, new VELatLong(39.74999, -96.71));<br />
&nbsp;&nbsp;&nbsp; shape2.SetTitle(&quot;Shape 2&quot;);<br />
&nbsp;&nbsp;&nbsp; shape2.SetDescription(&quot;Test Shape2&quot;);<br />
&nbsp;&nbsp;&nbsp; map.AddShape(shape2); 
</p>
<p>
&nbsp;&nbsp;&nbsp; /// Add a Polygon Shape to the map 
</p>
<p>
&nbsp;&nbsp;&nbsp; var shape3points = new Array();<br />
&nbsp;&nbsp;&nbsp; shape3points[shape3points.length] = new VELatLong(37.74999, -99.71);<br />
&nbsp;&nbsp;&nbsp; shape3points[shape3points.length] = new VELatLong(37.74999, -110.71);<br />
&nbsp;&nbsp;&nbsp; shape3points[shape3points.length] = new VELatLong(32.74999, -111.71);<br />
&nbsp;&nbsp;&nbsp; var shape3 = new VEShape(VEShapeType.Polygon, shape3points);<br />
&nbsp;&nbsp;&nbsp; shape3.HideIcon(); // Hide the Polygons Icon Image<br />
&nbsp;&nbsp;&nbsp; map.AddShape(shape3); 
</p>
<p>
} 
</p>
<p>
function Map_OnClick(e)<br />
{<br />
&nbsp;&nbsp;&nbsp; // Check if a Shape was clicked<br />
&nbsp;&nbsp;&nbsp; if (e.elementID != null)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get a reference to the Shape that was clicked<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var shape = map.GetShapeByID(e.elementID); 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Set the MapView to the Shapes collection of VELatLong points<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // This will zoom and pan the map to the best view to show all the points of this Shape<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.SetMapView(shape.GetPoints());<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
&lt;/script&gt;<br />
&lt;/head&gt;<br />
&lt;body onload=&quot;GetMap();&quot;&gt;<br />
&lt;div id=&#39;myMap&#39; style=&quot;position:relative; width:400px; height:400px;&quot;&gt;&lt;/div&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt; 
</p>
<p>
[/code] 
</p>
