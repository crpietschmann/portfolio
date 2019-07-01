---
layout: post
blogengineid: 6a098f41-2df4-4362-a577-606863de838c
title: "CTP: Bing Maps Silverlight CTP: Basics of Adding Polygons and Polylines using XAML and Code"
date: 2009-03-20 18:40:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/03/20/Virtual-Earth-Silverlight-Basics-of-Adding-Polygons-and-Polylines-using-XAML-and-Code
  - /post/2009/03/20/virtual-earth-silverlight-basics-of-adding-polygons-and-polylines-using-xaml-and-code
  - /post.aspx?id=6a098f41-2df4-4362-a577-606863de838c
---
<!-- more -->

This was written for the Bing Maps Silverlight CTP Release.

Now that we&rsquo;re familiar with the basics of the Virtual Earth Silverlight Map Control SDK CTP (from my <a href="/post.aspx?id=20736f64-9876-4d0f-b60e-3fe20252d4c4" target="_blank">Getting Started with Virtual Earth Silverlight CTP</a> tutorial), we&rsquo;re ready to move on to adding Shapes (Polygons and Polylines). After all what use is a Virtual Earth Map Control without plotting some data on it. If you&rsquo;re not familiar with how to get a Map displayed within a Silverlight Application, I really encourage you to go take a look at my &ldquo;Getting Started with Virtual Earth Silverlight Map Control SDK CTP&rdquo; tutorial.

Did you notice that I left out Pushpins? Well, this is actually because the Map control doesn&rsquo;t have a Pushpin Shape Type; the only Shapes Types are Polygon and Polyline. The reason for this is because instead of limiting you to just Pushpins (a small icon of some sort) like the JavaScript Map Control; the Silverlight Control allows you to plot/display anything (as long as it inherits from UIElement) you want at a specific Latitude/Longitude Coordinate. Since, &ldquo;Pushpins&rdquo; are a newly changed concept with the Silverlight Map Control; I&rsquo;ll be covering that is a separate tutorial that covers &ldquo;Adding Media (Images, Video, etc.) to the Map&rdquo;.

Now let&rsquo;s get to plotting some Polygons and Polylines!
<h3>Adding Polygons to the Map</h3>

To add a Polygon to the Map, you will need to create an instance of the MapPolygon object and add a collection of Location objects to its &ldquo;Locations&rdquo; property. You will also need to define the look of your Polygon by setting its &ldquo;Fill&rdquo;, &ldquo;Stroke&rdquo;, &ldquo;StrokeThickness&rdquo; and &ldquo;Opacity&rdquo; properties.

The MapPolygon properties and what they do:
<ul>
<li>**Fill** &ndash; A Brush object that defines how the inside of the Polygon is filled in. </li>
<li>**Stroke** &ndash; A Brush object that defines how the border that outlines the Polygon will be drawn. </li>
<li>**StrokeThickness** &ndash; A Double value that defines the thickness of the border that outlines the Polygon. </li>
<li>**Opacity** &ndash; A Double value that defines the Opacity (or Transparency) of the Polygon. </li>
</ul>

When adding Polygons to the Map you add your MapPolygon object instance to the Map.Children collection.
<h4>Add a Polygon Programmatically using Code</h4>

Here&rsquo;s an example of adding a Polygon to a Map programmatically:

MapPolygon polygon = new MapPolygon();    
polygon.Fill = new SolidColorBrush(Colors.Red);     
polygon.Stroke = new SolidColorBrush(Colors.Yellow);     
polygon.StrokeThickness = 5;     
polygon.Opacity = 0.7;     
polygon.Locations = new LocationCollection()     
{     
    new Location(20, -20),     
    new Location(20, 20),     
    new Location(-20, 20),     
    new Location(-20, -20)     
};

Map1.AddChild(polygon);    
// Map1.Children.Add(polygon); // <&mdash;This also works just the same

 
<h4>Add a Polygon Declaratively using XAML</h4>

One other neat thing that you can do is add Polygons to a Map declaratively using XAML. Here&rsquo;s an example:

