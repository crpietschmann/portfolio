---
layout: post
id: a5b169ee-bfde-4edc-b1b5-847d43a65d37
title: "Intro to IronRuby/DLR Scripting in C# Silverlight 4 Application"
date: 2010-09-29 12:44:33 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight", "DLR", "Ruby"]
redirect_from: 
  - /post/2010/09/29/Intro-to-IronRubyDLR-Scripting-in-C-Silverlight-4-Application
  - /post/2010/09/29/intro-to-ironrubydlr-scripting-in-c-silverlight-4-application
  - /post.aspx?id=a5b169ee-bfde-4edc-b1b5-847d43a65d37
---
<!-- more -->
<p>I’ve been working lately on figuring out how to add DLR scripting support to a Silverlight 4 application I’ve been working on. The idea is to give it a plugin style architecture, with the plugins being written in a DLR language; currently focusing on IronRuby. I originally searched how to do this, but couldn’t find any recent articles that discuss Silverlight 4. Also, most articles out don’t target Silverlight and more of them discuss <a href="http://ironpython.codeplex.com">IronPython</a> and not <a href="http://ironruby.codeplex.com">IronRuby</a>, even though the DLR stuff is the same regardless of DLR language used.</p>  <p>So, I thought I’d share what I’m learning about adding IronRuby scripting to Silverlight 4 applications. I’m also focusing on C# as the host language, but the .NET object and methods used will be the same from VB.NET.</p>  <p><strong>Older Articles for Reference</strong></p>  <ul>   <li><a href="http://blog.jimmy.schementi.com/2008/11/adding-scripting-to-c-silverlight-app.html">Adding scripting to a C# Silverlight app</a> </li>    <li><a href="http://blog.jimmy.schementi.com/2009/03/scripting-c-silverlight-apps-with.html">Scripting C# Silverlight apps with IronPython</a> </li>    <li><a href="http://neontapir.wordpress.com/2009/06/29/ironruby-script-engine-in-c/">IronRuby script engine in C#</a> </li>    <li><a href="http://blogs.microsoft.co.il/blogs/berniea/archive/2008/12/04/extending-your-c-application-with-ironpython.aspx">Extending your C# application with IronPython</a> </li>    <li><a href="http://www.switchonthecode.com/tutorials/getting-started-with-ironruby-and-silverlight">Getting Started with IronRuby and SIlverlight</a> </li> </ul>  <h3>What to download?</h3>  <p>Since I am talking about using Silverlight 4, you will need Visual Studio 2010 installed.</p>  <p>You will need to have the following installed:</p>  <ul>   <li><a href="http://go.microsoft.com/fwlink/?LinkID=177428">Silverlight 4 Tools for Visual Studio 2010</a> </li> </ul>  <p>Also, download the following and extract, as it will be used later:</p>  <ul>   <li><a href="http://ironruby.codeplex.com/releases/view/43540#DownloadId=133275">IronRuby 1.1 (.NET 4.0 ZIP &amp; Silverlight 4)</a> </li> </ul>  <h3>Add Assembly References to Silverlight Project</h3>  <p>Either create a new Silverlight 4 project or use an existing one, then add the references to the following assemblies located within the “<em>silverlight/bin</em>” folder of the IronRuby 1.1 archive previously downloaded.</p>  <ul>   <li>IronRuby.dll </li>    <li>IronRuby.Libraries.dll </li>    <li>IronRuby.Libraries.Yaml.dll </li>    <li>Microsoft.Dynamic.dll </li>    <li>Microsoft.Scripting.Debugging.dll </li>    <li>Microsoft.Scripting.dll </li>    <li>Microsoft.Scripting.Silverlight.dll </li>    <li>System.Numerics.dll </li> </ul>  <p>If your using a C# project, then you will also need to Add Reference to Microsoft.CSharp namespace.</p>  <h3>Execute IronRuby Code from C#</h3>  <p>It is actually very simple to use the ScriptEngine class to execute DLR code from within C# (or any other .NET language.)</p>  <p>Here’s a small example that show how to use ScriptEngine to execute a small piece of IronRuby code:</p>  <pre class="csharpcode"><span class="rem">// Create instance of the IronRuby ScriptEngine</span>
ScriptEngine engine = Ruby.CreateEngine();

