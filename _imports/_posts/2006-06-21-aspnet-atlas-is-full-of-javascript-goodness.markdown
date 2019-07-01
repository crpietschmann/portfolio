---
layout: post
title: "ASP.NET Atlas is full of JavaScript goodness"
date: 2006-06-21 09:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "JavaScript"]
redirect_from: 
  - /post/2006/06/21/ASPNET-Atlas-is-full-of-JavaScript-goodness
  - /post/2006/06/21/aspnet-atlas-is-full-of-javascript-goodness
---
<!-- more -->
<p>I was looking through the JavaScript code for <a href="http://atlas.asp.net">Atlas</a> and I noticed there is some pretty neat stuff in there. It is really a very large enhancement to JavaScript.</p>
<p>One of the things I noticed is they are adding support for the XMLHttpRequest object if the browser doesn't natively support it. In the past I've traditionally just created a function named similarly to 'CreateXMLHttpRequestObject' and I make that function support multiple browsers. The technique that's used in Atlas is they are adding the 'window.XMLHttpRequest' object if it doesn't already exist. This allows for your AJAX code to support multiple browsers more easily by making it so you don't need to change your code to support Internet Explorer. And your code will still work in IE7 because IE7 natively supports the 'window.XMLHttpRequest' object. Very nice guys!</p>
<p>Below is the above mentioned chunk of JS code for your viewing pleasure:</p>
<p>//-----------------------------------------------------------------------<br />// Copyright (C) Microsoft Corporation. All rights reserved.<br />//-----------------------------------------------------------------------<br />// Atlas.js<br />// Atlas Framework.<br />//<br />if (!window.XMLHttpRequest) {<br />&nbsp;&nbsp;&nbsp; window.XMLHttpRequest = function() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var progIDs = [ 'Msxml2.XMLHTTP', 'Microsoft.XMLHTTP' ];<br />&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var i = 0; i &lt; progIDs.length; i++) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var xmlHttp = new ActiveXObject(progIDs[i]);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xmlHttp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; catch (ex) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return null;<br />&nbsp;&nbsp;&nbsp; }<br />}</p>
<p>&nbsp;</p>
<p>Remember the above code is technically copyrighted to Microsoft and is part of the Atlas Framework.</p>
<p><a href="http://atlas.asp.net">ASP.NET Atlas Framwork</a></p>
