---
layout: post
blogengineid: 7b110c3f-e26c-446e-967f-084357c59f31
title: "Bing Maps Shapes (VEShape) to WKT (Well-Known-Text) and Back using JavaScript"
date: 2009-04-04 12:38:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "JavaScript"]
redirect_from: 
  - /post/2009/04/04/Virtual-Earth-Shapes-(VEShape)-to-WKT-(Well-Known-Text)-and-Back-using-JavaScript.aspx
  - /post/2009/04/04/Virtual-Earth-Shapes-(VEShape)-to-WKT-(Well-Known-Text)-and-Back-using-JavaScript
  - /post/2009/04/04/virtual-earth-shapes-(veshape)-to-wkt-(well-known-text)-and-back-using-javascript
  - /post.aspx?id=7b110c3f-e26c-446e-967f-084357c59f31
---
<!-- more -->

One of the standard methods of representing geometric shapes is by using the WKT (Well-Known-Text) standard. This is a human readable standard method of representing geometric shapes that can be used to easily pass spatial data between applications. I know GML or GeoRSS may be a little more applicable since they are based on XML, but WKT can work just fine in some cases.

If you don&rsquo;t know what WKT is here are a couple links for reference:

<a title="http://geoapi.sourceforge.net/2.0/javadoc/org/opengis/referencing/doc-files/WKT.html" href="http://geoapi.sourceforge.net/2.0/javadoc/org/opengis/referencing/doc-files/WKT.html">http://geoapi.sourceforge.net/2.0/javadoc/org/opengis/referencing/doc-files/WKT.html</a>

<a title="http://en.wikipedia.org/wiki/Well-known_text" href="http://en.wikipedia.org/wiki/Well-known_text">http://en.wikipedia.org/wiki/Well-known_text</a>

This is also one of the things that Virtual Earth does NOT have support built in for. So I wrote a little code that simply converts VEShape objects to a WKT string representation.

The code below allows you to represent Pushpins, Polygons and Polylines as strings like the following:
<pre class="csharpcode">POINT(-99.71000000000001 43.74999999999998)

POLYGON((-99.71000000000001 46.74999999999998,
 -96.71000000000001 46.74999999999998,
 -96.71000000000001 43.74999999999998,
 -99.71000000000001 46.74999999999998))

LINESTRING(-99.71000000000001 40.74999999999998,
 -102.71000000000001 40.74999999999998,
 -102.71000000000001 43.74999999999998)</pre>

Here are some examples of using the conversion methods:
<pre class="csharpcode"><span class="rem">// Get Map Center Point</span>
 <span class="kwrd">var</span> centerPoint = map.GetCenter();

 <span class="rem">// Create Pushpin VEShape and Get it's WKT representation</span>
 <span class="kwrd">var</span> wktShape = VirtualEarthWKT.ShapeToWKT(<span class="kwrd">new</span> VEShape(VEShapeType.Pushpin, centerPoint));
 <span class="rem">// Create a VEShape from the WKT representation</span>
 <span class="kwrd">var</span> shape = VirtualEarthWKT.ShapeFromWKT(wktShape);
 <span class="rem">// Add VEShape to Map</span>
 map.AddShape(shape);


 <span class="rem">// Create Polygons' Location Array</span>
 <span class="kwrd">var</span> polygonLocations = [
    <span class="kwrd">new</span> VELatLong(centerPoint.Latitude + 3, centerPoint.Longitude),
    <span class="kwrd">new</span> VELatLong(centerPoint.Latitude + 3, centerPoint.Longitude + 3),
    <span class="kwrd">new</span> VELatLong(centerPoint.Latitude, centerPoint.Longitude + 3)
 ];

 <span class="rem">// Create Polygon VEShape and Get it's WKT representation</span>
 wktShape = VirtualEarthWKT.ShapeToWKT(<span class="kwrd">new</span> VEShape(VEShapeType.Polygon, polygonLocations));
 <span class="rem">// Create a VEShape from the WKT representation</span>
 shape = VirtualEarthWKT.ShapeFromWKT(wktShape);
 <span class="rem">// Add VEShape to Map</span>
 map.AddShape(shape);


 <span class="rem">// Create Polylines' Location Array</span>
 <span class="kwrd">var</span> polylineLocations = [
    <span class="kwrd">new</span> VELatLong(centerPoint.Latitude - 3, centerPoint.Longitude),
    <span class="kwrd">new</span> VELatLong(centerPoint.Latitude - 3, centerPoint.Longitude - 3),
    <span class="kwrd">new</span> VELatLong(centerPoint.Latitude, centerPoint.Longitude - 3)
 ];

 <span class="rem">// Create Polyline VEShape and Get it's WKT representation</span>
 wktShape = VirtualEarthWKT.ShapeToWKT(<span class="kwrd">new</span> VEShape(VEShapeType.Polyline, polylineLocations));
 <span class="rem">// Create a VEShape from the WKT representation</span>
 shape = VirtualEarthWKT.ShapeFromWKT(wktShape);
 <span class="rem">// Add VEShape to Map</span>
 map.AddShape(shape);</pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

