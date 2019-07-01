---
layout: post
title: "Prototype of VEToolkit + ASP.NET MVC 1.0 Component Checked In"
date: 2009-03-28 16:17:06 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "JavaScript", "ASP.NET MVC"]
alias: ["/post/2009/03/28/Prototype-of-VEToolkit-2b-ASPNET-MVC-10-Component-Checked-In", "/post/2009/03/28/prototype-of-vetoolkit-2b-aspnet-mvc-10-component-checked-in"]
---
<!-- more -->
<p>I just checked in an initial prototype of a reusable Virtual Earth component for ASP.NET MVC. The “VEToolkit.Web.MVC.Map” component is written as an Extension to the ASP.NET MVC AjaxHelper class, and allows for a simpler experience when implementing Virtual Earth mapping within ASP.NET MVC applications. This is an early prototype of what the component will be; it’s not a final release; but you are free to use it.</p>  <p><a href="http://vetoolkit.codeplex.com/SourceControl/ListDownloadableCommits.aspx" target="_blank">Download the latest Change Set of VEToolkit</a></p>  <p>The code is subject to change at any time, since this is currently in a prototype stage, but below is a basic overview of what’s there so far.</p>  <h3>Include a Basic Map on the Page</h3>  <p>Include the “VEToolkit.Web.MVC” namespace within the page by adding the following Include directive to the top of the Page:</p>  <pre class="csharpcode"><span class="asp">&lt;%@ Import Namespace=&quot;VEToolkit.Web.MVC&quot; %&gt;</span></pre>
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

<p>Add the following two JavaScript Includes (the Virtual Earth JavaScript API and jQuery) to the Page Header:</p>

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">script</span> <span class="attr">type</span><span class="kwrd">=&quot;text/javascript&quot;</span> <span class="attr">src</span><span class="kwrd">=&quot;http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">script</span><span class="kwrd">&gt;</span></pre>
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

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">script</span> <span class="attr">type</span><span class="kwrd">=&quot;text/javascript&quot;</span> <span class="attr">src</span><span class="kwrd">=&quot;/Scripts/jquery-1.3.2.js&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">script</span><span class="kwrd">&gt;</span></pre>

<p>Add the following to the Page to add a basic Virtual Earth map:</p>

<pre class="csharpcode"><span class="asp">&lt;%</span>=Ajax.Map() <span class="asp">%&gt;</span></pre>

<p>And that’s it; you’ll have “default” sized Virtual Earth map on the page.</p>

<h3>Specify you own name for the global VEMap Variable that’s used</h3>

<p>By default the component autogenerates an ID to use when naming the global VEMap object within the JavaScript that’s generated.</p>

<p>Here’s an example of how to specify your own ID (or variable name) to be used for the global VEMap object that’s created:</p>

<pre class="csharpcode"><span class="asp">&lt;%</span>=Ajax.Map(<span class="str">&quot;myMap&quot;</span>) <span class="asp">%&gt;</span></pre>

<p>Now to get a hold of the global reference to the VEMap object, you can just access it by name, like so:</p>

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">input</span> <span class="attr">type</span><span class="kwrd">=&quot;button&quot;</span> <span class="attr">value</span><span class="kwrd">=&quot;Zoom In&quot;</span> <span class="attr">onclick</span><span class="kwrd">=&quot;myMap.ZoomIn();&quot;</span> <span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;</span><span class="html">input</span> <span class="attr">type</span><span class="kwrd">=&quot;button&quot;</span> <span class="attr">value</span><span class="kwrd">=&quot;Zoom Out&quot;</span> <span class="attr">onclick</span><span class="kwrd">=&quot;myMap.ZoomOut();&quot;</span> <span class="kwrd">/&gt;</span></pre>

<h3>&#160;</h3>

<h3>Set a couple Map Properties</h3>

<p>Here’s a modified example of the above that sets the Center Location, Zoom Level and Map Style:</p>

<pre class="csharpcode"><span class="asp">&lt;%</span>=Ajax.Map(<span class="str">&quot;myMap&quot;</span>)
    .SetCenter(<span class="kwrd">new</span> Location(44, -78))
    .SetZoom(6)
    .SetMapStyle(MapStyle.Road)<span class="asp">%&gt;</span></pre>

<h3>&#160;</h3>

<h3>Call a JavaScript Function Once the Map is Loaded</h3>

<p>Also you can specify a JavaScript Function to be called once the Map has finished loading within the Page.</p>

<p>Here’s an example:</p>

<pre class="csharpcode"><span class="asp">&lt;%</span>=Ajax.Map(<span class="str">&quot;myMap&quot;</span>)
    .SetOnMapLoaded(<span class="str">&quot;MapLoaded&quot;</span>)<span class="asp">%&gt;</span></pre>

<p>And, here’s a simple JavaScript Function named “MapLoaded” to match that adds a Pushpin to the Map at it’s Center Point:</p>

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">script</span> <span class="attr">type</span><span class="kwrd">=&quot;text/javascript&quot;</span><span class="kwrd">&gt;</span>
    <span class="kwrd">function</span> MapLoaded(sender) {
        <span class="rem">// &quot;sender&quot; = The Map that was Loaded</span>
        <span class="kwrd">var</span> map = sender;

        <span class="rem">// Add a Shape to the Center of the Map now it's finished loading</span>
        <span class="kwrd">var</span> s = <span class="kwrd">new</span> VEShape(VEShapeType.Pushpin, sender.GetCenter());
        s.SetTitle(<span class="str">&quot;Center Point&quot;</span>);
        s.SetDescription(<span class="str">&quot;This was the original center point when the Map loaded.&quot;</span>);
        map.AddShape(s);
    }
<span class="kwrd">&lt;/</span><span class="html">script</span><span class="kwrd">&gt;</span></pre>

<h3>&#160;</h3>

<h3>Conclusion</h3>

<p>As stated above, this is just a basic overview of what’s been implemented so far in the VEToolkit ASP.NET MVC Prototype. There are a couple more things in there than I mentioned above, but I thought I’d keep the intro very basic until development moved further along.</p>
