---
layout: post
blogengineid: fd2f37b1-3f8e-428f-8310-a9aee245a162
title: "Loading Microsoft CDN Hosted OpenStreetMap Imagery in Silverlight Bing Maps Control"
date: 2010-08-19 15:42:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "C#", "Silverlight"]
redirect_from: 
  - /post/2010/08/19/Load-Microsoft-CDN-Hosted-OpenStreetMap-Imagery-In-Silverlight-Map-Control.aspx
  - /post/2010/08/19/Load-Microsoft-CDN-Hosted-OpenStreetMap-Imagery-In-Silverlight-Map-Control
  - /post/2010/08/19/load-microsoft-cdn-hosted-openstreetmap-imagery-in-silverlight-map-control
  - /post.aspx?id=fd2f37b1-3f8e-428f-8310-a9aee245a162
---
<!-- more -->

<a href="/files/MSHostedOpenStreetMapImageryFromSilverlight.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="MSHostedOpenStreetMapImageryFromSilverlight" src="/files/MSHostedOpenStreetMapImageryFromSilverlight_thumb.png" border="0" alt="MSHostedOpenStreetMapImageryFromSilverlight" width="204" height="179" align="right" /></a> Recently a new <a href="http://www.bing.com/toolbox/blogs/maps/archive/2010/08/02/bing-maps-adds-open-street-maps-layer.aspx">Bing Maps App for OpenStreetMap (OSM)</a> was released. This new feature of the Bing Maps consumer facing website is hosting the <a href="http://openstreetmap.org">OpenStreetMap</a> imagery using the Azure CDN, rather than relying on OpenStreetMap&rsquo;s server. There has been some question as to whether developers can use the Microsoft hosted OpenStreetMap imagery within their own applications.

I have not seen anything official from Microsoft on this, so I assume that doing this is against their terms of use. You assume any and all responsibility in violating their terms of use if you use the below code. Sorry for the disclaimer, but I don&rsquo;t want you to tell Microsoft I told you it was ok. Basically, do not use this in a production application, unless you get consent from Microsoft.

Now the code&hellip;

Displaying the Map (XAML):
<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="Silverlight_NewBingMapsRoadImagery_2010.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span>
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:d</span><span class="kwrd">="http://schemas.microsoft.com/expression/blend/2008"</span>
    <span class="attr">xmlns:mc</span><span class="kwrd">="http://schemas.openxmlformats.org/markup-compatibility/2006"</span>
    <span class="attr">xmlns:local</span><span class="kwrd">="clr-namespace:Silverlight_NewBingMapsRoadImagery_2010"</span>
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">xmlns:mCore</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl.Core;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">mc:Ignorable</span><span class="kwrd">="d"</span>
    <span class="attr">d:DesignHeight</span><span class="kwrd">="300"</span> <span class="attr">d:DesignWidth</span><span class="kwrd">="400"</span><span class="kwrd">></span>

    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span> <span class="attr">Background</span><span class="kwrd">="White"</span><span class="kwrd">></span>

        <span class="kwrd"><</span><span class="html">m:Map</span> <span class="attr">NavigationVisibility</span><span class="kwrd">="Collapsed"</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">m:Map.Mode</span><span class="kwrd">></span>
                <span class="rem"><!-- Do Not Display Default Bing Maps Imagery --></span>
                <span class="kwrd"><</span><span class="html">mCore:MercatorMode</span> <span class="kwrd">/></span>
            <span class="kwrd"></</span><span class="html">m:Map.Mode</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">m:Map.Children</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">m:MapTileLayer</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">m:MapTileLayer.TileSources</span><span class="kwrd">></span>
                        <span class="rem"><!-- Display OpenStreetMap Imagery --></span>
                        <span class="kwrd"><</span><span class="html">local:OpenStreetMapTileSource</span> <span class="kwrd">/></span>
                    <span class="kwrd"></</span><span class="html">m:MapTileLayer.TileSources</span><span class="kwrd">></span>
                <span class="kwrd"></</span><span class="html">m:MapTileLayer</span><span class="kwrd">></span>
            <span class="kwrd"></</span><span class="html">m:Map.Children</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">m:Map</span><span class="kwrd">></span>
        
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

OpenStreetMapTileSource (C#):
<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> OpenStreetMapTileSource : Microsoft.Maps.MapControl.TileSource
{
    <span class="kwrd">public</span> OpenStreetMapTileSource()
        : <span class="kwrd">base</span>()
    {
        <span class="kwrd">this</span>.UriFormat = <span class="str">"{UriScheme}://{3}.osm.virtualearth.net/{2}/{0}/{1}.png"</span>
            .Replace(<span class="str">"{UriScheme}"</span>, OpenStreetMapTileSource.PageUriScheme); <span class="rem">// <-- set "http" or "https" appropriately</span>
    }

    <span class="kwrd">public</span> <span class="kwrd">override</span> System.Uri GetUri(<span class="kwrd">int</span> x, <span class="kwrd">int</span> y, <span class="kwrd">int</span> zoomLevel)
    {
        <span class="rem">// Randomly decide which server to use</span>
        <span class="kwrd">string</span> server;
        var rnd = <span class="kwrd">new</span> Random();
        var i = rnd.Next(0, 2);
        <span class="kwrd">switch</span> (i)
        {
            <span class="kwrd">case</span> 1:
                server = <span class="str">"b"</span>;
                <span class="kwrd">break</span>;
            <span class="kwrd">case</span> 2:
                server = <span class="str">"c"</span>;
                <span class="kwrd">break</span>;
            <span class="kwrd">default</span>:
                server = <span class="str">"a"</span>;
                <span class="kwrd">break</span>;
        }

        <span class="rem">// Format Uri for the desired map tile image</span>
        <span class="kwrd">return</span> <span class="kwrd">new</span> Uri(<span class="kwrd">string</span>.Format(<span class="kwrd">this</span>.UriFormat, x, y, zoomLevel, server));
    }

    <span class="kwrd">internal</span> <span class="kwrd">static</span> <span class="kwrd">string</span> PageUriScheme
    {
        get
        {
            <span class="kwrd">if</span> ((HtmlPage.IsEnabled &amp;&amp; (HtmlPage.Document != <span class="kwrd">null</span>)) &amp;&amp; (HtmlPage.Document.DocumentUri != <span class="kwrd">null</span>))
            {
                <span class="kwrd">return</span> HtmlPage.Document.DocumentUri.Scheme;
            }
            <span class="kwrd">return</span> <span class="str">"HTTP"</span>;
        }
    }
}</pre>
