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
  - /post/2010/06/28/Silverlight-Bing-Maps-Draw-Circle-Around-Latitude-Longitude-Location
  - /post/2010/06/28/silverlight-bing-maps-draw-circle-around-latitude-longitude-location
  - /post.aspx?id=f1194fa7-c70b-4f63-aa03-62fec6ec6581
---
<!-- more -->

<a href="/images/postsSLBingMaps_DrawCircles.png"><img style="border-bottom: 0px; border-left: 0px; display: inline; margin-left: 0px; border-top: 0px; margin-right: 0px; border-right: 0px" title="SLBingMaps_DrawCircles" src="/images/postsSLBingMaps_DrawCircles_thumb.png" border="0" alt="SLBingMaps_DrawCircles" width="244" height="196" align="right" /></a> Over 2 years ago I posted an example of how to <a href="/post/2008/02/09/Virtual-Earth-Draw-a-Circle-Radius-Around-a-LatLong-Point.aspx">draw circles on the Bing Maps JavaScript control</a>. I thought it was about time to update that post to demonstrate how to do this using the Bing Maps Silverlight control. This is basically a C# port of the original JavaScript code.

Sometimes this can be really useful, but it isn&rsquo;t built into the Sivleright Bing Maps Control. So you need to implement it yourself in order to do it. However, instead of writing from scratch, feel free to copy the code from this post.

Download Full Source: <a href="/file.axd?file=SLBingMaps_DrawCircle.zip" target="_self">SLBingMaps_DrawCircle.zip</a>
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:d0dc3616-ed94-46b2-a1ef-1768009e7fae" class="wlWriterEditableSmartContent" style="padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: none; padding-top: 0px">

 
</div>

 

Here&rsquo;s example usage:
<pre class="csharpcode"><span class="rem">// Draw circle at the location where the user clicked</span><br /><span class="kwrd">private</span> <span class="kwrd">void</span> Map_MouseClick(<span class="kwrd">object</span> sender, Microsoft.Maps.MapControl.MapMouseEventArgs e)<br />{<br />    <span class="rem">// Get the location the mouse clicked</span><br />    var mousePoint = e.ViewportPoint;<br />    var clickedLocation = MainMap.ViewportPointToLocation(mousePoint);<br /><br />    <span class="rem">// Calculate the points to make up a circle with radius of 200 miles</span><br />    var locations = GeoCodeCalc.CreateCircle(clickedLocation, 200, DistanceMeasure.Miles);<br /><br />    <span class="rem">// Add Red Polyline to the Map</span><br />    var poly = <span class="kwrd">new</span> MapPolyline();<br />    poly.Locations = locations;<br />    poly.Stroke = <span class="kwrd">new</span> SolidColorBrush(Color.FromArgb(255, 255, 0, 0));<br />    poly.StrokeThickness = 2;<br />    MainMap.Children.Add(poly);            <br />}</pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

 

And, here&rsquo;s the code that calculates the location points to make up the circle:
<pre class="csharpcode"><span class="rem">/*</span><br /><span class="rem"> * Written by Chris Pietschmann ()</span><br /><span class="rem"> * This code is derived from the code posted in the following location:</span><br /><span class="rem"> * /post/2010/03/02/Bing-Maps-JS-Calculate-Area-of-Circle-and-Draw-Circle-on-Map.aspx</span><br /><span class="rem">*/</span><br /><span class="kwrd">using</span> System;<br /><span class="kwrd">using</span> System.Collections.Generic;<br /><span class="kwrd">using</span> Microsoft.Maps.MapControl;<br /><br /><span class="kwrd">namespace</span> SLBingMaps_DrawCircle<br />{<br />    <span class="kwrd">public</span> <span class="kwrd">enum</span> DistanceMeasure<br />    {<br />        Miles,<br />        Kilometers<br />    }<br /><br />    <span class="kwrd">public</span> <span class="kwrd">class</span> GeoCodeCalc<br />    {<br />        <span class="kwrd">public</span> <span class="kwrd">const</span> <span class="kwrd">double</span> EarthRadiusInMiles = 3956.0;<br />        <span class="kwrd">public</span> <span class="kwrd">const</span> <span class="kwrd">double</span> EarthRadiusInKilometers = 6367.0;<br /><br />        <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">double</span> ToRadian(<span class="kwrd">double</span> degrees)<br />        {<br />            <span class="kwrd">return</span> degrees * (Math.PI / 180);<br />        }<br /><br />        <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">double</span> ToDegrees(<span class="kwrd">double</span> radians)<br />        {<br />            <span class="kwrd">return</span> radians * (180 / Math.PI);<br />        }<br /><br />        <span class="kwrd">public</span> <span class="kwrd">static</span> LocationCollection CreateCircle(Location center, <span class="kwrd">double</span> radius, DistanceMeasure units)<br />        {<br />            var earthRadius = (units == DistanceMeasure.Miles ? GeoCodeCalc.EarthRadiusInMiles : GeoCodeCalc.EarthRadiusInKilometers);<br />            var lat = ToRadian(center.Latitude); <span class="rem">//radians</span><br />            var lng = ToRadian(center.Longitude); <span class="rem">//radians</span><br />            var d = radius / earthRadius; <span class="rem">// d = angular distance covered on earth's surface</span><br />            var locations = <span class="kwrd">new</span> LocationCollection();<br /><br />            <span class="kwrd">for</span> (var x = 0; x &lt;= 360; x++)<br />            {<br />                var brng = ToRadian(x);<br />                var latRadians = Math.Asin(Math.Sin(lat) * Math.Cos(d) + Math.Cos(lat) * Math.Sin(d) * Math.Cos(brng));<br />                var lngRadians = lng + Math.Atan2(Math.Sin(brng) * Math.Sin(d) * Math.Cos(lat), Math.Cos(d) - Math.Sin(lat) * Math.Sin(latRadians));<br /><br />                locations.Add(<span class="kwrd">new</span> Location(ToDegrees(latRadians), ToDegrees(lngRadians)));<br />            }<br /><br />            <span class="kwrd">return</span> locations;<br />        }<br />    }<br />}</pre>
