---
layout: post
blogengineid: b3812d3c-cb64-4947-b6df-4ebb8e3a2e43
title: "Display OpenStreetMap Imagery using Bing Maps Silverlight Control v1"
date: 2009-11-12 09:02:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW.aspx
  - /post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW
  - /post/2009/11/12/display_openstreetmap_imagery_using_bing_maps_silverlight_control_version_1_rtw
  - /post.aspx?id=b3812d3c-cb64-4947-b6df-4ebb8e3a2e43
---
<!-- more -->

<a href="/files/BingMapsSilverlight_OpenStreetMap.png"><img style="border-bottom: 0px; border-left: 0px; display: inline; margin-left: 0px; border-top: 0px; margin-right: 0px; border-right: 0px" title="BingMapsSilverlight_OpenStreetMap" src="/files/BingMapsSilverlight_OpenStreetMap_thumb.png" border="0" alt="BingMapsSilverlight_OpenStreetMap" width="244" height="158" align="right" /></a> The Bing Maps Silverlight SDK documentation on MSDN contains an article on <a href="http://msdn.microsoft.com/en-us/library/ee681902.aspx" target="_blank">Adding Tile Overlays to the Map</a>, that demonstrates how to overlay your own map imagery over top of the Bing Maps Imagery. However, what if you want to completely replace the Bing Maps Imagery with some other Imagery like the <a href="http://openstreetmap.org" target="_blank">OpenStreeMap</a> Imagery?

In the &ldquo;Adding Tile Overlays to the Map&rdquo; article it shows using a &ldquo;LocationRectTileSource&rdquo; to add the custom map imagery overlay. To implement the OpenStreetMap imagery you will need to create a simple class that inherits from &ldquo;TileSource&rdquo; since you wont be restricting the imagery to only a small portion of the map, but instead will be showing all the OpenStreetMap Imagery in place of the Bing Maps Imagery.

## First, Hide the Bing Maps Imagery

Since we will be displaying the OpenStreetMap imagery instead of the Bing Maps Imagery, we want to prevent the Map control from loading/displaying the Bing Maps Imagery completely.

To do this, all you need to do is set the Maps Mode to an instance of the &ldquo;MercatorMode&rdquo; object:

```xaml
<UserControl x:Class="BingMapsSilverlightApplication1.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
    xmlns:mCore="clr-namespace:Microsoft.Maps.MapControl.Core;assembly=Microsoft.Maps.MapControl">
    <Grid x:Name="LayoutRoot">
        <m:Map>
            <m:Map.Mode>
                
                <mCore:MercatorMode></mCore:MercatorMode>
            </m:Map.Mode>
        </m:Map>
    </Grid>
</UserControl>
```
 
## Display OpenStreetMap Imagery

Next, we will create a simple &ldquo;OpenStreetMapTileSource&rdquo; class that inherits from &ldquo;TileSource&rdquo; that will be used to specify the location (URI) of the OpenStreetMap Imagery so the Map control can load and display it.

Here&rsquo;s the simple OpenStreetMapTileSource class:

```csharp
public class OpenStreetMapTileSource : Microsoft.Maps.MapControl.TileSource
{
    public OpenStreetMapTileSource()
        : base("http://tile.openstreetmap.org/{2}/{0}/{1}.png")
    {
    }

    public override System.Uri GetUri(int x, int y, int zoomLevel)
    {
        return new Uri(string.Format(this.UriFormat, x, y, zoomLevel));
    }
}
```

Now to put the OpenStreetMapTIleSource in place and actually display the OpenStreetMap Imagery. To do this, we will add a new MapTileLayer to the Maps Children collection, and add an instance of our OpenStreetMapTileSource object to the MapTileLayer objects TileSources collection.

Here&rsquo;s the code to do this:

```xaml
<UserControl x:Class="BingMapsSilverlightApplication1.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
    xmlns:mCore="clr-namespace:Microsoft.Maps.MapControl.Core;assembly=Microsoft.Maps.MapControl"
    xmlns:local="clr-namespace:BingMapsSilverlightApplication1">
    <Grid x:Name="LayoutRoot">
        <m:Map>
            <m:Map.Mode>
                
                <mCore:MercatorMode></mCore:MercatorMode>
            </m:Map.Mode>
            <m:Map.Children>
                <m:MapTileLayer>
                    <m:MapTileLayer.TileSources>
                        
                        <local:OpenStreetMapTileSource></local:OpenStreetMapTileSource>
                    </m:MapTileLayer.TileSources>
                </m:MapTileLayer>
            </m:Map.Children>
        </m:Map>
    </Grid>
</UserControl>
```
 
## Conclusion

It&rsquo;s really pretty simple to display your own custom map tile image sets and even completely replace the Bing Maps Imagery with the new control. If your interested in seeing how to display Yahoo Maps imagery within the control, then you&rsquo;ll want to refer to my <a href="/post/2009/11/12/getting_started_bing_maps_silverlight_control_version_1_rtw" target="_blank">previous article</a> on doing this with the CTP version of the Bing Maps Silverlight Control.
