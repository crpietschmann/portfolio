---
layout: post
blogengineid: 2c25c9bc-e290-41e4-9a03-daa75a912c63
title: "Bing Maps Silverlight CTP: Adding Media (Images, Video, etc.) to the Map"
date: 2009-03-20 18:43:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/03/20/Virtual-Earth-Silverlight-Adding-Media-(Images2c-Video2c-etc)-to-the-Map
  - /post/2009/03/20/virtual-earth-silverlight-adding-media-(images2c-video2c-etc)-to-the-map
  - /post.aspx?id=2c25c9bc-e290-41e4-9a03-daa75a912c63
---
<!-- more -->

This was written for the Bing Maps Silverlight CTP Release.  
In the previous tutorial (“<a href="/post.aspx?id=6a098f41-2df4-4362-a577-606863de838c" target="_blank">Basics of Adding Polygons and Polylines using XAML and Code</a>”) I mentioned that there is no Pushpin Shape Type in the new Virtual Earth Silverlight Map Control SDK CTP. Instead, the Silverlight control has the flexibility of plotting/displaying anything (as long as it inherits from UIElement) you want at a specific Latitude/Longitude Coordinate. This opens up a ton of UI options that can be built to allow the user to interact with the data being displayed.  
One thing to keep in mind when adding Images, Video and any other UIElements to the Map is that you’ll need to add them to a MapLayer, then add the MapLayer to the Map. This is required so that you can specify the Location to Plot the UIElement at. This is something that you’ll probably want to do anyway so you can easily control the layering of the elements that are plotted, or even easily show/hide groups of elements (by having a seperate MapLayer contain the elements for each specific group.)  
Let’s start plotting some cool stuff on a Map.  <h3>Adding Images to the Map (aka “Pushpins”)</h3>  
When adding Images to the Map, the process is very similar to adding Polygons or Polylines, except you need to add Images to a MapLayer first, then add the MapLayer to the Map.  
The closest thing with the Silverlight Map Control to the “Pushpins” of the old JavaScript control is the ability to directly plot Images on the Map.  
// Create MapLayer    
MapLayer myLayer = new MapLayer();  
// Create Image    
Image image = new Image();     
// Set the Image Source     
image.Source = new BitmapImage(new Uri(&quot;pushpinImage.png&quot;, UriKind.Relative));  
// Set Image Display Properties    
image.Opacity = 0.8;     
image.Stretch = Stretch.None;  
// Create a Location object that defines where the &quot;Shape&quot; will be plotted    
Location location = new Location() { Latitude = -10, Longitude = 10 };  
// Center the image around the location specified    
PositionMethod position = PositionMethod.Center;  
// Add Image to the Layer    
myLayer.AddChild(image, location, position);  
// Add Layer to the Map    
Map1.AddChild(myLayer);  <h3>Adding Video to the Map</h3>  
Plotting Video content on the Map is a good example of what some of the possibilities are opening up with this new Virtual Earth Silverlight Map Control. To do this all you need to do is create a MediaElement with its Source set to the Uri of a Video and add it to the Map in the same way as shown above with adding Images to the Map.  
// Create MapLayer    
MapLayer myLayer = new MapLayer();  
// Create MediaElement    
MediaElement video = new MediaElement();  
// Set the MediaElement Source to the Video    
video.Source = new Uri(&quot;http://mschnlnine.vo.llnwd.net/d1/ch9/8/9/1/1/6/4/ScottGuthrieSL3_ch9.wmv&quot;,     
&#160;&#160;&#160;&#160;&#160;&#160;&#160; UriKind.RelativeOrAbsolute);  
// Set MediaElement Display Properties    
video.Opacity = 0.8;     
video.Width = 200;     
video.Height = 150;  
// Create a Location object that defines where the &quot;Shape&quot; will be plotted    
Location location = new Location() { Latitude = -10, Longitude = 10 };  
// Center the image around the location specified    
PositionMethod position = PositionMethod.Center;  
// Add Image to the Layer    
myLayer.AddChild(video, location, position);  
// Add Layer to the Map    
Map1.AddChild(myLayer);  <h3>Conclusion</h3>  
You can add any visual control/object that derives from UIElement to the Map using the same method described above with Images and Video. This really opens up the possibilities to plot/add any kind of Rich Content to the Map. The possibilities are almost endless.  <h4>Next Tutorial/Article: <a href="/post.aspx?id=ce8b5456-ef99-4311-8099-16976ebcc5e2">Using Tile Layers to Overlay Custom Map Imagery</a>    
</h4>  <h4>Previous Tutorial/Article: <a href="/post.aspx?id=6a098f41-2df4-4362-a577-606863de838c">Basics of Adding Polygons and Polylines using XAML and Code</a></h4>
