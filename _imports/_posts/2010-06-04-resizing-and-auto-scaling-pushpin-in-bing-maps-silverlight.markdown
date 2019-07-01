---
layout: post
blogengineid: f5cc395e-a712-4884-ab24-3e556e6da666
title: "Resizing and Auto-Scaling Pushpin in Bing Maps Silverlight"
date: 2010-06-04 00:26:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2010/06/04/Resizing-and-Auto-Scaling-Pushpin-in-Bing-Maps-Silverlight
  - /post/2010/06/04/resizing-and-auto-scaling-pushpin-in-bing-maps-silverlight
  - /post.aspx?id=f5cc395e-a712-4884-ab24-3e556e6da666
---
<!-- more -->

Plotting pushpins on the Bing Maps Silverlight control is really simple when using the Pushpin control that comes with the control. But, what if you want to change the size of the Pushpin? It doesn't work to just change the Pushpin.Height and Pushpin.Width properties. This is actually because those properties pertain to the controls Content property. So, how exactly do you go about changing the size of the Pushpin if the Height and Width properties don't work?
<h3>Use ScaleTransform to Resize Pushpins
</h3>

<img style="float: right;" src="/files/2010/6/SLBingMapsPushpinResizeScaleTransform.png" alt="" />

The answer is simple. All you need to do is use a <a rel="nofollow external" href="http://msdn.microsoft.com/en-us/library/system.windows.media.scaletransform%28VS.95%29.aspx">ScaleTransform</a>. Below is a couple examples, one making the pushpin smaller and the other bigger.

*<m:Pushpin Location="0,-15">
    <m:Pushpin.RenderTransform>
        <ScaleTransform ScaleX=".5" ScaleY=".5" CenterX="17" CenterY="35"></ScaleTransform>
    </m:Pushpin.RenderTransform>
</m:Pushpin>
<m:Pushpin Location="0,15">
    <m:Pushpin.RenderTransform>
        <ScaleTransform ScaleX="2" ScaleY="2" CenterX="17" CenterY="35"></ScaleTransform>
    </m:Pushpin.RenderTransform>
</m:Pushpin>*

You may have noticed that not only does the above example set the ScaleX and ScaleY properties of the ScaleTransform, but the CenterX and CenterY are also set. This is because if we don't set the CenterX and CenterY appropriately the Pushpin will get "moved" from its correct location when the Transform is performed.

How did I decide to set CenterX to 17 and CenterY to 35? Well, the Pushpins "default" size sets the Width equal to 34 and Height to 35, and the PositionOrigin to BottomCenter. Since the PositionOrigin is set to BottomCenter, in order to get the pushpin to stay in its correct position on the map we need to set the CenterX to half the Width or 17, and CenterY to the Height or 35.

The image to the right shows an example of this in action.
<h3>Auto Scale Pushpin with Map Zoom Level</h3>

<img style="float: right;" src="/files/2010/6/SLBingMapsPushpinAutoScaleToZoomLevel.png" alt="" />

A neat feature that becomes available with the Bing Maps Silverlight control once you start using ScaleTransforms to modify the size of Pushpins is the ability to change the size of the Pushpins when the Map Zoom Level is changed. All it takes is a little help from a custom <a href="http://msdn.microsoft.com/en-us/library/system.windows.data.ivalueconverter%28VS.95%29.aspx">IValueConverter</a> and a little Data Binding.

The image to the right shows this in action. Both sides of the image were not resized at all, the difference in size of the Pushpins is due to the usage of the following code.

First, we'll add some Pushpins to a Map and set the Pushpins RenderTransform property binding to bind it to the Map's ZoomLevel property and set it to use a custom converter.

*<m:Map Height="200" x:Name="myMap">
    <m:Map.Children>
        <m:Pushpin Location="0,-15"
            RenderTransform="{Binding ZoomLevel, ElementName=myMap, Converter={StaticResource PushpinScaleTransform}}"></m:Pushpin>
        <m:Pushpin Location="0,15"
            RenderTransform="{Binding ZoomLevel, ElementName=myMap, Converter={StaticResource PushpinScaleTransform}}"></m:Pushpin>
    </m:Map.Children>
</m:Map>*

Next, make sure you declare the PushpinScaleTransform static resource in the UserControl, Page or App. Also, don't forget to include the namespace, in the below example I named it "local".

*<UserControl.Resources>
    <local:PushpinScaleTransform x:Key="PushpinScaleTransform"></local:PushpinScaleTransform>
*

*</UserControl.Resources>*

Finally, add the PushpinScaleTransform custom IValueConverter object to the project. This custom IValueCoverter will recieve the ZoomLevel and "convert" it to a ScaleTransform with ScaleX, ScaleY and CenterX, CenterY properties set appropriately to Auto Scale the Pushpin with the Map ZoomLevel. Below is an example of this that I found works quite well.

*using System;
using System.Windows.Data;
using System.Windows.Media;*

*namespace SLBingMapsScalePushpins
{
    public class PushpinScaleTransform : IValueConverter
    {
        #region IValueConverter Members

        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            double currentZoomLevel = (double)value;

            // Calculate the scale to use. This is just a simple algorithm that
            // I found works nicely.
            var scaleVal = (0.05 * (currentZoomLevel + 1)) + 0.3;

            var transform = new ScaleTransform();
            transform.ScaleX = scaleVal;
            transform.ScaleY = scaleVal;

            // Set the transform center X and Y so the Pushpin stays at the correct location.
            // The Default Pushpin's height is 35 and width is 34
            // Since the Default Pushpin's PositionOrigin is set to BottomCenter, we need to
            // set the CenterX to half the width (17), and CenterY to the height (35).
            transform.CenterX = 17;
            transform.CenterY = 35;

            return transform;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}*
<h3>Download Code</h3>

Here's a link to download a small Silverlight project that implements the above code examples.

<a href="/files/2010/6/SLBingMapsScalePushpins.zip">SLBingMapsScalePushpins.zip (446.52 kb)</a>
