---
layout: post
blogengineid: d5025e10-f1bf-4b56-9eae-71095fe256a8
title: "Virtual Earth: Restrict Map to Specified Viewable Area"
date: 2008-05-03 20:36:00 -0500
comments: true
published: true
categories: ["Virtual Earth", "GIS"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/05/03/Virtual-Earth-Restrict-Map-to-Specified-Viewable-Area.aspx
  - /post/2008/05/03/Virtual-Earth-Restrict-Map-to-Specified-Viewable-Area
  - /post/2008/05/03/virtual-earth-restrict-map-to-specified-viewable-area
  - /post.aspx?id=d5025e10-f1bf-4b56-9eae-71095fe256a8
---
<!-- more -->


This example demonstrates the ability to restrict the viewable area (and impose map boundaries) of a Virtual Earth map to be within a specified distance from the maps original center point (at time of initial load), and restrict to a maximum zoom level. 



Why might you want to do this? There are times when you may want to restrict your users from possibly getting &quot;lost&quot; when viewing your data on a map. Also, you may want to restrict the user from panning around the globe in an attempt to reduce the number of Virtual Earth Map Transactions that you&#39;ll end up paying for. Whatever the reasoning is; I&#39;ve actually had this functionality requested a few times by clients, so I thought I&#39;d write up a simple example. 



This article was written with Virtual Earth v6.1, and will also work with Virtual Earth v6.0.

<img style="float: right" src="/files/VE_RestrictMapSpecifiedViewableArea.png" alt="" width="230" height="314" /> 
<h5>Download the Code:</h5>


<a rel="enclosure" href="/files/VE_RestrictMapSpecifiedViewableArea.zip">VE_RestrictMapSpecifiedViewableArea.zip (3.01 kb)</a> 

<h3>Other Code Used In This Example</h3>


This example utilizes code that was included in the following two examples I&#39;ve previously written:

<a href="/post.aspx?id=3bd04a2e-7df6-48d5-a359-1cbc3764889e">Calculate Distance Between Geocodes in C# and JavaScript</a>

<a href="/post.aspx?id=1e2824a0-3bef-4707-8f18-a624ad784432">Virtual Earth: Draw a Circle Radius Around a Lat/Long Point</a> 

<h3>Restrict Viewable Area</h3>


First create your map as usual; nothing special the creation of the VE map needed. Once you have your code in place to add the map to the page, you just need to handle the maps OnEndPan and OnStartPan events. You do this by attaching event handlers to these events, like the following: 



```javascript 



//Attach our onendpan event handler

map.AttachEvent(&quot;onendpan&quot;, map_onendpan); 



//Attach our onstartpan event handler

map.AttachEvent(&quot;onstartpan&quot;, map_onstartpan);



function map_onendpan(e) { }

function map_onstartpan(e) { } 



``` 



Next, setup a couple global variables that will be used to define the restriction that will be imposed. 



```javascript 

var mapRestrictionDistance = 100;

var mapRestrictionUnit = GeoCodeCalc.EarthRadiusInMiles; 


``` 



The above two global variables define that you will restrict the map to only be panned within 100 miles of the maps original center point. 



Next, you need to add code to the event handler method stubs shown above that will actually restrict the maps viewable area. 



In the map_onstartpan event handler you will record the maps center point in a global variable before the panning begins. To do this add the following code: 



```javascript 



// global variable to keep track of maps center point before panning began

var mapStartPanPoint = null;



function map_onstartpan(e)

{

    //Get the current map center point before panning begins

    mapStartPanPoint = map.GetCenter();

} 



``` 



In the map_onendpan event handler you will place the actual code that imposes our restriction. The following code will check if the map has been panned past the desired limitation of 100 miles from the original center point. If it has, it will reposition the map back to the last point the map was at before the invalid panning began. Here&#39;s the code to implement this within the map_onendpan event handler: 



```javascript 



function map_onendpan(e)

{

    //Get total distance panned from map center

    var distance = GeoCodeCalc.CalcDistance(

        mapOriginalCenterPoint.Latitude,

        mapOriginalCenterPoint.Longitude,

        map.GetCenter().Latitude,

        map.GetCenter().Longitude,

        mapRestrictionUnit

        ); 



    //Check distance panned from original center point

    if (distance > mapRestrictionDistance)

    {

        //Move map back to the last point that was

        //within the desired restriction radius

        map.SetCenter(mapStartPanPoint);

    }

} 



``` 

<h3>Restrict Maximum Zoom Level</h3>


To add the Maximum Zoom Level restriction all you need to do is implement a handler for the maps OnEndZoom event. 



Use the following code to attach an event handler to the OnEndZoom event: 



```javascript 



//Attach our onendzoom event handler

map.AttachEvent(&quot;onendzoom&quot;, map_onendzoom);



function map_onendzoom(e) { } 



``` 



Before you write the code that will place a restriction on the maximum zoom level, you need to declare a global variable that will define what the maximum zoom level will be. 



```javascript 



var mapRestrictionZoomLevel = 7; 



``` 



Now that you have the global variable in place, and the event is being handled by the map_onendzoom method stub, you need to add the following code to the method that will put the zoom level restriction in place: 



```javascript 



function map_onendzoom(e)

{

    //Check if the map is zoomed out further than

    //the set restriction

    if (e.zoomLevel < mapRestrictionZoomLevel)

    {

        //Zoom the map back in to the restricted area

        map.SetZoomLevel(mapRestrictionZoomLevel);

    }

} 



``` 

<h3>Conclusion</h3>


This is actually some rather simple code to write (at least when utilizing the GeoCodeCalc class) and it provides some good functionality to keep your users from possibly getting lost, along with potentially reducing the number of Virtual Earth Map Transactions you&#39;ll end up paying for. 

