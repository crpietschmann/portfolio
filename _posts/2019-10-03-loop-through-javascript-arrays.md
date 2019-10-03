---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "Loop through JavaScript Arrays"
date: 2019-10-03 10:36:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["Tips", "JavaScript", "js", "array"]
---

All JavaScript apps from server-side Node.js to client-side code, there are many time when you need to work with JavaScript Arrays. Arrays are useful to store multiple values within a single variale. You can build them directly within your code, pass them to another function, or even receive them as part of a JSON payload from a REST API response. Arrays are a very useful construct in any programming language; certainly including JavaScript. This article takes a look at a few of the top tips and methods for working with and looping through JavaScript arrays.

For reference, here's a simple JavaScript array that will be referenced in the following code tips:

```js
var myArray = ['one','two','three'];
```

## Loop Sequentially using `for`

The `for` keyword can be used to loop through an array sequentially. It will help you loop through each of the elements in the array, one at a time, from the beginning of the array (or zero index) to the last elemnt in the array.

Before you use the `for` keyboard to create a "for loop", you need to know how long, or how many items are in the array. You can do this with the following code:

```js
var len = myArray.length;
```

Once you have the length of the array, you can create a `for` loop to iterate through the array:

```js
for(var i = 0; i < len; i++) {
  var item = myArray[i];
  // do something
}
```

Within the `for` loop, in the example above, the `i` variable will contain the Index of the item in the Array. You can use the Index property of the array to retreive that specific element of the Array by it's `i` Index. Then you can execute your code to do something with that element / value of the Array.

### Tips on `for`

- `for` works in any environment JavaScript code runs


## 



links:
https://stackoverflow.com/questions/3010840/loop-through-an-array-in-javascript

https://www.geeksforgeeks.org/ways-iterating-array-javascript/

https://www.w3schools.com/js/js_arrays.asp

https://www.google.com/search?q=site%3Apietschsoft.com+javascript+array&oq=site%3Apietschsoft.com+javascript+array&aqs=chrome..69i57j69i58.4243j0j1&sourceid=chrome&ie=UTF-8

