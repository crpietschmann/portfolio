---
layout: post
blogengineid: f0843935-2753-4621-b521-7d41a180c28f
title: "JavaScript ForEach Equivalent"
date: 2008-02-28 18:23:00 -0600
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/02/28/JavaScript-ForEach-Equivalent.aspx
  - /post/2008/02/28/JavaScript-ForEach-Equivalent
  - /post/2008/02/28/javascript-foreach-equivalent
  - /post.aspx?id=f0843935-2753-4621-b521-7d41a180c28f
---

One thing with the For Loop in JavaScript is it doesn't seem to be very well documented that you can use it to do an equivalent of a ForEach loop.

Here's a short example of doing the ForEach loop equivalent in JavaScript:

```js
var names = ["Chris", "Kate", "Steve"];
for(var i in names)
{
    alert(names[i]);
}
```

In the above code, the variable `i` is our iterator and by using the `in` keyword the `for` loop actually loops through all elements in the Array for us. Using this you no longer have to worry about the length of the array.

One thing to note about using this to iterate over an array is that it will not necessarily iterate over the array in the order of their index 0 to n. Basically, the order of iteration is not guaranteed.

> More Information: <a href="https://developer.mozilla.org/en/JavaScript/Reference/Statements/for...in">https://developer.mozilla.org/en/JavaScript/Reference/Statements/for...in</a>
