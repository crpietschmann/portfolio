---
layout: post
title: "Odd .NET Namespace Scoping Causes Compile-Time Exception"
date: 2011-01-01 23:46:01 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
alias: ["/post/2011/01/01/Odd-NET-Namespace-Scoping-Causes-Compile-Time-Exception", "/post/2011/01/01/odd-net-namespace-scoping-causes-compile-time-exception"]
---
<!-- more -->
<p>This isn’t really a bug in the .NET compilers, but it sure is an interesting namespace scoping issue that could easily be encountered. If this teaches you anything, be it that you should never name a nested namespace level the same name as one of its parents in the hierarchy.</p>  <h3>In C#</h3>  <p>First here’s the Compile Time Exception that I was getting:</p>  <p><em>The type or namespace name ‘Data’ does not exist in namespace ‘MyApp.Data.MyApp’ (are you missing an assembly reference?)</em></p>  <p>At first I was like <em>“What do you mean namespace ‘Data’ doesn’t exist in ‘MyApp.Data’?”</em></p>  <p>Here’s the C# code that causes this exception:</p>  <pre class="csharpcode"><span class="kwrd">namespace</span> MyApp.Data
{
    <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> Person
    {
        <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
    }
}

<span class="kwrd">namespace</span> MyApp.Data.MyApp
{
    <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> Billy : MyApp.Data.Person
    {

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

<p>If you are familiar with scoping of namespaces in .NET then you probably can see what the issue is. Remember, I has this issue in a large solution with multiple projects and it wasn’t as straight forward as this. This example is the most basic example that will raise this exception.</p>

<p>Basically, since the ‘Billy’ class is within the ‘MyApp.Data.MyApp’ namespace, all references to the ‘MyApp’ namespace will be scoped to the nested ‘MyApp’ instead of the root.&#160; So, as a consequence, the ‘MyApp.Data.Person’ object doesn’t exist because the compiler is really looking for ‘MyApp.Data.MyApp.Data.Person’.</p>

<h3>How about VB.NET?</h3>

<p>Another thing to point out is that I also tested this in VB.NET, and the VB.NET compiler gives a similar compile-time exception message for the same ‘MyApp.Data.Person' reference within the ‘Billy’ class. Here’s VB.NET’s message:</p>

<p><em>Type ‘MyApp.Data.Person’ is not defined</em></p>

<p>Here’s the VB.NET code:</p>

<pre class="csharpcode"><span class="kwrd">Namespace</span> MyApp.Data
    <span class="kwrd">Public</span> <span class="kwrd">Class</span> Person


    <span class="kwrd">End</span> <span class="kwrd">Class</span>
<span class="kwrd">End</span> <span class="kwrd">Namespace</span>

<span class="kwrd">Namespace</span> MyApp.Data.MyApp
    <span class="kwrd">Public</span> <span class="kwrd">Class</span> Test
        <span class="kwrd">Public</span> <span class="kwrd">Sub</span> <span class="kwrd">New</span>()
            <span class="kwrd">Dim</span> person = <span class="kwrd">New</span> MyApp.Data.Person()
        <span class="kwrd">End</span> <span class="kwrd">Sub</span>
    <span class="kwrd">End</span> <span class="kwrd">Class</span>
<span class="kwrd">End</span> Namespace</pre>
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

<h3>Conclusion</h3>

<p>You may assume, as I did at first, that the compiler should just fall back to the ‘MyApp’ root namespace if it can’t find the type within the nested namespace. This assumption was completely incorrect, and after thinking it over, the compilers response does make sense.</p>

<p>I actually never ran into this before, so I thought I would share.</p>
