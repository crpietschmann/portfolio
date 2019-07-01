---
layout: post
blogengineid: 57194bdd-11c5-4627-888c-e3331fec2a4b
title: "Mixing some Dynamic-ness with IronJS in .NET 4"
date: 2011-08-24 10:01:01 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript", "C#", "DLR"]
redirect_from: 
  - /post/2011/08/24/Mixing-some-Dynamic-ness-with-IronJS-in-NET-4
  - /post/2011/08/24/mixing-some-dynamic-ness-with-ironjs-in-net-4
  - /post.aspx?id=57194bdd-11c5-4627-888c-e3331fec2a4b
---
<!-- more -->

I recently started messing around with IronJS again, and I must say that this project is pure awesomeness! One of the first things I noticed is that when you call the “Execute” methods to run some JavaScript code it returns an “object.” Now, while this works just fine, I would prefer if it returned a “dynamic” object while running against .NET 4.0. There may be some reason that <a href="http://twitter.com/#!/fjholmstrom">Fredrik Holmstrom</a> (the author) decided to return an ‘object’, so I don’t mean to sound negative, but you have to admit that dynamics are really cool, especially when working with a dynamic language like JavaScript.  <h3>Basics of using IronJS</h3>  
There are articles that cover the usage of IronJS, but here’s a very brief summary:  <pre class="csharpcode"><span class="rem">// Instantiate the IronJS Engine</span>
var context = <span class="kwrd">new</span> IronJS.Hosting.CSharp.Context();

var result = context.Execute(<span class="str">&quot;2 + 2&quot;</span>);
<span class="rem">// returns 4</span>

var result = context.Execute(<span class="str">&quot;'Ch' + 'ris'&quot;</span>);
// returns <span class="str">&quot;Chris&quot;</span></pre>
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



<h3>Returning JavaScript Objects</h3>


The previous examples were extremely simple just to give you an idea if you are unfamiliar. Now I will show a more interesting example that returns a JavaScript object instead of just a simple, single value.

<pre class="csharpcode">var result = context.Execute(<span class="str">@&quot;
(function(){
  // do something here
  var id = 42;
  var name = 'chris';
  return { id: id, name: name }
})()
&quot;</span>);</pre>


This returns a JavaScript object with “id” and “name” properties set respectively to 42 and “chris”.

<h3>Retrieving Object Values</h3>


Retrieving the JavaScript object values is pretty straight forward, although you must reach for them through the “CommonObject.Members” property.

<pre class="csharpcode">var obj = (CommonObject)result;

var id = obj.Members[<span class="str">&quot;id&quot;</span>];
var name = obj.Members[<span class="str">&quot;name&quot;</span>];</pre>

<h3>Using Dynamics (via DynamicCommonObject class) to Retrieve Object Values</h3>


Wouldn’t it be nice to use Dynamics to get at the JavaScript object values? Yes, I agree that it would be.


Here’s an example of performing the previous example by using the DynamicCommonObject wrapper class (code listed below) to do it with .NET 4.0’s Dynamic object support.

<pre class="csharpcode">var obj = <span class="kwrd">new</span> DynamicCommonObject(result <span class="kwrd">as</span> CommonObject);

<span class="rem">// like properties on the object</span>
var id = obj.id;
var name = obj.name;

<span class="rem">// using the indexer property (not dynamic, but also simpler)</span>
var id = obj[<span class="str">&quot;id&quot;</span>];
var name = obj[<span class="str">&quot;name&quot;</span>];</pre>


What if the property doesn’t exist? Well let me show you…

<pre class="csharpcode">var firstname = obj.firstname;
<span class="rem">// throws RuntimeBinderException with message:</span>
<span class="rem">// &quot;'DynamicCommonObject' does not contain a definition for 'notexist'&quot;</span>

var firstname = obj[<span class="str">&quot;firstname&quot;</span>];
// returns IronJS.Undefined</pre>


If you want to change the behavior of DynamicCommonObject when the requested property name does not exist, then you can modify it’s code; it’s listed below.

<h3>DynamicCommonObject Wrapper Class Source Code</h3>

