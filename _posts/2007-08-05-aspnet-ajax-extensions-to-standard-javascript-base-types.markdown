---
layout: post
title: "ASP.NET AJAX: Extensions to standard JavaScript base types"
date: 2007-08-05 00:30:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "JavaScript"]
redirect_from: 
  - /post/2007/08/05/ASPNET-AJAX-Extensions-to-standard-JavaScript-base-types
  - /post/2007/08/05/aspnet-ajax-extensions-to-standard-javascript-base-types
---
<!-- more -->
<p>Working with JavaScript can be a challenge at times, and there are a number of helpful things that the ASP.NET AJAX Extensions are bringing to the table. One of the things it does is extend some of the standard JavaScript base types with additional functionality. This is actually rather neat, and is something that you may not find unless you dig through the ASP.NET AJAX documentation like I did.</p>
<p><br /> <strong><span style="font-size: medium;">Array</span></strong></p>
<p>There are a number of extensions made to the Array base type, including "add", "remove" and "clear" functions that allow you to interact with your JavaScript Arrays much more like they are actually collections. This is my favorite Extension that they've added since Arrays are used so frequently with JavaScript.</p>
<p><strong>Example Usage:</strong> <br /> <em>var myArray = new Array();</em></p>
<p><em>// Add some elements to the Array<br /> Array.add(myArray, "String One");<br /> Array.add(myArray, "2");</em></p>
<p><em>// Remove an element from the Arrray<br /> Array.remove(myArray, "2");</em></p>
<p><em>// Clear all elements from the Array<br /> Array.clear(myArray);</em></p>
<p>Another neat extension to the Array base type, is the "forEach" function. This function allows you to loop through the Array and execute some code on each of its elements. What makes this extension really nice it the fact that you don't need to use an iterator to loop through; it does that tedious stuff for you.</p>
<p><strong>Example Usage:<br /> </strong><em>var m = ['1','20','40'];</em></p>
<p><em>function appendPercentSign(element, index, array)<br /> {<br /> &nbsp;&nbsp;&nbsp; array[index] += '%';<br /> }</em></p>
<p><em>Array.forEach(m, appendPercentSign, this);</em></p>
<p><br /> <strong><span style="font-size: medium;">Boolean</span></strong></p>
<p>A simple but effective one that's nice is the "parse" function that is added to Boolean. This one converts the string representation of "true" or "false" to their boolean counterparts.</p>
<p><strong>Example Usage:</strong></p>
<p><em>var one = new Boolean.parse("true");</em></p>
<p>&nbsp;</p>
<p><strong><span style="font-size: medium;">Are there any problems?</span></strong></p>
<p>I don't really see any problems with the extensions that have been added. However I do have a small convenience issue with the way you use the Array extensions. These extensions are static methods that are called and you need to pass the Array instance to them. Why not a more object oriented approach?</p>
<p><strong>Current ASP.NET AJAX use of Static methods:<br /> </strong><em>var myArray = new Array();</em></p>
<p><em>Array.add(myArray, "one");<br /> Array.remove(myArray, "two");</em></p>
<p><em>function appendPercentSign(element, index, array)<br /> {<br /> &nbsp;&nbsp;&nbsp; array[index] += '%';<br /> }<br /> Array.forEach(m, appendPercentSign, this);</em></p>
<p><em>Array.clear(myArray)</em></p>
<p><br /> <strong>Propose more object oriented way:</strong><br /> <em>var myArray = new Array();</em></p>
<p><em>myArray.add("one");<br /> myArray.remove("two");</em></p>
<p><em>function appendPercentSign(element, index, array)<br /> {<br /> &nbsp;&nbsp;&nbsp; array[index] += '%';<br /> }<br /> myArray.forEach(appendPercentSign, this);</em></p>
<p><em>myArray.clear();</em></p>
<p><br /> Now don't you agree that the more object oriented approach is just easier to read? I'm not sure why they implemented these extensions the way they did, but they've got their reasons (they always do).</p>
<p>&nbsp;</p>
<p><strong><span style="font-size: medium;">Can I add my own extensions?</span></strong></p>
<p>Yes, you can, but remember the ASP.NET AJAX Extensions are necessary to add your own JavaScript Extension Methods. All it takes is a little JavaScript code that utilizes the Prototype functionality of JavaScript.</p>
<p><strong>Example to make the Array extensions more object oriented:</strong></p>
<p><br /> <em>Array.prototype.add = function(item)<br /> {<br /> &nbsp;Array.add(this, item);<br /> };<br /> Array.prototype.remove = function(item)<br /> {<br /> &nbsp;Array.remove(this, item);<br /> };<br /> Array.prototype.clear = function()<br /> {<br /> &nbsp;Array.clear(this);<br /> };<br /> Array.prototype.forEach(method, context)<br /> {<br /> &nbsp;Array.forEach(this, method, context);<br /> };</em></p>
<p>In fact JavaScript is so flexible, you can use prototyping to extend any JavaScript object type whether it's a base type or one you or a framework you are using created.</p>
<p><strong><span style="font-size: medium;">Conclusion</span></strong></p>
<p>The ASP.NET AJAX JavaScript Base Type Extensions have some nice enhancements to the existing JavaScript base types. Even though I think they could be implemented in a slightly more object oriented way, I do find the functionality they add to be very useful. It's really nice when there is functionality you can just use and it works.</p>
<p>&nbsp;</p>
<p><strong><span style="font-size: medium;">Useful, Related Links:</span></strong><br /> ASP.NET AJAX: JavaScript Base Type Extensions<br /> <a href="http://asp.net/AJAX/Documentation/Live/ClientReference/Global/JavascriptTypeExtensions/default.aspx">http://asp.net/AJAX/Documentation/Live/ClientReference/Global/JavascriptTypeExtensions/default.aspx</a></p>
<p>JScript Language Reference<br /> <a href="http://msdn2.microsoft.com/en-us/library/29f83a2c-48c5-49e2-9ae0-7371d2cda2ff">http://msdn2.microsoft.com/en-us/library/29f83a2c-48c5-49e2-9ae0-7371d2cda2ff</a></p>
<p>ASP.NET AJAX and JavaScript Tutorials<br /> <a href="http://asp.net/AJAX/Documentation/Live/tutorials/ASPNETAJAXAndJavaScriptTutorials.aspx">http://asp.net/AJAX/Documentation/Live/tutorials/ASPNETAJAXAndJavaScriptTutorials.aspx</a></p>
