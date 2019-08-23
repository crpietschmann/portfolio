---
layout: post
blogengineid: 3bd04a2e-7df6-48d5-a359-1cbc3764889e
title: "Calculate Distance Between Geocodes in C# and JavaScript"
date: 2008-02-01 23:58:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "JavaScript"]
redirect_from: 
  - /post/2008/02/01/Calculate-Distance-Between-Geocodes-in-C-and-JavaScript.aspx
  - /post/2008/02/01/Calculate-Distance-Between-Geocodes-in-C-and-JavaScript
  - /post/2008/02/01/calculate-distance-between-geocodes-in-c-and-javascript
  - /post.aspx?id=3bd04a2e-7df6-48d5-a359-1cbc3764889e
---
<!-- more -->

There are times when I need code to calculate the distance between two geocodes (Lat/Long points). I don't need it very often and until now I didn't have a code snippet that I could jus copy and paste. I was searching and found <a href="http://blog.wekeroad.com/2007/08/30/linq-and-geocoding/">Rob Conery's LINQ and Geocoding</a> post. It's an interesting post and he includes a sample of how to use Lambda expressions in C# 3.0 to calculate the distance between two geocodes in Miles.

I decided to copy his code snippet and make sure it works in .NET 2.0 and also convert it to JavaScript. So below are both my C# 2.0 and JavaScript snippets for calculating the distance between two geocodes.
<h3>C# 2.0</h3>

Sample Usage:

```csharp
 // Calculate Distance in Milesdouble 
 d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625);
 // Calculate Distance in Kilometersdouble 
 d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625, GeoCodeCalcMeasurement.Kilometers); 
 ```

GeoCodeCalc C# Class:

```csharp
 public static class GeoCodeCalc{ 
 public const double EarthRadiusInMiles = 3956.0; 
 public const double EarthRadiusInKilometers = 6367.0; 
 public static double ToRadian(double val) { return val * (Math.PI / 180); } 
 public static double DiffRadian(double val1, double val2) { return ToRadian(val2) - ToRadian(val1); } 
 /// <summary> 
 /// Calculate the distance between two geocodes. Defaults to using Miles. 
 /// </summary> 
 public static double CalcDistance(double lat1, double lng1, double lat2, double lng2) { 
 return CalcDistance(lat1, lng1, lat2, lng2, GeoCodeCalcMeasurement.Miles); 
 }
  /// <summary> 
 /// Calculate the distance between two geocodes. 
 /// </summary> 
 public static double CalcDistance(double lat1, double lng1, double lat2, double lng2, GeoCodeCalcMeasurement m) { 
 double radius = GeoCodeCalc.EarthRadiusInMiles; 
 if (m == GeoCodeCalcMeasurement.Kilometers) { radius = GeoCodeCalc.EarthRadiusInKilometers; } 
 return radius * 2 * Math.Asin( Math.Min(1, Math.Sqrt( ( Math.Pow(Math.Sin((DiffRadian(lat1, lat2)) / 2.0), 2.0) + Math.Cos(ToRadian(lat1)) * Math.Cos(ToRadian(lat2)) * Math.Pow(Math.Sin((DiffRadian(lng1, lng2)) / 2.0), 2.0) ) ) ) ); 
 }
 }
 public enum GeoCodeCalcMeasurement : int
 { 
 Miles = 0,
 Kilometers = 1
 }
 ```
<h3>JavaScript</h3>

Sample Usage:

```javascript
 // Calculate distance in Milesvar 
 d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625, GeoCodeCalc.EarthRadiusInMiles); 
 // Calculate distance in Kilometersvar 
 d = GeoCodeCalc.CalcDistance(47.8131545175277, -122.783203125, 42.0982224111897, -87.890625, GeoCodeCalc.EarthRadiusInKilometers); 
 ```

GeoCodeCalc JavaScript Class:

```javascript
 var GeoCodeCalc = {};
 GeoCodeCalc.EarthRadiusInMiles = 3956.0;
 GeoCodeCalc.EarthRadiusInKilometers = 6367.0;
 GeoCodeCalc.ToRadian = function(v) { return v * (Math.PI / 180);};
 GeoCodeCalc.DiffRadian = function(v1, v2) { 
 return GeoCodeCalc.ToRadian(v2) - GeoCodeCalc.ToRadian(v1);
 };
 GeoCodeCalc.CalcDistance = function(lat1, lng1, lat2, lng2, radius) { 
 return radius * 2 * Math.asin( Math.min(1, Math.sqrt( ( Math.pow(Math.sin((GeoCodeCalc.DiffRadian(lat1, lat2)) / 2.0), 2.0) + Math.cos(GeoCodeCalc.ToRadian(lat1)) * Math.cos(GeoCodeCalc.ToRadian(lat2)) * Math.pow(Math.sin((GeoCodeCalc.DiffRadian(lng1, lng2)) / 2.0), 2.0) ) ) ) );
 };
 ```
