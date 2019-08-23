---
layout: post
blogengineid: a2d820aa-2a18-491e-8552-cf6f30ff4913
title: "JavaScript: Easily 'Extend' an Object/Element"
date: 2009-07-29 17:03:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2009/07/29/JavaScript-Easily-Extend-an-Object-Element.aspx
  - /post/2009/07/29/JavaScript-Easily-Extend-an-Object-Element
  - /post/2009/07/29/javascript-easily-extend-an-object-element
  - /post.aspx?id=a2d820aa-2a18-491e-8552-cf6f30ff4913
---
<!-- more -->

If you use jQuery then you may be familiar with its "<a href="http://docs.jquery.com/Utilities/jQuery.extend">jQuery.extend</a>" method. The "jQuery.extend" method allows you to easily extend one object with one or more others. This is something that can really come in handy, especially when dealing with passing in "options" to a method, and needing to have them "default" to certain values.

For Example:

```javascript

// "Default" to showing both Toolbar and Footer
var defaultOptions = { showToolbar: true, showFooter: true };

function MyObject = function(options){
    // Create a new "opts" variable that is a copy of "defaultOptions", then apply all values from "options"
    var opts = jQuery.extend({}, defaultOptions, options);

    // Now you have the "opts" variable that has all the "defaultOptions" values merged with the
    // "options" that were passed in to the function.

    // Do Stuff According to "opts" defined

}
MyObject.prototype = {};

// Example of creating new MyObject and passing it only the values you want to override the defaults
var obj = new MyObject({ showFooter: false });
// The above line will tell the new "MyObject" to show the toolbar, but not the footer.

```
<h3>Why use this?</h3>

As you can probably tell from the above example of doing this with jQuery, this really helps to simplify and reduce the amount of code you write. The benefits are smaller .js files for the browser to download, and it's just easier to read/maintain the code.

If you still have questions about this, then the following non-jQuery example of doing the same thing should help clear things up for you.
<h3>What if I'm Not using jQuery?
</h3>

As you can probably see, the above example can really help to keep things simple. However, if you're not using jQuery how would you do this?

Now the "jQuery.extend" method has some logic to make sure the resulting object is only a copy and doesn't contain any references to the original so you don't mess things up, but below is really simplified version that will get the job done in most cases.

```javascript

// Create Global "extend" method
var extend = function(obj, extObj) {
    if (arguments.length > 2) {
        for (var a = 1; a < arguments.length; a++) {
            extend(obj, arguments[a]);
        }
    } else {
        for (var i in extObj) {
            obj[i] = extObj[i];
        }
    }
    return obj;
};

```

Here's some examples of using the above "extend" method:

```javascript

var Person = function() {
};
Person.prototype = {
    FirstName: null,
    LastName: null
};        

var person1 = new Person();
// Set multiple object properties with a single line of code
extend(person1, { FirstName: "John", LastName: "Doe" });
alert(person1.FirstName + " " + person1.LastName);

// Create a new Person instance and set it's properties in 1 line
var person2 = extend(new Person(), { FirstName: "John", LastName: "Doe" });
alert(person2.FirstName);

// "clone" person2
var person3 = extend(new Person(), person2);
alert(person3.LastName);

// "clone" person2 and add new properties
var person4 = extend(new Person(), person2, { Age: 18 });
alert(person4.FirstName + " :: " + person4.Age);

```

This can also be used to more easily add new HTML Elements to a page:

```javascript
var js = extend(document.createElement("script"), { type: "text/javascript", src: "test.js" });
document.body.appendChild(js);

//As you can see the above is simpler than the traditional method of creating a new <script> Element
var js = document.createElement("script");
js.type = "text/javascript";
js.src = "test.js";
document.body.appendChild(js);

```
<h3>Conclusion</h3>

Now the use of the above method is actually really simple, and the end result is pretty much identical to the "jQuery.extend" method for simple tasks. If you want to have a cleaner "cloning" of the object values that get merged, then you'll probably want to use the "jQuery.extend" method or just copy it into your project if you aren't using jQuery.

Enjoy.
