---
layout: post
blogengineid: 03d5d230-54bc-4c55-af70-22d84ac83bdf
title: "Using MiniProfiler with SqlDataSource ASP.NET WebForms Control"
date: 2012-08-08 20:27:21 -0500
comments: true
published: true
categories: ["ASP.NET", ".NET", "MiniProfiler", "SqlDataSource", "WebForms"]
tags: ["C#", "asp.net"]
redirect_from: 
  - /post/2012/08/08/Using-MiniProfiler-with-SqlDataSource-ASPNET-WebForms-Control.aspx
  - /post/2012/08/08/Using-MiniProfiler-with-SqlDataSource-ASPNET-WebForms-Control
  - /post/2012/08/08/using-miniprofiler-with-sqldatasource-aspnet-webforms-control
  - /post.aspx?id=03d5d230-54bc-4c55-af70-22d84ac83bdf
---
<!-- more -->

I recently implemented MiniProfiler into an existing ASP.NET WebForms application that makes use of databinding to the SqlDataSource control. Since the SqlDataSource uses a DbProviderFactory internally, it is fairly simple to exend the control to utilize MiniProfiler through inheritance and overriding a single method of the SqlDataSource.  
Here’s a very simple class that inherits from the SqlDataSource control and injects MiniProfiler support to be able to profile the SQL query used by the control:  <pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> ProfiledSqlDataSource : SqlDataSource
{
    <span class="kwrd">protected</span> <span class="kwrd">override</span> DbProviderFactory  GetDbProviderFactory()
    {
        <span class="rem">// get the &quot;base&quot; DbProviderFactory</span>
        var baseDbProviderFactory = <span class="kwrd">base</span>.GetDbProviderFactory();
        <span class="rem">// Return a ProfiledDbProviderFactory from MiniProfiler</span>
        <span class="rem">// that wraps the &quot;base&quot; DbProviderFactory</span>
        <span class="kwrd">return</span> <span class="kwrd">new</span> ProfiledDbProviderFactory(
            MiniProfiler.Current,
            baseDbProviderFactory
        );
    }
}</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>
