---
layout: post
blogengineid: e1ff8913-504e-4df4-a852-069647a6259b
title: "Draggable Pushpins using Bing Maps Silverlight Control"
date: 2010-05-30 08:39:00 -0500
comments: true
published: true
categories: ["Bing Maps", "Silverlight"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2010/05/30/Draggable-Pushpins-using-Bing-Maps-Silverlight-Control.aspx
  - /post/2010/05/30/Draggable-Pushpins-using-Bing-Maps-Silverlight-Control
  - /post/2010/05/30/draggable-pushpins-using-bing-maps-silverlight-control
  - /post.aspx?id=e1ff8913-504e-4df4-a852-069647a6259b
---
<!-- more -->

Using a map to visualize data within an application is great, but you must first get the location of the data to be displayed. If you have the address you can geocode it using the Bing Maps Web Services, but &quot;What if you can't geocode it?&quot; Or, &quot;What if the geocoding can't find the address?&quot; Well, if your user knows where the location is, then you can have them point it out by clicking on the map. Creating Pushpins in response to a users click is nice, but wouldn't it be even nicer if they could &quot;Click and Drag&quot; the Pushpin around to define/edit/change the location of the data entity?  
I have even seen this discussed a bit in regards to the Bing Maps Silverlight Control, and it isn't something that is built into the map control directly. However it isn't too difficult to implement, if you know what to do. So I decided to create and post a simple &quot;DraggablePushpin&quot; object deriving from the &quot;Microsoft.Maps.MapControl.Pushpin&quot; object that implements Dragging in a nice, self contained fashion. There's no need to wire up any events, you simple add a &quot;DraggablePushpin&quot; to you Map, and the user can drag it around.  
Here's the code for the &quot;DraggablePushpin&quot;:  <pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> DraggablePushpin : Microsoft.Maps.MapControl.Pushpin
{
    <span class="kwrd">private</span> <span class="kwrd">bool</span> isDragging = <span class="kwrd">false</span>;
    EventHandler<MapMouseDragEventArgs> ParentMapMousePanHandler;
    MouseButtonEventHandler ParentMapMouseLeftButtonUpHandler;
    MouseEventHandler ParentMapMouseMoveHandler;

    <span class="kwrd">protected</span> <span class="kwrd">override</span> <span class="kwrd">void</span> OnMouseLeftButtonDown(MouseButtonEventArgs e)
    {
        <span class="rem">// Check if the Map Event Handlers have been created/attached to the Map</span>
        <span class="rem">// If not, then attach them. This is done in the &quot;Pushpin.OnMouseLeftButtonDown&quot;</span>
        <span class="rem">// event because we don't know when the Pushpin is added to a Map or MapLayer, but</span>
        <span class="rem">// we do konw that when this event is fired the Pushpin will already have been added.</span>
        var parentLayer = <span class="kwrd">this</span>.Parent <span class="kwrd">as</span> MapLayer;
        <span class="kwrd">if</span> (parentLayer != <span class="kwrd">null</span>)
        {
            var parentMap = parentLayer.ParentMap;
            <span class="kwrd">if</span> (parentMap != <span class="kwrd">null</span>)
            {
                <span class="kwrd">if</span> (<span class="kwrd">this</span>.ParentMapMousePanHandler == <span class="kwrd">null</span>)
                {
                    <span class="kwrd">this</span>.ParentMapMousePanHandler = <span class="kwrd">new</span> EventHandler<MapMouseDragEventArgs>(ParentMap_MousePan);
                    parentMap.MousePan += <span class="kwrd">this</span>.ParentMapMousePanHandler;
                }
                <span class="kwrd">if</span> (<span class="kwrd">this</span>.ParentMapMouseLeftButtonUpHandler == <span class="kwrd">null</span>)
                {
                    <span class="kwrd">this</span>.ParentMapMouseLeftButtonUpHandler = <span class="kwrd">new</span> MouseButtonEventHandler(ParentMap_MouseLeftButtonUp);
                    parentMap.MouseLeftButtonUp += <span class="kwrd">this</span>.ParentMapMouseLeftButtonUpHandler;
                }
                <span class="kwrd">if</span> (<span class="kwrd">this</span>.ParentMapMouseMoveHandler == <span class="kwrd">null</span>)
                {
                    <span class="kwrd">this</span>.ParentMapMouseMoveHandler = <span class="kwrd">new</span> MouseEventHandler(ParentMap_MouseMove);
                    parentMap.MouseMove += <span class="kwrd">this</span>.ParentMapMouseMoveHandler;
                }
            }
        }

        <span class="rem">// Enable Dragging</span>
        <span class="kwrd">this</span>.isDragging = <span class="kwrd">true</span>;

        <span class="kwrd">base</span>.OnMouseLeftButtonDown(e);
    }

    <span class="preproc">#region</span> <span class="str">&quot;Mouse Event Handler Methods&quot;</span>

    <span class="kwrd">void</span> ParentMap_MousePan(<span class="kwrd">object</span> sender, MapMouseDragEventArgs e)
    {
        <span class="rem">// If the Pushpin is being dragged, specify that the Map's MousePan</span>
        <span class="rem">// event is handled. This is to suppress the Panning of the Map that</span>
        <span class="rem">// is done when the mouse drags the map.</span>
        <span class="kwrd">if</span> (<span class="kwrd">this</span>.isDragging)
        {
            e.Handled = <span class="kwrd">true</span>;
        }
    }

    <span class="kwrd">void</span> ParentMap_MouseLeftButtonUp(<span class="kwrd">object</span> sender, MouseButtonEventArgs e)
    {
        <span class="rem">// Left Mouse Button released, stop dragging the Pushpin</span>
        <span class="kwrd">this</span>.isDragging = <span class="kwrd">false</span>;
    }

    <span class="kwrd">void</span> ParentMap_MouseMove(<span class="kwrd">object</span> sender, MouseEventArgs e)
    {
        var map = sender <span class="kwrd">as</span> Microsoft.Maps.MapControl.Map;
        <span class="rem">// Check if the user is currently dragging the Pushpin</span>
        <span class="kwrd">if</span> (<span class="kwrd">this</span>.isDragging)
        {
            <span class="rem">// If so, the Move the Pushpin to where the Mouse is.</span>
            var mouseMapPosition = e.GetPosition(map);
            var mouseGeocode = map.ViewportPointToLocation(mouseMapPosition);
            <span class="kwrd">this</span>.Location = mouseGeocode;
        }
    }

    <span class="preproc">#endregion</span>
}</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>
