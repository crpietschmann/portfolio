---
layout: post
title: "JavaScript: Easily "Extend" an Object/Element"
date: 2009-07-29 17:03:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2009/07/29/JavaScript-Easily-Extend-an-Object-Element
 -  /post/2009/07/29/javascript-easily-extend-an-object-element
---
<!-- more -->
<p>If you use jQuery then you may be familiar with its "<a href="http://docs.jquery.com/Utilities/jQuery.extend">jQuery.extend</a>" method. The "jQuery.extend" method allows you to easily extend one object with one or more others. This is something that can really come in handy, especially when dealing with passing in "options" to a method, and needing to have them "default" to certain values.</p>
<p>For Example:</p>
<p>[code:js]</p>
<p>// "Default" to showing both Toolbar and Footer<br />var defaultOptions = { showToolbar: true, showFooter: true };</p>
<p>function MyObject = function(options){<br />&nbsp;&nbsp;&nbsp; // Create a new "opts" variable that is a copy of "defaultOptions", then apply all values from "options"<br />&nbsp;&nbsp;&nbsp; var opts = jQuery.extend({}, defaultOptions, options);<br /><br />&nbsp;&nbsp;&nbsp; // Now you have the "opts" variable that has all the "defaultOptions" values merged with the<br />&nbsp;&nbsp;&nbsp; // "options" that were passed in to the function.<br /><br />&nbsp;&nbsp;&nbsp; // Do Stuff According to "opts" defined</p>
<p>}<br />MyObject.prototype = {};</p>
<p>// Example of creating new MyObject and passing it only the values you want to override the defaults<br />var obj = new MyObject({ showFooter: false });<br />// The above line will tell the new "MyObject" to show the toolbar, but not the footer.</p>
<p>[/code]</p>
<h3>Why use this?</h3>
<p>As you can probably tell from the above example of doing this with jQuery, this really helps to simplify and reduce the amount of code you write. The benefits are smaller .js files for the browser to download, and it's just easier to read/maintain the code.</p>
<p>If you still have questions about this, then the following non-jQuery example of doing the same thing should help clear things up for you.</p>
<h3>What if I'm Not using jQuery?<br /></h3>
<p>As you can probably see, the above example can really help to keep things simple. However, if you're not using jQuery how would you do this?</p>
<p>Now the "jQuery.extend" method has some logic to make sure the resulting object is only a copy and doesn't contain any references to the original so you don't mess things up, but below is really simplified version that will get the job done in most cases.</p>
<p>[code:js]</p>
<p>// Create Global "extend" method<br />var extend = function(obj, extObj) {<br />&nbsp;&nbsp;&nbsp; if (arguments.length &gt; 2) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var a = 1; a &lt; arguments.length; a++) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(obj, arguments[a]);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; } else {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var i in extObj) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj[i] = extObj[i];<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; return obj;<br />};</p>
<p>[/code]</p>
<p>Here's some examples of using the above "extend" method:</p>
<p>[code:js]</p>
<p>var Person = function() {<br />};<br />Person.prototype = {<br />&nbsp;&nbsp;&nbsp; FirstName: null,<br />&nbsp;&nbsp;&nbsp; LastName: null<br />};&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /><br />var person1 = new Person();<br />// Set multiple object properties with a single line of code<br />extend(person1, { FirstName: "John", LastName: "Doe" });<br />alert(person1.FirstName + " " + person1.LastName);<br /><br />// Create a new Person instance and set it's properties in 1 line<br />var person2 = extend(new Person(), { FirstName: "John", LastName: "Doe" });<br />alert(person2.FirstName);<br /><br />// "clone" person2<br />var person3 = extend(new Person(), person2);<br />alert(person3.LastName);<br /><br />// "clone" person2 and add new properties<br />var person4 = extend(new Person(), person2, { Age: 18 });<br />alert(person4.FirstName + " :: " + person4.Age);</p>
<p>[/code]</p>
<p>This can also be used to more easily add new HTML Elements to a page:</p>
<p>[code:js]<br />var js = extend(document.createElement("script"), { type: "text/javascript", src: "test.js" });<br />document.body.appendChild(js);</p>
<p>//As you can see the above is simpler than the traditional method of creating a new &lt;script&gt; Element<br />var js = document.createElement("script");<br />js.type = "text/javascript";<br />js.src = "test.js";<br />document.body.appendChild(js);</p>
<p>[/code]</p>
<h3>Conclusion</h3>
<p>Now the use of the above method is actually really simple, and the end result is pretty much identical to the "jQuery.extend" method for simple tasks. If you want to have a cleaner "cloning" of the object values that get merged, then you'll probably want to use the "jQuery.extend" method or just copy it into your project if you aren't using jQuery.</p>
<p>Enjoy.</p>
