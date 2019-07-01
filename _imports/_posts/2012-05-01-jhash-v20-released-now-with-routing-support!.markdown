---
layout: post
id: 132350f3-c5ad-4eca-8c4f-2c1110f9a345
title: "jHash v2.0 Released: Now with Routing Support!"
date: 2012-05-01 17:34:30 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript", "HTML"]
redirect_from: 
  - /post/2012/05/01/jHash-v20-Released-Now-with-Routing-Support!
  - /post/2012/05/01/jhash-v20-released-now-with-routing-support!
  - /post.aspx?id=132350f3-c5ad-4eca-8c4f-2c1110f9a345
---
<!-- more -->
<p><a href="http://jhash.codeplex.com" target="_blank">jHash</a> is a small, lightweight (4kb minified / 2kb compressed) javascript library that makes it extremely easy to work with “location.hash&quot;. Version 1.0 had the ability to set / retrieve hash root values as well as “hash querystring” values. The newly released version 2.0 includes a new lightweight routing engine that facilitates an easier developer experience when building Single Page Applications.</p>  <p>The <a href="http://jhash.codeplex.com/documentation" target="_blank">jHash documentation</a> contains full descriptions of the libraries methods and their usage.</p>  <p>Get jHash Here: <a href="http://jhash.codeplex.com">http://jhash.codeplex.com</a> </p>  <h3>Easily work with “location.hash”</h3>  <p>Here are some simple examples of setting and retrieving hash “root” and “querystring” values:</p>  <pre class="csharpcode"><span class="rem">// URL:</span>
<span class="rem">// http://localhost/page.htm#SomeValue?name=Chris&amp;location=Wisconsin</span>

<span class="rem">// get &quot;root&quot; hash value</span>
<span class="kwrd">var</span> root = jHash.root(); <span class="rem">// returns &quot;SomeValue&quot;</span>

<span class="rem">// get &quot;name&quot; hash querystring value</span>
<span class="kwrd">var</span> name = jHash.val(<span class="str">'name'</span>); <span class="rem">// returns &quot;Chris&quot;</span>

<span class="rem">// get &quot;location&quot; hash querystring value</span>
<span class="kwrd">var</span> loc = jHash.val(<span class="str">'location'</span>); <span class="rem">// return &quot;Wisconsin&quot;</span>

<span class="rem">// set new individual query string value</span>
jHash.val(<span class="str">'name'</span>, <span class="str">'Steve'</span>);

<span class="rem">// set all new query string hash values</span>
jHash.val({
    name: <span class="str">'Steve'</span>,
    location: <span class="str">'Montana'</span>
});</pre>
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

<h3>Easy “location.hash” Routing with jHash</h3>

<p>Hash routes are a technique that can be used to build Single Page Applications more easily. The Routing implementation contained within jHash works so you can declare Route Patterns in a similar fashion to ASP.NET Routes.</p>

<p>The <a href="http://jhash.codeplex.com/wikipage?title=Using%20jHash%20Routes" target="_blank">Using jHash Routes article in the jHash documentation</a> contains full descriptions and examples on how to use jHash Routes.</p>

<p>Here’s a short code sample that shows how to add a simple hash route handler and a sample Hash value that will match the route specified:</p>

<pre class="csharpcode"><span class="rem">// Hash that would match this Route Pattern</span>
<span class="rem">// #Wisconsin/Milwaukee</span>

jHash.route(<span class="str">'{state}/{city}'</span>,
    <span class="kwrd">function</span> () {
        <span class="kwrd">var</span> stateName = <span class="kwrd">this</span>.state;
        <span class="rem">// stateName will equal 'Wisconsin'</span>

        <span class="kwrd">var</span> cityName = <span class="kwrd">this</span>.city;
        <span class="rem">// cityName will equal 'Milwaukee'</span>
    }
);</pre>
