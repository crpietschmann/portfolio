---
layout: post
blogengineid: 0ac24a38-25bc-43d8-9ba8-421dbbebfaa1
title: "Display Google Maps Imagery using Bing Maps Silverlight Control"
date: 2010-06-14 23:15:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2010/06/14/Display_Google_Maps_Imagery_using_Bing_Maps_Silverlight_Control.aspx
  - /post/2010/06/14/Display_Google_Maps_Imagery_using_Bing_Maps_Silverlight_Control
  - /post/2010/06/14/display_google_maps_imagery_using_bing_maps_silverlight_control
  - /post.aspx?id=0ac24a38-25bc-43d8-9ba8-421dbbebfaa1
---
<!-- more -->

I&rsquo;ve gotten a couple emails asking how to show Google Maps imagery using the Bing Maps Silverlight Control. I previously post how to display <a href="/post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW.aspx">OpenStreetMaps</a> and <a href="/post/2009/03/20/Virtual-Earth-Silverlight-Overlay-OpenStreetMap2c-OpenAerialMap-and-Yahoo-Map-Imagery-using-Custom-Tile-Layers!.aspx">Yahoo maps</a> imagery using the control, but is it possible to show Google Maps imagery too?? Yes, absolutely; well technically, but the Google Maps Terms of Use does prohibit it. Actually, the Google Maps Terms of Use prohibits the direct access of the map tile images, and does not specifically prohibit using them with the Bing Maps Silverlight Control.

<a href="/files/SLBingMapsControl_GoogleMapsImagery.png"><img style="border-bottom: 0px; border-left: 0px; display: inline; border-top: 0px; border-right: 0px" title="SLBingMapsControl_GoogleMapsImagery" src="/files/SLBingMapsControl_GoogleMapsImagery_thumb.png" border="0" alt="SLBingMapsControl_GoogleMapsImagery" width="644" height="243" /></a>

You may only continue reading if you are willing to break the Google Maps Terms of Use, and see how similar the two mapping platforms really are.

Remember the below code most likely violates the Google Maps Terms of Use, and probably shouldn&rsquo;t be used in a production system; unless of course you really don&rsquo;t mind breaking the terms of use.

The below code follows suite after the code I posted a while back on displaying <a href="/post/2009/11/12/Display_OpenStreetMap_Imagery_using_Bing_Maps_Silverlight_Control_Version_1_RTW">OpenStreetMap</a> and <a href="/post/2009/03/20/Virtual-Earth-Silverlight-Overlay-OpenStreetMap2c-OpenAerialMap-and-Yahoo-Map-Imagery-using-Custom-Tile-Layers!">Yahoo Maps</a> imagery within the Bing Maps Silverlight Control.

First, here&rsquo;s some XAML usage samples using the Google Maps TIle Source classes listed further down. The first one is showing the Google Maps Road/Terrain imagery, the second shows the Google Maps Aerial/Satellite imagery:

```xaml
<m:Map CopyrightVisibility="Collapsed" LogoVisibility="Collapsed">
    <m:Map.Mode>
        
        <mCore:MercatorMode></mCore:MercatorMode>
    </m:Map.Mode>
    <m:Map.Children>
        <m:MapTileLayer>
            <m:MapTileLayer.TileSources>
                <local:GoogleMapsRoadTileSource></local:GoogleMapsRoadTileSource>
            </m:MapTileLayer.TileSources>
        </m:MapTileLayer>
    </m:Map.Children>
</m:Map>

<m:Map CopyrightVisibility="Collapsed" LogoVisibility="Collapsed">
    <m:Map.Mode>
        
        <mCore:MercatorMode></mCore:MercatorMode>
    </m:Map.Mode>
    <m:Map.Children>
        <m:MapTileLayer>
            <m:MapTileLayer.TileSources>
                <local:GoogleMapsAerialTileSource></local:GoogleMapsAerialTileSource>
                <local:GoogleMapsLabelsTileSource></local:GoogleMapsLabelsTileSource>
            </m:MapTileLayer.TileSources>
        </m:MapTileLayer>
    </m:Map.Children>
</m:Map>
```

If you notice, the second example showing the usage of the Google Maps Aerial/Satellite imagery is displaying 2 tile sources. This is because Google Maps has separate tile sources for both the Aerial/Satellite imagery and the Labels. This example shows the Labels tile source over the top of the Aerial/Satellite tile source to give the desired effect of &ldquo;Aerial with Labels.&rdquo;

Now, here&rsquo;s the main attraction of this article; the actual Google Maps TileSource objects referred to above:

```csharp
public class GoogleMapsRoadTileSource : GoogleMapsTileSourceBase
{
    public GoogleMapsRoadTileSource()
        : base("http://mt{0}.google.com/vt/lyrs=m@128&hl=en&x={1}&y={2}&z={3}&s=")
    { }
}

public class GoogleMapsAerialTileSource : GoogleMapsTileSourceBase
{
    public GoogleMapsAerialTileSource()
        : base("http://khm{0}.google.com/kh/v=62&x={1}&y={2}&z={3}&s=")
    { }
}

public class GoogleMapsLabelsTileSource : GoogleMapsTileSourceBase
{
    public GoogleMapsLabelsTileSource()
        : base("http://mt{0}.google.com/vt/lyrs=h@128&hl=en&x={1}&y={2}&z={3}&s=")
    { }
}

public abstract class GoogleMapsTileSourceBase : Microsoft.Maps.MapControl.TileSource
{
    public GoogleMapsTileSourceBase(string uriFormat)
        : base(uriFormat)
    { }

    public override System.Uri GetUri(int x, int y, int zoomLevel)
    {
        return new Uri(string.Format(this.UriFormat, new Random().Next() % 4, x, y, zoomLevel));
    }
}
``` 

> **Disclaimer:** Use the above posted code at your own risk. The usage of it may be in violation of the Google Maps Terms of Use.
