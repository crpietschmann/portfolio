---
layout: post
blogengineid: ea0010eb-d51d-406a-82b1-3d1c6031a34c
title: "Bing Maps: Modify the Opacity of an Existing Custom Tile Layer"
date: 2009-03-13 19:27:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2009/03/13/Virtual-Earth-Modify-the-Opacity-of-an-Existing-Custom-Tile-Layer
  - /post/2009/03/13/virtual-earth-modify-the-opacity-of-an-existing-custom-tile-layer
  - /post.aspx?id=ea0010eb-d51d-406a-82b1-3d1c6031a34c
---
<!-- more -->

One of the features that the Custom Tile Layer functionality of the Virtual Earth JavaScript control is the ability to modify the Tile Layers Opacity after it's been added to the Map. It does include HideTileLayer and ShowTileLayer methods to dynamically toggle the display of Custom Tile Layers, but sometimes that's just not enough customization. However, I do have some good news, there is a small technique that you can use to modify the Tile Layer Opacity as necessary.
<h3>How to Change Custom Tile Layer Opacity</h3>

To change the Opacity of a Custom Tile Layer you basically need to Delete and then Re-Add the Custom Tile Layer. However, the technique shown below gets the existing Tile Layer by ID, changes it's Opacity value only, then deletes and re-adds it.

Here's the main javascript method that does the work for you:

```javascript

function SetTileLayerOpacity(tileLayerID, newOpacity) {<br />     // Get TileLayer<br />     var layer = map.GetTileLayerByID(tileLayerID);<br /> <br />     // Set new Opacity Value<br />     layer.Opacity = newOpacity;<br /> <br />     // Delete Existing TileLayer from Map<br />     map.DeleteTileLayer(tileLayerID);<br />     <br />     // Re-Add the TileLayer with new Opacity<br />     map.AddTileLayer(layer);<br /> }

```

And, here's the simple code needed to change a Custom Tile Layer's Opacity as needed:

```javascript

SetTileLayerOpacity("tilerLayerID", 0.5);

```
<h3>Complete Code Example</h3>

Here's a full example page that implements the javascript method above. To build this example I actually copied the "Add a tile layer" example from the Virtual Earth Interactive SDK and added the SetTileLayerOpacity methed/functionality to it.

```javascript

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;<br /> &lt;html&gt;<br /> &lt;head&gt;<br />       &lt;title&gt;&lt;/title&gt;<br />       &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8"&gt;<br />       &lt;script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2"&gt;&lt;/script&gt;<br />       &lt;script type="text/javascript"&gt;<br />         var map = null;<br />         var tileLayer;<br />          <br />         function GetMap()<br />         {<br />             map = new VEMap('myMap');<br />             map.LoadMap(new VELatLong(48.03,-122.4),12,'r' ,false);<br />             GetTiles();<br />         }   <br />          <br />         function GetTiles()<br />         {<br />             var bounds = [new VELatLongRectangle(new VELatLong(49,-123),new VELatLong(47,-121))];<br /> <br />             var tileSourceSpec = new VETileSourceSpecification("lidar", "http://dev.live.com/virtualearth/sdk/layers/lidar/%4.png");<br />             tileSourceSpec.NumServers = 1;<br />             tileSourceSpec.Bounds = bounds;<br />             tileSourceSpec.MinZoomLevel = 10;<br />             tileSourceSpec.MaxZoomLevel = 18;<br />             tileSourceSpec.Opacity = 0.5; //opacity;<br />             tileSourceSpec.ZIndex = 100;<br /> <br />             map.AddTileLayer(tileSourceSpec, true);<br />         }<br />         <br />         function DeleteTileLayer()<br />         {<br />             map.DeleteTileLayer("lidar");<br />         }<br />         <br />         function SetTileLayerOpacity(tileLayerID, newOpacity) {<br />             // Get TileLayer<br />             var layer = map.GetTileLayerByID(tileLayerID);<br /> <br />             // Set new Opacity Value<br />             layer.Opacity = newOpacity;<br /> <br />             // Delete Existing TileLayer from Map<br />             map.DeleteTileLayer(tileLayerID);<br />             <br />             // Re-Add the TileLayer with new Opacity<br />             map.AddTileLayer(layer);<br />         }<br />       &lt;/script&gt;<br />    &lt;/head&gt;<br />    &lt;body onload="GetMap();"&gt;<br />       &lt;div id='myMap' style="position:relative; width:400px; height:400px;"&gt;&lt;/div&gt;<br />       &lt;a href="#" onclick="SetTileLayerOpacity('lidar', 0.5);"&gt;Set Opacity to 0.5&lt;/a&gt;&lt;br /&gt;<br />       &lt;a href="#" onclick="SetTileLayerOpacity('lidar', 1.0);"&gt;Set Opacity to 1.0&lt;/a&gt;&lt;br /&gt;<br />       &lt;hr /&gt;<br />       &lt;a href="#" onclick="DeleteTileLayer();"&gt;Remove the tile layer&lt;/a&gt;<br />    &lt;/body&gt;<br /> &lt;/html&gt;

```
