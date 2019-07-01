---
layout: post
blogengineid: 9f492f0f-8da4-4606-9f43-098074d8b9e9
title: "Bing Maps Silverlight CTP: Using MouseClick Event To Add "Pushpins""
date: 2009-03-25 22:38:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/03/25/Virtual-Earth-Silverlight-Using-MouseClick-Event-To-Add-Pushpins
  - /post/2009/03/25/virtual-earth-silverlight-using-mouseclick-event-to-add-pushpins
  - /post.aspx?id=9f492f0f-8da4-4606-9f43-098074d8b9e9
---
<!-- more -->

In previous tutorials I covered the “<a href="/post.aspx?id=6a098f41-2df4-4362-a577-606863de838c">Basics of Adding Polygons and Polylines</a>” and “<a href="/post.aspx?id=2c25c9bc-e290-41e4-9a03-daa75a912c63">Adding Media (Images, Video, etc.)</a>”, but what about handling user input via Map Events? Well, in this tutorial I’ll cover the basics of working with the Map.MouseClick Event (equivalent of the old “onclick” event in the Virtual Earth JavaScript Control).  
This was written for the Bing Maps Silverlight CTP Release.  <h3>Adding a MouseClick Event Handler</h3>  
In order to wire things up to manipulate the Map using the MouseClick event, we must first attach an Event Handler to it. The Event Handler for the MouseClick event needs to be just like any other event handler in .NET; it must accept two parameters: 1) a “sender” object, and 2) an “EventArgs” object.  
Before we create our event handler, it’s worth noting that to be more specific, the value that gets passed to the “EventArgs” parameter of the Map.MouseClick event is actually of Type MapMouseEventArgs.  
The MapMouseEventArgs object has the following two properties:  <ol>   <li>**Handled** – Gets or Sets a value indicating whether the Map event was handled. If you want to prevent the “default” event handling behavior from executing, then all you need to do is set this to True. </li>    <li>**ViewportPoint** – Gets the viewport point where the mouse event occurred. This is a System.Windows.Point object that represents the X and Y coordinates where the mouse was clicked. </li> </ol>  
To declare the MouseClick event handler a method that matched the following signature: void(object sender, MapMouseEventArgs e)  
Here’s an example Map.MouseClick event handler method:  <pre class="csharpcode"><span class="kwrd">private</span> <span class="kwrd">void</span> myMap_MouseClick(<span class="kwrd">object</span> sender, MapMouseEventArgs e)
{
}</pre>


<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->


You can attach the above event handler from within code:

<pre class="csharpcode">myMap.MouseClick += <span class="kwrd">new</span> EventHandler<MapMouseEventArgs>(myMap_MouseClick);</pre>


Or, from within XAML:

<pre class="csharpcode"><span class="kwrd"><</span><span class="html">m:Map</span> <span class="attr">Name</span><span class="kwrd">=&quot;myMap&quot;</span> <span class="attr">MouseClick</span><span class="kwrd">=&quot;myMap_MouseClick&quot;</span><span class="kwrd">></</span><span class="html">m:Map</span><span class="kwrd">></span></pre>

<h3>&#160;</h3>

<h3>Get the Location (Lat/Long Coordinate) the Mouse was Clicked</h3>


One thing that you may have noticed is the MapMouseEventArgs object that is passed to the MouseClick event handler doesn’t contain a “Location” or “LatLong” property of any kind. It’s seems odd at first that there’s no direct way of obtaining the Map Location (Lat/Long) of where the mouse was clicked, but with the help of a little helper method on the Map object itself we can pass in the ViewportPoint (X and Y Coordinates) value contained within the MapMouseEventArgs.ViewportPoint property and get back a Location object with Latitude/Longitude.


To obtain the Location (Lat/Long) where the mouse was clicked, simply invoke the Map.ViewportPointToLocation method by passing in the MapMouseEventArgs.ViewportPoint value.


The following line of code demonstrates how this can be done within the MouseClick Event Handler we defined above:

<pre class="csharpcode">var location = clickedMap.ViewportPointToLocation(e.ViewportPoint);</pre>


Now that we have the&#160; Location of where the mouse was clicked, we can directly access the Latitude and Longitude values.

