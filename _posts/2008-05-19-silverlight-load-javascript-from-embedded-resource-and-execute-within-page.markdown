---
layout: post
title: "Silverlight: Load JavaScript from Embedded Resource and Execute Within Page"
date: 2008-05-19 20:32:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/05/19/Silverlight-Load-JavaScript-from-Embedded-Resource-and-Execute-Within-Page
  - /post/2008/05/19/silverlight-load-javascript-from-embedded-resource-and-execute-within-page
---
<!-- more -->
<p>
I&#39;ve been playing around with Silverlight 2 Beta 1 alot lately, and one of the areas I&#39;ve been focusing on is interoperability with JavaScript and the DOM. Here&#39;s a technique I&#39;ve found that allows you to inject JavaScript into the page from within your Silverlight application. This example also starts with the idea that the JavaScript you are going to inject is stored as an Embedded Resource within your Silverlight Application. 
</p>
<p>
<strong>Step 1: </strong>Create your JavaScript (.js) file and add it as an embedded resource to your Silverlight Application. 
</p>
<p>
<strong>Step 2:</strong> Place code in your app that loads the embedded JavaScript file to a string variable: 
</p>
<p>
[code:c#] 
</p>
<p>
// Load JavaScript code from Embedded Resource<br />
System.IO.Stream stream = this.GetType().Assembly.GetManifestResourceStream(&quot;[namespace].[javascriptFileName]&quot;);<br />
System.IO.StreamReader reader = new System.IO.StreamReader(stream);<br />
string script = reader.ReadToEnd(); 
</p>
<p>
[/code] 
</p>
<p>
Note: Replace the <em>[namespace]</em> text above with the full namespace of your Silverlight application project. Also, replace the <em>[javascriptFileName]</em> text above with the filename of your JavaScript file. An example value for this with the namespace and JavaScript filename is <em>&quot;MyApplication.TestScript.js&quot;</em>. 
</p>
<p>
<strong>Step 3: </strong>Inject the JavaScript into the page using Eval: 
</p>
<p>
[code:c#] 
</p>
<p>
HtmlPage.Window.Eval(script); 
</p>
<p>
[/code] 
</p>
<p>
This is a small technique that I&#39;ve found to make mixing JavaScript with Silverlight a little easier since this allows you to take advantage of JavaScript Intellisense within Visual Studio 2008; where if you just placed the JavaScript code inline within your C# or VB.NET code you would not&nbsp;be able to have JavaScript Intellisense. 
</p>
