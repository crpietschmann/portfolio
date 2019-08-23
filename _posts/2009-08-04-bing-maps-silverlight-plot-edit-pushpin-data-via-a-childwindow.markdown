---
layout: post
blogengineid: 85a6ee8c-71b5-4c7e-8aec-2adeb2b97919
title: "Bing Maps Silverlight CTP: Plot/Edit Pushpin data via a ChildWindow"
date: 2009-08-04 16:57:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/08/04/Bing-Maps-Silverlight-Plot-Edit-Pushpin-data-via-a-ChildWindow.aspx
  - /post/2009/08/04/Bing-Maps-Silverlight-Plot-Edit-Pushpin-data-via-a-ChildWindow
  - /post/2009/08/04/bing-maps-silverlight-plot-edit-pushpin-data-via-a-childwindow
  - /post.aspx?id=85a6ee8c-71b5-4c7e-8aec-2adeb2b97919
---
<!-- more -->

<a href="/files/Silverlight_BingMaps_CTP_EditPushpintsWithChildWindow.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="Silverlight_BingMaps_CTP_EditPushpintsWithChildWindow" border="0" alt="Silverlight_BingMaps_CTP_EditPushpintsWithChildWindow" align="right" src="/files/Silverlight_BingMaps_CTP_EditPushpintsWithChildWindow.png" width="244" height="178" /></a> Recently I posted an example of using the <a href="http://blog.simplovation.com/blog/post.aspx?id=2360a9ab-48e5-410f-a2b4-195fa501f1ea" target="_blank">Web.Maps.VE Bing Maps ASP.NET AJAX Server Control with the AjaxControlToolkit ModalPopup Extender over at the Simplovation Blog</a>. Writing that example was rather simple since those two components/libraries are both written on top of ASP.NET AJAX and work extremely well together. This did however get me thinking about how to implement this same type of functionality using the Bing Maps Silveright Control CTP, and now that Silverlight 3 is out and it has a ChildWIndow control, this is actually really simple to implement using Silverlight as well.  
This was written for the Bing Maps Silverlight CTP Release.  
Download Example Code: <a href="/files/2009/8/Silverlight_BingMaps_CTP_EditPushpinsWithChildWindow.zip">Silverlight_BingMaps_CTP_EditPushpinsWithChildWindow.zip (235.44 kb)</a>  
To the right you can see a screenshot of this code sample in action. The screenshot in the back is just displaying the plotted “pushpins” as red squares, with tooltip being displayed over the pushpin located in Seattle, WA. The front screenshot is displaying the “Edit” dialog using the ChildWindow control.  
Before you hit Run (F5) on this Example Code, you will need to have the <a href="http://connect.microsoft.com/silverlightmapcontrolctp" target="_blank">Bing Maps Silverlight Map Control SDK CTP</a> Installed.  
If you want to see how to use the Silverlight 3 ChildWindow control, I recommend you take a look at <a href="http://www.wintellect.com/CS/blogs/jprosise/archive/2009/04/29/silverlight-3-s-new-child-windows.aspx" target="_blank">Jeff Prosise’s “Silverlight 3’s New Child Windows”</a> post.  
Also, if you want to see how to work with the Bing Maps Silverlight Control CTP, then you may want to take a look at the following links:  <ul>   <li><a href="/post.aspx?id=20736f64-9876-4d0f-b60e-3fe20252d4c4" target="_blank">Getting Started with Bing Maps Silverlight Map Control SDK CTP</a> </li>    <li><a href="/post.aspx?id=9f492f0f-8da4-4606-9f43-098074d8b9e9" target="_blank">Bing Maps Silverlight: Using MouseClick Event to Add “Pushpins”</a> </li>    <li><a href="/post.aspx?id=6a098f41-2df4-4362-a577-606863de838c" target="_blank">Bing Maps Silverlight: Basics of Adding Polygons and Polylines using XAML and Code</a> </li>    <li><a href="/post.aspx?id=2c25c9bc-e290-41e4-9a03-daa75a912c63" target="_blank">Bing Maps Silverlight: Adding Media (Images, Video, etc.) to the Map</a> </li>    <li><a href="/post.aspx?id=ce8b5456-ef99-4311-8099-16976ebcc5e2" target="_blank">Bing Maps Silverlight: Using Tile Layers to Overlay Custom Map Imagery</a> </li>    <li><a href="/post.aspx?id=88a585cd-f90a-40e1-963d-ca1932ce2535" target="_blank">Bing Maps Silverlight: Overlay OpentStreetMap, OpenAerialMap and Yahoo Map Imagery using Custom Tile Layers</a> </li> </ul>