<span class="rem">// some IronRuby code to execute</span>
<span class="rem">// this just adds 2 plus 2</span>
var code = <span class="str">&quot;2 + 2&quot;</span>;

<span class="rem">// Execute the code and catch the result</span>
<span class="rem">// in a variable</span>
var result = engine.Execute(code);

<span class="rem">// After execution &quot;result&quot; should contain</span>
// the <span class="kwrd">value</span> <span class="str">&quot;4&quot;</span></pre>
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

<p>As you can see, it really is only 2 lines of code required to execute a piece of IronRuby (or other DLR language) code.</p>

<h3>Use Global Variables to Grant Access Within Your Application</h3>

<p>The ScirptEngine class allows you to set global variables from .NET code to allow the DLR language (in this case IronRuby) access to them.</p>

<p>Here’s an example of creating a global variable “MainPage” that is a reference to the object that is executing the code. The MainPage object also implements a method named “SetTitleText” that the IronRuby code will call.</p>

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> MainPage : UserControl
{
    <span class="kwrd">public</span> <span class="kwrd">void</span> SetTitleText(<span class="kwrd">string</span> t)
    {
        <span class="kwrd">this</span>.txtTitle.Text = t;
    }

    <span class="kwrd">void</span> MainPage_Loaded(<span class="kwrd">object</span> sender, RoutedEventArgs e)
    {
        ScriptEngine engine = Ruby.CreateEngine();

        <span class="rem">// Set global variable for access to this Page instance</span>
        <span class="rem">// The Ruby code will only be able to access the &quot;MainPage&quot;</span>
        <span class="rem">// global variable</span>
        engine.Runtime.Globals.SetVariable(<span class="str">&quot;MainPage&quot;</span>, <span class="kwrd">this</span>);

        <span class="rem">// Use Ruby to set the text displayed in a TextBlock using a method</span>
        <span class="rem">// exposed by this Page object</span>
        <span class="kwrd">string</span> code = <span class="str">&quot;MainPage.SetTitleText(\&quot;Hello from IronRuby!\&quot;)&quot;</span>;
        engine.Execute(code);
    }
}</pre>

<p>Using this you can grant the DLR script access to any objects or methods within your application.</p>

<h3>Return Object Instance from IronRuby and Execute a Method from C#</h3>

<p>Here’s another code example of executing IronRuby code from C#. This time the IronRuby code is creating an instance of an object and returning that object so that C# can call one of its methods.</p>

<pre class="csharpcode">ScriptEngine engine = Ruby.CreateEngine();

<span class="rem">// Execute IronRuby code that creates an</span>
<span class="rem">// instance of a class</span>
dynamic obj = engine.Execute(<span class="str">@&quot;
    class MyObject
        def add(a, b)
            a + b
        end
    end
    MyObject.new
&quot;</span>);

<span class="rem">// call the &quot;add&quot; method of the IronRuby object</span>
var i = obj.add(1, 2);

<span class="rem">// Display the result of the IronRuby method to</span>
<span class="rem">// the user</span>
HtmlPage.Window.Alert(<span class="str">&quot;i = &quot;</span> + i);</pre>

<p>&#160;</p>

<h3>Conclusion</h3>

<p>The examples shown here may seem really simple and not to offer much, but this is just the basics of what can allow you to add a ton of power to your applications. Being able to easily script certain pieces of your application without the need to recompile and redeploy the solution can drastically increase the speed at which certain application changes, such as business logic, can be implemented. This also allows for a much more modular plug-in model to be developed in to the application; which is what I’m looking to do.</p>
