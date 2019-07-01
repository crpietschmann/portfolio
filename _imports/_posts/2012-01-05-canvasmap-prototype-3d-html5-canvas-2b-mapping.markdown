---
layout: post
blogengineid: 2c00d505-e1d3-483a-a157-090f0cf654e2
title: "CanvasMap Prototype = HTML5 Canvas + Mapping"
date: 2012-01-05 08:46:17 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "JavaScript"]
redirect_from: 
  - /post/2012/01/05/CanvasMap-Prototype-3d-HTML5-Canvas-2b-Mapping
  - /post/2012/01/05/canvasmap-prototype-3d-html5-canvas-2b-mapping
  - /post.aspx?id=2c00d505-e1d3-483a-a157-090f0cf654e2
---
<!-- more -->

When Microsoft released the Windows 8 Developer Preview (Sept. 2011) I was a bit annoyed that they failed to include a “native” Bing Maps control for us to build with. Instead they require you embed the Bing Maps v7 Ajax map within an IFrame to use it. There are a few issues with this that I wont get into now. So, consequentially, I decided to prototype my own map control with the intended purpose to use it with JavaScript based WinRT apps if it turned out well.  
*Disclaimer: The code for CanvasMap is very much in the prototype stage. It is buggy and far from complete. It wont hurt anything to play with it, but you wont want to use it in any apps you are building.*  
CanvasMap is a JavaScript map visualization control (similar to Bing Maps or Google Maps) that is built entirely on top of using the HTML5 Canvas element to render the map. Currently, neither Bing Maps or Google Maps use the Canvas element to render maps, so I thought I’d do this to see how the performance might compare. I know there are a few alternatives already, but I thought I’d have some fun trying to build my own.  
One big different between Canvas Map and Bing Maps or Google Maps is that it easily supports using the imagery tiles from either Bing Maps, <a href="http://www.openstreetmap.org/">OpenStreetMap</a> or Google Maps. And, it’s Open Source.  
<a href="/files/CanvasMapScreenshot.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top: 0px; border-right: 0px; padding-top: 0px" title="CanvasMapScreenshot" border="0" alt="CanvasMapScreenshot" src="/files/CanvasMapScreenshot_thumb.png" width="604" height="374" /></a>  
You can download the full source code for CanvasMap here:  <div style="padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: none; padding-top: 0px" id="scid:fb3a1972-4489-4e52-abe7-25a00bb07fdf:14319807-119e-430d-ae6d-8c08eb359545" class="wlWriterEditableSmartContent">
Source Code: <a href="/files/CanvasMap_Prototype_2.zip" target="_blank">CanvasMap_Prototype.zip</a></div>  
Enjoy playing around with it. I know I have.