Here&rsquo;s the full code to the VirtualEarthWKT object that contains the static methods:
<pre class="csharpcode"><span class="rem">// Create the singleton object that contains the WKT (Well-Known-Text) transformation methods.</span>
<span class="kwrd">var</span> VirtualEarthWKT = <span class="kwrd">new</span> (<span class="kwrd">function</span>() {
    <span class="rem">// Declare some "private" methods that will only be used internally</span>
    <span class="kwrd">var</span> priv = {
        trimSpaces: <span class="kwrd">function</span>(str) {
            <span class="rem">// Trim beginning spaces</span>
            <span class="kwrd">while</span> (priv.startsWith(str, <span class="str">" "</span>)) {
                str = str.substring(1);
            }
            <span class="rem">// Trim ending spaces</span>
            <span class="kwrd">while</span> (priv.endsWith(str, <span class="str">" "</span>)) {
                str = str.substring(0, str.length - 1);
            }
            <span class="kwrd">return</span> str;
        },
        startsWith: <span class="kwrd">function</span>(str, startstr) {
            <span class="kwrd">return</span> str.substring(0, startstr.length) == startstr;
        },
        endsWith: <span class="kwrd">function</span>(str, endstr) {
            <span class="kwrd">return</span> str.substring(str.length - endstr.length) == endstr;
        }
    };
    <span class="rem">// Declare the "public" methods that will be exposed</span>
    <span class="kwrd">var</span> that = {
        <span class="rem">///<summary>Converts a VEShape object to WKT (Well-Known-Text) string representation.</summary></span>
        ShapeToWKT: <span class="kwrd">function</span>(shape) {
            <span class="kwrd">if</span> (shape == <span class="kwrd">null</span>) {
                <span class="kwrd">throw</span> <span class="str">"VirtualEarthWKT.ShapeToWKT: 'shape' parameter can not be null."</span>;
            }
            <span class="kwrd">var</span> wktTemplate = <span class="str">""</span>;
            <span class="kwrd">var</span> wktGeomPoints = <span class="str">""</span>;

            <span class="rem">// Figure out the WKT Geometry Type</span>
            <span class="kwrd">switch</span> (shape.GetType()) {
                <span class="kwrd">case</span> VEShapeType.Pushpin:
                    wktTemplate = <span class="str">"POINT({points})"</span>;
                    <span class="kwrd">break</span>;
                <span class="kwrd">case</span> VEShapeType.Polygon:
                    wktTemplate = <span class="str">"POLYGON(({points}))"</span>;
                    <span class="kwrd">break</span>;
                <span class="kwrd">case</span> VEShapeType.Polyline:
                    wktTemplate = <span class="str">"LINESTRING({points})"</span>;
                    <span class="kwrd">break</span>;
                <span class="kwrd">default</span>:
                    <span class="kwrd">throw</span> <span class="str">"VirtualEarthWKT.ShapeToWKT: VEShapeType ("</span> + shape.GetType() + <span class="str">") not supported."</span>;
                    <span class="kwrd">break</span>;
            }

            <span class="rem">// Get the List of VELatLong objects represented as WKT compatible list of points</span>
            <span class="kwrd">var</span> shapePoints = shape.GetPoints();
            <span class="kwrd">for</span> (<span class="kwrd">var</span> i = 0; i < shapePoints.length; i++) {
                <span class="kwrd">if</span> (wktGeomPoints.length > 0) {
                    wktGeomPoints += <span class="str">", "</span>;
                }
                wktGeomPoints += shapePoints[i].Longitude + <span class="str">" "</span> + shapePoints[i].Latitude;
            }

            <span class="rem">// return WKT representation of the VEShape</span>
            <span class="kwrd">return</span> wktTemplate.replace(<span class="str">"{points}"</span>, wktGeomPoints);
        },
        <span class="rem">///<summary></span>
        <span class="rem">///Converts WKT (Well-Known-Text) string representation of a point/polygon/linestring to a VEShape object.</span>
        <span class="rem">///</summary></span>
        ShapeFromWKT: <span class="kwrd">function</span>(strWKT) {
            <span class="kwrd">if</span> (strWKT == <span class="kwrd">null</span>) {
                <span class="kwrd">throw</span> <span class="str">"VirtualEarthWKT.ShapeFromWKT: 'strWKT' parameter can not be null."</span>;
            }
            <span class="kwrd">if</span> (strWKT.length == 0) {
                <span class="kwrd">throw</span> <span class="str">"VirtualEarthWKT.ShapeFromWKT: 'strWKT' parameter can not be an empty string."</span>;
            }
            <span class="kwrd">var</span> shapeType = <span class="kwrd">null</span>;
            <span class="kwrd">var</span> wktPoints = <span class="kwrd">null</span>;

            <span class="rem">// Get the Shape Type and list of "Longitude Latitude" location points</span>
            <span class="kwrd">switch</span> (strWKT.substring(0, 5).toLowerCase()) {
                <span class="kwrd">case</span> <span class="str">"point"</span>:
                    shapeType = VEShapeType.Pushpin;
                    wktPoints = strWKT.substring(6, strWKT.length - 1);
                    <span class="kwrd">break</span>;
                <span class="kwrd">case</span> <span class="str">"polyg"</span>:
                    shapeType = VEShapeType.Polygon;
                    wktPoints = strWKT.substring(9, strWKT.length - 2);
                    <span class="kwrd">break</span>;
                <span class="kwrd">case</span> <span class="str">"lines"</span>:
                    shapeType = VEShapeType.Polyline;
                    wktPoints = strWKT.substring(11, strWKT.length - 1);
                    <span class="kwrd">break</span>;
                <span class="kwrd">default</span>:
                    <span class="kwrd">throw</span> <span class="str">"VirtualEarthWKT.ShapeFromWKT: Unknown WKT Geometry Type"</span>;
                    <span class="kwrd">break</span>;
            }

            <span class="rem">// split out the wkt points to be seperate</span>
            wktPoints = wktPoints.split(<span class="str">","</span>);

            <span class="rem">// Convert the WKT Points to VELatLong locations</span>
            <span class="kwrd">var</span> shapePoints = <span class="kwrd">new</span> Array();
            <span class="kwrd">for</span> (<span class="kwrd">var</span> i = 0; i < wktPoints.length; i++) {
                <span class="rem">// Split the "Longitude Latitude" apart</span>
                <span class="kwrd">var</span> loc = priv.trimSpaces(wktPoints[i]).split(<span class="str">" "</span>);
                <span class="rem">// Create VELatLong location</span>
                shapePoints[shapePoints.length] = <span class="kwrd">new</span> VELatLong(parseFloat(loc[1]), parseFloat(loc[0]));
            }
            
            <span class="rem">// Return a VEShape that represents this WKT Geometry</span>
            <span class="kwrd">return</span> <span class="kwrd">new</span> VEShape(shapeType, shapePoints);
        }
    };
    <span class="rem">// Return the object that contains the "public" and "private" methods</span>
    <span class="kwrd">return</span> that;
})();</pre>
