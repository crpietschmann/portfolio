---
layout: post
blogengineid: b67ee48a-600b-45bb-980c-93b1fae64838
title: "ASP.NET AJAX: Extensions to standard JavaScript base types"
date: 2007-08-05 00:30:00 -0500
comments: true
published: true
categories: ["ASP.NET", "AJAX", "JavaScript"]
tags: ["asp.net", "JavaScript"]
redirect_from: 
  - /post/2007/08/05/ASPNET-AJAX-Extensions-to-standard-JavaScript-base-types.aspx
  - /post/2007/08/05/ASPNET-AJAX-Extensions-to-standard-JavaScript-base-types
  - /post/2007/08/05/aspnet-ajax-extensions-to-standard-javascript-base-types
  - /post.aspx?id=b67ee48a-600b-45bb-980c-93b1fae64838
---
<!-- more -->

Working with JavaScript can be a challenge at times, and there are a number of helpful things that the ASP.NET AJAX Extensions are bringing to the table. One of the things it does is extend some of the standard JavaScript base types with additional functionality. This is actually rather neat, and is something that you may not find unless you dig through the ASP.NET AJAX documentation like I did.


 **<span style="font-size: medium;">Array</span>**

There are a number of extensions made to the Array base type, including "add", "remove" and "clear" functions that allow you to interact with your JavaScript Arrays much more like they are actually collections. This is my favorite Extension that they've added since Arrays are used so frequently with JavaScript.

**Example Usage:** 
 *var myArray = new Array();*

*// Add some elements to the Array
 Array.add(myArray, "String One");
 Array.add(myArray, "2");*

*// Remove an element from the Arrray
 Array.remove(myArray, "2");*

*// Clear all elements from the Array
 Array.clear(myArray);*

Another neat extension to the Array base type, is the "forEach" function. This function allows you to loop through the Array and execute some code on each of its elements. What makes this extension really nice it the fact that you don't need to use an iterator to loop through; it does that tedious stuff for you.

**Example Usage:
 ***var m = ['1','20','40'];*

*function appendPercentSign(element, index, array)
 {
     array[index] += '%';
 }*

*Array.forEach(m, appendPercentSign, this);*


 **<span style="font-size: medium;">Boolean</span>**

A simple but effective one that's nice is the "parse" function that is added to Boolean. This one converts the string representation of "true" or "false" to their boolean counterparts.

**Example Usage:**

*var one = new Boolean.parse("true");*

 

**<span style="font-size: medium;">Are there any problems?</span>**

I don't really see any problems with the extensions that have been added. However I do have a small convenience issue with the way you use the Array extensions. These extensions are static methods that are called and you need to pass the Array instance to them. Why not a more object oriented approach?

**Current ASP.NET AJAX use of Static methods:
 ***var myArray = new Array();*

*Array.add(myArray, "one");
 Array.remove(myArray, "two");*

*function appendPercentSign(element, index, array)
 {
     array[index] += '%';
 }
 Array.forEach(m, appendPercentSign, this);*

*Array.clear(myArray)*


 **Propose more object oriented way:**
 *var myArray = new Array();*

*myArray.add("one");
 myArray.remove("two");*

*function appendPercentSign(element, index, array)
 {
     array[index] += '%';
 }
 myArray.forEach(appendPercentSign, this);*

*myArray.clear();*


 Now don't you agree that the more object oriented approach is just easier to read? I'm not sure why they implemented these extensions the way they did, but they've got their reasons (they always do).

 

**<span style="font-size: medium;">Can I add my own extensions?</span>**

Yes, you can, but remember the ASP.NET AJAX Extensions are necessary to add your own JavaScript Extension Methods. All it takes is a little JavaScript code that utilizes the Prototype functionality of JavaScript.

**Example to make the Array extensions more object oriented:**


 *Array.prototype.add = function(item)
 {
  Array.add(this, item);
 };
 Array.prototype.remove = function(item)
 {
  Array.remove(this, item);
 };
 Array.prototype.clear = function()
 {
  Array.clear(this);
 };
 Array.prototype.forEach(method, context)
 {
  Array.forEach(this, method, context);
 };*

In fact JavaScript is so flexible, you can use prototyping to extend any JavaScript object type whether it's a base type or one you or a framework you are using created.

**<span style="font-size: medium;">Conclusion</span>**

The ASP.NET AJAX JavaScript Base Type Extensions have some nice enhancements to the existing JavaScript base types. Even though I think they could be implemented in a slightly more object oriented way, I do find the functionality they add to be very useful. It's really nice when there is functionality you can just use and it works.

 

**<span style="font-size: medium;">Useful, Related Links:</span>**
 ASP.NET AJAX: JavaScript Base Type Extensions
 <a href="http://asp.net/AJAX/Documentation/Live/ClientReference/Global/JavascriptTypeExtensions/default.aspx">http://asp.net/AJAX/Documentation/Live/ClientReference/Global/JavascriptTypeExtensions/default.aspx</a>

JScript Language Reference
 <a href="http://msdn2.microsoft.com/en-us/library/29f83a2c-48c5-49e2-9ae0-7371d2cda2ff">http://msdn2.microsoft.com/en-us/library/29f83a2c-48c5-49e2-9ae0-7371d2cda2ff</a>

ASP.NET AJAX and JavaScript Tutorials
 <a href="http://asp.net/AJAX/Documentation/Live/tutorials/ASPNETAJAXAndJavaScriptTutorials.aspx">http://asp.net/AJAX/Documentation/Live/tutorials/ASPNETAJAXAndJavaScriptTutorials.aspx</a>
