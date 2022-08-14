---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "JavaScript: Remove Specific Items from Array"
date: 2022-08-13 19:48:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["javascript","array","js"]
---

When writing JavaScript code, there are many use cases where working with Arrays is required. Creating arrays of values / object and receiving them from API calls is really common. [Looping through JavaScript Arrays](/post/2020/07/01/loop-through-javascript-arrays-using-for-forEach-map-functions) is a common action to perform, but removing items from a JavaScript Array you are working with is not as straight forward. In this article, we'll take a look at some methods that can be performed to allow you to make sense of removing items from an array.

The following are the JavaScript Array methods discussed in this article for removing a specific item from a JavaScript Array:

- [Remove Last Item from Array using `Array.pop` method](#pop)
- [Remove First Item from Array using `Array.shift()` method](#shift)
- [Remove Item at Specified Index from Array using `Array.splice()` method](#splice)
- [Create Array subset using the `Array.filter` method](#filter)
- [Remove All Items from Array by Setting Empty Array](#reset)

Let's dig into removing specific items from Arrays!

<span id="pop"></span>
## Remove Last Item from Array using `Array.pop()` method

The Array object in JavaScript provides methods of built-in functionality that includes the `pop()` method. This method will remove the last item of the Array and return it. If you need to work with an Array in a "last in, first out" fashion, then the `pop()` method will help your use case.

When the `pop()` method removes the "last item" from the Array, it really means the item in the Array with the highest index. This is essentially the last item in the Array.

The following is an example of using the `Array.pop()` method to retrieve and remove the last item added to the Array:

```javascript
// Example Array
var arr = ['a', 'b', 'c', 'd'];

// Remove / Retrieve Last Item from Array
var item = arr.pop();
```

In this example, the `item` variable will end up being assigned to the value of `'d'` that was the last item in the Array when the `pop()` method was called. Afterwards, the `arr` Array will still have all the other items in it, but the `'d'` item will have been removed.

<span id="shift"></span>
## Remove First Item from Array using `Array.shift()` method

The Array object in JavaScript provides methods of built-in functionality that includes the `shift()` method. This method will remove the first item of the Array and return it. If you need to work with an Array in a "first in, first out" fashion, then the `shift()` method will help your use case.

When the `shift()` method removes the "first item" from the Array, it will be removing the item in the Array with the zero (`0`) index.

The following is an example of using the `Array.shift()` method to retrieve and remove the first item in an Array:

```javascript
// Example Array
var arr = ['a', 'b', 'c', 'd'];

// Remove / Retrieve First Item from Array
var item = arr.shift();
```

In this example, the `item` variable will end up being assigned to the value of `'a'` that was the first item in the Array when the `shift()` method was called. Afterwards, the `arr` Array will still have all the other items in it, but the `'a'` item will have been removed.

<span id="splice"></span>
## Remove Item at Specified Index from Array using `Array.splice()` method

The Array object in JavaScript provides methods of built-in functionality that includes the `splice()` method. This method will remove items from an Array starting at the specified index in the Array, and ending after the number of items requested. This enables you to remove a single item or even multiple items from the Array at once.

The `Array.splice()` method has the following signature that shows the expected arguments:

```
Array.splice(startIndex, removeCount)
```

The `Array.splice()` method arguments are defined as follows:

- `startIndex` - This is the index in the Array where the item to remove is located.
- `removeCount` - This is the number of items from the Array to remove. `1` will remove a single item, and `2` or more will remove that number of items from the Array in batch.

```javascript
// Example Array
var arr = ['a', 'b', 'c', 'd']

// Remove / Retrieve Item at Index 1
var item1 = arr.splice(1, 1);
// Returns 'b'

// Example Array
var arr2 = ['a', 'b', 'c', 'd']
// Remove Retrieve 2 Items starting at Index 1
var items = arr.splice(1, 2);
// Returns Array of ['b', 'c']
```

If the `Array.splice` method is used to remove multiple items from an Array, the method will return an Array that contains those multiple items.

The `Array.splice` method can also be used to replace items in an Array with other values, however, that usage is outside the scope of this article.

<span id="filter"></span>
## Create Array subset using the `Array.filter` method

The Array object in JavaScript provides methods of built-in functionality that includes the `filter()` method. This method enables you to write a filter function that will then be used to evaluate all the items in the Array so you can return a subset Array of the original Array with just the values you need. This method doesn't modify the original Array object like the previous methods discussed in this article.

> **NOTE:** The `Array.filter()` method doesn't modify the original Array. So it doesn't really remove items from an Array. It really just enables you to select a subset of the original Array in addition to still having the original Array intact.

The `Array.filter()` method has the following signature for working with it that accepts a `function` as an argument:

```javascript
Array.filter(filterFunction)
```

The `filterFunction` argument accepted by the `Array.filter` method is expected to have the following signature, and must return `true` _(to keep the item)_ or `false` when evaluating items in the Array:

```javascript
function(element, index, array) {}
```

The `filterFunction` method signature arguments are defined as follows:

- `element` - This is the current element being processed in the Array.
- `index` - The index of the current element being processed in the Array.
- `array` - The Array that the `.filter()` method was called.

> **NOTE:** Keep in mind that when using the `Array.filter()` method that it will loop through each item in the Array in order to evaluate them all and return the subset Array of matching items. When working with large Arrays this will add execution time to your JavaScript code.

The following is a simple example of using the `Array.filter()` method to retrieve specific items from an Array:

```javascript
// Example Array
var arr = ['a', 'b', 'c', 'd', 'e', 'f'];

// Retrieve item at index 2
var item = arr.filter(function(e,i,a){
  return i === 2;
});

// Retrieve item with specific value
var item = arr.filter(function(e,i,a){
  return e == 'c';
});
```

There are obviously much more complex uses that could be done with the `Array.filter()` method. [My project named `jslinq`](https://github.com/crpietschmann/jslinq) has some implementation that uses the `Array.filter()` to enable a [C# LINQ-like (Language Integrated Query) syntax for working with Array in JavaScript](https://github.com/crpietschmann/jslinq). Not, this isn't the NPM jslinq package. I created my JavaScript library before the NPM jslinq was created, and the same / similar naming is just a strange coincidence. Anyway, my OSS project is an example of how `Array.filter()` could be used in a more powerful way than the simple example above.

<span id='reset'></span>
## Remove All Items from Array by Setting Empty Array

In JavaScript, you can always reassign a new value to variables. If you need to remove all the items from an Array at once, the quickest way to do so is to just replace the value of the variable with a new Empty Array.

The following is an example of replacing the value of a variable with a new Empty Array, having the affect of removing all the items from the Array at once:

```javascript
// Example Array
var arr = ['a', 'b', 'c', 'd', 'e', 'f'];

// Remove All Items from Array
arr = [];
```

Happy JavaScript coding!