<UserControl x:Class="VirtualEarthSilverlightApplication1.Page"    
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"     
    xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"     
    Width="400" Height="300">     
    <Grid x:Name="LayoutRoot" Background="White">     
        <m:Map Name="Map1">     
            <m:Map.Children>     
                <m:MapPolygon Fill="Red" Stroke="Yellow" StrokeThickness="5" Opacity="0.7">     
                    <m:MapPolygon.Locations>     
                        <m:LocationCollection>     
                            <m:Location>20, -20</m:Location>     
                            <m:Location>20, 20</m:Location>     
                            <m:Location>-20, 20</m:Location>     
                            <m:Location>-20, -20</m:Location>     
                        </m:LocationCollection>     
                    </m:MapPolygon.Locations>     
                </m:MapPolygon>     
            </m:Map.Children>     
        </m:Map>     
    </Grid>     
</UserControl>

 
<h3>Adding Polylines to the Map</h3>

To add a Polyline to the Map, you will need to create an instance of the MapPolyline object and add a collection of Location objects to its &ldquo;Locations&rdquo; property. You will also need to define the look of your Polyline by setting its &ldquo;Stroke&rdquo;, &ldquo;StrokeThickness&rdquo; and &ldquo;Opacity&rdquo; properties.

The MapPolyline properties and what they do:
<ul>
<li>**Stroke** &ndash; A Brush object that defines how the Line that represents the Polyline will be drawn on the Map. </li>
<li>**StrokeThickness** &ndash; A Double value that defines the thickness of the Line. </li>
<li>**Opacity** &ndash; A Double value that defines the Opacity (or Transparency) of the Polyline. </li>
</ul>

Additionally, the MapPolyline object has one more property that I didn&rsquo;t mention above. This is a little bit of a special property, that you may wonder why a Polyline object has it, but it opens up some possibilities that weren&rsquo;t available before using the JavaScript Map Control.
<ul>
<li>**Fill** - A Brush object that defines how the inside of the Polyline is filled in. This will connect the first and last Location point of the Polyline and Fill in between using the designated Brush. This doesn&rsquo;t draw a Line (or Stroke) from the first Location to the last, it just fills in between the Shape. </li>
</ul>

When adding Polylines to the Map you add your MapPolyline object instance to the Map.Children collection; just the same as is done with Polygons.
<h4>Add a Polyline Programmatically using Code</h4>

Here&rsquo;s an example of adding a Polyline to a Map programmatically:

MapPolyline polyline = new MapPolyline();    
polyline.Stroke = new SolidColorBrush(Colors.Yellow);     
polyline.StrokeThickness = 5;     
polyline.Opacity = 0.7;     
polyline.Locations = new LocationCollection()     
{     
    new Location(10, -10),     
    new Location(10, 10),     
    new Location(-10, -10),     
    new Location(-10, 10)     
};

Map1.AddChild(polyline);    
// Map1.Children.Add(polyline); // <&mdash;This also works just the same

 
<h4>Add a Polyline Declaratively using XAML</h4>

One other neat thing that you can do is add Polylines to a Map declaratively using XAML. Here&rsquo;s an example:

<UserControl x:Class="VirtualEarthSilverlightApplication1.Page"    
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"     
    xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"     
    Width="400" Height="300">     
    <Grid x:Name="LayoutRoot" Background="White">     
        <m:Map Name="Map1">     
            <m:Map.Children>     
                <m:MapPolyline Stroke="Yellow" StrokeThickness="5" Opacity="0.7">     
                    <m:MapPolyline.Locations>     
                        <m:LocationCollection>     
                            <m:Location>10, -10</m:Location>     
                            <m:Location>10, 10</m:Location>     
                            <m:Location>-10, -10</m:Location>     
                            <m:Location>-10, 10</m:Location>     
                        </m:LocationCollection>     
                    </m:MapPolyline.Locations>     
                </m:MapPolyline>     
            </m:Map.Children>     
        </m:Map>     
    </Grid>     
</UserControl>

 
<h3>Adding Shape Layers</h3>

In the old JavaScript Map Control, you could add your Shapes to different Shape Layers, then you could easily hide/show the Shapes in each Layer by hiding/showing the entire Shape Layer. This is also possible using the Virtual Earth Silverlight Map Control via the MapLayer object.

To use the MapLayer object you simply create a new MapLayer, add your Shapes (Polygons or Polylines) to it, then add the MapLayer to the Map.

Here&rsquo;s an example of doing this:

// Create MapLayer    
MapLayer myShapeLayer = new MapLayer();

