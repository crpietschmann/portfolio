---
layout: post
blogengineid: 09e73b5d-431b-43df-b0be-4e5f44cca05c
title: "Bing Maps JS: Calculate Area of Circle and Draw Circle on Map"
date: 2010-03-02 12:24:00 -0600
comments: true
published: true
categories: ["Bing Maps", "GIS"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2010/03/02/Bing-Maps-JS-Calculate-Area-of-Circle-and-Draw-Circle-on-Map.aspx
  - /post/2010/03/02/Bing-Maps-JS-Calculate-Area-of-Circle-and-Draw-Circle-on-Map
  - /post/2010/03/02/bing-maps-js-calculate-area-of-circle-and-draw-circle-on-map
  - /post.aspx?id=09e73b5d-431b-43df-b0be-4e5f44cca05c
---
<!-- more -->

Something that can be useful at times in being able to calculate the total Area of a circle, especially when plotting it on a map. So, I decided to slightly modify my "<a href="/post/2008/02/09/Virtual-Earth-Draw-a-Circle-Radius-Around-a-LatLong-Point.aspx">Draw a Circle Radius Around Lat/Lng Point</a>" to make it also calculate the Area of the circles and display that value within the TItle of the Circle Shapes Pushpin.

Remember, back in Trig class, it's fairly simple to calculate the area of a circle. You just Multiply Pi by the Radius Squared.

```
Area = Pi * (radius * radius)
```

Anyway, I know this isn't a very advanced math problem. If fact it's much simpler than calculating out the point that make up the circle in the first place. However, I thought I'd post it since it may be usefull to someone that maybe doesn't quite remember this little trick from Trig class.

Here's the full, modified source code that contains this:

<a href="/files/2010/3/DrawRadiusCalcArea_JS_BingMaps.zip">DrawRadiusCalcArea_JS_BingMaps.zip (3.28 kb)</a>
