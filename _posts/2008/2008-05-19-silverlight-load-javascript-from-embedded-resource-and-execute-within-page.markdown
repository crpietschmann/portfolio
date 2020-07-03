---
layout: post
blogengineid: 9e458354-15dd-466f-aae9-7eefaaa1948d
title: "Silverlight: Load JavaScript from Embedded Resource and Execute Within Page"
date: 2008-05-19 20:32:00 -0500
comments: true
published: true
categories: ["Silverlight", "JavaScript"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/05/19/Silverlight-Load-JavaScript-from-Embedded-Resource-and-Execute-Within-Page.aspx
  - /post/2008/05/19/Silverlight-Load-JavaScript-from-Embedded-Resource-and-Execute-Within-Page
  - /post/2008/05/19/silverlight-load-javascript-from-embedded-resource-and-execute-within-page
  - /post.aspx?id=9e458354-15dd-466f-aae9-7eefaaa1948d
---
<!-- more -->


I&#39;ve been playing around with Silverlight 2 Beta 1 alot lately, and one of the areas I&#39;ve been focusing on is interoperability with JavaScript and the DOM. Here&#39;s a technique I&#39;ve found that allows you to inject JavaScript into the page from within your Silverlight application. This example also starts with the idea that the JavaScript you are going to inject is stored as an Embedded Resource within your Silverlight Application. 



**Step 1: **Create your JavaScript (.js) file and add it as an embedded resource to your Silverlight Application. 



**Step 2:** Place code in your app that loads the embedded JavaScript file to a string variable: 



```csharp 



// Load JavaScript code from Embedded Resource

System.IO.Stream stream = this.GetType().Assembly.GetManifestResourceStream(&quot;[namespace].[javascriptFileName]&quot;);

System.IO.StreamReader reader = new System.IO.StreamReader(stream);

string script = reader.ReadToEnd(); 



``` 



Note: Replace the *[namespace]* text above with the full namespace of your Silverlight application project. Also, replace the *[javascriptFileName]* text above with the filename of your JavaScript file. An example value for this with the namespace and JavaScript filename is *&quot;MyApplication.TestScript.js&quot;*. 



**Step 3: **Inject the JavaScript into the page using Eval: 



```csharp 



HtmlPage.Window.Eval(script); 



``` 



This is a small technique that I&#39;ve found to make mixing JavaScript with Silverlight a little easier since this allows you to take advantage of JavaScript Intellisense within Visual Studio 2008; where if you just placed the JavaScript code inline within your C# or VB.NET code you would not be able to have JavaScript Intellisense. 

