---
layout: post
id: 80f10444-7e23-45b5-bf7b-f6781fc31925
title: "Virtual Earth: Getting Started - Adding a basic Map to a page"
date: 2007-12-21 16:24:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2007/12/21/Virtual-Earth-Getting-Started-Adding-a-basic-Map-to-a-page
  - /post/2007/12/21/virtual-earth-getting-started-adding-a-basic-map-to-a-page
  - /post.aspx?id=80f10444-7e23-45b5-bf7b-f6781fc31925
---
<!-- more -->
<h3>What is Microsoft Virtual Earth?</h3>
<p>
Virtual Earth allows any developer to implement mapping technology within their web sites and/or applications. The mapping techology behind Virtual Earth is the exact same technology that powers <a href="http://maps.live.com/">Microsoft&#39;s Live Maps website</a>.
</p>
<h3>Getting Started with Virtual Earth</h3>
<h4>Lets add a Map to a page</h4>
<p>
<strong>Step 1:</strong> Add a DOCTYPE declaration and specify UTF-8 as the pages character set at the top of the page
</p>
<font size="2" color="#0000ff">
<p>
&lt;!<font size="2" color="#a31515">DOCTYPE</font><font size="2"> </font><font size="2" color="#ff0000">html</font><font size="2"> </font><font size="2" color="#ff0000">PUBLIC</font><font size="2"> </font><font size="2" color="#0000ff">&quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot;</font><font size="2"> </font><font size="2" color="#0000ff">&quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;</font><font size="2" color="#a31515">html</font><font size="2" color="#0000ff">&gt;<br />
&lt;</font><font size="2" color="#a31515">head</font><font size="2" color="#0000ff">&gt;<br />
&lt;</font><font size="2" color="#a31515">meta</font><font size="2"> </font><font size="2" color="#ff0000">http-equiv</font><font size="2" color="#0000ff">=&quot;Content-Type&quot;</font><font size="2"> </font><font size="2" color="#ff0000">content</font><font size="2" color="#0000ff">=&quot;text/html; charset=utf-8&quot;&gt;</font>
</p>
</font>
<p>
In order for certain map elements to be drawn correctly, you must use UTF-8 encoding.
</p>
<p>
<strong>Step 2:</strong> Add a script reference to the JavaScript Virtual Earth Map Control
</p>
<font size="2" color="#0000ff">
<p>
&lt;<font size="2" color="#a31515">script</font><font size="2"> </font><font size="2" color="#ff0000">type</font><font size="2" color="#0000ff">=&quot;text/javascript&quot;</font><font size="2"> </font><font size="2" color="#ff0000">src</font><font size="2" color="#0000ff">=&quot;http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/</font><font size="2" color="#a31515">script</font><font size="2" color="#0000ff">&gt;</font>
</p>
</font>
<p>
For best results, add this script reference to the page header. Placing this in the header ensures that the script will be loaded before other JavaScript on the page is executed. Doing this will prevent errors occuring because of certain code running before the script file is loaded.
</p>
<p>
<strong>Step 3:</strong> Add a DIV to the page where we want the Map to be rendered
</p>
<p>
This is essentially a placeholder where we will tell Virtual Earth to render the map.
</p>
<font size="2" color="#0000ff">
<p>
&lt;<font size="2" color="#a31515">div</font><font size="2"> </font><font size="2" color="#ff0000">id</font><font size="2" color="#0000ff">=&quot;myMap&quot;</font><font size="2"> </font><font size="2" color="#ff0000">style</font><font size="2" color="#0000ff">=&quot;</font><font size="2" color="#ff0000">position</font><font size="2">:</font><font size="2" color="#0000ff">relative</font><font size="2">; </font><font size="2" color="#ff0000">width</font><font size="2">:</font><font size="2" color="#0000ff">400px</font><font size="2">; </font><font size="2" color="#ff0000">height</font><font size="2">:</font><font size="2" color="#0000ff">400px</font><font size="2">;</font><font size="2" color="#0000ff">&quot;&gt;&lt;/</font><font size="2" color="#a31515">div</font><font size="2" color="#0000ff">&gt;</font>
</p>
</font>
<p>
You should also specify the Height and Width of the map using CSS styles on the DIV element. If you do not specify a height and width, then Virtual Earth will us the defaults of: 600px width and 400px height.
</p>
<p>
In this example we are also adding a black border around the map.
</p>
<p>
<strong>Step 4:</strong> Tell Virtual Earth to render the map
</p>
<p>
To do this we just add the following JavaScript to the page after the maps DIV is declared
</p>
<font size="2" color="#0000ff">
<p>
&lt;<font size="2" color="#a31515">script</font><font size="2"> </font><font size="2" color="#ff0000">type</font><font size="2" color="#0000ff">=&quot;text/javascript&quot;&gt;<br />
var</font><font size="2"> map = </font><font size="2" color="#0000ff">null</font><font size="2">;<br />
map = </font><font size="2" color="#0000ff">new</font><font size="2"> VEMap(</font><font size="2" color="#a31515">&#39;myMap&#39;</font><font size="2">);<br />
map.LoadMap();<br />
</font><font size="2" color="#0000ff">&lt;/</font><font size="2" color="#a31515">script</font><font size="2" color="#0000ff">&gt;</font>
</p>
</font>
<p>
<strong>Step 5:</strong> Run the page and see the map
</p>
<h3>Implementation Tips</h3>
<p>
<strong>Tip 1: </strong>When calling the LoadMap method, it is better practice to place the code that instantiates the map within a method and then have it called within the pages OnLoad event. To set this up do the following:
</p>
<font size="2" color="#0000ff">
<p>
&lt;<font size="2" color="#a31515">body</font><font size="2"> </font><font size="2" color="#ff0000">onload</font><font size="2" color="#0000ff">=&quot;PageLoad()&quot;&gt;<br />
&lt;</font><font size="2" color="#a31515">script</font><font size="2"> </font><font size="2" color="#ff0000">type</font><font size="2" color="#0000ff">=&quot;text/javascript&quot;&gt;<br />
function</font><font size="2"> PageLoad()<br />
{<br />
</font><font size="2" color="#0000ff">var</font><font size="2"> map = </font><font size="2" color="#0000ff">null</font><font size="2">;<br />
map = </font><font size="2" color="#0000ff">new</font><font size="2"> VEMap(</font><font size="2" color="#a31515">&#39;myMap&#39;</font><font size="2">);<br />
map.LoadMap();<br />
}<br />
</font><font size="2" color="#0000ff">&lt;/</font><font size="2" color="#a31515">script</font><font size="2" color="#0000ff">&gt;</font>
</p>
</font>
<p>
<strong>Tip 2: </strong>You can also specify a the location (Lat/Long), zoom level and map styles when calling the LoadMap method.
</p>
<font size="2">
<p>
map.LoadMap(<font size="2" color="#0000ff">new</font><font size="2"> VELatLong(47.6, -122.33), 10, VEMapStyle.Road);</font>
</p>
</font>
<h3>Is there an ASP.NET Virtual Earth server control?</h3>
<p>
Yes, but it isn&#39;t from Microsoft. The <a href="http://simplovation.com/Page/WebMapsVE.aspx">Simplovation Web.Maps.VE</a> component is a reusable ASP.NET AJAX Virtual Earth mapping server control that is created with the goal of abstracting out as much JavaScript as possible when implementing Virtual Earth mapping within ASP.NET. It even allows you to handle most map events (like: OnEndZoom, OnEndPan and OnClick, etc.) all from within server-side code; so you don&#39;t even have to write any JavaScript if you don&#39;t want to.
</p>
<h3>Complete Code For This Article</h3>
<p>
You can just save the following code in an .htm file and run it in your browser to see the above code in action without typing it all in yourself.
</p>
<p>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;&gt;<br />
&lt;script type=&quot;text/javascript&quot; src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>&quot; mce_src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script</a>&gt;<br />
&lt;/head&gt;
</p>
<p>
&lt;body onload=&quot;PageLoad()&quot;&gt;<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
function PageLoad()<br />
{<br />
&nbsp;&nbsp;&nbsp; var map = null;<br />
&nbsp;&nbsp;&nbsp; map = new VEMap(&#39;myMap&#39;);<br />
&nbsp;&nbsp;&nbsp; map.LoadMap(new VELatLong(47.6, -122.33), 10, VEMapStyle.Road);<br />
}<br />
&lt;/script&gt;
</p>
<p>
&lt;div id=&quot;myMap&quot; style=&quot;position:relative; width:400px; height:400px;&quot;&gt;&lt;/div&gt;
</p>
<p>
&lt;/body&gt;<br />
&lt;/html&gt;
</p>
<h3>Why did I write this?</h3>
<p>
You may be wondering why I wrote a basic &quot;Getting Started with Virtual Earth&quot; tutorial when there are already other ones out there? Well, it&#39;s simple, I am working on some more advanced articles and I want to make sure you have a basic understanding before I go into more detail.
</p>
<h3>Additional Resources</h3>
<p>
<a href="http://dev.live.com/virtualearth/sdk/">Virtual Earth Interactive SDK</a><br />
<a href="http://msdn2.microsoft.com/en-us/library/bb429619.aspx">Virtual Earth Map Control SDK within MSDN</a>
</p>
