---
layout: post
title: "Silverlight and JavaScript Interop Basics"
date: 2008-06-19 23:18:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/06/19/Silverlight-and-JavaScript-Interop-Basics
  - /post/2008/06/19/silverlight-and-javascript-interop-basics
---
<!-- more -->
<p>I've been looking into Silverlight in my spare time a bit, to see what it has to offer, and the JavaScript &quot;Interop&quot; is actually pretty neat and simple to use. About three months ago I wrote a post titled &quot;<a href="/post/2008/03/Working-with-HTML-DOM-in-Silverlight-2-Beta-1.aspx">Working with HTML DOM in Silverlight using the Bridge Pattern</a>&quot;; so I think this time I'll go over some of the basics involved with communicating back and forth between Silverlight and JavaScript. This article is written by referencing Silverlight 2 Beta 2, but should still hold relevent in the final release of Silverlight 2. </p>  <h3>Call a JavaScript Methods from within Silverlight</h3>  <p><strong>1) Using the Eval method</strong></p>  <p>Silverlight does expose the JavaScript Eval method, so you can use it to call some JavaScript in the page </p>  <p>Here's a couple examples of calling Eval from in Silverlight:</p>  <pre class="csharpcode"><span class="kwrd">using</span> System.Windows.Browser; 

<span class="rem">// set a global variable</span>
HtmlPage.Window.Eval(<span class="str">&quot;myJSObject = 2;&quot;</span>); 

<span class="rem">// invoke a global method</span>
HtmlPage.Window.Eval(<span class="str">&quot;myJSMethod();&quot;</span>);</pre>
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

<p>One thing to keep in mind with using Eval, even from Silverlight, is you can potentially open yourself up to script injection vulnerabilities. Instead of using Eval, you should use Invoke, which is my next example. </p>

<p><strong>2) Using the Invoke method</strong></p>

<p>You can use the Invoke method to execute some global JavaScript method within your page. </p>

<p>Here's a couple examples, one without arguments, the other passing in two arguments:</p>

<pre class="csharpcode"><span class="kwrd">using</span> System.Windows.Browser;

<span class="rem">// Call a global method without passing in arguments</span>
HtmlPage.Window.Invoke(<span class="str">&quot;myJSMethod&quot;</span>);

<span class="rem">// Call a global method, pass in two arguments</span>
<span class="rem">// First argument is a string</span>
<span class="rem">// Second argument is an integer</span>
HtmlPage.Window.Invoke(<span class="str">&quot;myJSMethod&quot;</span>, <span class="str">&quot;Chris&quot;</span>, 42);</pre>

<h3>Returning Values From JavaScript Method Calls </h3>

<p>Now that we've covered how to execute JavaScript methods from Silverlight, I'll show how to captures values that are returned from those method call. </p>

<p>Both the Eval and Invoke methods return an Object. The Object returned is a reference to the JavaScript object that is returned from the method call. To get at the returned value the Object needs to be cast into the appropriate data type. </p>

<p>Here's some examples of casting the ScriptObject to different data types to return different data types from JavaScript methods:</p>

<pre class="csharpcode"><span class="rem">// Returning a Double</span>
<span class="kwrd">double</span> doubleValue = (<span class="kwrd">double</span>)HtmlPage.Window.Invoke(<span class="str">&quot;myJSMethod&quot;</span>);

<span class="rem">// Returning a String</span>
<span class="kwrd">string</span> stringValue = (<span class="kwrd">string</span>)HtmlPage.Window.Invoke(<span class="str">&quot;myJSMethod&quot;</span>); </pre>

<p>One thing to always rememer when casting the object returned to a specific data type, is to check for NULL before casting, just to make sure a value was returned. </p>

<h3>Returning Objects From JavaScript Method Calls and Accessing Its Methods and Properties
  <br /></h3>