<pre class="csharpcode">var lat = location.Latitude;
var lng = location.Longitude;</pre>

<h3>&#160;</h3>

<h3>Add a “Pushpin” at the Clicked Location</h3>


Now that we have a MouseClick Event Handler in place, and we have access to the Location (Latitude/Longitude) where the mouse was clicked; we can go ahead and add a “Pushpin” to the Map at that Location.


If you have any questions on how to add a Shape or “Pushpin” to the Map, I recommend reading the following two tutorials:

<ul>
  <li><a href="/post.aspx?id=6a098f41-2df4-4362-a577-606863de838c">Basics of Adding Polygons and Polylines using XAML and Code</a> </li>

  <li><a href="/post.aspx?id=2c25c9bc-e290-41e4-9a03-daa75a912c63">Adding Media (Images, Video, etc.) to the Map</a> </li>
</ul>


In this example to keep things simple, we’ll add a Square (via the System.Windows.Shapes.Rectangle object) to the Map at the clicked location that is 10x10 in size.


Here’s a full code example of the MouseClick event handler we created above, including code that gets the Location clicked and adds the Rectangle Shape to the Map within a new MapLayer:

<pre class="csharpcode"><span class="kwrd">private</span> <span class="kwrd">void</span> myMap_MouseClick(<span class="kwrd">object</span> sender, MapMouseEventArgs e)
{
    <span class="rem">// Set a variable equal to the Map that raised the event</span>
    Map clickedMap = (Map)sender;
    
    <span class="rem">// Convert the X/Y Coordinate that was Clicked to a Lat/Long Location</span>
    var location = clickedMap.ViewportPointToLocation(e.ViewportPoint);

    <span class="rem">// Create new MapLayer</span>
    var myLayer = <span class="kwrd">new</span> MapLayer();

    <span class="rem">// Create a Rectangle Shape to Show as the &quot;Pushpin&quot;</span>
    var rectangle = <span class="kwrd">new</span> System.Windows.Shapes.Rectangle();
    <span class="rem">// Set it's Size to 10x10</span>
    rectangle.Width = 10;
    rectangle.Height = 10;
    <span class="rem">// Color the Rectangle Red</span>
    rectangle.Fill = <span class="kwrd">new</span> SolidColorBrush(Colors.Red);

    <span class="rem">// Center the Rectangle around the location</span>
    PositionMethod position = PositionMethod.Center;

    <span class="rem">// Add Rectangle to MapLayer</span>
    myLayer.AddChild(rectangle, location, position);

    <span class="rem">// Add the MapLayer to the Map so the &quot;Pushpin&quot; gets displayed</span>
    clickedMap.AddChild(myLayer);
}</pre>


One thing that you may want to do when implementing the above example is create only 1 MapLayer and add all the new “Pushpins” to that single MapLayer. This will help improve performance on the Map if you are adding MANY pushpins. For the simple example above this just wasn’t absolutely necessary.

<h3>Auto Expand “Pushpins” using ScaleTransform</h3>


The best part of the new Virtual Earth Silverlight Map Control is the fact that we can now leverage the full power of Silverlight within our mapping applications/implementations. One of the cool things that can be done are implementing Animations to spice up the user interface.


Here’s an example that takes the above MouseClick event handler code that adds a Rectangle “Pushpin” to the Map when the user clicks the Map, and adds a ScaleTransform to “Expand” the Rectangle when the user moves the mouse over it.


This is done by setting a ScaleTransform to the Rectangle.RenderTransform during the MouseEnter event, and then removing it during the MouseLeave event. The end result are Rectangle “Pushpins” that Expand when the user Moves the mouse over them.


Here’s the full code for Map.MouseClick, Rectangle.MouseEnter and Rectangle.MouseLeave Event Handlers for this “Expand” Animation example:

<pre class="csharpcode"><span class="rem">// Single MapLayer that will contain all &quot;Pushpins&quot;</span>
<span class="kwrd">private</span> MapLayer myLayer = <span class="kwrd">null</span>;

