---
layout: post
blogengineid: 1e2824a0-3bef-4707-8f18-a624ad784432
title: "Bing Maps: Draw a Circle Radius Around a Lat/Long Point"
date: 2008-02-09 02:58:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/02/09/Virtual-Earth-Draw-a-Circle-Radius-Around-a-LatLong-Point
  - /post/2008/02/09/virtual-earth-draw-a-circle-radius-around-a-latlong-point
  - /post.aspx?id=1e2824a0-3bef-4707-8f18-a624ad784432
---
<!-- more -->

I get requests on how to draw radius' around points on the map. And, up until now, I never needed to do it myself, so I didn't have a code snippet to do it. I did a search and quickly found an example over at <a href="http://viavirtualearth.com/Wiki/Draw+a+circle.ashx">viavirtualearth</a> on how to do it in an older version of Virtual Earth. Other than being coded for an older version of Virtual Earth (and incompatible with VE6); it's coded to only handle drawing a radius in Kilometers.

So, I decided to upgrade the code example to support VE6, and support both Miles and Kilometers. I'm also converted it to make use of the GeoCodeCalc.ToDegrees function that I originally posted in my "<a href="/Blog/Post.aspx?PostID=1453">Calculate Distance of User-Drawn Polyline</a>" post.

<a href="http://pietschsoft.net/Download/Blog/1456/DrawRadius.zip">Download the Full Example Here</a>

<img src="http://pietschsoft.net/Download/Blog/1456/VEDrawRadius.png" border="0" alt="" width="300" height="219" align="baseline" />

And, in case you don't feel like downloading the example code that uses it, here's the source to the method that calculates the points that make up the radius: 

```javascript
 /* *************************************************************************** */
 /* Written Chris Pietschmann (<a href="/"></a>) */
 /* This code is dependant on the GeoCodeCalc class found here: */
 /* <a href="/Blog/Post.aspx?PostID=1453">/Blog/Post.aspx?PostID=1453</a> */
 /* *************************************************************************** */
 /* This mathimatical code is a modified version of the code originally posted */
 /* at the following location: *//* <a href="http://viavirtualearth.com/Wiki/Draw+a+circle.ashx">http://viavirtualearth.com/Wiki/Draw+a+circle.ashx</a> */
 /* *************************************************************************** */
 if (GeoCodeCalc == undefined) 
     var GeoCodeCalc = {}

GeoCodeCalc.ToDegrees = function(radians){ return radians * 180 / Math.PI;};

function CreateCircle(loc, radius, units){ 
 var earthRadius = parseFloat(units); 
 var lat = GeoCodeCalc.ToRadian(loc.Latitude); //radians 
 var lon = GeoCodeCalc.ToRadian(loc.Longitude); //radians 
 var d = parseFloat(radius) / earthRadius; // d = angular distance covered on earth&amp;#39;s surface 
 var locs = new Array(); 
 for (x = 0; x &amp;lt;= 360; x++) { 
 var p2 = new VELatLong(0,0) 
 brng = GeoCodeCalc.ToRadian(x); //radians 
 var latRadians = Math.asin(Math.sin(lat) * Math.cos(d) + Math.cos(lat) * Math.sin(d) * Math.cos(brng)); 
 var lngRadians = lon + Math.atan2(Math.sin(brng) * Math.sin(d) * Math.cos(lat), Math.cos(d) - Math.sin(lat) * Math.sin(latRadians)); 
 locs.push(new VELatLong(GeoCodeCalc.ToDegrees(latRadians), GeoCodeCalc.ToDegrees(lngRadians))); 
 } 
 return new VEShape(VEShapeType.Polyline, locs); 
 }
 ```