<p>You can also pass back Objects to Silverlight from your JavaScript methods calls. Instead of casting the object returned from the Eval or Invoke method call to a double, string or any other data type; you'll need to cast it to a ScriptObject. ScriptObject is basically the data type used for a &quot;general&quot; JavaScript object.</p>

<pre class="csharpcode"><span class="rem">// Execute the global JavaScript method and cast it to ScriptObject</span>
ScriptObject myScriptObject = (ScriptObject)HtmlPage.Window.Invoke(<span class="str">&quot;myJSMethod&quot;</span>);</pre>

<p><strong>1) Accessing the ScriptObjects Properties </strong></p>

<p>You can access the properties of the ScriptObject using the GetProperty method, then you must cast it to the appropriate data type.</p>

<pre class="csharpcode"><span class="rem">// Get a Double Property value from our ScriptObject</span>
<span class="kwrd">double</span> doubleValue = (<span class="kwrd">double</span>)myScriptObject.GetProperty(<span class="str">&quot;DoubleValue&quot;</span>);

<span class="rem">// Get a String Property value from our ScriptObject</span>
<span class="kwrd">double</span> stringValue = (<span class="kwrd">string</span>)myScriptObject.GetProperty(<span class="str">&quot;StringValue&quot;</span>);</pre>

<p><strong>2) Invoke one of the ScriptObjects Methods</strong></p>

<p>The ScriptObject has an Invoke method that works just like the HtmlPage.Window.Invoke method shown above.</p>

<pre class="csharpcode"><span class="rem">// Invoke a method that doesn't return a value</span>
myScriptObject.Invoke(<span class="str">&quot;myMethod&quot;</span>);

<span class="rem">// Invoke a method that returns a string value, and pass in some arguments</span>
<span class="kwrd">string</span> stringValue = myScriptObject.Invoke(<span class="str">&quot;myMethod&quot;</span>, <span class="str">&quot;Chris&quot;</span>, 42); </pre>

<p>Here's the JavaScript code that defines an object that has the properties and method show above:</p>

<pre class="csharpcode"><span class="kwrd">var</span> myJSObject = <span class="kwrd">function</span>(){
    <span class="kwrd">this</span>.DoubleValue = 42;
    <span class="kwrd">this</span>.StringValue = <span class="str">&quot;Chris&quot;</span>;
};
myJSObject.prototype.myMethod = <span class="kwrd">function</span>(arg1, arg2){
    <span class="kwrd">return</span> <span class="str">&quot;Chris&quot;</span>;
};</pre>
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

<h3>Call Silverlight Methods From JavaScript</h3>

<p>You can also call Silverlight methods from within JavaScript and return values from them. </p>

<p><strong>1) Setup your Silverlight object as Scriptable</strong></p>

<p>In order to interact with a Silverlight object from within JavaScript, it must be marked with the ScriptableType attribute, and any methods you want to expose need to be marked with the ScriptableMember attribute. Also, you must register the object as Scriptable in the page once the page loads, and give the object an alias that will be used to reference it within JavaScript. </p>

<p>Here's a sample of a page that exposes a method to be called from JavaScript:</p>

<pre class="csharpcode">[ScriptableType]
<span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> Page : UserControl
{
    <span class="kwrd">public</span> Page()
    {
        InitializeComponent();
        <span class="kwrd">this</span>.Loaded += <span class="kwrd">new</span> System.Windows.RoutedEventHandler(Page_Loaded);
    }

    <span class="kwrd">void</span> Page_Loaded(<span class="kwrd">object</span> sender, System.Windows.RoutedEventArgs e)
    {
        <span class="rem">// Register this object in the page as Scriptable</span>
        <span class="rem">// so it can be access from within JavaScript</span>
        HtmlPage.RegisterScriptableObject(<span class="str">&quot;myObject&quot;</span>, <span class="kwrd">this</span>);
    }

    [ScriptableMember]
    <span class="kwrd">public</span> <span class="kwrd">double</span> GetDoubleValue()
    {
        <span class="rem">// return a double</span>
        <span class="kwrd">return</span> (<span class="kwrd">double</span>)42;
    }
}</pre>

