---
layout: post
id: af2d7ca7-0a4a-4d50-ad41-fbc320ec714c
title: "jHash: Easily Manage Browser History / window.location.hash"
date: 2010-11-26 10:11:56 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript", "JavaScript"]
redirect_from: 
  - /post/2010/11/26/jHash-Easily-Manage-Browser-History-windowlocationhash
  - /post/2010/11/26/jhash-easily-manage-browser-history-windowlocationhash
  - /post.aspx?id=af2d7ca7-0a4a-4d50-ad41-fbc320ec714c
---
<!-- more -->
<p>When building Ajax-based web applications it can be difficult to get the web browsers back and forward buttons to work appropriately for each client-side state change. I recently published the new <a href="http://jhash.codeplex.com">jHash</a> library that can help alleviate this issue.</p>  <p>Put simply: <a href="http://jhash.codeplex.com">jHash</a> allows you to easily be notified when the “window.location.hash” changes. It also allows you to easily store/retrieve values from the hash in a similar fashion to server-side query string values.</p>  <p>Download: <a href="http://jhash.codeplex.com">http://jhash.codeplex.com</a></p>  <h3>JavaScript Framework Support (jQuery, Prototype, etc.)</h3>  <p>The library lives entirely within the “jHash” namespace so it can be used along with any JavaScript framework (jQuery, Prototype, etc.) you choose.</p>  <h3>Receive Hash Change Notifications</h3>  <p>The library primarily uses the “window.onhashchange” event to allow for hash change notifications to be raises. However, since the “onhashchange” event is only supported by newer web browsers (mainly Internet Explorer 8 and Firefox 3.6), the library also implements a fall back mechanism using “window.setInterval” to monitor the “window.location.hash” for changes in older web browsers that do not support this event.</p>  <p>To set a function to be called/notified when the hash changes, you just pass it to jHash using “jHash.change” You can also remove a function from being notified by calling “jHash.unbind” Below are examples of both of these:</p>  <pre class="csharpcode"><span class="rem">// Add &quot;onhashchange&quot; handler</span>
jHash.change(function(){
    <span class="rem">// hash changed - do something</span>
});

<span class="rem">// Create a function and set it to be called</span>
<span class="rem">// on the &quot;onhashchange&quot; event</span>
function myHashChanged(){
    <span class="rem">// do something</span>
}
<span class="rem">// Set &quot;myHashChanged&quot; to be called when</span>
<span class="rem">// the &quot;onhashchange&quot; event is fired</span>
jHash.change(myHashChanged);

<span class="rem">// Remove &quot;myHashChanged&quot; from being</span>
<span class="rem">// called when &quot;onhashchange&quot; is fired</span>
jHash.unbind(myHashChanged);</pre>
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

<h3>Retrieving the Hash Values</h3>

<p>To retrieve values from the “location.hash” you use the “jHash.root” and “jHash.val” functions.</p>

<p>Here’s a sample URL with Hash:</p>

<p><em>http://localhost/page.aspx#SomeAnchor?page=4&amp;name=Chris</em></p>

<p>jHash allows you to have both a “root” element and “query” values stored in the hash. In the above example, then “root” is “SomeAnchor” and the query values are “page=4&amp;name=Chris”</p>

<p>The query values are prefixed with a question mark (“?”) and delimited with an ampersand (“&amp;”) just like server-side query string values to keep things familiar.</p>

<p>Here are some examples of using jHash to parse the above hash value to retrieve its values:</p>

<pre class="csharpcode"><span class="rem">/* ---- Get the root ---- */</span>
<span class="kwrd">var</span> root = jHash.root();
<span class="rem">// root now equals &quot;SomeAnchor&quot;</span>

<span class="rem">/* ---- Get query values ---- */</span>
<span class="kwrd">var</span> page = jHash.val(<span class="str">&quot;page&quot;</span>);
<span class="rem">// page now equals &quot;4&quot;</span>

<span class="kwrd">var</span> name = jHash.val(<span class="str">&quot;name&quot;</span>);
// name now equals <span class="str">&quot;Chris&quot;</span></pre>

<p>One thing to not about the “jHash.val” function is that the key of the query value is not case sensitive. The following will also work:</p>

<pre class="csharpcode">var page = jHash.val(<span class="str">&quot;PaGe&quot;</span>);
var name = jHash.val(<span class="str">&quot;Name&quot;</span>);</pre>

<h3>Setting the Hash Values</h3>

<p>To set values and consequentially change the “location.hash”, you can use the same “jHash.root” and “jHash.value” functions.</p>

<p>Here are some examples of using jHash to set/change values within the “location.hash”:</p>

<pre class="csharpcode"><span class="rem">// Set the root</span>
jHash.root(<span class="str">&quot;SomeAnchor&quot;</span>);

<span class="rem">// Set some query values</span>
jHash.val(<span class="str">&quot;page&quot;</span>, 4);
jHash.val(<span class="str">&quot;name&quot;</span>, <span class="str">&quot;Chris&quot;</span>);

<span class="rem">// The resulting Hash value is:</span>
// <span class="str">&quot;#SomeAnchor?page=4&amp;name=Chris&quot;</span></pre>

<p>The previous example will set the hash to the same end result as the shown previously for retrieving hash values.</p>

<h3>Removing Hash Query Values</h3>

<p>Sometimes you may want to remove a query value from the hash. jHash handles this using the “jHash.remove” method.</p>

<p>Here’s an example of using it to remove the query value for the key “name”:</p>

<pre class="csharpcode"><span class="rem">// Remove &quot;name&quot; query value from hash</span>
jHash.remove(<span class="str">&quot;name&quot;</span>);</pre>

<h3>Set Hash Query Values from an Object / Dictionary</h3>

<p>The “jHash.set” function allows you to set both the “root” and “query” values while overwriting any existing hash values. This function is actually used internally with the library by the “root” and “val” functions. This allows you to easily set either just the “query” values or both the “root” and “query” values with only a single line of code.</p>

<p>Here are a couple examples:</p>

<pre class="csharpcode"><span class="rem">// Set just the root value</span>
jHash.set(<span class="str">&quot;SomeAnchor&quot;</span>);

<span class="rem">// Set both root and query values from object / dictionary</span>
jHash.set(<span class="str">&quot;SomeAnchor&quot;</span>, { page: 4, name: <span class="str">&quot;Chris&quot;</span> });</pre>

<p>When using the “jHash.set” method it is important to remember that it completely overwrites any previous “root” or “query” values stored in the hash.</p>

<h3>Fluent Interface</h3>

<p>The jHash functions also implement a fluent interface; meaning they return the jHash object. This allows you to chain multiple calls together in a&#160; single line of code.</p>

<p>Here’s an example:</p>

<pre class="csharpcode">jHash.change(someFunction).root(<span class="str">&quot;myRoot&quot;</span>).val(<span class="str">&quot;page&quot;</span>, 5).val(<span class="str">&quot;name&quot;</span>, <span class="str">&quot;Chris&quot;</span>);</pre>

<h3>Conclusion</h3>

<p>I searched for some good libraries for doing this type of thing before I began writing jHash. As you have probably assumed, I did not find anything that quite fit my liking. Consequentially, we all have <a href="http://jhash.codeplex.com">jHash</a> to use in our applications as desired.</p>
