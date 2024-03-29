---
layout: post
blogengineid: 09bd09f5-2cd1-4c0b-a273-eb7c91c3acb3
title: "Virtual Earth: Get Center Lat/Long When In Birdseye or Oblique Map Style"
date: 2008-06-05 19:11:00 -0500
comments: true
published: true
categories: ["Virtual Earth", "GIS"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/06/05/Virtual-Earth-Get-Center-LatLong-When-In-Birdseye-or-Oblique-Map-Style.aspx
  - /post/2008/06/05/Virtual-Earth-Get-Center-LatLong-When-In-Birdseye-or-Oblique-Map-Style
  - /post/2008/06/05/virtual-earth-get-center-latlong-when-in-birdseye-or-oblique-map-style
  - /post.aspx?id=09bd09f5-2cd1-4c0b-a273-eb7c91c3acb3
---
<!-- more -->

One of the tricky things that you need to work around when programming Virtual Earth is the VEMap.GetCenter() method doesn't work when displaying the Birdseye or Oblique Map Style. I'm not exactly sure what the reasoning for this is, but this is one thing that I would like to see fixed in a future version. Luckily, there is an unsupported method of doing this.

The code shown below gets the center Lat/Long coordinate for the BirdseyeScene being shown, not the actual center of the Map. This isn't exaclty what we're looking for, but at least it gives us a better idea of the current position of the map than nothing.

Here's a full example page that demonstrates getting the Map's center Lat/Long "relatively" when in Birdseye or Oblique Map Style:
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1"></script>
        <script type="text/javascript">
            var map = null;
                       
            function GetMap()
            {
                map = new VEMap('myMap');
                map.LoadMap();

                map.SetCenterAndZoom(new VELatLong(41.8797864435218, -87.681884765625), 11);
                map.SetMapStyle(VEMapStyle.Birdseye);
            }  

            function GetCenterLatLong()
            {
                //Check if in Birdseye or Oblique Map Style
                if (map.GetMapStyle() == VEMapStyle.Birdseye || map.GetMapStyle() == VEMapStyle.BirdseyeHybrid)
                {
                    //IN Birdseye or Oblique Map Style

                    //Get the BirdseyeScene being displayed
                    var birdseyeScene = map.GetBirdseyeScene();

                    //Get approximate center coordinate of the map
                    var x = birdseyeScene.GetWidth() / 2;
                    var y = birdseyeScene.GetHeight() / 2;

                    // Get the Lat/Long 
                    var center = birdseyeScene.PixelToLatLong(new VEPixel(x,y), map.GetZoomLevel());

                    // Convert the BirdseyeScene LatLong to a normal LatLong we can use
                    return (new _xy1).Decode(center);
                }
                else
                {
                    // NOT in Birdseye or Oblique Map Style
                    return map.GetCenter();
                }
            }

            function DisplayCenter()
            {
                var center = GetCenterLatLong();
                alert("Latitude: " + center.Latitude + "\nLongitude: " + center.Longitude);
            }
        </script>
    </head>
    <body onload="GetMap();">
        <input type="button" value="Get Center Lat/Lng" onclick="DisplayCenter();"/>
        <div id='myMap' style="position:relative; width:400px; height:400px;"></div>
    </body>
</html></pre>

 
