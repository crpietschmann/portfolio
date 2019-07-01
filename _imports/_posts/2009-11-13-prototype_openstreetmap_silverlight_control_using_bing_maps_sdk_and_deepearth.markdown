---
layout: post
blogengineid: 3ad2707d-615b-45a6-9a69-29c5d8bc1c28
title: "Prototype of OpenStreetMap Silverlight Control using DeepEarth and Bing Maps SDK"
date: 2009-11-13 07:40:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "C#", "Silverlight"]
redirect_from: 
  - /post/2009/11/13/Prototype_OpenStreetMap_Silverlight_Control_using_Bing_Maps_SDK_and_DeepEarth
  - /post/2009/11/13/prototype_openstreetmap_silverlight_control_using_bing_maps_sdk_and_deepearth
  - /post.aspx?id=3ad2707d-615b-45a6-9a69-29c5d8bc1c28
---
<!-- more -->

I&rsquo;ve decided to expand a little on using OpenStreetMap imagery with the new Bing Maps Silverlight Control in response to the following <a rel="nofollow" href="/post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW.aspx#id_a250bec2-e7f3-4324-8837-e167eff776e4">comment posted by John O&rsquo;Brien</a> on my previous &ldquo;<a href="/post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW.aspx">Display OpenStreetMap Imagery using Bing Maps Silverlight Control v1</a>&rdquo; post:

*&ldquo;Very close Chris but you will still need to enter a Bing Maps AppID.      
If however you create your own map from MapCore and don't use the Bing Maps services then you don't need creditials&rdquo;*

Yes, it is true that by just displaying the OpenStreetMap imagery on the Bing Maps Silverlight Control using a custom TileSource you still need to provide the control a Bing Maps Key (App ID). However, what if you inherited from the &ldquo;MapCore&rdquo; base class (the same one that the Bing Maps &ldquo;Map&rdquo; object inherits) and built out a full OpenStreetMap Map control?
<h3>Custom &ldquo;OpenStreetMap&rdquo; Control</h3>

I built out a test &ldquo;OpenStreetMap&rdquo; object that inherits from &ldquo;MapCore&rdquo; that automatically sets the Map Mode to a &ldquo;OpenStreetMapMode&rdquo; object that loads up the OpenStreetMap imagery automatically. This was some simple code to write, basically just extending only a little bit on top of what I posted in the previous post.

Here&rsquo;s the code for the &ldquo;OpenStreetMap&rdquo;, &ldquo;OpenStreetMapMode&rdquo; and &ldquo;OpenStreetMapTileSource&rdquo; objects:
<pre class="csharpcode"><span class="kwrd">using</span> System;
<span class="kwrd">using</span> Microsoft.Maps.MapControl;
<span class="kwrd">using</span> Microsoft.Maps.MapControl.Core;

<span class="kwrd">namespace</span> SilverlightApplication1
{
    <span class="kwrd">public</span> <span class="kwrd">class</span> OpenStreetMap : MapCore
    {
        <span class="kwrd">public</span> OpenStreetMap()
            : <span class="kwrd">base</span>()
        {
            <span class="kwrd">this</span>.Mode.SetView(<span class="kwrd">new</span> Location(), 2.0, 0.0, 0.0, <span class="kwrd">false</span>);
            <span class="kwrd">this</span>.Mode = <span class="kwrd">new</span> OpenStreetMapMode();
        }
    }

    <span class="kwrd">public</span> <span class="kwrd">class</span> OpenStreetMapMode : RoadMode
    {
        <span class="kwrd">public</span> OpenStreetMapMode()
            : <span class="kwrd">base</span>()
        {
            var tileLayer = (MapTileLayer)<span class="kwrd">this</span>.Content;
            tileLayer.TileSources.Clear();
            tileLayer.TileSources.Add(<span class="kwrd">new</span> OpenStreetMapTileSource());
        }
    }

    <span class="kwrd">public</span> <span class="kwrd">class</span> OpenStreetMapTileSource : TileSource
    {
        <span class="kwrd">public</span> OpenStreetMapTileSource()
            : <span class="kwrd">base</span>(<span class="str">"http://tile.openstreetmap.org/{2}/{0}/{1}.png"</span>)
        {
        }

        <span class="kwrd">public</span> <span class="kwrd">override</span> System.Uri GetUri(<span class="kwrd">int</span> x, <span class="kwrd">int</span> y, <span class="kwrd">int</span> zoomLevel)
        {
            <span class="kwrd">return</span> <span class="kwrd">new</span> Uri(<span class="kwrd">string</span>.Format(<span class="kwrd">this</span>.UriFormat, x, y, zoomLevel));
        }
    }
}</pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

 

