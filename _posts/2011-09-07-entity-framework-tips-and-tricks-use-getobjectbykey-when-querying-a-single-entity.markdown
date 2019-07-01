---
layout: post
title: "Entity Framework Tips and Tricks: Use GetObjectByKey When Querying a Single Entity"
date: 2011-09-07 14:30:46 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#"]
redirect_from: 
  - /post/2011/09/07/Entity-Framework-Tips-and-Tricks-Use-GetObjectByKey-When-Querying-a-Single-Entity
 -  /post/2011/09/07/entity-framework-tips-and-tricks-use-getobjectbykey-when-querying-a-single-entity
---
<!-- more -->
<p>I’ve been using Entity Framework a lot lately and it makes data access really nice. It’s fairly simple to use and maps all your tables to a .NET object model. However, just like any other library, it can be misused and have it’s own issues. I’ve been figuring some things out as I’ve been using it, so I thought I’d share a few tip and tricks that I’ve learned. Here’s the first one:</p>  <h3>Use “GetObjectByKey” when Querying for a Single data entity</h3>  <p>Take the following query:</p>  <pre class="csharpcode">var person = (from p <span class="kwrd">in</span> context.Persons
              <span class="kwrd">where</span> p.ID == id
              select p).FirstOrDefault();</pre>
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

<p>This query will find all the “Person” entities that have a specific “ID” and then return the first one or null if it doesn’t exist. This query is perfectly valid and will operate as expected. However, if you were to call that query multiple times, it will hit the database every time it’s called and never cache the entity. In order to “cache” the entity for future calls you would need to keep the “person” variable around for any future use.</p>

<p>Now, take the following code:</p>

<pre class="csharpcode">var keyValues = <span class="kwrd">new</span> KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;[] {
    <span class="kwrd">new</span> KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;(<span class="str">&quot;ID&quot;</span>, id)
};
var key = <span class="kwrd">new</span> EntityKey(<span class="str">&quot;DataEntities.Persons&quot;</span>, keyValues);

var person = (Person)context.GetObjectByKey(key);</pre>

<p>This code uses the “<a href="http://msdn.microsoft.com/en-us/library/system.data.objects.objectcontext.getobjectbykey.aspx">GetObjectByKey</a>” method to return the same “Person” entity as the above query. However, there is one critical difference. This code will check the cache before hitting the database to see if the entity has already been loaded into memory using Entity Framework.</p>

<p>Basically, the first call to “<a href="http://msdn.microsoft.com/en-us/library/system.data.objects.objectcontext.getobjectbykey.aspx">GetObjectByKey</a>” will query the database, and any subsequent calls for the same entity will just return it from the cache. You must remember when using this method that it wont refresh the data from the database if it exists in the cache, so in certain circumstances, it may still be better to perform a query to make sure the data returned is the latest and not stale.</p>

<p>The “<a href="http://msdn.microsoft.com/en-us/library/system.data.objects.objectcontext.getobjectbykey.aspx">GetObjectByKey</a>” method will throw an ObjectNotFoundException if the requested object cannot be found. To avoid handling the exception, you can alternatively use the “<a href="http://msdn.microsoft.com/en-us/library/bb738728.aspx">TryGetObjectByKey</a>” method instead.</p>

<p>Here’s a generic method and it’s sample usage that I’ve created to make using TryGetObjectKey a little simpler:</p>

<pre class="csharpcode"><span class="kwrd">static</span> T GetEntityByID&lt;T&gt;(<span class="kwrd">string</span> entitySetName, Guid id)
    <span class="kwrd">where</span> T: <span class="kwrd">class</span>
{
    <span class="kwrd">object</span> val = <span class="kwrd">null</span>;

    <span class="rem">// Create the EntityKey</span>
    var keyValues = <span class="kwrd">new</span> KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;[] {
        <span class="kwrd">new</span> KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;(<span class="str">&quot;ID&quot;</span>, id)
    };
    var key = <span class="kwrd">new</span> EntityKey(
        <span class="kwrd">string</span>.Format(<span class="str">&quot;DataEntities.{0}&quot;</span>, entitySetName),
        keyValues
    );

    <span class="rem">// Try to get the Object using the Key</span>
    context.TryGetObjectByKey(key, <span class="kwrd">out</span> val);

    <span class="rem">// cast the object as T</span>
    <span class="rem">// this will return Null if the object doesn't exist</span>
    <span class="kwrd">return</span> val <span class="kwrd">as</span> T;
}

<span class="rem">// Example usage of the method</span>
var person = GetEntityByID&lt;Person&gt;(<span class="str">&quot;Persons&quot;</span>, id);</pre>

<p>You could even go a step further and wrap the above “GetEntityByID&lt;Person&gt;()” call into a method like “GetPersonByID(Guid id)” to make it easier to use.</p>
