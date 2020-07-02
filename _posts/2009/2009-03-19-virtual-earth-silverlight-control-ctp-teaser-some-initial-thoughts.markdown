---
layout: post
blogengineid: 6b2b935a-f941-4357-8e30-2d5f61644935
title: "Virtual Earth Silverlight Control CTP Teaser and Some Initial Thoughts"
date: 2009-03-19 18:12:21 -0500
comments: true
published: true
categories: ["Virtual Earth", "Silverlight"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/03/19/Virtual-Earth-Silverlight-Control-CTP-Teaser-Some-Initial-Thoughts.aspx
  - /post/2009/03/19/Virtual-Earth-Silverlight-Control-CTP-Teaser-Some-Initial-Thoughts
  - /post/2009/03/19/virtual-earth-silverlight-control-ctp-teaser-some-initial-thoughts
  - /post.aspx?id=6b2b935a-f941-4357-8e30-2d5f61644935
---
<!-- more -->

Yesterday, the <a href="http://blogs.msdn.com/virtualearth/archive/2009/03/18/introducing-the-virtual-earth-silverlight-map-control.aspx" target="_blank">Virtual Earth Silverlight Control CTP (Community Technology Preview) was announced at MIX’09</a>. I was also fortunate to get early access to the CTP, so I’ve been playing with it for a few days. I can’t show you any code yet (until it’s released publicly), but I can tell you a little about it for now. Once it’s released I’ll be posting some articles that range from Basic How-To to Implementing Some Cool Stuff; but you’ll have to wait a little bit for those.  
For now, here’s a little info…  
Combining the power of Silverlight and Virtual Earth Mapping makes for a pretty awesome combination. You can now build all the cool stuff you wanted to build with the JavaScript Map Control, Plus TONS More!  
Here’s a couple key feature points:  <ul>   <li>Cross-Platform Support. No more hacky JavaScript to write; unless of course you want to use the Silverlight HTML Bridge to interface with existing JavaScript code (think about how you could upgrade existing mapping web applications with this). </li>    <li>Ability to Plot ANY Rich Content on the Map. Including Videos or any other Custom Controls. </li>    <li>Increased Performance! Since the control uses Silverlight it takes full advantage of the performance benefits that Silverlight has to offer. Remember how slow the JavaScript Map Control can become?</li>    <li>Map wraps across the International Date Line. This is an issue with the JavaScript Map Control, since it doesn’t allow you to plot Polygons or Polylines that span across the International Date Line. This is no longer an issue with the Silverlight Map Control.</li> </ul>  
Here’s a couple screenshots of the Map in action:  
The first one shows a Polygon, Polyline and a Video plotted on the Map.  
<a href="/files/VEJS_Teaser_001_PolygonPolylineVideo.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_Teaser_001_PolygonPolylineVideo" border="0" alt="VEJS_Teaser_001_PolygonPolylineVideo" src="/files/VEJS_Teaser_001_PolygonPolylineVideo_thumb.png" width="244" height="214" /></a>   
The second one shows a Tooltip being displayed from the mouse hovering over a Polygon.  
<a href="/files/VEJS_Teaser_002_PolygonWithTooltip.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_Teaser_002_PolygonWithTooltip" border="0" alt="VEJS_Teaser_002_PolygonWithTooltip" src="/files/VEJS_Teaser_002_PolygonWithTooltip_thumb.png" width="244" height="152" /></a>   
Not a final release, and the JavaScript Map Control does offer some features that the Silverlight control does not:  
For example, the Silverlight control does not have Birdseye or 3D map modes. They haven’t mentioned when/if the Silverlight control may have these, but I’m hoping they do make it into the control before RTW to keep it on par with the existing JavaScript Control.  
Also keep in mind that this is just a CTP (Community Technology Preview); which means: 1) You can NOT use it in Production, and 2) The next release (CTP, Beta, Whatever) may contain (and probably will) breaking changes. So, if you’re looking for a Silverlight Map Control you can roll into Production Today, then you’ll want to check out the <a href="http://deepearth.codeplex.com" target="_blank">DeepEarth Project</a>.  
Keep an eye out for my tutorials as I release them, starting tomorrow as soon as the CTP is Released To Web (RTW).
