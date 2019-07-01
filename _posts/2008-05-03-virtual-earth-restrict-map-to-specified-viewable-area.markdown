---
layout: post
id: d5025e10-f1bf-4b56-9eae-71095fe256a8
title: "Virtual Earth: Restrict Map to Specified Viewable Area"
date: 2008-05-03 20:36:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/05/03/Virtual-Earth-Restrict-Map-to-Specified-Viewable-Area
  - /post/2008/05/03/virtual-earth-restrict-map-to-specified-viewable-area
  - /post.aspx?id=d5025e10-f1bf-4b56-9eae-71095fe256a8
---
<!-- more -->
<p>
This example demonstrates the ability to restrict the viewable area (and impose map boundaries)&nbsp;of a Virtual Earth map to be within a specified distance from the maps original center point (at time of initial load), and restrict to a maximum zoom level. 
</p>
<p>
Why might you want to do this? There are times when you may want to restrict your users from possibly getting &quot;lost&quot; when viewing your data on a map. Also, you may want to restrict the user from panning around the globe in an attempt to reduce the number of Virtual Earth Map Transactions that you&#39;ll end up paying for. Whatever the reasoning is; I&#39;ve actually had this functionality requested a few times by clients, so I thought I&#39;d write up a simple example. 
</p>
<p>
This article was written with Virtual Earth v6.1, and will also work with Virtual Earth v6.0.
</p>
<img style="float: right" src="/images/postsVE_RestrictMapSpecifiedViewableArea.png" alt="" width="230" height="314" /> 
<h5>Download the Code:</h5>
<p>
<a rel="enclosure" href="/file.axd?file=VE_RestrictMapSpecifiedViewableArea.zip">VE_RestrictMapSpecifiedViewableArea.zip (3.01 kb)</a> 
</p>
<h3>Other Code Used In This Example</h3>
<p>
This example utilizes code that was included in the following two examples I&#39;ve previously written:<br />
<a href="/post.aspx?id=3bd04a2e-7df6-48d5-a359-1cbc3764889e">Calculate Distance Between Geocodes in C# and JavaScript</a><br />
<a href="/post.aspx?id=1e2824a0-3bef-4707-8f18-a624ad784432">Virtual Earth: Draw a Circle Radius Around a Lat/Long Point</a> 
</p>
<h3>Restrict Viewable Area</h3>
<p>
First create your map as usual; nothing special the creation of the VE map needed. Once you have your code in place to add the map to the page, you just need to handle the maps OnEndPan and OnStartPan&nbsp;events. You do this by attaching event handlers to these events, like the following: 
</p>
<p>
[code:js] 
</p>
<p>
//Attach our onendpan event handler<br />
map.AttachEvent(&quot;onendpan&quot;, map_onendpan); 
</p>
<p>
//Attach our onstartpan event handler<br />
map.AttachEvent(&quot;onstartpan&quot;, map_onstartpan);<br />
<br />
function map_onendpan(e) { }<br />
function map_onstartpan(e) { } 
</p>
<p>
[/code] 
</p>
<p>
Next,&nbsp;setup a couple global variables that will be used to define the restriction that will be imposed. 
</p>
<p>
[code:js] 
</p>
var mapRestrictionDistance = 100;<br />
var mapRestrictionUnit = GeoCodeCalc.EarthRadiusInMiles; 
<p>
[/code] 
</p>
<p>
The above two global variables define that&nbsp;you will restrict the map to only be panned within 100 miles of the maps original center point. 
</p>
<p>
Next,&nbsp;you need to add code to the event handler method stubs shown above that will actually restrict the maps viewable area. 
</p>
<p>
In&nbsp;the map_onstartpan event handler&nbsp;you will record the maps center point in a global variable&nbsp;before the panning begins. To do this add the following code: 
</p>
<p>
[code:js] 
</p>
<p>
// global variable to keep track of maps center point before panning began<br />
var mapStartPanPoint = null;<br />
<br />
function map_onstartpan(e)<br />
{<br />
&nbsp;&nbsp;&nbsp; //Get the current map center point before panning begins<br />
&nbsp;&nbsp;&nbsp; mapStartPanPoint = map.GetCenter();<br />
} 
</p>
<p>
[/code] 
</p>
<p>
In&nbsp;the map_onendpan event handler&nbsp;you will place the actual code that imposes our restriction. The following code will check if the map has been panned past the desired limitation of 100 miles from the original center point. If it has, it will reposition the map back to the last point the map was at before the invalid panning began. Here&#39;s the code to implement this within the map_onendpan event handler: 
</p>
<p>
[code:js] 
</p>
<p>
function map_onendpan(e)<br />
{<br />
&nbsp;&nbsp;&nbsp; //Get total distance panned from map center<br />
&nbsp;&nbsp;&nbsp; var distance = GeoCodeCalc.CalcDistance(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;mapOriginalCenterPoint.Latitude,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;mapOriginalCenterPoint.Longitude,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;map.GetCenter().Latitude,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.GetCenter().Longitude,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapRestrictionUnit<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ); 
</p>
<p>
&nbsp;&nbsp;&nbsp; //Check distance panned from original center point<br />
&nbsp;&nbsp;&nbsp; if (distance &gt; mapRestrictionDistance)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //Move map back to the last point that was<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //within the desired restriction radius<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.SetCenter(mapStartPanPoint);<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
[/code] 
</p>
<h3>Restrict Maximum Zoom Level</h3>
<p>
To add the Maximum Zoom Level restriction all&nbsp;you need to do is implement a handler for the maps OnEndZoom event. 
</p>
<p>
Use the following code to attach an event handler to the OnEndZoom event: 
</p>
<p>
[code:js] 
</p>
<p>
//Attach our onendzoom event handler<br />
map.AttachEvent(&quot;onendzoom&quot;, map_onendzoom);<br />
<br />
function map_onendzoom(e) { } 
</p>
<p>
[/code] 
</p>
<p>
Before&nbsp;you write the code that will place a restriction on the maximum zoom level, you need to declare a global variable that will define what&nbsp;the maximum zoom level will be. 
</p>
<p>
[code:js] 
</p>
<p>
var mapRestrictionZoomLevel = 7; 
</p>
<p>
[/code] 
</p>
<p>
Now that you have&nbsp;the global variable in place, and the event is being handled by&nbsp;the map_onendzoom method stub,&nbsp;you need to add the following code to the method that will put&nbsp;the zoom level&nbsp;restriction in place: 
</p>
<p>
[code:js] 
</p>
<p>
function map_onendzoom(e)<br />
{<br />
&nbsp;&nbsp;&nbsp; //Check if the map is zoomed out further than<br />
&nbsp;&nbsp;&nbsp; //the set restriction<br />
&nbsp;&nbsp;&nbsp; if (e.zoomLevel &lt; mapRestrictionZoomLevel)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //Zoom the map back in to the restricted area<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.SetZoomLevel(mapRestrictionZoomLevel);<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
[/code] 
</p>
<h3>Conclusion</h3>
<p>
This is actually some rather simple code to write (at least when utilizing the GeoCodeCalc class) and it provides some good functionality to keep your users from possibly getting lost, along with potentially reducing the number of Virtual Earth Map Transactions you&#39;ll end up paying for. 
</p>
