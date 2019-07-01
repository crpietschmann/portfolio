---
layout: post
title: "ASP.NET: How to get a specific ConnectionString from the Web.Config by name"
date: 2005-12-28 23:18:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2005/12/28/ASPNET-20-How-to-get-a-specific-ConnectionString-from-the-WebConfig-by-name
  - /post/2005/12/28/aspnet-20-how-to-get-a-specific-connectionstring-from-the-webconfig-by-name
---
<!-- more -->
<p>You have your ConnectionString for your <a title="ASP.NET" href="http://asp.net" target="_blank">ASP.NET</a> web app stored in the Web.Config file. Now how exactly how do you get that ConnectionString out of there from within your code?</p>  <p>Sample Web.Config section with a ConnectionString:</p>  <pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">connectionStrings</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">remove</span> <span class="attr">name</span><span class="kwrd">=&quot;LocalSqlServer&quot;</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">add</span> <span class="attr">name</span><span class="kwrd">=&quot;LocalSqlServer&quot;</span>
        <span class="attr">connectionString</span><span class="kwrd">=&quot;Data Source=myDBServer;database=myDB;Integrated Security=True;&quot;</span>
        <span class="attr">providerName</span><span class="kwrd">=&quot;System.Data.SqlClient&quot;</span><span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">connectionStrings</span><span class="kwrd">&gt;</span></pre>
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

<p>Now lets get the ConnectionString from the Web.Config file with only one line of code (C#):</p>

<pre class="csharpcode">var conString = ConfigurationManager.ConnectionStrings[<span class="str">&quot;LocalSqlServer&quot;</span>];
<span class="kwrd">string</span> strConnString = conString.ConnectionString;</pre>
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

<p>and with Visual Basic .NET:</p>

<pre class="csharpcode"><span class="kwrd">Dim</span> conString = ConfigurationManager.ConnectionStrings(<span class="str">&quot;LocalSqlServer&quot;</span>)
<span class="kwrd">Dim</span> strConnString <span class="kwrd">As</span> <span class="kwrd">String</span> = conString.ConnectionString</pre>
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

<p>Now isn't that simple? I'm posting this because I did a search and didn't find an example of how to do this. I had to poke around a little and discover this on my own. I hope this helps someone avoid some frustration.</p>
