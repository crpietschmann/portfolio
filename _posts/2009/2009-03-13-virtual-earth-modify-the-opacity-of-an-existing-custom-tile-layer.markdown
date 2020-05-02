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
  - /post/2009/03/13/Virtual-Earth-Modify-the-Opacity-of-an-Existing-Custom-Tile-Layer.aspx
  - /post/2009/03/13/Virtual-Earth-Modify-the-Opacity-of-an-Existing-Custom-Tile-Layer
  - /post/2009/03/13/virtual-earth-modify-the-opacity-of-an-existing-custom-tile-layer
  - /post.aspx?id=ea0010eb-d51d-406a-82b1-3d1c6031a34c
---
<!-- more -->

One of the features that the Custom Tile Layer functionality of the Virtual Earth JavaScript control is the ability to modify the Tile Layers Opacity after it's been added to the Map. It does include HideTileLayer and ShowTileLayer methods to dynamically toggle the display of Custom Tile Layers, but sometimes that's just not enough customization. However, I do have some good news, there is a small technique that you can use to modify the Tile Layer Opacity as necessary.

## How to Change Custom Tile Layer Opacity

To change the Opacity of a Custom Tile Layer you basically need to Delete and then Re-Add the Custom Tile Layer. However, the technique shown below gets the existing Tile Layer by ID, changes it's Opacity value only, then deletes and re-adds it.

Here's the main javascript method that does the work for you:

```javascript

function SetTileLayerOpacity(tileLayerID, newOpacity) {
     // Get TileLayer
     var layer = map.GetTileLayerByID(tileLayerID);
 
     // Set new Opacity Value
     layer.Opacity = newOpacity;
 
     // Delete Existing TileLayer from Map
     map.DeleteTileLayer(tileLayerID);
     
     // Re-Add the TileLayer with new Opacity
     map.AddTileLayer(layer);
 }

```

And, here's the simple code needed to change a Custom Tile Layer's Opacity as needed:

```javascript

SetTileLayerOpacity("tilerLayerID", 0.5);

```

## Complete Code Example

Here's a full example page that implements the javascript method above. To build this example I actually copied the "Add a tile layer" example from the Virtual Earth Interactive SDK and added the SetTileLayerOpacity methed/functionality to it.

```javascript

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html>
 <head>
       <title></title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       <script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2"></script>
       <script type="text/javascript">
         var map = null;
         var tileLayer;
          
         function GetMap()
         {
             map = new VEMap('myMap');
             map.LoadMap(new VELatLong(48.03,-122.4),12,'r' ,false);
             GetTiles();
         }   
          
         function GetTiles()
         {
             var bounds = [new VELatLongRectangle(new VELatLong(49,-123),new VELatLong(47,-121))];
 
             var tileSourceSpec = new VETileSourceSpecification("lidar", "http://dev.live.com/virtualearth/sdk/layers/lidar/%4.png");
             tileSourceSpec.NumServers = 1;
             tileSourceSpec.Bounds = bounds;
             tileSourceSpec.MinZoomLevel = 10;
             tileSourceSpec.MaxZoomLevel = 18;
             tileSourceSpec.Opacity = 0.5; //opacity;
             tileSourceSpec.ZIndex = 100;
 
             map.AddTileLayer(tileSourceSpec, true);
         }
         
         function DeleteTileLayer()
         {
             map.DeleteTileLayer("lidar");
         }
         
         function SetTileLayerOpacity(tileLayerID, newOpacity) {
             // Get TileLayer
             var layer = map.GetTileLayerByID(tileLayerID);
 
             // Set new Opacity Value
             layer.Opacity = newOpacity;
 
             // Delete Existing TileLayer from Map
             map.DeleteTileLayer(tileLayerID);
             
             // Re-Add the TileLayer with new Opacity
             map.AddTileLayer(layer);
         }
       </script>
    </head>
    <body onload="GetMap();">
       <div id='myMap' style="position:relative; width:400px; height:400px;"></div>
       <a href="#" onclick="SetTileLayerOpacity('lidar', 0.5);">Set Opacity to 0.5</a>

       <a href="#" onclick="SetTileLayerOpacity('lidar', 1.0);">Set Opacity to 1.0</a>

       <hr />
       <a href="#" onclick="DeleteTileLayer();">Remove the tile layer</a>
    </body>
 </html>

```
