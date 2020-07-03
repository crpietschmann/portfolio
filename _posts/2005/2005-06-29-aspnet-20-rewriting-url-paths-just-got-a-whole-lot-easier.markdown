---
layout: post
blogengineid: 927cf266-f035-4661-9a54-c28fc34f5ec9
title: "ASP.NET 2.0: Rewriting URL Paths just got a whole lot easier"
date: 2005-06-29 14:43:00 -0500
comments: true
published: true
categories: ["ASP.NET"]
tags: ["General"]
redirect_from: 
  - /post/2005/06/29/ASPNET-20-Rewriting-URL-Paths-just-got-a-whole-lot-easier.aspx
  - /post/2005/06/29/ASPNET-20-Rewriting-URL-Paths-just-got-a-whole-lot-easier
  - /post/2005/06/29/aspnet-20-rewriting-url-paths-just-got-a-whole-lot-easier
  - /post.aspx?id=927cf266-f035-4661-9a54-c28fc34f5ec9
---

Rewriting URL paths in <a href="http://asp.net" target="_blank" title="ASP.NET">ASP.NET</a> 2.0 is referred to as URL Mapping. Instead of putting some code in your Application_BeginRequest method, you can now just put a few lines in your Web.Config file and like magic you can rewrite those URL paths with ease.

With URL Mapping you can turn a not so friendly URL like `~/Blog/Post/11/12/2005/145.aspx` into `~/TheCoolestPost.aspx`

Example Web.Config File:

```xml
<?xml version="1.0" ?>
<configuration xmlns="http://schemas.microsoft.com/.NetConfiguration/v2.0">
  <system.web>


    <urlMappings enabled="true">
      <add
          url="~/Category.aspx"
          mappedUrl="~/Default.aspx?category=default" />
      <add
          url="~/Autos.aspx"
          mappedUrl="~/Default.aspx?category=autos" />
      <add
          url="~/Games.aspx"
          mappedUrl="~/Default.aspx?category=games" />
      <add
          url="~/Health.aspx"
          mappedUrl="~/Default.aspx?category=health" />
      <add
          url="~/News.aspx"
          mappedUrl="~/Default.aspx?category=news" />
    </urlMappings>


  </system.web>
</configuration>
```

Since the Web.Config file is an XML document, you could add functionality to the admin section of your app to add/edit/delete custom URL Mappings. This is definitely something I&#39;m going to keep in mind for future ASP.NET 2.0 app I design/build.

kudos to the ASP.NET team. This is just one of the many new features added to ASP.NET 2.0. And they couldn't have made it any easier to use!

URL Mapping in ASP.NET 2.0: <a href="http://beta.asp.net/QUICKSTART/aspnet/doc/navigation/urlmapping.aspx">http://beta.asp.net/QUICKSTART/aspnet/doc/navigation/urlmapping.aspx</a>

If you want to see how to rewrite url paths with ASP.NET 1.x go here: <a href="http://edsid.com/blog/articles/160.aspx">http://edsid.com/blog/articles/160.aspx</a>
