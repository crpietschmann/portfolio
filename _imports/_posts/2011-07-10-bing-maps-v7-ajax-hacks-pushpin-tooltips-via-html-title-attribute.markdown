---
layout: post
blogengineid: 0597582d-eb65-47af-b3c0-86f2b227ccdc
title: "Bing Maps v7 Ajax Hacks: Pushpin Tooltips via Html Title Attribute"
date: 2011-07-10 15:02:24 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2011/07/10/Bing-Maps-v7-Ajax-Hacks-Pushpin-Tooltips-via-Html-Title-Attribute
  - /post/2011/07/10/bing-maps-v7-ajax-hacks-pushpin-tooltips-via-html-title-attribute
  - /post.aspx?id=0597582d-eb65-47af-b3c0-86f2b227ccdc
---
<!-- more -->

The Bing Maps v7 Ajax control is still a bit lacking in functionality, and good for us it’s written in JavaScript so it’s easy to extent and hack. The following hack is an “unsupported” method of adding Tooltips to Pushpins by making use of the HTML Title attribute.  
<a href="/images/postsBingMaps7HackPushpinTooltip.png"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="BingMaps7HackPushpinTooltip" border="0" alt="BingMaps7HackPushpinTooltip" src="/images/postsBingMaps7HackPushpinTooltip_thumb.png" width="361" height="131" /></a>  
The Google Maps API already has a “setTitle” method on Markers to add a Tooltip to the pins plotted. Now, thanks to this hack, the same can be done using the Bing Maps v7 Ajax control.  
Here’s a full sample page that adds a map with pushpin and sets up the pushpin to have a Tooltip:  <pre class="csharpcode"><span class="kwrd"><!</span><span class="html">DOCTYPE</span> <span class="attr">html</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">html</span><span class="kwrd">></span>
   <span class="kwrd"><</span><span class="html">head</span><span class="kwrd">></span>
      <span class="kwrd"><</span><span class="html">title</span><span class="kwrd">></</span><span class="html">title</span><span class="kwrd">></span>
      <span class="kwrd"><</span><span class="html">meta</span> <span class="attr">http-equiv</span><span class="kwrd">=&quot;Content-Type&quot;</span> <span class="attr">content</span><span class="kwrd">=&quot;text/html; charset=utf-8&quot;</span><span class="kwrd">></span>
      <span class="kwrd"><</span><span class="html">script</span> <span class="attr">src</span><span class="kwrd">=&quot;http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0&quot;</span><span class="kwrd">></</span><span class="html">script</span><span class="kwrd">></span>
      <script type=<span class="str">&quot;text/javascript&quot;</span>>
         <span class="kwrd">var</span> map = <span class="kwrd">null</span>;

         <span class="kwrd">function</span> initMap()
         {
            <span class="rem">// Initialize the map</span>
            map = <span class="kwrd">new</span> Microsoft.Maps.Map(document.getElementById(<span class="str">&quot;myMap&quot;</span>), {credentials:<span class="str">&quot;Bing Maps Key&quot;</span>}); 

            <span class="rem">// Retrieve the location of the map center </span>
            <span class="kwrd">var</span> center = map.getCenter();
            
            <span class="rem">// Add a pin to the center of the map</span>
            <span class="kwrd">var</span> pin = <span class="kwrd">new</span> Microsoft.Maps.Pushpin(center);


            <span class="rem">// Add the pushpin to the map</span>
            map.entities.push(pin);



            <span class="rem">// Now that the Pushpin has been added to the Map,</span>
            <span class="rem">// we can implement the hack to add the Tooltip</span>
            
            <span class="rem">// Set the Pushpin's Tooltip via setting its HTML Dom</span>
            <span class="rem">// Title Attribute.</span>
            pin.cm1001_er_etr.dom.setAttribute(<span class="str">'title'</span>, <span class="str">'Pushpin Title'</span>);
         }
      <span class="kwrd"></</span><span class="html">script</span><span class="kwrd">></span>
   <span class="kwrd"></</span><span class="html">head</span><span class="kwrd">></span>
   <span class="kwrd"><</span><span class="html">body</span> <span class="attr">onload</span><span class="kwrd">=&quot;initMap();&quot;</span><span class="kwrd">></span>
      <span class="kwrd"><</span><span class="html">div</span> <span class="attr">id</span><span class="kwrd">='myMap'</span> <span class="attr">style</span><span class="kwrd">=&quot;position:relative; width:500px; height:500px;&quot;</span><span class="kwrd">></</span><span class="html">div</span><span class="kwrd">></span>
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


***Warning:** Like I said, this is a hack and it relies on accessing part of a “non-public” API within the control. If the Bing Maps team decides to rename “cm1001_er_etr.dom” in a future update/release of Bing Maps v7 then this code will stop working.*
