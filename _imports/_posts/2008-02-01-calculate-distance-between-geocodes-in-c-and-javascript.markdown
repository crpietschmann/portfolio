---
layout: post
title: "Calculate Distance Between Geocodes in C# and JavaScript"
date: 2008-02-01 23:58:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "JavaScript"]
redirect_from: 
  - /post/2008/02/01/Calculate-Distance-Between-Geocodes-in-C-and-JavaScript
 -  /post/2008/02/01/calculate-distance-between-geocodes-in-c-and-javascript
---
<!-- more -->
<p>There are times when I need code to calculate the distance between two geocodes (Lat/Long points). I don't need it very often and until now I didn't have a code snippet that I could jus copy and paste. I was searching and found <a href="http://blog.wekeroad.com/2007/08/30/linq-and-geocoding/">Rob Conery's LINQ and Geocoding</a> post. It's an interesting post and he includes a sample of how to use Lambda expressions in C# 3.0 to calculate the distance between two geocodes in Miles.</p>
<p>I decided to copy his code snippet and make sure it works in .NET 2.0 and also convert it to JavaScript. So below are both my C# 2.0 and JavaScript&nbsp;snippets for calculating the distance between two geocodes.</p>
<h3>C# 2.0</h3>
<p>Sample Usage:</p>
<p>[code:c#]<br /> // Calculate Distance in Milesdouble <br /> d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625);<br /> // Calculate Distance in Kilometersdouble <br /> d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625, GeoCodeCalcMeasurement.Kilometers); <br /> [/code]</p>
<p>GeoCodeCalc C# Class:</p>
<p>[code:c#]<br /> public static class GeoCodeCalc{ <br /> public const double EarthRadiusInMiles = 3956.0; <br /> public const double EarthRadiusInKilometers = 6367.0; <br /> public static double ToRadian(double val) { return val * (Math.PI / 180); } <br /> public static double DiffRadian(double val1, double val2) { return ToRadian(val2) - ToRadian(val1); } <br /> /// &lt;summary&gt; <br /> /// Calculate the distance between two geocodes. Defaults to using Miles. <br /> /// &lt;/summary&gt; <br /> public static double CalcDistance(double lat1, double lng1, double lat2, double lng2) { <br /> return CalcDistance(lat1, lng1, lat2, lng2, GeoCodeCalcMeasurement.Miles); <br /> }<br /> &nbsp;/// &lt;summary&gt; <br /> /// Calculate the distance between two geocodes. <br /> /// &lt;/summary&gt; <br /> public static double CalcDistance(double lat1, double lng1, double lat2, double lng2, GeoCodeCalcMeasurement m) { <br /> double radius = GeoCodeCalc.EarthRadiusInMiles; <br /> if (m == GeoCodeCalcMeasurement.Kilometers) { radius = GeoCodeCalc.EarthRadiusInKilometers; } <br /> return radius * 2 * Math.Asin( Math.Min(1, Math.Sqrt( ( Math.Pow(Math.Sin((DiffRadian(lat1, lat2)) / 2.0), 2.0) + Math.Cos(ToRadian(lat1)) * Math.Cos(ToRadian(lat2)) * Math.Pow(Math.Sin((DiffRadian(lng1, lng2)) / 2.0), 2.0) ) ) ) ); <br /> }<br /> }<br /> public enum GeoCodeCalcMeasurement : int<br /> { <br /> Miles = 0,<br /> Kilometers = 1<br /> }<br /> [/code]</p>
<h3>JavaScript</h3>
<p>Sample Usage:</p>
<p>[code:js]<br /> // Calculate distance in Milesvar <br /> d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625, GeoCodeCalc.EarthRadiusInMiles); <br /> // Calculate distance in Kilometersvar <br /> d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625, GeoCodeCalc.EarthRadiusInKilometers); <br /> [/code]</p>
<p>GeoCodeCalc JavaScript Class:</p>
<p>[code:js]<br /> var GeoCodeCalc = {};<br /> GeoCodeCalc.EarthRadiusInMiles = 3956.0;<br /> GeoCodeCalc.EarthRadiusInKilometers = 6367.0;<br /> GeoCodeCalc.ToRadian = function(v) { return v * (Math.PI / 180);};<br /> GeoCodeCalc.DiffRadian = function(v1, v2) { <br /> return GeoCodeCalc.ToRadian(v2) - GeoCodeCalc.ToRadian(v1);<br /> };<br /> GeoCodeCalc.CalcDistance = function(lat1, lng1, lat2, lng2, radius) { <br /> return radius * 2 * Math.asin( Math.min(1, Math.sqrt( ( Math.pow(Math.sin((GeoCodeCalc.DiffRadian(lat1, lat2)) / 2.0), 2.0) + Math.cos(GeoCodeCalc.ToRadian(lat1)) * Math.cos(GeoCodeCalc.ToRadian(lat2)) * Math.pow(Math.sin((GeoCodeCalc.DiffRadian(lng1, lng2)) / 2.0), 2.0) ) ) ) );<br /> };<br /> [/code]</p>
