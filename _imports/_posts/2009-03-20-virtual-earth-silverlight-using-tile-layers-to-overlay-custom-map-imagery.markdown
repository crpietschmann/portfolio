---
layout: post
blogengineid: ce8b5456-ef99-4311-8099-16976ebcc5e2
title: "Bing Maps Silverlight CTP: Using Tile Layers to Overlay Custom Map Imagery"
date: 2009-03-20 18:47:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/03/20/Virtual-Earth-Silverlight-Using-Tile-Layers-to-Overlay-Custom-Map-Imagery
  - /post/2009/03/20/virtual-earth-silverlight-using-tile-layers-to-overlay-custom-map-imagery
  - /post.aspx?id=ce8b5456-ef99-4311-8099-16976ebcc5e2
---
<!-- more -->

One of the features that the Virtual Earth JavaScript Control has is the ability to add custom Tile Layers to overlay your own custom imagery over the map. The Virtual Earth Silverlight control also supports this feature.  
This was written for the Bing Maps Silverlight CTP Release.  
Before I begin to explain how to add custom Tile Layers to the Map it’s important to note that you can still use the <a href="http://dev.live.com/virtualearth/mapcruncher/" target="_blank">MapCruncher</a> tool to generate Map Imagery Tiles to be used with the custom Tile Layers. The specifics of using the <a href="http://dev.live.com/virtualearth/mapcruncher/" target="_blank">MapCruncher</a> tool to generate Map Imagery Tiles isn’t within the scope of this article. You can find a tutorial on how to use MapCruncher here: <a title="http://research.microsoft.com/en-us/um/redmond/projects/mapcruncher/tutorial/version3.0docs/index.htm" href="http://research.microsoft.com/en-us/um/redmond/projects/mapcruncher/tutorial/version3.0docs/index.htm">http://research.microsoft.com/en-us/um/redmond/projects/mapcruncher/tutorial/version3.0docs/index.htm</a>  <h3>Add Custom Tile Layer using Code</h3>  
<a href="/images/posts/VEJS_006_CustomTileLayer.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_006_CustomTileLayer" border="0" alt="VEJS_006_CustomTileLayer" align="right" src="/images/posts/VEJS_006_CustomTileLayer_thumb.png" width="244" height="214" /></a>Once you have some custom Map Imagery Tiles generated from using MapCruncher, you can then add them using an instance of the LocationRectTileSource object and adding it to a MapTileLayer on the Map.  
To do this we will following the below steps:  <ol>   <li>Create a MapTileLayer object </li>    <li>Create a LocationRect object that defines the bounding rectangle for our map tile overlay </li>    <li>Create a LocationRectTileSource      <ol>       <li>Point it to the Uri of our custom Map Imagery Tiles </li>        <li>Set the Minimum and Maximum Zoom Levels (ZoomRange) that the imagery is to be visible within </li>        <li>Set the Bouding Rectangle to the LocationRect object we previously created </li>     </ol>   </li>    <li>Add the LocationRectTileSource to the MapTileLayer’s TileSources collection property </li>    <li>Set the MapTileLayer’s Opacity to the desired value </li>    <li>Add the MapTileLayer to the Children collection of the Map </li> </ol>  
Here’s some sample code that will add a custom Tile Layer using the imagery that the JavaScript Map Controls SDK uses as an example for this same thing:  
// Create a Tile Layer that will display our custom Map Imagery Tiles    <br />var customTileLayer = new MapTileLayer();  
// Define the Bounding Rectangle    <br />LocationRect boundingRect = new LocationRect(     <br />&#160;&#160;&#160; new Location(49, -123),&#160; <br />&#160;&#160;&#160; new Location(47, -121)     <br />);  
// Create a LocationRectTileSource    <br />LocationRectTileSource customTileSource = new LocationRectTileSource();  
// Set the Uri for the custom Map Imagery Tiles    <br />customTileSource.UriFormat = &quot;http://dev.live.com/virtualearth/sdk/layers/lidar/{0}.png&quot;;  
// Set the Min and Max Zoom Levels that the imagery is to be visible within    <br />customTileSource.ZoomRange = new Range<double>(10, 18);  
// The bounding rectangle area that the tile overaly is valid in.    <br />customTileSource.BoundingRectangle = boundingRect;  
// Add the Tile Source to the Tile Layer    <br />customTileLayer.TileSources.Add(customTileSource);  
// Set the Tile Layer Opacity to a desired value    <br />customTileLayer.Opacity = 0.7;  
Map1.Children.Add(customTileLayer);  
&#160;  <h3>Hide Virtual Earth Imagery From Being Displayed</h3>  
Sometimes you may want to hide the Virtual Earth Imagery from being displayed altogether. To do this all you need to do is set the Map’s Mode property to a new instance of the MercatorMode object. Doing this allows you to show only your custom map imagery.  <h4>Using XAML:</h4>  
<UserControl x:Class=&quot;VirtualEarthSilverlightApplication1.Page&quot;    <br />&#160;&#160;&#160; xmlns=&quot;http://schemas.microsoft.com/winfx/2006/xaml/presentation&quot;     <br />&#160;&#160;&#160; xmlns:x=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;     <br />&#160;&#160;&#160; xmlns:m=&quot;clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl&quot;     <br />&#160;&#160;&#160; xmlns:mc=&quot;clr-namespace:Microsoft.VirtualEarth.MapControl.Core;assembly=Microsoft.VirtualEarth.MapControl&quot;     <br />&#160;&#160;&#160; Width=&quot;800&quot; Height=&quot;600&quot;>     <br />&#160;&#160;&#160; <Grid x:Name=&quot;LayoutRoot&quot; Background=&quot;White&quot;>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <m:Map Name=&quot;Map1&quot;>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <m:Map.Mode>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <mc:MercatorMode></mc:MercatorMode>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </m:Map.Mode>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; </m:Map>     <br />&#160;&#160;&#160; </Grid>     <br /></UserControl>  
&#160;  <h4>Using Code:</h4>  
Map1.Mode = new Microsoft.VirtualEarth.MapControl.Core.MercatorMode();  
&#160;  <h4>A little more intuitively</h4>  
Alternatively, you can also create your own EmptyMapMode object that inherits from the MercatorMode object. This way your code will be a little more intuitive to read.  
Here’s example of doing this:  
<UserControl x:Class=&quot;VirtualEarthSilverlightApplication1.Page&quot;    <br />&#160;&#160;&#160; xmlns=&quot;http://schemas.microsoft.com/winfx/2006/xaml/presentation&quot;     <br />&#160;&#160;&#160; xmlns:x=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;     <br />&#160;&#160;&#160; xmlns:m=&quot;clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl&quot;     <br />&#160;&#160;&#160; xmlns:local=&quot;clr-namespace:VirtualEarthSilverlightApplication1&quot;     <br />&#160;&#160;&#160; Width=&quot;800&quot; Height=&quot;600&quot;>     <br />&#160;&#160;&#160; <Grid x:Name=&quot;LayoutRoot&quot; Background=&quot;White&quot;>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; <m:Map Name=&quot;Map1&quot;>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <m:Map.Mode>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <local:EmptyMapMode></local:EmptyMapMode>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </m:Map.Mode>     <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; </m:Map>     <br />&#160;&#160;&#160; </Grid>     <br /></UserControl>  
&#160;  
As you notice above, since our custom EmptyMapMode object is contained within the “VirtualEarthSilverlightApplication1” namespace, we need to add that namespace to the XAML file in order to use it.  
And, here’s the EmptyMapMode object shown in use above:  
public class EmptyMapMode :Microsoft.VirtualEarth.MapControl.Core.MercatorMode    <br />{     <br />}  
&#160;  <h3>Conclusion</h3>  
If you are familiar with the JavaScript Map Control you can see that it’s pretty much just as simple to overly your own custom map imagery tiles on the map. One thing to note is that the LocationRectTileSource inherits from the TileSource object; so presumably you could inherit from the TileSource object yourself to create write code that pulls in map imagery from any source using your own custom TileSource object.  <h4>Next Tutorial/Article: <a href="/post.aspx?id=88a585cd-f90a-40e1-963d-ca1932ce2535">Overlay OpenStreetMap, OpenAerialMap and Yahoo Maps Imagery using Custom Tile Layers!</a></h4>  <h4>Previous Tutorial/Article: <a href="/post.aspx?id=2c25c9bc-e290-41e4-9a03-daa75a912c63">Adding Media (Images, Video, etc.) to the Map</a></h4>
