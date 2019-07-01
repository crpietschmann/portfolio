---
layout: post
blogengineid: 927cf266-f035-4661-9a54-c28fc34f5ec9
title: "ASP.NET 2.0: Rewriting URL Paths just got a whole lot easier"
date: 2005-06-29 14:43:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/06/29/ASPNET-20-Rewriting-URL-Paths-just-got-a-whole-lot-easier
  - /post/2005/06/29/aspnet-20-rewriting-url-paths-just-got-a-whole-lot-easier
  - /post.aspx?id=927cf266-f035-4661-9a54-c28fc34f5ec9
---
<!-- more -->


Rewriting URL paths in <a href="http://asp.net" target="_blank" title="ASP.NET">ASP.NET</a> 2.0 is referred to as URL Mapping. Instead of putting some code in your Application_BeginRequest method, you can now just put a few lines in your Web.Config file and like magic you can rewrite those URL paths with ease.



With URL Mapping you can turn a not so freindly URL like ~/Blog/Post/11/12/2005/145.aspx into ~/TheCoolestPost.aspx



Example Web.Config File:



[code:html]<br />
<?xml version=&quot;1.0&quot; ?><br />
<configuration xmlns=&quot;<a href="http://schemas.microsoft.com/.NetConfiguration/v2.0">http://schemas.microsoft.com/.NetConfiguration/v2.0</a>&quot;><br />
  <system.web>



    <urlMappings enabled=&quot;true&quot;><br />
      <add<br />
          url=&quot;~/Category.aspx&quot;<br />
          mappedUrl=&quot;~/Default.aspx?category=default&quot; /><br />
      <add<br />
          url=&quot;~/Autos.aspx&quot;<br />
          mappedUrl=&quot;~/Default.aspx?category=autos&quot; /><br />
      <add<br />
          url=&quot;~/Games.aspx&quot;<br />
          mappedUrl=&quot;~/Default.aspx?category=games&quot; /><br />
      <add<br />
          url=&quot;~/Health.aspx&quot;<br />
          mappedUrl=&quot;~/Default.aspx?category=health&quot; /><br />
      <add<br />
          url=&quot;~/News.aspx&quot;<br />
          mappedUrl=&quot;~/Default.aspx?category=news&quot; /><br />
    </urlMappings>



  </system.web><br />
</configuration><br />
```



Since the Web.Config file is an XML document, you could add functionality to the admin section of your app to add/edit/delete custom URL Mappings. This is definately something I&#39;m going to keep in mind for future ASP.NET 2.0 app I design/build.



kudos to the ASP.NET team. This is just one of the many new features added to ASP.NET 2.0. And they couldn&#39;t have made it any easier to use!



URL Mapping in ASP.NET 2.0: <a href="http://beta.asp.net/QUICKSTART/aspnet/doc/navigation/urlmapping.aspx">http://beta.asp.net/QUICKSTART/aspnet/doc/navigation/urlmapping.aspx</a>



If you want to see how to rewrite url paths with ASP.NET 1.x go here: <a href="http://edsid.com/blog/articles/160.aspx">http://edsid.com/blog/articles/160.aspx</a>

