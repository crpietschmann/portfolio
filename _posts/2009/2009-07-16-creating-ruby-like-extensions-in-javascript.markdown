---
layout: post
blogengineid: 091362bb-cfb5-40c8-abff-bdb4156ca837
title: "Creating Ruby-like 'Extensions' in JavaScript"
date: 2009-07-16 11:48:00 -0500
comments: true
published: true
categories: ["Ruby", "JavaScript"]
tags: ["JavaScript", "Ruby"]
redirect_from: 
  - /post/2009/07/16/Creating-Ruby-like-Extensions-in-JavaScript.aspx
  - /post/2009/07/16/Creating-Ruby-like-Extensions-in-JavaScript
  - /post/2009/07/16/creating-ruby-like-extensions-in-javascript
  - /post.aspx?id=091362bb-cfb5-40c8-abff-bdb4156ca837
---
<!-- more -->

I've been spending a little time here and there learning Ruby. I haven't dug much into Rails yet, but have mostly been just focusing on the Ruby language and what it has to offer. Ruby has some nice "helper" methods attached to it's base data types that make iterations and other simple operations even simpler. I've ported a couple of these methods over to JavaScript so I could play around with using some of these "Ruby-isms" with my favorite web-based, dynamic programming language.

Below are some example usages of each of the methods I ported over to JavaScript. Below are methods that extend the JavaScript "Array", "Number" and "String" data types. The Array "pop" and "join" methods are already Native to JavaScript and don't need any additional coding to be able to utilize them.

My favorite of these methods has to be the Array.times and String.times methods that allow you to more easily iterate over an array or repeat a string a certain number of times.

```javascript

var test = "";

(10).times(function(i) { test += i; }); // outputs - test = "0123456789"

test = "Chris".reverse(); // outputs "sirhC"

test = "Chris".upcase(); // outputs "CHRIS"
test = "ChRiS".downcase(); // outputs "chris"

test = "";
(5).upto(10, function(start, end) {
    test += this;
}); // outputs - test = "5678910"

test = "";
(10).downto(5, function(start, end) {
    test += this;
}); // outputs - test = "1098765"

test = "";
(0).step(10, 5, function(start, end, step) {
    test += this;
}); // outputs - test = "0510"

test = "";
(10).step(0, 5, function(start, end, step) {
    test += this;
}); // outputs - test = "1050"

test = "Chris".chop(); // outputs "Chri"

test = "Fish".times(3); // outputs "FishFishFish"


var a = ["Chris", "John", "Joe", "Steve"];
test = a.pop(); // <-- native JavaScript feature, same as in Ruby
test = a.join(); // <-- native JavaScript feature, same as in Ruby
test = a.join(","); // <-- native JavaScript feature, same as in Ruby


test = "";
[1, 2, "3", "Chris"].each(function(array, index) {
    test = test + this + ",";
}); // outputs - test = "1,2,3,Chris,"

test = [1, 2, 3, 4, 5].collect(function(array, index) {
    return this * 2;
}); // outputs [2, 4, 6, 8, 10]


test = [].empty(); // outputs - true
test = [1, 2].empty(); // outputs - false

// These "first" and "last" examples use the "a" array defined above
test = a.first(); // outputs "Chris"
test = a.first(2); // outputs ["Chris", "John"]
test = a.last(); // outputs "Steve"
test = a.last(2); // outputs ["Steve", "Joe"]
test = a.last(15);  // <-- if array is shorter than the length specified, it just returns the entire array
test = a.first(15); // <-- if array is shorter than the length specified, it just returns the entire array

test = a.reverse(); // <-- both Arrays and Strings can be reversed

```

Here's the code for the JavaScript "extensions" that are demonstrated above:

```javascript

Array.prototype.collect = function(f) {
    var newArray = [];
    this.each(function(array, index) {
        newArray[index] = f.apply(array[index], [array, index]);
    });
    return newArray;
};

Array.prototype.each = function(f) {
    for (var i =  0; i < this.length; i++) {
        f.apply(this[i], [this, i]);
    }
};

Array.prototype.empty = function() {
    return (this.length === 0);
};

Array.prototype.first = function(n) {
    if (n) {
        if (n > this.length) {
            return this;
        } else {
            var r = []
            for (var i = 0; i < n; i++) {
                r.push(this[i]);
            }
            return r;
        }
    } else {
        return this[0];
    }
};

Array.prototype.last = function(n) {
    if (n) {
        if (n > this.length) {
            return this;
        } else {
            var r = [];
            for (var i = this.length - n; i < this.length; i++) {
                r.push(this[i]);
            }
            return r;
        }
    } else {
        return this[this.length - 1];
    }
};

Array.prototype.reverse = function() {
    var r = [];
    for (var i = this.length - 1; i >= 0; i--) {
        r.push(this[i]);
    }
    return r;
};



Number.prototype.times = function(f) {
    for (var i = 0; i < this; i++) {
        f.apply(i, [this]);
    }
};

Number.prototype.upto = function(end, f) {
    this.step(end, 1, f);
};

Number.prototype.downto = function(end, f) {
    this.step(end, 1, f);
};

Number.prototype.step = function(end, step, f) {
    if (this <= end) {
        for (var i = this; i <= end; i += step) {
            f.apply(i, [this, end, step]);
        }
    } else {
        for (var i = this; i >= end; i -= step) {
            f.apply(i, [this, end, step]);
        }
    }
};



String.prototype.chop = function() {
    return this.substr(0, this.length - 1);
};

String.prototype.downcase = function() {
    return this.toLowerCase();
};

String.prototype.reverse = function() {
    var r = "";
    for (var i = this.length - 1; i >= 0; i--) {
        r += this.charAt(i);
    }
    return r;
};

String.prototype.times = function(n) {
    var r = "";
    for (var i = 1; i <= n; i++) {
        r += this;
    }
    return r;
};

String.prototype.upcase = function() {
    return this.toUpperCase();
};

```

 

This is just something that I was playing around with, so I thought I'd post it to share. Also, I know these methods are pretty much getting placed within the "global namespace" of the Array, Number and String data/object types, but you can't place them within a "sub-namespace" if you want to keep them as "Ruby-like" as possible. I even think that the JavaScript / ECMAScript language could probably benefit from some of the methods being added to the language specification and implemented directly within the web browsers.

If you have any thoughts on this, please post a comment.