And, here&rsquo;s an example of using this new &ldquo;OpenStreetMap&rdquo; control:
<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="SilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:d</span><span class="kwrd">="http://schemas.microsoft.com/expression/blend/2008"</span> <span class="attr">xmlns:mc</span><span class="kwrd">="http://schemas.openxmlformats.org/markup-compatibility/2006"</span> 
    <span class="attr">xmlns:map</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">xmlns:local</span><span class="kwrd">="clr-namespace:SilverlightApplication1"</span>
    <span class="attr">mc:Ignorable</span><span class="kwrd">="d"</span> <span class="attr">d:DesignWidth</span><span class="kwrd">="640"</span> <span class="attr">d:DesignHeight</span><span class="kwrd">="480"</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">local:OpenStreetMap</span> <span class="attr">Name</span><span class="kwrd">="map"</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">local:OpenStreetMap.Children</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">map:MapLayer</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">Image</span> <span class="attr">Source</span><span class="kwrd">="BluePin.png"</span> <span class="attr">Opacity</span><span class="kwrd">="0.8"</span> <span class="attr">Stretch</span><span class="kwrd">="None"</span> <span class="attr">map:MapLayer</span>.<span class="attr">Position</span><span class="kwrd">="42.16, -95"</span><span class="kwrd">></</span><span class="html">Image</span><span class="kwrd">></span>
                <span class="kwrd"></</span><span class="html">map:MapLayer</span><span class="kwrd">></span>
            <span class="kwrd"></</span><span class="html">local:OpenStreetMap.Children</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">local:OpenStreetMap</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

 
<h3>What About Navigation Controls?</h3>

One side effect of creating this completely custom Map Control based off MapCore is that the other controls that the &ldquo;Map&rdquo; control includes automatically do not get displayed.

The &ldquo;Map&rdquo; control displays the &ldquo;MapControlNavigationBar&rdquo; control via the &ldquo;MapForeground&rdquo; object, however due to the MapForeground constructor that lets you tell it what MapBase object to attach to being marked &ldquo;internal&rdquo; is seems that it can&rsquo;t be easily reused.

However, with a little help from the newest controls in developments within the <a href="http://deepearth.codeplex.com/">DeepEarth</a> project, you can fairly simply modify the Bing Maps Navigation control within the DeepEarth project to be used with the new &ldquo;OpenStreetMap&rdquo; control.

Here&rsquo;s the code I worked up for a DeepEarth NavigationPanel for the &ldquo;OpenStreetMap&rdquo; control created earlier:
<pre class="csharpcode"><span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Windows;
<span class="kwrd">using</span> DeepEarth.Client.BingMaps.Convertors;
<span class="kwrd">using</span> DeepEarth.Client.Common;
<span class="kwrd">using</span> GeoAPI.Geometries;
<span class="kwrd">using</span> GisSharpBlog.NetTopologySuite.Geometries;
<span class="kwrd">using</span> Microsoft.Maps.MapControl;
<span class="kwrd">using</span> Point = System.Windows.Point;
<span class="kwrd">using</span> Microsoft.Maps.MapControl.Core;

