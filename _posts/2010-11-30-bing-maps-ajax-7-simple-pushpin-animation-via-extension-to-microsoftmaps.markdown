---
layout: post
id: db9b20db-30e1-4f41-b114-c47bd7b8b35d
title: "Bing Maps Ajax 7: Simple Pushpin Animation via Extension to Microsoft.Maps"
date: 2010-11-30 23:10:29 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2010/11/30/Bing-Maps-Ajax-7-Simple-Pushpin-Animation-via-Extension-to-MicrosoftMaps
  - /post/2010/11/30/bing-maps-ajax-7-simple-pushpin-animation-via-extension-to-microsoftmaps
  - /post.aspx?id=db9b20db-30e1-4f41-b114-c47bd7b8b35d
---
<!-- more -->
<p>When updating the location a pushpin using the Bing Maps Ajax Control, the pushpin instantly moves to its new location. Sometimes this may work, but other times it may be nice to animate the movement. Updating the location a vehicle in an asset tracking application is one example where it would be nice to animate the movement.</p>  <p>I wrote a simple extension to the Bing Maps Ajax v7 control that adds the “Pushpin.moveLocation” method to perform such an animation.</p>  <h3>Usage</h3>  <p>Let’s start with some sample usage of the “Pushpin.moveLocation” method.</p>  <pre class="csharpcode"><span class="rem">// Move pushpin to new location</span>
<span class="rem">// using the default animation speed</span>
<span class="rem">// of 1000 milliseconds (1 second)</span>
pushpin.moveLocation(
    <span class="kwrd">new</span> Microsoft.Maps.Location(47, -87)
);

<span class="rem">// Move pushpin to new location</span>
<span class="rem">// using a speed of 2000 milliseconds</span>
<span class="rem">// or 2 seconds</span>
pushpin.moveLocation(
    <span class="kwrd">new</span> Microsoft.Maps.Location(47, -87),
    2000
);</pre>

<h3>Method Reference</h3>

<p>Here’s some documentation for the “Pushpin.moveLocation” method:</p>

<p><strong>Pushpin.moveLocation(location, speed)</strong>

  <br />This methods moves the pushpin to a new location using an animation of slowly moving the pushpin over the period of the specified interval.</p>

<ol>
  <li><strong>location </strong>– The Location to move the pushpin to.</li>

  <li><strong>speed</strong> – The time period to perform the animation, in milliseconds. If not specified, the default is 1000 milliseconds, or 1 second.</li>
</ol>

<h3>Full Extension Source Code</h3>

<p>Here’s the full source code for adding the “Pushpin.moveLocation” extension to Bing Maps Ajax v7.</p>

<pre class="csharpcode">(<span class="kwrd">function</span> ($m) {
    (<span class="kwrd">function</span>(proto) {
        <span class="kwrd">if</span> (!proto.moveLocation){
            proto.moveLocation = <span class="kwrd">function</span>(loc, speed) {
                <span class="rem">// loc = Location to move the pushpin to</span>
                <span class="rem">// speed = time (in milliseconds) to perform animation</span>
                <span class="kwrd">var</span> that = <span class="kwrd">this</span>, startLoc = <span class="kwrd">this</span>.getLocation(),
                    endLoc = loc, startTime = <span class="kwrd">new</span> Date();
                <span class="kwrd">if</span> (speed === undefined){
                    speed = 1000; <span class="rem">// Default to 1 second</span>
                }
                <span class="kwrd">var</span> interval = window.setInterval(<span class="kwrd">function</span>() {
                    <span class="kwrd">var</span> timeElapsed = (<span class="kwrd">new</span> Date()) - startTime;
                    <span class="kwrd">if</span> (timeElapsed &gt;= speed){
                        <span class="rem">// Full animation time (speed) has elapsed</span>
                        <span class="rem">// Just set final location and end animation</span>
                        that.setLocation(endLoc);
                        window.clearInterval(interval);
                    }
                    <span class="rem">// Set the Latitude/Longitude values to a percentage</span>
                    <span class="rem">// of the total distance to move based on the amount</span>
                    <span class="rem">// of time that has elapsed since animation started.</span>
                    <span class="kwrd">var</span> timeElapsedPercent = (timeElapsed / speed);
                    <span class="kwrd">var</span> latitudeDistToMove = (
                        endLoc.latitude - startLoc.latitude
                    );
                    <span class="kwrd">var</span> longitudeDistToMove = (
                        endLoc.longitude - startLoc.longitude
                    );
                    that.setLocation(<span class="kwrd">new</span> $m.Location(
                        startLoc.latitude + (timeElapsedPercent * latitudeDistToMove),
                        startLoc.longitude + (timeElapsedPercent * longitudeDistToMove)
                        ));
                }, 10);
            };
        }
    })($m.Pushpin.prototype);
})(Microsoft.Maps);</pre>
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

<h3>Conclusion</h3>

<p>This is a really simple Pushpin animation extension that does its job very nicely. However, this is just the beginning of what a more feature full extension would provide.</p>
