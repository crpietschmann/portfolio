---
layout: post
blogengineid: 00665f57-858a-442b-baea-20422987ff30
title: "Use ASP.NET Web Parts and Membership stuff with SQL Server 2000"
date: 2005-09-18 12:11:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2005/09/18/Use-ASPNET-20-Web-Parts-and-Membership-stuff-with-SQL-Server-2000
  - /post/2005/09/18/use-aspnet-20-web-parts-and-membership-stuff-with-sql-server-2000
  - /post.aspx?id=00665f57-858a-442b-baea-20422987ff30
---
<!-- more -->

By default <a title="ASP.NET" href="http://asp.net" target="_blank">ASP.NET</a> 2.0 Web Parts uses SQL Express. To use this stuff with SQL Server 2000 you must configure the aspnetdb database on your SQL Server 2000 database server. Fortunately for us, <a title="Microsoft" href="http://Microsoft.com" target="_blank">Microsoft</a> has created a utility to automate the process.

Follow these steps to setup the aspnetdb database:

1) run the utility - C:\WINDOWS\Microsoft.NET\Framework\v2.0.50215\aspnet_regsql.exe <span style="font-size: x-small;">*(this was written with ASP.NET 2.0 Beta 2 (v2.0.50215) as a reference, so with the final release of <a title=".NET" href="http://www.microsoft.com/net/" target="_blank">.NET</a> 2.0 the version number will be different.)*</span>

2) Select the &ldquo;Configure SQL Server for application services&rdquo; option and click &ldquo;Next&rdquo;

3) Enter your server name, login credentials and the name of the database to create/edit with the aspnetdb stuff.*<span style="font-size: x-small;">(The database will hold your login and personalization data, so if you don't have complete control over the database server (if you use a remote hosting service like I do) you will want to point this utility to the database you are going to use for your web site. You know, keep all your sites data in the same database. This is the same database that the Membership Provider uses to store user credentials.)</span>*

4) Add the following stuff to your web sites Web.config file <span style="font-size: x-small;">*(this stuff tells ASP.NET to use your SQL Server 2000 database instead of SQL Express)*:</span>

<connectionStrings>
   <add name="SQLConnString" 
      connectionString="Data Source=SQL_SERVER_NAME;Initial Catalog=aspnetdb;Integrated Security=True"
      providerName="System.Data.SqlClient" />
</connectionStrings>

<system.web>
   <webParts>
      <personalization
         defaultProvider="SqlPersonalizationProvider">
         <providers>
            <add name="SqlPersonalizationProvider"
               type="System.Web.UI.WebControls.WebParts.SqlPersonalizationProvider"
               connectionStringName="SQLConnString"
               applicationName="/" />
         </providers> 
         <authorization>
            <deny users="*" verbs="enterSharedScope" />
            <allow users="*" verbs="modifyState" />
         </authorization>
      </personalization>
   </webParts>
</system.web>

And, that's it! Wasn't that simple to do. Even though it's so simple, for some reason I could could only find one article online *<span style="font-size: x-small;">(</span>*<a href="http://www.ondotnet.com/pub/a/dotnet/2005/06/06/webparts_2.html">*<span style="font-size: x-small;">http://www.ondotnet.com/pub/a/dotnet/2005/06/06/webparts_2.html</span>*</a>*<span style="font-size: x-small;">)</span>* that covers this topic. So I thought I would write a little blog post about it to increase the number of content online that covers using a SQL Server 2000 database with ASP.NET 2.0 WebParts.