// Create Polygon    
MapPolygon polygon = new MapPolygon();     
polygon.Fill = new SolidColorBrush(Colors.Red);     
polygon.Stroke = new SolidColorBrush(Colors.Yellow);     
polygon.StrokeThickness = 5;     
polygon.Opacity = 0.7;     
polygon.Locations = new LocationCollection()     
{     
    new Location(20, -20),     
    new Location(20, 20),     
    new Location(-20, 20),     
    new Location(-20, -20)     
};

// Add Polygon to the Layer    
myShapeLayer.AddChild(polygon);

// Add the Layer to the Map    
Map1.AddChild(myShapeLayer);

 
<h3>Easily Add a &ldquo;Hover Over&rdquo; Effect Via Tooltips</h3>

If you want to quickly and easily add some content that gets displayed when the user hovers the mouse over the Polygon or Polyline; you can implement it very easily by taking advantage of Silverlights Tooltip feature.

<a href="/files/VEJS_PolygonShapeTooltip.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_PolygonShapeTooltip" src="/files/VEJS_PolygonShapeTooltip_thumb.png" border="0" alt="VEJS_PolygonShapeTooltip" width="489" height="304" /></a>

Here are some code examples of doing this that add to the above Polygon examples (the exact same can be done with Polylines).
<h4>Add Tooltip Declaratively using XAML</h4>

<UserControl x:Class="VirtualEarthSilverlightApplication1.Page"    
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"     
    xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"     
    Width="400" Height="300">     
    <Grid x:Name="LayoutRoot" Background="White">     
        <m:Map Name="Map1">     
            <m:Map.Children>     
                <m:MapPolygon Fill="Red" Stroke="Yellow" StrokeThickness="5" Opacity="0.7">     
                    <ToolTipService.ToolTip>     
                        <StackPanel>     
                            <TextBlock FontWeight="Bold">A Huge Square Title</TextBlock>     
                            <TextBlock>This is an arbitrary description of the "Huge Square" to be displayed within the Tooltip.</TextBlock>     
                        </StackPanel>     
                    </ToolTipService.ToolTip>     
                    <m:MapPolygon.Locations>     
                        <m:LocationCollection>     
                            <m:Location>20, -20</m:Location>     
                            <m:Location>20, 20</m:Location>     
                            <m:Location>-20, 20</m:Location>     
                            <m:Location>-20, -20</m:Location>     
                        </m:LocationCollection>     
                    </m:MapPolygon.Locations>     
                </m:MapPolygon>     
            </m:Map.Children>     
        </m:Map>     
    </Grid>     
</UserControl>

 
<h4>Add Tooltip Programmatically using Code</h4>

// Declare Polygon    
MapPolygon polygon = new MapPolygon();     
polygon.Fill = new SolidColorBrush(Colors.Red);     
polygon.Stroke = new SolidColorBrush(Colors.Yellow);     
polygon.StrokeThickness = 5;     
polygon.Opacity = 0.7;     
polygon.Locations = new LocationCollection()     
{     
    new Location(20, -20),     
    new Location(20, 20),     
    new Location(-20, 20),     
    new Location(-20, -20)     
};

// Add Tooltip    
var tooltipObject = new StackPanel();

var title = new TextBlock();    
title.FontWeight = FontWeights.Bold;     
title.Text = "A Huge Square Title";     
tooltipObject.Children.Add(title);

var description = new TextBlock();    
description.Text = "This is an arbitrary description of the \"Huge Square\" to be displayed within the Tooltip.";     
tooltipObject.Children.Add(description);

ToolTipService.SetToolTip(polygon, tooltipObject);

// Add Polygon to Map    
Map1.AddChild(polygon);     
// Map1.Children.Add(polygon); // <&mdash;This also works just the same

 
<h3>Conclusion</h3>

As you can see, it&rsquo;s fairly simple to add Polygons and Polylines to the Map. In the next tutorial I&rsquo;ll cover how to add Image (also &ldquo;Pushpins&rdquo;) and Video to the Map.
<h4>Next Tutorial/Article: <a href="/post.aspx?id=2c25c9bc-e290-41e4-9a03-daa75a912c63">Adding Media (Images, Video, etc.) to the Map</a></h4>
<h4>Previous Tutorial/Article: <a href="/post.aspx?id=20736f64-9876-4d0f-b60e-3fe20252d4c4">Getting Started with Virtual Earth Silverlight Map Control SDK CTP</a></h4>
