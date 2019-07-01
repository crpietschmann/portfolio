---
layout: post
blogengineid: 59014567-e99d-4eb6-a550-7fcbf3117651
title: "Geomap Project - HTML Extensions for Rendering Map Displays"
date: 2011-01-13 06:54:06 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["HTML", "Bing Maps"]
redirect_from: 
  - /post/2011/01/13/Geomap-Project-HTML-Extensions-for-Rendering-Map-Displays
  - /post/2011/01/13/geomap-project-html-extensions-for-rendering-map-displays
  - /post.aspx?id=59014567-e99d-4eb6-a550-7fcbf3117651
---
<!-- more -->
<p>One thing missing from HTML5 is the ability to render maps on a page. The Bing Maps and Google Maps JavaScript API’s are generally fairly simple to implement, but they could both be easier. I wrote up a small example API that allows you to add Maps, and plot data on those Maps, to an HTML page by using mostly HTML markup using a new <a href="http://geomap.codeplex.com">&lt;geomap/&gt;</a> tag.</p>  <p>While this project uses JavaScript to perform the map rendering once the page loads, all you need to do to implement it is write some simple markup. This project really makes it easier than before to add Maps to your HTML pages.</p>  <p><a href="http://geomap.codeplex.com">Download &lt;geomap&gt; Here</a></p>  <h3>Basic Map</h3>  <p>Once the &lt;geomap&gt; javascript (.js) files are included in the page, you can use the following markup to add a map.</p>  <pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">geomap</span><span class="kwrd">&gt;&lt;/</span><span class="html">geomap</span><span class="kwrd">&gt;</span></pre>
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

<h3>Plot Some Data</h3>

<p>Plotting data on the map is as simple as markup, just like any other HTML element.</p>

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">geomap</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">pushpin</span> <span class="attr">location</span><span class="kwrd">=&quot;40 -96&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">pushpin</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">polyline</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">location</span> <span class="attr">latitude</span><span class="kwrd">=&quot;40&quot;</span> <span class="attr">longitude</span><span class="kwrd">=&quot;-96&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">location</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">location</span> <span class="attr">latitude</span><span class="kwrd">=&quot;-40&quot;</span> <span class="attr">longitude</span><span class="kwrd">=&quot;-96&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">location</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">polyline</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">polygon</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">location</span> <span class="attr">latitude</span><span class="kwrd">=&quot;40&quot;</span> <span class="attr">longitude</span><span class="kwrd">=&quot;-76&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">location</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">location</span> <span class="attr">latitude</span><span class="kwrd">=&quot;-40&quot;</span> <span class="attr">longitude</span><span class="kwrd">=&quot;-76&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">location</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">location</span> <span class="attr">latitude</span><span class="kwrd">=&quot;0&quot;</span> <span class="attr">longitude</span><span class="kwrd">=&quot;0&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">location</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">location</span> <span class="attr">latitude</span><span class="kwrd">=&quot;40&quot;</span> <span class="attr">longitude</span><span class="kwrd">=&quot;-76&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">location</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">polygon</span><span class="kwrd">&gt;</span>
    Map not loaded. You may need to enable JavaScript within this browser.
<span class="kwrd">&lt;/</span><span class="html">geomap</span><span class="kwrd">&gt;</span></pre>
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

<p>Additionally, if JavaScript is disabled in the page, or you are unable to execute the JavaScript code that initializes the map, then the user will see the message <em>“Map not loaded. You may need to enable JavaScript within this browser.” </em>You can alternatively add any HTML content to this “&lt;noscript&gt;” style functionality to fall back to what ever you want when the map is unable to load.</p>

<h3>Supports both Bing Maps and Google Maps</h3>

<p>What would be the use of this type of plugin / extension if it didn’t support multiple Map providers. Currently the project only includes support for Bing Maps and Google Maps, but you could write you own &lt;geomap&gt; provider script to add support for any Map provider you want.</p>

<h3>Conclusion</h3>

<p>At the time of writing this, the &lt;geomap&gt; project is pretty much in a prototype stage; while you are free to use it in your own projects if you wish. Also, the project is licensed under the the LGPL license, so you can do what you wish with it as long as you abide by the license.</p>

<p><a href="http://geomap.codeplex.com">Download &lt;geomap&gt; Here!</a></p>

<p>Happy Mapping!</p>
