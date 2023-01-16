---
layout: post
blogengineid: 59014567-e99d-4eb6-a550-7fcbf3117651
title: "Geomap Project - HTML Extensions for Rendering Map Displays"
date: 2011-01-13 06:54:06 -0600
comments: true
published: true
categories: ["Bing Maps", "Google Maps", "GIS", "Geomap"]
tags: ["HTML", "Bing Maps"]
redirect_from: 
  - /post/2011/01/13/Geomap-Project-HTML-Extensions-for-Rendering-Map-Displays.aspx
  - /post/2011/01/13/Geomap-Project-HTML-Extensions-for-Rendering-Map-Displays
  - /post/2011/01/13/geomap-project-html-extensions-for-rendering-map-displays
  - /post.aspx?id=59014567-e99d-4eb6-a550-7fcbf3117651
---
<!-- more -->

One thing missing from HTML5 is the ability to render maps on a page. The Bing Maps and Google Maps JavaScript API’s are generally fairly simple to implement, but they could both be easier. I wrote up a small example API that allows you to add Maps, and plot data on those Maps, to an HTML page by using mostly HTML markup using a new `<geomap/>` tag.  
While this project uses JavaScript to perform the map rendering once the page loads, all you need to do to implement it is write some simple markup. This project really makes it easier than before to add Maps to your HTML pages.  

[Download `<geomap>` Here](https://github.com/crpietschmann/geomap)

## Basic Map

Once the `<geomap>` javascript (.js) files are included in the page, you can use the following markup to add a map.

```html
<geomap></geomap>
```

## Plot Some Data

Plotting data on the map is as simple as markup, just like any other HTML element.

```html
<geomap>
    <pushpin location="40 -96">pushpin>
    <polyline>
        <location latitude="40" longitude="-96">location>
        <location latitude="-40" longitude="-96">location>
    </polyline>
    <polygon>
        <location latitude="40" longitude="-76">location>
        <location latitude="-40" longitude="-76">location>
        <location latitude="0" longitude="0">location>
        <location latitude="40" longitude="-76">location>
    </polygon>
    Map not loaded. You may need to enable JavaScript within this browser.
</geomap>
```

Additionally, if JavaScript is disabled in the page, or you are unable to execute the JavaScript code that initializes the map, then the user will see the message *“Map not loaded. You may need to enable JavaScript within this browser.”* You can alternatively add any HTML content to this `<noscript>` style functionality to fall back to what ever you want when the map is unable to load.

## Supports both Bing Maps and Google Maps

What would be the use of this type of plugin / extension if it didn’t support multiple Map providers. Currently the project only includes support for Bing Maps and Google Maps, but you could write you own `<geomap>` provider script to add support for any Map provider you want.

## Conclusion

At the time of writing this, the `<geomap>` project is pretty much in a prototype stage; while you are free to use it in your own projects if you wish. Also, the project is licensed under the the LGPL license, so you can do what you wish with it as long as you abide by the license.

[Download `<geomap>` Here!](https://github.com/crpietschmann/geomap)

Happy Mapping!
