---
layout: post
blogengineid: 76ef247b-9a57-4577-b45e-34ebb506bdac
title: "VEToolkit - Virtual Earth Toolkit v6.2.012509.1053 Released!"
date: 2009-01-25 11:56:00 -0600
comments: true
published: true
categories: ["VEToolkit", "Bing Maps", "Virtual Earth"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2009/01/25/VEToolkit-Virtual-Earth-Toolkit-v620125091053-Released.aspx
  - /post/2009/01/25/VEToolkit-Virtual-Earth-Toolkit-v620125091053-Released
  - /post/2009/01/25/vetoolkit-virtual-earth-toolkit-v620125091053-released
  - /post.aspx?id=76ef247b-9a57-4577-b45e-34ebb506bdac
---
<!-- more -->


This is the first official release of the <a href="http://codeplex.com/VEToolkit">Virtual Earth Toolkit</a>. The toolkit is by no means complete, but this is a &quot;stable&quot; collection of the Controls, Extenders and Methods that have been implemented thus far.



Project: <a href="http://codeplex.com/VEToolkit" title="Virtual Earth Toolkit">http://codeplex.com/VEToolkit</a> 



Download the Release: <a href="http://www.codeplex.com/VEToolkit/Release/ProjectReleases.aspx">http://www.codeplex.com/VEToolkit/Release/ProjectReleases.aspx</a>

<h3>What is the Virtual Earth Toolkit?</h3>


*<span>The
Virtual Earth Toolkit is a set of JavaScript-based Controls/Tools that
Extend Virtual Earth with functionality that is commonly implemented,
but hasn&#39;t been implemented within the Virtual Earth JavaScript Map
Control.



The Controls/Tools in the VEToolkit library are
completely self contained, and don&#39;t require the use of any other
JavaScript library to use other than Virtual Earth 6.2 (current
version). This allows you to use this toolkit along-side any other
JavaScript library (jQuery, ASP.NET AJAX, etc.); plus you can make use
of it with any server-side framework of you choice (ASP.NET, ASP.NET
MVC, PHP, etc.).</span>* 

<h3>Features 

</h3>


Below is a summary of what&#39;s included in this release:



<span>
<ul>
	<li>Controls 

	<ul>
		<li>VEToolkit.ShapeListControl
		<ul>
			<li>A simple control that displays a list of Shapes that are currently plotted on the VEMap.</li>
		</ul>
		</li>
	</ul>
	</li>
	<li>Extenders
	<ul>
		<li>VEToolkit.ContextMenuExtender
		<ul>
			<li>This extends the VEMap with Context Menu (right click menu) support.</li>
		</ul>
		</li>
		<li>VEToolkit.DragShapeExtender
		<ul>
			<li>This extends the VEMap to allow the user to reposition Shapes by
			simply clicking and dragging them around the map. It also implements
			functionality that allows you (the programmer) to determine at runtime
			which Shapes are draggable.</li>
		</ul>
		</li>
		<li>VEToolkit.MiniMapExtender
		<ul>
			<li>This extends the VEMap with better MiniMap support; allowing the
			MiniMap to easily be positioned and aligned into any side/corner of the
			VEMap display.</li>
		</ul>
		</li>
	</ul>
	</li>
	<li>Helper Methods
	<ul>
		<li>VEToolkit.LoadAPI
		<ul>
			<li>This methods allows you to easily load the Virtual Earth JavaScript API On-Demand at runtime.</li>
		</ul>
		</li>
		<li>VEToolkit.Drawing.DrawCircle
		<ul>
			<li>This method returns a collection of VELatLong objects that
			represent a Circle with a given radius surrounding a specific VELatLong
			center point.</li>
		</ul>
		</li>
		<li>VEToolkit.Math.CalculateBearing
		<ul>
			<li>This method calculates the bearing (in degrees) between two
			VELatLong coordinates. This can be used to calculate the direction an
			object is pointing or traveling.</li>
		</ul>
		</li>
		<li>VEToolkit.Math.CalculateInverseCoordinate
		<ul>
			<li>This method calculates the Inverse VELatLong coordinate for a given VELatLong coordinate. (Or opposite position on the globe)</li>
		</ul>
		</li>
		<li>VEToolkit.Math.CalculateMidPoint
		<ul>
			<li>This method calculates the Mid Point (Center Point) in between two VELatLong coordinates.</li>
		</ul>
		</li>
		<li>VEToolkit.Math.GetPolygonCentroid
		<ul>
			<li>This method calculates the approximate Centroid (Center Point) of a Polygon.</li>
		</ul>
		</li>
		<li>VEToolkit.Math.IsInPolygon
		<ul>
			<li>This method calculates whether a given VELatLong coordinate exists
			within a given Polygon made up of an Array/collection of VELatLong
			coordinates.</li>
		</ul>
		</li>
	</ul>
	</li>
</ul>
</span>

<h3>JavaScript Intellisense

</h3>


<span>The VEToolkit also includes full Visual Studio 2008 JavaScript Intellisense Support </span>



<img src="http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=VEToolkit&amp;DownloadId=56200" alt="VEToolkit" />



  

