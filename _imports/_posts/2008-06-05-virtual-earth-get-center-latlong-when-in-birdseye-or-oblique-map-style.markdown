---
layout: post
title: "Virtual Earth: Get Center Lat/Long When In Birdseye or Oblique Map Style"
date: 2008-06-05 19:11:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/06/05/Virtual-Earth-Get-Center-LatLong-When-In-Birdseye-or-Oblique-Map-Style
  - /post/2008/06/05/virtual-earth-get-center-latlong-when-in-birdseye-or-oblique-map-style
---
<!-- more -->
<p>One of the tricky things that you need to work around when programming Virtual Earth is the VEMap.GetCenter() method doesn't work when&nbsp;displaying the&nbsp;Birdseye or Oblique Map Style. I'm not exactly sure what the reasoning for this is, but this is one thing that I would like to see fixed in a future version. Luckily, there is an unsupported method of doing this.</p>
<p>The code shown below&nbsp;gets the center Lat/Long coordinate for the BirdseyeScene being shown, not the actual center of the Map. This isn't exaclty what we're looking for, but at least it gives us a better idea of the current position of the map than nothing.</p>
<p>Here's a full example page that demonstrates getting the Map's center Lat/Long "relatively" when in Birdseye or Oblique Map Style:</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;&lt;/title&gt;
        &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8"&gt;
        &lt;script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1"&gt;&lt;/script&gt;
        &lt;script type="text/javascript"&gt;
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
        &lt;/script&gt;
    &lt;/head&gt;
    &lt;body onload="GetMap();"&gt;
        &lt;input type="button" value="Get Center Lat/Lng" onclick="DisplayCenter();"/&gt;
        &lt;div id='myMap' style="position:relative; width:400px; height:400px;"&gt;&lt;/div&gt;
    &lt;/body&gt;
&lt;/html&gt;</pre>
<p>&nbsp;</p>
