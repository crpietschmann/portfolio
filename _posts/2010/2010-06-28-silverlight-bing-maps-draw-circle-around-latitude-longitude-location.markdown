---
layout: post
blogengineid: f1194fa7-c70b-4f63-aa03-62fec6ec6581
title: "Silverlight Bing Maps: Draw Circle Around a Latitude/Longitude Location"
date: 2010-06-28 23:43:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2010/06/28/Silverlight-Bing-Maps-Draw-Circle-Around-Latitude-Longitude-Location.aspx
  - /post/2010/06/28/Silverlight-Bing-Maps-Draw-Circle-Around-Latitude-Longitude-Location
  - /post/2010/06/28/silverlight-bing-maps-draw-circle-around-latitude-longitude-location
  - /post.aspx?id=f1194fa7-c70b-4f63-aa03-62fec6ec6581
---
<!-- more -->

<a href="/files/SLBingMaps_DrawCircles.png"><img style="border-bottom: 0px; border-left: 0px; display: inline; margin-left: 0px; border-top: 0px; margin-right: 0px; border-right: 0px" title="SLBingMaps_DrawCircles" src="/files/SLBingMaps_DrawCircles_thumb.png" border="0" alt="SLBingMaps_DrawCircles" width="244" height="196" align="right" /></a> Over 2 years ago I posted an example of how to <a href="/post/2008/02/09/Virtual-Earth-Draw-a-Circle-Radius-Around-a-LatLong-Point">draw circles on the Bing Maps JavaScript control</a>. I thought it was about time to update that post to demonstrate how to do this using the Bing Maps Silverlight control. This is basically a C# port of the original JavaScript code.

Sometimes this can be really useful, but it isn&rsquo;t built into the Sivleright Bing Maps Control. So you need to implement it yourself in order to do it. However, instead of writing from scratch, feel free to copy the code from this post.

Download Full Source: <a href="/files/SLBingMaps_DrawCircle.zip" target="_self">SLBingMaps_DrawCircle.zip</a>
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:d0dc3616-ed94-46b2-a1ef-1768009e7fae" class="wlWriterEditableSmartContent" style="padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: none; padding-top: 0px">

 
</div>

 

Here&rsquo;s example usage:

```csharp
// Draw circle at the location where the user clicked
private void Map_MouseClick(object sender, Microsoft.Maps.MapControl.MapMouseEventArgs e)
{
    // Get the location the mouse clicked
    var mousePoint = e.ViewportPoint;
    var clickedLocation = MainMap.ViewportPointToLocation(mousePoint);

    // Calculate the points to make up a circle with radius of 200 miles
    var locations = GeoCodeCalc.CreateCircle(clickedLocation, 200, DistanceMeasure.Miles);

    // Add Red Polyline to the Map
    var poly = new MapPolyline();
    poly.Locations = locations;
    poly.Stroke = new SolidColorBrush(Color.FromArgb(255, 255, 0, 0));
    poly.StrokeThickness = 2;
    MainMap.Children.Add(poly);            
}
```
 

And, here&rsquo;s the code that calculates the location points to make up the circle:

```csharp
/*
 * Written by Chris Pietschmann ()
 * This code is derived from the code posted in the following location:
 * /post/2010/03/02/Bing-Maps-JS-Calculate-Area-of-Circle-and-Draw-Circle-on-Map.aspx
*/
using System;
using System.Collections.Generic;
using Microsoft.Maps.MapControl;

namespace SLBingMaps_DrawCircle
{
    public enum DistanceMeasure
    {
        Miles,
        Kilometers
    }

    public class GeoCodeCalc
    {
        public const double EarthRadiusInMiles = 3956.0;
        public const double EarthRadiusInKilometers = 6367.0;

        public static double ToRadian(double degrees)
        {
            return degrees * (Math.PI / 180);
        }

        public static double ToDegrees(double radians)
        {
            return radians * (180 / Math.PI);
        }

        public static LocationCollection CreateCircle(Location center, double radius, DistanceMeasure units)
        {
            var earthRadius = (units == DistanceMeasure.Miles ? GeoCodeCalc.EarthRadiusInMiles : GeoCodeCalc.EarthRadiusInKilometers);
            var lat = ToRadian(center.Latitude); //radians
            var lng = ToRadian(center.Longitude); //radians
            var d = radius / earthRadius; // d = angular distance covered on earth's surface
            var locations = new LocationCollection();

            for (var x = 0; x <= 360; x++)
            {
                var brng = ToRadian(x);
                var latRadians = Math.Asin(Math.Sin(lat) * Math.Cos(d) + Math.Cos(lat) * Math.Sin(d) * Math.Cos(brng));
                var lngRadians = lng + Math.Atan2(Math.Sin(brng) * Math.Sin(d) * Math.Cos(lat), Math.Cos(d) - Math.Sin(lat) * Math.Sin(latRadians));

                locations.Add(new Location(ToDegrees(latRadians), ToDegrees(lngRadians)));
            }

            return locations;
        }
    }
}
```