<span class="kwrd">namespace</span> NewDeepEarth.NavigationPanel
{
    <span class="kwrd">public</span> <span class="kwrd">class</span> NavigationPanel : DeepEarth.Client.Controls.NavigationPanel.NavigationPanel, IMapControl<MapCore>
    {
        <span class="kwrd">private</span> <span class="kwrd">string</span> mapName;

        <span class="kwrd">public</span> NavigationPanel()
        {
            Loaded += CoordinatePanel_Loaded;
        }

        <span class="kwrd">public</span> <span class="kwrd">override</span> <span class="kwrd">double</span> ZoomLevel
        {
            get
            {
                <span class="kwrd">if</span> (MapInstance != <span class="kwrd">null</span>)
                {
                    <span class="kwrd">return</span> MapInstance.ZoomLevel;
                }
                <span class="kwrd">return</span> 0;
            }
            set
            {
                <span class="kwrd">if</span> (MapInstance != <span class="kwrd">null</span>)
                {
                    MapInstance.ZoomLevel = <span class="kwrd">value</span>;
                }
            }
        }

        <span class="kwrd">public</span> <span class="kwrd">override</span> ICoordinate Center
        {
            get
            {
                <span class="kwrd">if</span> (MapInstance != <span class="kwrd">null</span>)
                {
                    <span class="kwrd">return</span> CoordinateConvertor.Convert(MapInstance.Center);
                }
                <span class="kwrd">return</span> <span class="kwrd">new</span> Coordinate(0, 0);
            }
            set
            {
                <span class="kwrd">if</span> (MapInstance != <span class="kwrd">null</span>)
                {
                    MapInstance.Center = CoordinateConvertor.ConvertBack(<span class="kwrd">value</span>);
                }
            }
        }

        <span class="preproc">#region</span> IMapControl<MapCore> Members

        <span class="kwrd">public</span> <span class="kwrd">string</span> MapName
        {
            get { <span class="kwrd">return</span> mapName; }
            set
            {
                mapName = <span class="kwrd">value</span>;
                setMapInstance(MapName);
            }
        }

        <span class="kwrd">public</span> MapCore MapInstance { get; set; }

        <span class="kwrd">public</span> <span class="kwrd">new</span> <span class="kwrd">void</span> Dispose()
        {
            MapInstance = <span class="kwrd">null</span>;
            <span class="kwrd">base</span>.Dispose();
        }

        <span class="kwrd">public</span> <span class="kwrd">override</span> <span class="kwrd">void</span> PanMap(<span class="kwrd">int</span> deltaX, <span class="kwrd">int</span> deltaY)
        {
            <span class="kwrd">if</span> (MapInstance != <span class="kwrd">null</span>)
            {
                NewDeepEarth.Client.BingMaps.Utilities.Pan(deltaX, deltaY, MapInstance);
            }
        }

        <span class="preproc">#endregion</span>

        <span class="kwrd">private</span> <span class="kwrd">void</span> CoordinatePanel_Loaded(<span class="kwrd">object</span> sender, RoutedEventArgs e)
        {
            setMapInstance(MapName);
        }

        <span class="kwrd">private</span> <span class="kwrd">void</span> setMapInstance(<span class="kwrd">string</span> mapname)
        {
            MapInstance = Utilities.FindVisualChildByName<MapCore>(Application.Current.RootVisual, mapname);
        }

    }
}</pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

Also, hers a small utility method that I needed to modify slightly within the DeepEarth project to get the above NavigationPanel to work:
<pre class="csharpcode"><span class="kwrd">using</span> Microsoft.Maps.MapControl.Core;
<span class="kwrd">using</span> Point = System.Windows.Point;

<span class="kwrd">namespace</span> NewDeepEarth.Client.BingMaps
{
    <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">class</span> Utilities
    {
        <span class="rem">// Convert to accept Bing Maps "MapCore" instead of "Map" object</span>
        <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">void</span> Pan(<span class="kwrd">double</span> deltaX, <span class="kwrd">double</span> deltaY, MapCore map) <span class="rem">//Map map)</span>
        {
            Point center = map.LocationToViewportPoint(map.Center);
            center.X = center.X + deltaX;
            center.Y = center.Y + deltaY;
            map.Center = map.ViewportPointToLocation(center);
        }
    }
}</pre>

 
<h3>Suggestion for the DeepEarth Preview Controls</h3>

One big suggestion I have for the DeepEarth projects new Preview Controls is to make the Bing Maps objects/libraries within the project use/accept &ldquo;MapCore&rdquo; or &ldquo;MapBase&rdquo; where ever it can instead of &ldquo;Map&rdquo;. This way as much of the DeepEarth code can be reused, without modification, when building a completely custom Map Control using the Bing Maps Silverlight SDK.

A perfect example of this are the modifications I needed to make to the NavigationPanel object and Utilities.Pan method posted above. By simply changing them from referencing/using &ldquo;Map&rdquo; to &ldquo;MapCore&rdquo; instead, they can not be used with any Map Control built using the Bing Maps Silverlight SDK.
<h3>Conclusion</h3>

Even though the above code works, it&rsquo;s really just a prototype of what can be done using the current Preview controls within the DeepEarth project along with the new Bing Maps Silverlight Control. There is definitely some cool stuff to be done with both the Bing Maps Silverlight SDK and the DeepEarth project!

Anyway, here&rsquo;s a download link to the full code of the project for the above code:
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:d6d36e07-63fe-464f-82cc-7b8216c68372" class="wlWriterEditableSmartContent" style="padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: none; padding-top: 0px">

 
<div><a href="/file.axd?file=OpenStreetMapDeepEarthPrototype_1.zip" target="_self">OpenStreetMapDeepEarthPrototype.zip</a></div>

 
</div>

 