<span class="kwrd">private</span> <span class="kwrd">void</span> myMap_MouseClick(<span class="kwrd">object</span> sender, MapMouseEventArgs e)
{
    <span class="rem">// Set a variable equal to the Map that raised the event</span>
    Map clickedMap = (Map)sender;

    <span class="rem">// Convert the X/Y Coordinate that was Clicked to a Lat/Long Location</span>
    var location = clickedMap.ViewportPointToLocation(e.ViewportPoint);

    <span class="rem">// Check if MapLayer has already been created</span>
    <span class="kwrd">if</span> (myLayer == <span class="kwrd">null</span>)
    {
        <span class="rem">// Create new MapLayer</span>
        myLayer = <span class="kwrd">new</span> MapLayer();

        <span class="rem">// Add the MapLayer to the Map so the &quot;Pushpin&quot; gets displayed</span>
        clickedMap.AddChild(myLayer);
    }

    <span class="rem">// Create a Rectangle Shape to Show as the &quot;Pushpin&quot;</span>
    var rectangle = <span class="kwrd">new</span> System.Windows.Shapes.Rectangle();
    <span class="rem">// Set it's Size to 10x10</span>
    rectangle.Width = 10;
    rectangle.Height = 10;
    <span class="rem">// Color the Rectangle Red</span>
    rectangle.Fill = <span class="kwrd">new</span> SolidColorBrush(Colors.Red);

    <span class="rem">// Attach MouseEnter and MouseLeave Event Handler to the Rectangle</span>
    <span class="rem">// This will be used to &quot;Expand&quot; the Rectangle when the user hovers the mouse over it</span>
    rectangle.MouseEnter += <span class="kwrd">new</span> MouseEventHandler(rectangle_MouseEnter);
    rectangle.MouseLeave += <span class="kwrd">new</span> MouseEventHandler(rectangle_MouseLeave);

    <span class="rem">// Center the Rectangle around the location</span>
    PositionMethod position = PositionMethod.Center;

    <span class="rem">// Add Rectangle to MapLayer</span>
    myLayer.AddChild(rectangle, location, position);
}

<span class="kwrd">void</span> rectangle_MouseEnter(<span class="kwrd">object</span> sender, MouseEventArgs e)
{
    <span class="rem">// Get the Rectangle</span>
    var rectangle = (Rectangle)sender;

    <span class="rem">// Create new ScaleTransform</span>
    var scaleTransform = <span class="kwrd">new</span> ScaleTransform();

    <span class="rem">// Set the Transform to &quot;Expand&quot; the Rectangle</span>
    <span class="rem">// equally horizontally and vertically</span>
    scaleTransform.ScaleX = 2.0;
    scaleTransform.ScaleY = 2.0;

    <span class="rem">// Set the Scale Center to the Center of the Rectangle</span>
    <span class="rem">// This is so it doesn't move when &quot;Expanded&quot;</span>
    scaleTransform.CenterX = rectangle.Width / 2;
    scaleTransform.CenterY = rectangle.Height / 2;

    <span class="rem">// Apply the ScaleTransform to the Rectangle</span>
    rectangle.RenderTransform = scaleTransform;
}

<span class="kwrd">void</span> rectangle_MouseLeave(<span class="kwrd">object</span> sender, MouseEventArgs e)
{
    <span class="rem">// Get the Rectangle</span>
    var rectangle = (Rectangle)sender;

    <span class="rem">// Remove the ScaleTransform</span>
    rectangle.RenderTransform = <span class="kwrd">null</span>;
}</pre>


The above code example also includes a modification from the previous examples in this tutorial; it adds all the new Rectangle “Pushpins” to a Single MapLayer instead of adding a new MapLayer for each Rectangle “Pushpin”.

<h3>Conclusion</h3>


The Map.MouseClick event is really simple to take advantage of, and it’s actually just as easy to add a “Pushpin” during the “onclick” event with the Virtual Earth Silverlight Map Control as it is with the Virtual Earth JavaScript Control.


There are a few other events that the Map object exposes, and I’ll be covering some of those in additional tutorials. So, keep an eye out for future posts.

<h4>Previous Tutorial/Article: <a href="/post.aspx?id=88a585cd-f90a-40e1-963d-ca1932ce2535">Overlay OpenStreetMap, OpenAerialMap and Yahoo Map Imagery using Custom Tile Layers</a></h4>
