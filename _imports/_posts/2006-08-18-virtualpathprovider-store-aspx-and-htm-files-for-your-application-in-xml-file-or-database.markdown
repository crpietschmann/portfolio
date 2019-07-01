---
layout: post
title: "VirtualPathProvider: Store .ASPX and .HTM files for your application in xml file or database"
date: 2006-08-18 22:28:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2006/08/18/VirtualPathProvider-Store-ASPX-and-HTM-files-for-your-application-in-xml-file-or-database
 -  /post/2006/08/18/virtualpathprovider-store-aspx-and-htm-files-for-your-application-in-xml-file-or-database
---
<!-- more -->
<p>With the <a href="http://msdn2.microsoft.com/en-us/library/system.web.hosting.virtualpathprovider.aspx">VirtualPathProvider</a> you can server pages from your website without the files actually existing on the disk. And this doesn't use url rewriting. The VirtualPathProvider actually allows you create your own virtual file system within your application. You can store the pages of you site within an xml file, a database or any other method you would like. In my opinion this is one of the coolest new features in ASP.NET 2.0.</p>
<p>The virtual file system you create can store virtually any file that you would normally have on disk. These include:</p>
<ul>
<li>ASP.NET pages, master pages, user controls, and other objects. </li>
<li>Standard Web pages with extensions such as .htm and .jpg </li>
<li>Any custom extension mapped to a <a href="http://msdn2.microsoft.com/en-us/library/system.web.compilation.buildprovider.aspx">BuildProvider</a> instance. </li>
<li>Any named theme in the App_Theme folder.</li>
</ul>
<p>ASP.NET application folders or files that generate application-level assemblies cannot be stored in your new virtual file system. These include:</p>
<ul>
<li>The Global.asax file. </li>
<li>Web.config files. </li>
<li>Site map data files used by the <a href="http://msdn2.microsoft.com/en-us/library/system.web.xmlsitemapprovider.aspx">XmlSiteMapProvider</a>. </li>
<li>Directories that contain application assemblies or that generate application assemblies: Bin, App_Code, App_GlobalResources, any App_LocalResources. </li>
<li>The App_Data folder</li>
</ul>
<p>Here is a zip file containing an example website that shows how to store static .htm files within an XML file. This example was derived from the code shown in the MSDN library.</p>
<p>Download Example: <a href="/download/blog/1323/VirtualPathProvider.zip">VirualPathProvider - Store static .htm pages in an XML file</a></p>
