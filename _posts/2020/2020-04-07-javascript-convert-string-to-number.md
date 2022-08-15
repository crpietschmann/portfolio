---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "JavaScript: Convert String to Number"
date: 2020-04-06 21:00:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript", "js"]
header_image: /images/header_Javascript_Tips.jpg
---

There are time when you need to convert a String to a Number in JavaScript. This can be very helpful in many situations, including when taking input from a user and passing that on to a function or object property. This article shows you how to use a short hand with the `+` operator (the quick and easy way), as well as using the `parseInt()`, `parseFloat()`, and `Number()` method for parsing string values into a number. This article also explains how each of these methods of conversion works so you have a better understanding of when the appropriate time is to use each within your own application code.

## Use the `+` operator

There exists a short hand in JavaScript for converting string values to numbers. You can use the `+` (plus) operator to do this. Now, let's walk through a journey of numbers, strings, and finally the `+` operator of converting strings to numbers in JavaScript!

The following expression will set a variable equal to the value of 1:

```javascript
var val1 = 1;
```

Now let's add a `+` in front of the 1. What do you think will happen?

```javascript
var val1 = +1;
// sets val1 to 1 as a Number
```

Since the `+` operator is a mathematical operator in JavaScirpt, it will attempt to add what ever is on the left and the right side of the operator. Since, in this case, nothing is to the left, it will add 0 (zero) to what's on the right of the operator; in this case '1'.

This will result in a Number of the value `1`; This works because when you try to add a Number to a String in JavaScript, it will automatically try to parse out the strin g into a number.

As a result this also works:

```javascript
var val1 = 4 + '1';
// returns 5 (Number)
```

However, what about when the string is not a number? Well, in this case instead of a parsed number being returned, JavaScript will return a value of `NaN` or not a number.

```javascript
var val1 = +'chris';
// return NaN
```

When you are returned a `NaN` (not a number) result in your variable, if you attempt to add another number to it the result will always be `NaN`. So, you'll always want to check if the result is `NaN` before doing something with it.

To do this, you can use the `isNaN` function in JavaScript to double check the string to number parsing worked successfully:

```javascript
var val1 = +'chris';
if (isNaN(val1)) {
    val1 = 0;
}
// returns 0 (Number)

var val2 = +'42';
if (isNaN(val2)) {
    val2 = 0;
}
// returns 42 (Number)
```

## `parseInt()` function

The `parseInt()` function in JavaScript can be used to parse a string argument and return an integer of the specified radix (the base in mathematical numeral systems).

```javascript
// Parse a simple integer (default of base 10)
var val1 = parseInt('23');
// returns 23 (Number)

// Parse a integer in base 16 format
var val2 = parseInt('0xF', 16);
// return 15 (Number)

// Parse a string that's not a number
var val3 = parseInt('test');
// returns NaN
```

What if you don't want to get a `NaN` result if the parsing of the integer failed? Well, you can easily check the result with the `isNaN` function and then handle it accordingly.

Here's a sample of how to check if the result returned from the `parseInt` function is not a number (NaN):

```javascript
var val1 = parseInt('test');

if (isNaN(val1)) {
    // do something here
    // like set it to 0 instead
    val1 = 0;
}

// returns 0 (Number)
```

Now what if you want this `isNaN` check to be automatic and built into the `parseInt` function? Well, you can't modify the built-in `parseInt` function, but you can write your own function that includes the `isNaN` check inside it.

Here's a helpful method that wraps this up with an `isNaN` (is not a number) check:

```javascript
function parseCleanInt(x, base) {
    const parsed = parseInt(x, base);
    if (isNaN(parsed)) { return 0; }
    return parsed;
}

// Parse a simple integer (default of base 10)
var val1 = parseCleanInt('23');
// returns 23 (Number)

// Parse a simple integer of base 10
var val2 = parseCleanInt('23', 10);
// returns 23 (Number)

// Parse a integer in base 16 format
var val3 = parseCleanInt('0xF', 16);
// returns 15 (Number)
```

## `parseFloat()` function

The `parseFloat()` function can be used to parse a string argument and return a floating point number.

```javascript
var val1 = parseFloat('3.14');
// returns 3.14 (Floating point number)
```

You can even pass in a string that contains non-numeric characters, as long as the string starts with the number you wish to parse:

```javascript
var val1 = parseFloat('3.14test');
// returns 3.14 (Floating point number)
```

Also, like previous methods shown, be sure to use the `isNaN` method to double check the parse compeleted successfully and you didn't get a `NaN` (not a number) result.

## `Number()` constructor

The `Number()` constructor can be used to parse a string into a number too. This function will determine, based on the string parsed, whether to return an integer or floating point number. Plus, an invalid parse will also return `NaN` too.

```javascript
var val1 = Number('42');
// returns 42 (Number)

var val2 = Number('3.14');
// return 3.14 (Floating point number)

var val3 = Number('3.14test');
// returns NaN
```

The `Number()` constructor is a little different than the other methods shown above. This is a constructor of the `Number` object type in JavaScript, and you're calling it directly htis way to creat a new object of type Number, and passing the constructor of that object the value to parse.
