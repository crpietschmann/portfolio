---
layout: post
blogengineid: 4cc95c7e-52bc-487b-9b6f-54d0b59f0d02
title: "Bing Maps v7 Ajax Hacks: InfoBox Description containing Html tags"
date: 2011-07-10 15:29:17 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2011/07/10/Bing-Maps-v7-Ajax-Hacks-InfoBox-Description-containing-Html-tags
  - /post/2011/07/10/bing-maps-v7-ajax-hacks-infobox-description-containing-html-tags
  - /post.aspx?id=4cc95c7e-52bc-487b-9b6f-54d0b59f0d02
---
<!-- more -->

For some odd reason the Bing Maps team decided to not allow HTML tags within the Description property of the InfoBox class they baked into the Bing Maps v7 Ajax control. I don’t know why they would limit it in such a way, but thankfully I have figured out a hack to override it and allow HTML tags as desired.  
<a href="/files/BingMaps7HackInfoBoxDescriptionHTML.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top: 0px; border-right: 0px; padding-top: 0px" title="BingMaps7HackInfoBoxDescriptionHTML" border="0" alt="BingMaps7HackInfoBoxDescriptionHTML" src="/files/BingMaps7HackInfoBoxDescriptionHTML_thumb.png" width="485" height="255" /></a>  
Here’s a full sample page that adds a map with pushpin and infobox, and sets up overriding support to allow HTML tags within the infobox’s description:  
&#160;  
   <pre class="csharpcode"><!DOCTYPE html>
<html>
   <head>
      <title></title>
      <meta http-equiv=<span class="str">&quot;Content-Type&quot;</span> content=<span class="str">&quot;text/html; charset=utf-8&quot;</span>>
      <script type=<span class="str">&quot;text/javascript&quot;</span> src=<span class="str">&quot;http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0&quot;</span>></script>
      <script type=<span class="str">&quot;text/javascript&quot;</span>>
         var map = <span class="kwrd">null</span>;

         function GetMap()
         {
            <span class="rem">// Initialize the map</span>
            map = <span class="kwrd">new</span> Microsoft.Maps.Map(document.getElementById(<span class="str">&quot;myMap&quot;</span>), {credentials:<span class="str">&quot;Bing Maps Key&quot;</span>}); 

            <span class="rem">// Retrieve the location of the map center </span>
            var center = map.getCenter();
            
            <span class="rem">// Add a pin to the center of the map</span>
            var pin = <span class="kwrd">new</span> Microsoft.Maps.Pushpin(center, {text: <span class="str">'1'</span>});

            <span class="rem">// Create the info box for the pushpin</span>
            var infobox = <span class="kwrd">new</span> Microsoft.Maps.Infobox(<span class="kwrd">new</span> Microsoft.Maps.Location(0, 0), {
                title: <span class="str">'My Pushpin'</span>,
                description: <span class="str">'A <i>short</i> description that contains '</span> +
                    <span class="str">'a couple <span style=&quot;color: red; font-weight: bold;&quot;>HTML</span> '</span> +
                    <span class="str">'tags, including a <a href=&quot;#&quot;>hyperlink</a>.'</span>,
                visible: <span class="kwrd">true</span>
            });

            <span class="rem">// Add a handler for the pushpin click event.</span>
            Microsoft.Maps.Events.addHandler(pin, <span class="str">'click'</span>, function () {
                infobox.setOptions({ visible: <span class="kwrd">true</span> });

                <span class="rem">// Override InfoBox Description to Allow the HTML tags it contains.</span>
                infobox.cm1001_er_etr.descriptionNode.innerHTML = infobox.getDescription();
            });

            <span class="rem">// Hide the info box when the map is moved.</span>
            Microsoft.Maps.Events.addHandler(map, <span class="str">'viewchange'</span>, function () {
                infobox.setOptions({ visible: <span class="kwrd">false</span> });
            });


            <span class="rem">// Add the pushpin and info box to the map</span>
            map.entities.push(pin);
            map.entities.push(infobox);

            <span class="rem">// Now that the InfoBox has been added to the Map,</span>
            <span class="rem">// override the Description to allow HTML</span>
            infobox.cm1001_er_etr.descriptionNode.innerHTML = infobox.getDescription();
         }
      </script>
   </head>
   <body onload=<span class="str">&quot;GetMap();&quot;</span>>
      <div id=<span class="str">'myMap'</span> style=<span class="str">&quot;position:relative; width:500px; height:500px;&quot;</span>></div>
   </body>      
</html></pre>
  ***Warning:** This is a hack and it relies on accessing part of the “non-public” API within the control. If the Bing Maps team decides to rename “cm1001_er_etr.descriptionNode” in a future release/update of the Bing Maps v7 control, then this code may stop working.*<style type="text/css">
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
