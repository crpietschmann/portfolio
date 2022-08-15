---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "Loop through JavaScript Arrays using for, forEach, and map functions"
date: 2020-07-01 08:36:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript", "js"]
header_image: /images/header_Javascript_Tips.jpg
---

All JavaScript apps from server-side Node.js to client-side code, there are many time when you need to work with JavaScript Arrays. Arrays are useful to store multiple values within a single variale. You can build them directly within your code, pass them to another function, or even receive them as part of a JSON payload from a REST API response. Arrays are a very useful construct in any programming language; certainly including JavaScript. This article takes a look at a few of the top tips and methods for working with and looping through JavaScript arrays.

For reference, here's a simple JavaScript array that will be referenced in the following code tips:

```js
var myArray = ['one','two','three'];
```

## Use `forEach` to loop through Array

The `Array` prototype (aka "object") in JavaScript contains the `forEach()` function on it. You can use this to execute specific code on each element in the array. It works by passing in a `function` (or _Callback_) that will be called for each element in the Array, with the first argument being the value from the Array.

Here's a simple example of using the `Array.prototype.forEach()` method to loop through an Array:

```js
myArray.forEach(function(item){
  // do something with item from the array
  // `item` will contain the value from the Array
});
```

The `forEach` methods **Callback** also supports a couple additional arguments that can be passed in to give you a little more power in it's usage. The first argument is the `currentValue` that will be the actual value from the Array. Here's a list of the additional arguments supported by the `forEach` function:

```
Array.prototype.forEach(
  callback(currentValue, index, array), thisArg
)
```

When passing a _Callback_ function to the `forEach` function, the minimum required argument is the `currentValue`, and you can optionally specify the rest as needed. Here's the definitions of what all the arguments are:

- `currentValue`: The current element being processed in the array.
- `index`: The index of the current element being processed in the array. _(optional)_
- `array`: The array the `forEach` was called on, so you can reference the original array the element being processed is from as necessary. _(optional)_

When calling the `forEach` functions and passing in a _Callback_ function, you can also pass in a second argument to the `forEach` function itself. You can pass in a value for the `thisArg` argument. The `thisArg` argument is used as the value of what `this` will be set to when the _Callback_ is executed as `forEach` iterates through each element in the Array. Normally, you probably wont use the `thisArg` argument, but it's there in case you need to curry a specific value for `this`; as can be necessary at times.

<!-- ad -->

## Process Array elements using `map` function

The Array prototype (aka "Object") in JavaScript also supports the `map` method. If you're familiar with Functional programming languages, then you may be familiar with the idea of a `map` function. In JavaScript, you can also use the `map` function as an alternative to the `forEach` functions. The `map` function accepts a _Callback_ function to use for processing each element in the Array, as well as a `thisArg` argument that can be used to assign a desired value to `this` when executing the _Callback_ function.

Basically, the `map` function works identically to the `forEach` function with the same argument support for `currentValue`, `index`, and `array` arguments on the _Callback_ function. Here's a similar example of using the `map` function to loop through and handle all the lements of an Array:

```js
myArray.map(function(item, index, arr) {
  // do something with item from the array
});
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
  // do something with item from the array
}
```

Within the `for` loop, in the example above, the `i` variable will contain the Index of the item in the Array. You can use the Index property of the array to retreive that specific element of the Array by it's `i` Index. Then you can execute your code to do something with that element / value of the Array.

> **Tip:** The `for` loop works in any environment JavaScript code runs. This includes the web browser, client-side, server-side, IoT, and other runtimes!


## `for ... in` loop through Elements in Array

Rather than inspecting the Array and identifying the length of how many elements exist, you can also use the `for ... in` loop to just loop through all element indexes in the Array for you. This enables you to skip the `.length` call, and even skip incrementing an index counter (such as `i++` as in the previous `for` example).

Here's an example of looping through the Array using a `for` loop without the use of an incrementor:

```js
for(var index in myArray) {
  var item = myArray[index];
  // do something with item from the array
}
```

As you can see, this example is relatively similar to the previous `for` loop example. The difference is that the JavaScript runtime will increment an indexer value for you, and go through all the element indexes within the array. This enables you to more easily loop through an array without the need to care about how many items are in the array.

Happy coding!