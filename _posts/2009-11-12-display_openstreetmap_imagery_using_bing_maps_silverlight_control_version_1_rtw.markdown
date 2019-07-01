---
layout: post
title: "Display OpenStreetMap Imagery using Bing Maps Silverlight Control v1"
date: 2009-11-12 09:02:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
alias: ["/post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW", "/post/2009/11/12/display_openstreetmap_imagery_using_bing_maps_silverlight_control_version_1_rtw"]
---
<!-- more -->
<p><a href="/images/postsBingMapsSilverlight_OpenStreetMap.png"><img style="border-bottom: 0px; border-left: 0px; display: inline; margin-left: 0px; border-top: 0px; margin-right: 0px; border-right: 0px" title="BingMapsSilverlight_OpenStreetMap" src="/images/postsBingMapsSilverlight_OpenStreetMap_thumb.png" border="0" alt="BingMapsSilverlight_OpenStreetMap" width="244" height="158" align="right" /></a> The Bing Maps Silverlight SDK documentation on MSDN contains an article on <a href="http://msdn.microsoft.com/en-us/library/ee681902.aspx" target="_blank">Adding Tile Overlays to the Map</a>, that demonstrates how to overlay your own map imagery over top of the Bing Maps Imagery. However, what if you want to completely replace the Bing Maps Imagery with some other Imagery like the <a href="http://openstreetmap.org" target="_blank">OpenStreeMap</a> Imagery?</p>
<p>In the &ldquo;Adding Tile Overlays to the Map&rdquo; article it shows using a &ldquo;LocationRectTileSource&rdquo; to add the custom map imagery overlay. To implement the OpenStreetMap imagery you will need to create a simple class that inherits from &ldquo;TileSource&rdquo; since you wont be restricting the imagery to only a small portion of the map, but instead will be showing all the OpenStreetMap Imagery in place of the Bing Maps Imagery.</p>
<h3>First, Hide the Bing Maps Imagery</h3>
<p>Since we will be displaying the OpenStreetMap imagery instead of the Bing Maps Imagery, we want to prevent the Map control from loading/displaying the Bing Maps Imagery completely.</p>
<p>To do this, all you need to do is set the Maps Mode to an instance of the &ldquo;MercatorMode&rdquo; object:</p>
<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="BingMapsSilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">xmlns:mCore</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl.Core;assembly=Microsoft.Maps.MapControl"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">m:Map</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">m:Map.Mode</span><span class="kwrd">&gt;</span>
                <span class="rem">&lt;!-- Do Not Display Bing Maps Imagery --&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">mCore:MercatorMode</span><span class="kwrd">&gt;&lt;/</span><span class="html">mCore:MercatorMode</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">m:Map.Mode</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">m:Map</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">Grid</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">UserControl</span><span class="kwrd">&gt;</span></pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<h3>Display OpenStreetMap Imagery</h3>
<p>Next, we will create a simple &ldquo;OpenStreetMapTileSource&rdquo; class that inherits from &ldquo;TileSource&rdquo; that will be used to specify the location (URI) of the OpenStreetMap Imagery so the Map control can load and display it.</p>
<p>Here&rsquo;s the simple OpenStreetMapTileSource class:</p>
<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> OpenStreetMapTileSource : Microsoft.Maps.MapControl.TileSource
{
    <span class="kwrd">public</span> OpenStreetMapTileSource()
        : <span class="kwrd">base</span>(<span class="str">"http://tile.openstreetmap.org/{2}/{0}/{1}.png"</span>)
    {
    }

    <span class="kwrd">public</span> <span class="kwrd">override</span> System.Uri GetUri(<span class="kwrd">int</span> x, <span class="kwrd">int</span> y, <span class="kwrd">int</span> zoomLevel)
    {
        <span class="kwrd">return</span> <span class="kwrd">new</span> Uri(<span class="kwrd">string</span>.Format(<span class="kwrd">this</span>.UriFormat, x, y, zoomLevel));
    }
}</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<p>Now to put the OpenStreetMapTIleSource in place and actually display the OpenStreetMap Imagery. To do this, we will add a new MapTileLayer to the Maps Children collection, and add an instance of our OpenStreetMapTileSource object to the MapTileLayer objects TileSources collection.</p>
<p>Here&rsquo;s the code to do this:</p>
<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="BingMapsSilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">xmlns:mCore</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl.Core;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">xmlns:local</span><span class="kwrd">="clr-namespace:BingMapsSilverlightApplication1"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">m:Map</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">m:Map.Mode</span><span class="kwrd">&gt;</span>
                <span class="rem">&lt;!-- Do Not Display Bing Maps Imagery --&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">mCore:MercatorMode</span><span class="kwrd">&gt;&lt;/</span><span class="html">mCore:MercatorMode</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">m:Map.Mode</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">m:Map.Children</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;</span><span class="html">m:MapTileLayer</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;</span><span class="html">m:MapTileLayer.TileSources</span><span class="kwrd">&gt;</span>
                        <span class="rem">&lt;!-- Display OpenStreetMap Imagery --&gt;</span>
                        <span class="kwrd">&lt;</span><span class="html">local:OpenStreetMapTileSource</span><span class="kwrd">&gt;&lt;/</span><span class="html">local:OpenStreetMapTileSource</span><span class="kwrd">&gt;</span>
                    <span class="kwrd">&lt;/</span><span class="html">m:MapTileLayer.TileSources</span><span class="kwrd">&gt;</span>
                <span class="kwrd">&lt;/</span><span class="html">m:MapTileLayer</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;/</span><span class="html">m:Map.Children</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">m:Map</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">Grid</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">UserControl</span><span class="kwrd">&gt;</span></pre>
<p>&nbsp;</p>
<h3>Conclusion</h3>
<p>It&rsquo;s really pretty simple to display your own custom map tile image sets and even completely replace the Bing Maps Imagery with the new control. If your interested in seeing how to display Yahoo Maps imagery within the control, then you&rsquo;ll want to refer to my <a href="/post.aspx?id=88a585cd-f90a-40e1-963d-ca1932ce2535" target="_blank">previous article</a> on doing this with the CTP version of the Bing Maps Silverlight Control.</p>