<p><strong>2) Write your JavaScript code</strong></p>

<p>When writing your JavaScript code, you need to get a reference to the Silverlight Plugin in the page, so you can call methods on your Silverlight object. </p>

<p>Here's a small example of doing this with a JavaScript method that calls the Silverlight method wired up to be fired on click of a button. In this example I'm using ASP.NET and the ASP.NET Silveright control.</p>

<pre class="csharpcode"><span class="asp">&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot; %&gt;</span>
<span class="asp">&lt;%@ Register Assembly=&quot;System.Web.Silverlight&quot; Namespace=&quot;System.Web.UI.SilverlightControls&quot; TagPrefix=&quot;asp&quot; %&gt;</span>

<span class="kwrd">&lt;!</span><span class="html">DOCTYPE</span> <span class="attr">html</span> <span class="attr">PUBLIC</span> <span class="kwrd">&quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot;</span> <span class="kwrd">&quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">html</span> <span class="attr">xmlns</span><span class="kwrd">=&quot;http://www.w3.org/1999/xhtml&quot;</span> <span class="attr">style</span><span class="kwrd">=&quot;height:100%;&quot;</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">head</span> <span class="attr">runat</span><span class="kwrd">=&quot;server&quot;</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">title</span><span class="kwrd">&gt;</span>Test Page For SilverlightJavaScriptInteropArticleCode<span class="kwrd">&lt;/</span><span class="html">title</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">script</span> <span class="attr">type</span><span class="kwrd">=&quot;text/javascript&quot;</span><span class="kwrd">&gt;</span>
        <span class="kwrd">function</span> callGetDoubleValue()
        {
            <span class="rem">// Get a reference to the Silverlight Plugin</span>
            <span class="rem">// Since we're using the ASP.NET Silverlight control</span>
            <span class="rem">// we can use $find with the controls ClientID to get</span>
            <span class="rem">// a reference to it</span>
            <span class="kwrd">var</span> pluginObject = $find(<span class="str">&quot;&lt;%=Xaml1.ClientID%&gt;&quot;</span>);
            <span class="rem">// Get a reference to the actual Silverlight</span>
            <span class="rem">// plugin element within the page</span>
            <span class="kwrd">var</span> plugin = pluginObject.get_element();
            
            <span class="rem">// Call the GetDoubleValue method of our Silverlight object</span>
            <span class="rem">// notice we are referencing the object by the name of &quot;myObject&quot;, that we setup</span>
            <span class="rem">// in Silverlight when we registered the object as Scriptable</span>
            <span class="kwrd">var</span> dbl = plugin.Content.myObject.GetDoubleValue();

            <span class="rem">// Display the value to the user in an alert box</span>
            alert(dbl);
        }
    <span class="kwrd">&lt;/</span><span class="html">script</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">head</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">body</span> <span class="attr">style</span><span class="kwrd">=&quot;height:100%;margin:0;&quot;</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">form</span> <span class="attr">id</span><span class="kwrd">=&quot;form1&quot;</span> <span class="attr">runat</span><span class="kwrd">=&quot;server&quot;</span> <span class="attr">style</span><span class="kwrd">=&quot;height:100%;&quot;</span><span class="kwrd">&gt;</span>

        <span class="rem">&lt;!-- The button that calls the js method above --&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">input</span> <span class="attr">type</span><span class="kwrd">=&quot;button&quot;</span> <span class="attr">value</span><span class="kwrd">=&quot;test&quot;</span> <span class="attr">onclick</span><span class="kwrd">=&quot;callGetDoubleValue();&quot;</span> <span class="kwrd">/&gt;</span>

        <span class="kwrd">&lt;</span><span class="html">asp:ScriptManager</span> <span class="attr">ID</span><span class="kwrd">=&quot;ScriptManager1&quot;</span> <span class="attr">runat</span><span class="kwrd">=&quot;server&quot;</span><span class="kwrd">&gt;&lt;/</span><span class="html">asp:ScriptManager</span><span class="kwrd">&gt;</span>
        <span class="kwrd">&lt;</span><span class="html">div</span>  <span class="attr">style</span><span class="kwrd">=&quot;height:100%;&quot;</span><span class="kwrd">&gt;</span>
            <span class="kwrd">&lt;</span><span class="html">asp:Silverlight</span> <span class="attr">ID</span><span class="kwrd">=&quot;Xaml1&quot;</span> <span class="attr">runat</span><span class="kwrd">=&quot;server&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;~/ClientBin/SilverlightJavaScriptInteropArticleCode.xap&quot;</span> <span class="attr">MinimumVersion</span><span class="kwrd">=&quot;2.0.30523&quot;</span> <span class="attr">Width</span><span class="kwrd">=&quot;100%&quot;</span> <span class="attr">Height</span><span class="kwrd">=&quot;100%&quot;</span> <span class="kwrd">/&gt;</span>
        <span class="kwrd">&lt;/</span><span class="html">div</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;/</span><span class="html">form</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">body</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">html</span><span class="kwrd">&gt;</span></pre>
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

