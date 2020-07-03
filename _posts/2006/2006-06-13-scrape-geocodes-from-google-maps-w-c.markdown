---
layout: post
blogengineid: fdfb2e52-5591-41d0-8fc7-4854e363b5d0
title: "Scrape Geocodes from Google Maps w/ C#"
date: 2006-06-13 09:00:00 -0500
comments: true
published: true
categories: ["GIS", "C#"]
tags: ["C#"]
redirect_from: 
  - /post/2006/06/13/Scrape-Geocodes-from-Google-Maps-w-C.aspx
  - /post/2006/06/13/Scrape-Geocodes-from-Google-Maps-w-C
  - /post/2006/06/13/scrape-geocodes-from-google-maps-w-c
  - /post.aspx?id=fdfb2e52-5591-41d0-8fc7-4854e363b5d0
---

I need to geocode some addresses once in a while and I notice if you view the source of the Google Maps page, the geocodes are right there. So instead of looking at the source of the page manually, I just created a little app that scrapes them from the page for me and places them into textboxes.

Below is a small code snippet I wrote that does just that. It's not perfect but it is simple and it just plain works.

```csharp
string lat = "";
string lng = "";
string address = "1 Microsoft Way, Redmond WA";

try
{
    System.Net.WebClient client = new System.Net.WebClient();
    string page = client.DownloadString("http://maps.google.com/maps?q=" + address);
    int begin = page.IndexOf("markers: [");
    string str = page.Substring(begin);
    int end = str.IndexOf(",image:");
    str = str.Substring(0, end);

    //Parse out Latitude
    lat = str.Substring(str.IndexOf(",lat: ") + 6);
    lat = lat.Substring(0, lat.IndexOf(",lng: "));
    //Parse out Longitude
    lng = str.Substring(str.IndexOf(",lng: ") + 6);
}
catch (Exception ex)
{
    MessageBox.Show("An Error Occured Loading Geocode!\nCheck that a valid address has been entered.", "An Error Occured Loading Geocode!");
}

MessageBox.Show("Latitude:\n" + lat + "\n\nLongitude:\n" + lng);
```

I know I should have used Regular Expressions, but I don't know them very well and this was just quicker/easier to do. It took all of like 5 minutes.