<pre class="csharpcode"><span class="rem">// Copyright (c) 2011 Chris Pietschmann - </span>
<span class="rem">// This work is licensed under a Creative Commons Attribution 3.0 Unites States License</span>
<span class="rem">// http://creativecommons.org/licenses/by/3.0/us/</span>

<span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Collections;
<span class="kwrd">using</span> System.Collections.Generic;
<span class="kwrd">using</span> System.Dynamic;
<span class="kwrd">using</span> System.Linq;
<span class="kwrd">using</span> IronJS;

<span class="kwrd">public</span> <span class="kwrd">class</span> DynamicCommonObject : DynamicObject, IEnumerable, IEnumerable&lt;KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;&gt;, IDictionary&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;
{
    <span class="kwrd">public</span> DynamicCommonObject(CommonObject commonObject)
    {
        <span class="kwrd">this</span>.CommonObject = commonObject;
    }

    <span class="kwrd">public</span> CommonObject CommonObject { get; <span class="kwrd">private</span> set; }

    <span class="preproc">#region</span> <span class="str">&quot;DynamicObject Overrides&quot;</span>

    <span class="kwrd">public</span> <span class="kwrd">override</span> <span class="kwrd">bool</span> TryGetMember(GetMemberBinder binder, <span class="kwrd">out</span> <span class="kwrd">object</span> result)
    {
        var r = <span class="kwrd">this</span>.Keys.Contains(binder.Name) ? <span class="kwrd">this</span>[binder.Name] : <span class="kwrd">null</span>;
        result = getClrBoxedValue(r);

        <span class="kwrd">if</span> (result == <span class="kwrd">null</span>)
        {
            <span class="kwrd">return</span> <span class="kwrd">false</span>;
        }
        <span class="kwrd">return</span> <span class="kwrd">true</span>;
    }

    <span class="kwrd">public</span> <span class="kwrd">override</span> <span class="kwrd">bool</span> TrySetMember(SetMemberBinder binder, <span class="kwrd">object</span> <span class="kwrd">value</span>)
    {
        <span class="kwrd">this</span>.CommonObject.Put(binder.Name, <span class="kwrd">value</span>);
        <span class="kwrd">return</span> <span class="kwrd">true</span>;
    }

    <span class="kwrd">public</span> <span class="kwrd">override</span> IEnumerable&lt;<span class="kwrd">string</span>&gt; GetDynamicMemberNames()
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Keys;
    }

    <span class="preproc">#endregion</span>

    <span class="preproc">#region</span> <span class="str">&quot;IEnumerable&lt;KeyValuePair&lt;string, object&gt;&gt; Implementation&quot;</span>

    <span class="kwrd">public</span> IEnumerator&lt;KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;&gt; GetEnumerator()
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Select(d =&gt; <span class="kwrd">new</span> KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;(d.Key, getClrBoxedValue(d.Value))).AsEnumerable().GetEnumerator();
    }

    System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.GetEnumerator();
    }

    <span class="preproc">#endregion</span>

    <span class="preproc">#region</span> <span class="str">&quot;IDictionary Implementation&quot;</span>

    <span class="kwrd">public</span> <span class="kwrd">void</span> Add(<span class="kwrd">string</span> key, <span class="kwrd">object</span> <span class="kwrd">value</span>)
    {
        <span class="kwrd">this</span>.CommonObject.Put(key, <span class="kwrd">value</span>);
    }

    <span class="kwrd">public</span> <span class="kwrd">bool</span> ContainsKey(<span class="kwrd">string</span> key)
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Keys.Contains(key);
    }

    <span class="kwrd">public</span> ICollection&lt;<span class="kwrd">string</span>&gt; Keys
    {
        get { <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Keys; }
    }

    <span class="kwrd">public</span> <span class="kwrd">bool</span> Remove(<span class="kwrd">string</span> key)
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Remove(key);
    }

    <span class="kwrd">public</span> <span class="kwrd">bool</span> TryGetValue(<span class="kwrd">string</span> key, <span class="kwrd">out</span> <span class="kwrd">object</span> <span class="kwrd">value</span>)
    {
        <span class="kwrd">object</span> v;
        var retVal = <span class="kwrd">this</span>.CommonObject.Members.TryGetValue(key, <span class="kwrd">out</span> v);

        <span class="kwrd">value</span> = getClrBoxedValue(v);
        <span class="kwrd">return</span> retVal;
    }

    <span class="kwrd">public</span> ICollection&lt;<span class="kwrd">object</span>&gt; Values
    {
        get {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Values.Select(d =&gt; getClrBoxedValue(d)).ToArray();
        }
    }

    <span class="kwrd">public</span> <span class="kwrd">object</span> <span class="kwrd">this</span>[<span class="kwrd">string</span> key]
    {
        get
        {
            <span class="kwrd">return</span> getClrBoxedValue(<span class="kwrd">this</span>.CommonObject.Get(key));
        }
        set
        {
            <span class="kwrd">this</span>.CommonObject.Put(key, <span class="kwrd">value</span>);
        }
    }

    <span class="kwrd">public</span> <span class="kwrd">void</span> Add(KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt; item)
    {
        <span class="kwrd">this</span>.CommonObject.Members.Add(item.Key, item.Value);
    }

    <span class="kwrd">public</span> <span class="kwrd">void</span> Clear()
    {
        <span class="kwrd">this</span>.CommonObject.Members.Clear();
    }

    <span class="kwrd">public</span> <span class="kwrd">bool</span> Contains(KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt; item)
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Contains(item);
    }

    <span class="kwrd">public</span> <span class="kwrd">void</span> CopyTo(KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt;[] array, <span class="kwrd">int</span> arrayIndex)
    {
        <span class="kwrd">throw</span> <span class="kwrd">new</span> NotImplementedException();
    }

    <span class="kwrd">public</span> <span class="kwrd">int</span> Count
    {
        get { <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Count; }
    }

    <span class="kwrd">public</span> <span class="kwrd">bool</span> IsReadOnly
    {
        get { <span class="kwrd">return</span> <span class="kwrd">false</span>; }
    }

    <span class="kwrd">public</span> <span class="kwrd">bool</span> Remove(KeyValuePair&lt;<span class="kwrd">string</span>, <span class="kwrd">object</span>&gt; item)
    {
        var v = <span class="kwrd">this</span>.CommonObject.Members[item.Key];
        <span class="kwrd">if</span> (v == item.Value)
        {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.CommonObject.Members.Remove(item.Key);
        }
        <span class="kwrd">return</span> <span class="kwrd">false</span>;
    }

    <span class="preproc">#endregion</span>

    <span class="preproc">#region</span> <span class="str">&quot;Static Methods&quot;</span>
        
    <span class="kwrd">private</span> <span class="kwrd">static</span> <span class="kwrd">object</span> getClrBoxedValue(<span class="kwrd">object</span> obj)
    {
        <span class="kwrd">if</span> (obj <span class="kwrd">is</span> IronJS.BoxedValue)
        {
            <span class="kwrd">return</span> ((IronJS.BoxedValue)obj).ClrBoxed;
        }
        <span class="kwrd">return</span> obj;
    }

    <span class="preproc">#endregion</span>
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

<h3>More Information on IronJS</h3>


If you aren’t familiar with IronJS, I encourage you to go check out one or more of the following links:

<ul>
  <li><a title="http://ironjs.wordpress.com/" href="http://ironjs.wordpress.com/">http://ironjs.wordpress.com/</a> </li>

  <li><a href="http://www.hanselman.com/blog/HanselminutesPodcast271InsideIronJSACompleteJavaScriptECMAScriptOpenSourceImplementationOnTheNETDLR.aspx">Hanselminutes Podcast 271: Inside IronJS – A complete JavaScript/ECMAScript open source implementation on the .NET DLR</a> </li>

  <li><a title="https://github.com/fholm/IronJS/wiki" href="https://github.com/fholm/IronJS/wiki">https://github.com/fholm/IronJS/wiki</a> </li>
</ul>
