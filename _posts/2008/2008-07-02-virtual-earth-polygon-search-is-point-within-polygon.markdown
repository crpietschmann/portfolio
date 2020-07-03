---
layout: post
blogengineid: 57e3e956-a3cd-445f-8445-48bee9c14494
title: "Bing Maps: Polygon Search - Is Point Within Polygon?"
date: 2008-07-02 23:42:00 -0500
comments: true
published: true
categories: ["Bing Maps", "GIS"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/07/02/Virtual-Earth-Polygon-Search-Is-Point-Within-Polygon.aspx
  - /post/2008/07/02/Virtual-Earth-Polygon-Search-Is-Point-Within-Polygon
  - /post/2008/07/02/virtual-earth-polygon-search-is-point-within-polygon
  - /post.aspx?id=57e3e956-a3cd-445f-8445-48bee9c14494
---
<!-- more -->

Today, I found an article on MSDN that covers how to perform a polygon search to determine if a given Lat/Long point is within a given Polygon.

I copied the logic for searching within the Polygon and made it more reusable than what is posted in the MSDN article, so I thought I'd post it here.
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">if (GeoHelper == undefined)
    var GeoHelper = {};

GeoHelper.IsInPolygon=function(points,latlong)
{
    // This code adapted from the following URL:
    // http://msdn.microsoft.com/en-us/library/cc451895.aspx
    var i;
    var j=points.length-1;
    var inPoly=false;
    var lat = latlong.Latitude;
    var lon = latlong.Longitude;
    for (i=0; i<points.length; i++) 
    {
        if (points[i].Longitude<lon &amp;&amp; points[j].Longitude>=lon ||  points[j].Longitude<lon &amp;&amp; points[i].Longitude>=lon) 
        {
            if (points[i].Latitude+(lon-points[i].Longitude)/(points[j].Longitude-points[i].Longitude)*(points[j].Latitude-points[i].Latitude)<lat) 
            {
                inPoly=!inPoly; 
            }
        }
        j=i; 
    }
    return inPoly; 
};</pre>

The usage of the IsInPolygon method is fairly simple, the first parameter is an array of VELatLong point objects that make up the Polygon, and the second is the VELatLong point object you want to test to see if it is located within the Polygon. Then the method simply returns True if it's within the Polygon, and False if it's not.

Also, this code would be very easily converted to C# or VB.NET if you need to perform the search within your server-side code.

Here's a full code sample demonstrating this. This sample allows you to click on the map, and when you click it checks to see if the point you clicked is within the polygon, and it displays an alert box telling you if it is or not.
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1"></script>
<script type="text/javascript">
    var map = null;
    var polygon = null;

    function GetMap()
    {
        map = new VEMap('myMap');
        map.LoadMap();

        //Plot Polygon
        var points = new Array(new VELatLong(43.64486433588385, -79.3791389465332),
            new VELatLong(43.64508171979899, -79.3930435180664),
            new VELatLong(43.63682057801007, -79.38437461853027),
            new VELatLong(43.63946054004705, -79.36819553375244),
            new VELatLong(43.652720712083266, -79.37201499938965),
            new VELatLong(43.65793702655821, -79.39111232757568),
            new VELatLong(43.64927396999741, -79.37222957611084),
            new VELatLong(43.64486433588385, -79.3791389465332));

        polygon = new VEShape(VEShapeType.Polygon, points);
        polygon.HideIcon();
        map.AddShape(polygon);
        map.SetMapView(points);

        //Add onclick handler
        map.AttachEvent("onclick", map_click);
    }

    function map_click(eventArgs)
    {
        var latlong = map.PixelToLatLong(new VEPixel(eventArgs.mapX, eventArgs.mapY));
        alert("Is Point Within Polyline:\n" + GeoHelper.IsInPolygon(polygon.GetPoints(), latlong));
    }


    if (GeoHelper == undefined)
        var GeoHelper = {};

    GeoHelper.IsInPolygon=function(points,latlong)
    {
        // This code adapted from the following URL:
        // http://msdn.microsoft.com/en-us/library/cc451895.aspx

        var i;
        var j=points.length-1;
        var inPoly=false;
        var lat = latlong.Latitude;
        var lon = latlong.Longitude;

        for (i=0; i<points.length; i++) 
        {
            if (points[i].Longitude<lon &amp;&amp; points[j].Longitude>=lon ||  points[j].Longitude<lon &amp;&amp; points[i].Longitude>=lon) 
            {
                if (points[i].Latitude+(lon-points[i].Longitude)/(points[j].Longitude-points[i].Longitude)*(points[j].Latitude-points[i].Latitude)<lat) 
                {
                    inPoly=!inPoly; 
                }
            }
            j=i; 
        }

        return inPoly; 
    };
</script>
</head>
<body onload="GetMap();">
  <div id='myMap' style="position: relative; width: 600px; height: 400px;"></div>
</body>
</html></pre>

You can find the original MSDN article here: 
<a href="http://msdn.microsoft.com/en-us/library/cc451895.aspx">http://msdn.microsoft.com/en-us/library/cc451895.aspx</a>
