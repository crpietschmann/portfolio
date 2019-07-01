---
layout: post
blogengineid: 6a0a75d6-afe3-427b-896f-812dc590dc4d
title: "Bing Maps Ajax 7: Add a Simple Mini Map"
date: 2010-12-19 13:15:02 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2010/12/19/Bing-Maps-Ajax-7-Add-a-Simple-Mini-Map
  - /post/2010/12/19/bing-maps-ajax-7-add-a-simple-mini-map
  - /post.aspx?id=6a0a75d6-afe3-427b-896f-812dc590dc4d
---
<!-- more -->

The Bing Maps Ajax v7 control doesn’t include support for adding a Mini Map. So, I decided to quickly work up a simple example of adding one. Below is the source code for it and a zip download of the code at the bottom of the post.  
<a href="/files/BingMapsAjax7QuickMiniMap.png"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="BingMapsAjax7QuickMiniMap" border="0" alt="BingMapsAjax7QuickMiniMap" src="/files/BingMapsAjax7QuickMiniMap_thumb.png" width="539" height="307" /></a>  <h3>Source Code</h3>  <pre class="csharpcode"><span class="kwrd"><!</span><span class="html">DOCTYPE</span> <span class="attr">html</span> <span class="attr">PUBLIC</span> <span class="kwrd">&quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot;</span> <span class="kwrd">&quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">html</span> <span class="attr">xmlns</span><span class="kwrd">=&quot;http://www.w3.org/1999/xhtml&quot;</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">head</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">meta</span> <span class="attr">http-equiv</span><span class="kwrd">=&quot;Content-Type&quot;</span> <span class="attr">content</span><span class="kwrd">=&quot;text/html; charset=utf-8&quot;</span> <span class="kwrd">/></span>
    <span class="kwrd"><</span><span class="html">script</span> <span class="attr">src</span><span class="kwrd">=&quot;http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0&quot;</span> <span class="attr">type</span><span class="kwrd">=&quot;text/javascript&quot;</span> <span class="attr">charset</span><span class="kwrd">=&quot;UTF-8&quot;</span><span class="kwrd">></</span><span class="html">script</span><span class="kwrd">></span>
    <script src=<span class="str">&quot;http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.4.min.js&quot;</span>></script>
    <style>
        .MiniMap
        {
            border: solid 1px #777;
            width: 150px;
            height: 150px;
        }
    </style>
</head>
<body>
<div id=<span class="str">&quot;myMap&quot;</span> style=<span class="str">&quot;position: relative; width: 530px; height: 300px;&quot;</span>></div>
<script type=<span class="str">&quot;text/javascript&quot;</span>>
    <span class="kwrd">var</span> bingMapsKey = <span class="str">&quot;Your Bing Maps Key&quot;</span>;

    <span class="rem">// Load the Main Map</span>
    <span class="kwrd">var</span> map = <span class="kwrd">new</span> Microsoft.Maps.Map(
        document.getElementById(<span class="str">&quot;myMap&quot;</span>),
        {
            credentials: bingMapsKey,
            mapTypeId: Microsoft.Maps.MapTypeId.road,
            center: <span class="kwrd">new</span> Microsoft.Maps.Location(43, -87.9),
            zoom: 9
        }
    );
    
    <span class="kwrd">var</span> mapElem = $(map.getRootElement());
    <span class="rem">// Create DIV and add to Main Map</span>
    <span class="kwrd">var</span> miniMapDiv = $(<span class="str">'<div>'</span>).
        addClass(<span class="str">'MiniMap'</span>).
        appendTo(mapElem);
    <span class="rem">// Position to the Top Right corner</span>
    miniMapDiv.css({
        position: <span class="str">'absolute'</span>,
        top: 0,
        left: (mapElem.width() - miniMapDiv.width() - 2)
    });
    <span class="rem">// Initialize Mini Map</span>
    <span class="kwrd">var</span> miniMap = <span class="kwrd">new</span> Microsoft.Maps.Map(miniMapDiv[0], {
        credentials: bingMapsKey,
        showCopyright: <span class="kwrd">false</span>, showDashboard: <span class="kwrd">false</span>, showLogo: <span class="kwrd">false</span>, showScalebar: <span class="kwrd">false</span>
    });
    <span class="rem">// Attach Event Handler to Sync Mini Map with Main Map</span>
    <span class="kwrd">var</span> syncMiniMap = <span class="kwrd">function</span> () {
        miniMap.setView({
            center: map.getCenter(),
            zoom: map.getZoom() - 4
        });
        window.status = map.getCenter();
    };
    Microsoft.Maps.Events.addHandler(map, <span class="str">&quot;viewchange&quot;</span>, syncMiniMap);
    <span class="rem">// Sync Mini Map</span>
    syncMiniMap();
<span class="kwrd"></</span><span class="html">script</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">body</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">html</span><span class="kwrd">></span></pre>


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


Download: <a href="/files/BingMapsAjax7SimpleMiniMap.zip">BingMapsAjax7SimpleMiniMap.zip (1 KB)</a>