<h3>Return Objects From Silverlight Method Calls To JavaScript</h3>

<p>You can also return more complex object references to JavaScript from Silverlight method calls. One thing to remember, when returning objects from a Silverlight method call to JavaScript, is they need to be marked as Scriptble using the ScriptableType attribute, and the member (properties and methods) you want to expose must be marked with the ScriptableMember attribute. </p>

<p>Here's an example method to be called by JavaScript that returns an object type that is marked as Scriptable:</p>

<pre class="csharpcode">[ScriptableMember]
<span class="kwrd">public</span> myObject GetObjectValue()
{
    myObject o = <span class="kwrd">new</span> myObject();
    o.Name = <span class="str">&quot;Chris&quot;</span>;
    <span class="kwrd">return</span> o;
}

[ScriptableType]
<span class="kwrd">public</span> <span class="kwrd">class</span> myObject
{
    [ScriptableMember]
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }

    [ScriptableMember]
    <span class="kwrd">public</span> <span class="kwrd">string</span> GetName()
    {
        <span class="kwrd">return</span> <span class="kwrd">this</span>.Name;
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

<p>Here's the simple JavaScript (based on the other example above) to call the method and access the returned objects properties and methods:</p>

<pre class="csharpcode"><span class="rem">// Call the method and get the returned object</span>
<span class="kwrd">var</span> obj = plugin.Content.myObject.GetObjectValue();

<span class="rem">// Get the value of a property of the returned object</span>
<span class="kwrd">var</span> strName = obj.Name;

<span class="rem">// Get the returned value of a method of the returned object</span>
<span class="kwrd">var</span> strName = obj.GetName();</pre>

<h3>Conclusion</h3>

<p>The JavaScript interop in Silverlight is fairly simple to use, however the ability to call Silverlight from JavaScript was a little tricky for me at first, mostly due to how few Silverlight articles are out there. I hope this helps you get your JavaScript code (new or existing) working along-side Silverlight in a friendly fashion. </p>

<p>Also, here's a couple related posts I've written during the last couple months. The were written with Silverlight 2 Beta 1 as reference, but they still hold relevent with Beta 2. </p>

<p><a href="/post/2008/03/Working-with-HTML-DOM-in-Silverlight-2-Beta-1.aspx">Working with HTML DOM in Silverlight 2 Beta 1 using the Bridge Pattern</a> </p>

<p><a href="/post/2008/03/Show-a-MessageBox-in-Silverlight-2-Beta-1.aspx">Show a MessageBox in Silverlight 2 Beta 1</a> </p>

<p><a href="/post/2008/05/Silverlight-Load-JavaScript-from-Embedded-Resource-and-Execute-Within-Page.aspx">Silverlight: Load JavaScript from Embedded Resource and Execute Within Page</a></p>
