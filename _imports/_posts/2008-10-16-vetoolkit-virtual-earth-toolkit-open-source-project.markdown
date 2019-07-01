---
layout: post
blogengineid: 168dded3-b787-440e-8273-f971229a3395
title: "VEToolkit: Virtual Earth Toolkit Open Source Project"
date: 2008-10-16 21:10:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/10/16/VEToolkit-Virtual-Earth-Toolkit-Open-Source-Project
  - /post/2008/10/16/vetoolkit-virtual-earth-toolkit-open-source-project
  - /post.aspx?id=168dded3-b787-440e-8273-f971229a3395
---
<!-- more -->
<p>
A couple weeks ago I started the new <a href="http://codeplex.com/vetoolkit">VEToolkit</a> (Virtual Earth Toolkit) Open Source project. This project spawns out of the need for more helpers to make Virtual Earth Map development much simpler, and follows inspiration from the Ajax Control Toolkit. This is a JavaScript library, so it&#39;s all client-side code; just like the Virtual Earth AJAX API itself. The project is also meant to play nicely with any client-side, JavaScript library you want to use within your application (such as jQuery, Prototype, etc.)
</p>
<p>
Below is a list of &quot;helper&quot; methods that the project currently includes at the time of writing this post:
</p>
<p>
<strong>VEToolkit.Drawing.DrawCircle</strong><br />
- This method returns an array of VELatLong objects that represent a circle drawn to the specified radius around a given center point.
</p>
<p>
<strong>VEToolkit.Math.CalculateBearing</strong><br />
- This method calculates the bearing (or direction) from 1 VELatLong coordinate to another.
</p>
<p>
<strong>VEToolkit.Math.CalculateDistance</strong><br />
- This method calculates the distance between 2 VELatLong coordinates using the specified unit of measurement (Miles or Kilometers). 
</p>
<p>
<strong>VEToolkit.Math.CalculateMidPoint</strong><br />
- This method calculates the mid point (or center point) between 2 VELatLong coordinates. 
</p>
<p>
<strong>VEToolkit.Math.GetPolygonCentroid</strong><br />
- This method calculates the approximate centroid (or center point) of a given Polygon&#39;s points.
</p>
<p>
<strong>VEToolkit.Math.IsInPolygon</strong><br />
- This method returns true or false specifying if the given VELatLong point is within the bounds of the given Polygon coordinates.
</p>
<p>
&nbsp;
</p>
<p>
Also, here&#39;s a list of the current JavaScript-based &quot;Extender&quot; controls in the works: 
</p>
<p>
<strong>VEToolkit.ContextMenuExtender</strong><br />
- This extender provides easy to use Context Menu functionality for Virtual Earth.
</p>
<p>
<strong>VEToolkit.DragShapeExtender</strong><br />
- This extender allows you to easily link up functionality that allows you to drag-n-drop specific Shape&#39;s that are plotted. 
</p>
<p>
<strong>VEToolkit.MiniMapExtender</strong><br />
- This extender provides easy to use functionality for controlling the position of the MiniMap. For Example: Auto-Align MiniMap to the Top Right Corner of the Map. 
</p>
<p>
&nbsp;
</p>
<p>
Project Homepage: <a href="http://codeplex.com/VEToolkit">http://codeplex.com/VEToolkit</a> 
</p>
