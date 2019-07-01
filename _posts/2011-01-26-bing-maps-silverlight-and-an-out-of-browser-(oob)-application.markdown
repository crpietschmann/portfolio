---
layout: post
blogengineid: 1f2938fd-eee7-4ec7-8d97-e80d307804bd
title: "Step By Step: Bing Maps Silverlight and an Out Of Browser (OOB) Application"
date: 2011-01-26 08:40:19 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2011/01/26/Bing-Maps-Silverlight-and-an-Out-Of-Browser-(OOB)-Application
  - /post/2011/01/26/bing-maps-silverlight-and-an-out-of-browser-(oob)-application
  - /post.aspx?id=1f2938fd-eee7-4ec7-8d97-e80d307804bd
---
<!-- more -->

I’ve received a couple questions regarding the display of the Bing Maps Silverlight control within a Silverlight Out Of Browser (OOB) application, so I decided to write up a simple step by step example of creating a basic Silverlight OOB application that displays a map.  <h3>Step By Step Example</h3>  
Follow the below steps to create a basic Silverlight OOB application that displays a map using the Bing Maps Silverlight control within Visual Studio 2010:  
**Step 1: Create New Project**     
In this case, I’m choosing to create a new “Silverlight Application” project, but you could also choose the Business or Navigation Application templates if you choose.     
<a href="/files/BingMapsSilverlightOOB_001.png"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="BingMapsSilverlightOOB_001" border="0" alt="BingMapsSilverlightOOB_001" src="/files/BingMapsSilverlightOOB_001_thumb.png" width="244" height="170" /></a>  
**Step 2: Select the desired Web Project Type on the New Silverlight Application dialog**     
I’m leaving the default setting of an ASP.NET Web Application Project, but you could choose a Website or MVC Web Project.     
<a href="/files/BingMapsSilverlightOOB_002.png"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="BingMapsSilverlightOOB_002" border="0" alt="BingMapsSilverlightOOB_002" src="/files/BingMapsSilverlightOOB_002_thumb.png" width="244" height="196" /></a>  
**Step 3: Add a Reference to the Bing Maps Silverlight Control within the Silverlight project      
<a href="/files/BingMapsSilverlightOOB_003.png"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="BingMapsSilverlightOOB_003" border="0" alt="BingMapsSilverlightOOB_003" src="/files/BingMapsSilverlightOOB_003_thumb.png" width="244" height="119" /></a>**  
**Step 4: Add a Map to the Application      
**Here’s the source code for MainPage.xaml with a map added in the project that I’ve created:  <pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">=&quot;BingMapsSilverlightApplication1.MainPage&quot;</span>
    <span class="attr">xmlns</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml/presentation&quot;</span>
    <span class="attr">xmlns:x</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;</span>
    <span class="attr">xmlns:d</span><span class="kwrd">=&quot;http://schemas.microsoft.com/expression/blend/2008&quot;</span>
    <span class="attr">xmlns:mc</span><span class="kwrd">=&quot;http://schemas.openxmlformats.org/markup-compatibility/2006&quot;</span>
    
    <span class="attr">xmlns:bing</span><span class="kwrd">=&quot;clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl&quot;</span>
             
    <span class="attr">mc:Ignorable</span><span class="kwrd">=&quot;d&quot;</span>
    <span class="attr">d:DesignHeight</span><span class="kwrd">=&quot;300&quot;</span> <span class="attr">d:DesignWidth</span><span class="kwrd">=&quot;400&quot;</span><span class="kwrd">></span>

    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;LayoutRoot&quot;</span> <span class="attr">Background</span><span class="kwrd">=&quot;White&quot;</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">bing:Map</span><span class="kwrd">></</span><span class="html">bing:Map</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>
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


**Step 5: Enable Out of Browser Mode** 

  
Within the Silverlight Project Properties, check the “Enable running application out of browser” option to enable Out Of Browser (OOB) for this Silverlight application.


**Step 6: Run it!
    
**If you have the Silverlight project selected as the Startup Project (which is the default when creating the project) then Visual Studio will run it in Out Of Browser mode.


If you have the Web project selected as the Startup Project, then you will need to Right Click the Silverlight Application (when running) and select “Install […] onto this computer…”


Generally when debugging an OOB application, you’ll want to have the Silverlight project set as Startup Project, unless you have web services, images or other data hosted within the Web Project that the Silverlight Project consumes. In this case you’ll want to debug while running the Web Project as Startup.

<h3>Additional Note Regarding Silverlight OOB (Out of Browser) Applications</h3>


The Bing Maps Silverlight control requires itself you be hosted within a web site or application. If you are using the Bing Maps Silverlight control within a Silverlight Application, then you’ll need to host it on a website (over http). If you do not host it on a web site or application, then the Bing Maps Silverlight control will display a *“Map loaded in unsupported Uri Scheme. Please reload page in “http” scheme.”* error message.


Happy Mapping!
