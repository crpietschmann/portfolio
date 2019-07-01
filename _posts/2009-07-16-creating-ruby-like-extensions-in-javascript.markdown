---
layout: post
blogengineid: 091362bb-cfb5-40c8-abff-bdb4156ca837
title: "Creating Ruby-like "Extensions" in JavaScript"
date: 2009-07-16 11:48:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript", "Ruby"]
redirect_from: 
  - /post/2009/07/16/Creating-Ruby-like-Extensions-in-JavaScript
  - /post/2009/07/16/creating-ruby-like-extensions-in-javascript
  - /post.aspx?id=091362bb-cfb5-40c8-abff-bdb4156ca837
---
<!-- more -->

I've been spending a little time here and there learning Ruby. I haven't dug much into Rails yet, but have mostly been just focusing on the Ruby language and what it has to offer. Ruby has some nice "helper" methods attached to it's base data types that make iterations and other simple operations even simpler. I've ported a couple of these methods over to JavaScript so I could play around with using some of these "Ruby-isms" with my favorite web-based, dynamic programming language.

Below are some example usages of each of the methods I ported over to JavaScript. Below are methods that extend the JavaScript "Array", "Number" and "String" data types. The Array "pop" and "join" methods are already Native to JavaScript and don't need any additional coding to be able to utilize them.

My favorite of these methods has to be the Array.times and String.times methods that allow you to more easily iterate over an array or repeat a string a certain number of times.

```javascript

var test = "";<br /><br />(10).times(function(i) { test += i; }); // outputs - test = "0123456789"<br /><br />test = "Chris".reverse(); // outputs "sirhC"<br /><br />test = "Chris".upcase(); // outputs "CHRIS"<br />test = "ChRiS".downcase(); // outputs "chris"<br /><br />test = "";<br />(5).upto(10, function(start, end) {<br />    test += this;<br />}); // outputs - test = "5678910"<br /><br />test = "";<br />(10).downto(5, function(start, end) {<br />    test += this;<br />}); // outputs - test = "1098765"<br /><br />test = "";<br />(0).step(10, 5, function(start, end, step) {<br />    test += this;<br />}); // outputs - test = "0510"<br /><br />test = "";<br />(10).step(0, 5, function(start, end, step) {<br />    test += this;<br />}); // outputs - test = "1050"<br /><br />test = "Chris".chop(); // outputs "Chri"<br /><br />test = "Fish".times(3); // outputs "FishFishFish"<br /><br /><br />var a = ["Chris", "John", "Joe", "Steve"];<br />test = a.pop(); // <-- native JavaScript feature, same as in Ruby<br />test = a.join(); // <-- native JavaScript feature, same as in Ruby<br />test = a.join(","); // <-- native JavaScript feature, same as in Ruby<br /><br /><br />test = "";<br />[1, 2, "3", "Chris"].each(function(array, index) {<br />    test = test + this + ",";<br />}); // outputs - test = "1,2,3,Chris,"<br /><br />test = [1, 2, 3, 4, 5].collect(function(array, index) {<br />    return this * 2;<br />}); // outputs [2, 4, 6, 8, 10]<br /><br /><br />test = [].empty(); // outputs - true<br />test = [1, 2].empty(); // outputs - false<br /><br />// These "first" and "last" examples use the "a" array defined above<br />test = a.first(); // outputs "Chris"<br />test = a.first(2); // outputs ["Chris", "John"]<br />test = a.last(); // outputs "Steve"<br />test = a.last(2); // outputs ["Steve", "Joe"]<br />test = a.last(15);  // <-- if array is shorter than the length specified, it just returns the entire array<br />test = a.first(15); // <-- if array is shorter than the length specified, it just returns the entire array<br /><br />test = a.reverse(); // <-- both Arrays and Strings can be reversed

```

Here's the code for the JavaScript "extensions" that are demonstrated above:

```javascript

Array.prototype.collect = function(f) {<br />    var newArray = [];<br />    this.each(function(array, index) {<br />        newArray[index] = f.apply(array[index], [array, index]);<br />    });<br />    return newArray;<br />};<br /><br />Array.prototype.each = function(f) {<br />    for (var i =  0; i < this.length; i++) {<br />        f.apply(this[i], [this, i]);<br />    }<br />};<br /><br />Array.prototype.empty = function() {<br />    return (this.length === 0);<br />};<br /><br />Array.prototype.first = function(n) {<br />    if (n) {<br />        if (n > this.length) {<br />            return this;<br />        } else {<br />            var r = []<br />            for (var i = 0; i < n; i++) {<br />                r.push(this[i]);<br />            }<br />            return r;<br />        }<br />    } else {<br />        return this[0];<br />    }<br />};<br /><br />Array.prototype.last = function(n) {<br />    if (n) {<br />        if (n > this.length) {<br />            return this;<br />        } else {<br />            var r = [];<br />            for (var i = this.length - n; i < this.length; i++) {<br />                r.push(this[i]);<br />            }<br />            return r;<br />        }<br />    } else {<br />        return this[this.length - 1];<br />    }<br />};<br /><br />Array.prototype.reverse = function() {<br />    var r = [];<br />    for (var i = this.length - 1; i >= 0; i--) {<br />        r.push(this[i]);<br />    }<br />    return r;<br />};<br /><br /><br /><br />Number.prototype.times = function(f) {<br />    for (var i = 0; i < this; i++) {<br />        f.apply(i, [this]);<br />    }<br />};<br /><br />Number.prototype.upto = function(end, f) {<br />    this.step(end, 1, f);<br />};<br /><br />Number.prototype.downto = function(end, f) {<br />    this.step(end, 1, f);<br />};<br /><br />Number.prototype.step = function(end, step, f) {<br />    if (this <= end) {<br />        for (var i = this; i <= end; i += step) {<br />            f.apply(i, [this, end, step]);<br />        }<br />    } else {<br />        for (var i = this; i >= end; i -= step) {<br />            f.apply(i, [this, end, step]);<br />        }<br />    }<br />};<br /><br /><br /><br />String.prototype.chop = function() {<br />    return this.substr(0, this.length - 1);<br />};<br /><br />String.prototype.downcase = function() {<br />    return this.toLowerCase();<br />};<br /><br />String.prototype.reverse = function() {<br />    var r = "";<br />    for (var i = this.length - 1; i >= 0; i--) {<br />        r += this.charAt(i);<br />    }<br />    return r;<br />};<br /><br />String.prototype.times = function(n) {<br />    var r = "";<br />    for (var i = 1; i <= n; i++) {<br />        r += this;<br />    }<br />    return r;<br />};<br /><br />String.prototype.upcase = function() {<br />    return this.toUpperCase();<br />};

```

 

This is just something that I was playing around with, so I thought I'd post it to share. Also, I know these methods are pretty much getting placed within the "global namespace" of the Array, Number and String data/object types, but you can't place them within a "sub-namespace" if you want to keep them as "Ruby-like" as possible. I even think that the JavaScript / ECMAScript language could probably benefit from some of the methods being added to the language specification and implemented directly within the web browsers.

If you have any thoughts on this, please post a comment.
