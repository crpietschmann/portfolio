---
layout: post
blogengineid: 7847c5f4-64eb-4ca3-9c15-9992806d9aa2
title: "JavaScript Function Tips and Tricks"
date: 2008-02-25 17:45:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/02/25/JavaScript-Function-Tips-and-Tricks
  - /post/2008/02/25/javascript-function-tips-and-tricks
  - /post.aspx?id=7847c5f4-64eb-4ca3-9c15-9992806d9aa2
---
<!-- more -->

First, What is a JavaScript Function? As defined by W3Schools.com a JavaScript Function is:

*"A function is a reusable code-block that will be executed by an event, or when the function is called."* - <a href="http://www.w3schools.com/js/js_functions.asp">http://www.w3schools.com/js/js_functions.asp</a>

You're probably thinking, "Well, Yeah. I knew that." But, how much do you really know about JavaScript Functions?

**JavaScript Function uses you already know**

Here's the most basic ways of using functions to get things done that most web developers are familiar with:

```javascript

/// Function that performs an action 
 function Test1()
 {
     alert("Test1");
 }
 
 /// Function that accepts arguments and performs an action
 function Test2(a, b)
 {
     alert(a + b);
 }

/// Function that returns returns a value
 function Test3(a, b)
 {
     return a + b;
 }

```

**Ok, but what else could there be?**

Well, actually there are a couple more Function usages that most web developers aren't familiar with.
 
 To test your knowledge of JavaScript Functions, take the following quiz:

1) Is it possible to write a JavaScript Function "in-line"?
 2) Is it possible to overload a JavaScript Function?
 3) Is it possible to call a JavaScript Function Asynchronously?

If you answered "Yes" to all three questions, then you're probably familiar with the tips listed in this article. If not, definitely read on.

**In-Line JavaScript Functions**

You can write JavaScript Function "in-line".

```javascript

var myFunction = function(a, b){ return a + b; };
 
 /// This actually does the exact same as the following:
 function myFunction(a, b)
 {
     return a + b;
 }

```

You can also use "in-line" function to define custom functions for use within a specific context. This allows you to reference variables within the context that the "in-line" function was defined without having to actually pass them as arguments.

```javascript

function AddNumbers(a, b)
 {
     var add = function(){ return a + b; };
 
     return add();
 }

```

**JavaScript Function Overloading**

If you're a .NET developer, then you're definitely used to overloading methods so you can pass in different combinations of arguments. Contrary to popular belief, JavaScript does support this. It's just in a different way.

The "arguments" variable within a Function is an Array that contains all the arguments that were passed in. You can use this to define your function "overloads".

```javascript

function Test()
 {
     /// Check how many arguments were passed in.
     alert("There were " + arguments.length + " argument(s) passed in.");
 }

```

Here's an implementation of the above AddNumbers function that will add any number of values.

```javascript

function AddNumbers()
 {
     var r = 0;
     for(var i = 0; i < arguments.length; i++)
     {
         r += arguments[i];
     }
     return r;
 }

```

You can also do some basic Type checking in JavaScript to overload your function for different object types.

```javascript

function Test(a)
 {
     /// Get the Type of the object passed in
     var t = typeof(a);
 
     /// Execute different code depending on the type passed in
     switch (t)
     {
         case "number":
             /// Number Type Overload Stuff Here
             break;
         case "string":
             /// StringType Overload Stuff Here
             break;
         case "boolean":
             /// Boolean Type Overload Stuff Here
             break;
         case "object":
             /// Object Type Overload Stuff Here
             break;
         default:
             alert("No overload exists for this object type: " + t);
     }
 
 }

```

**Calling JavaScript Function Asynchronously**

One trick with JavaScript Functions is that you can essentially call them asynchronously by using Timeouts.

```javascript

function AddNumbers(a, b)
 {
     alert(a + b);
 }
 
 /// Call AddNumbers Asynchronously
 window.setTimeout("AddNumbers(5, 10);", 1);

```

One thing to remember when executing functions asynchronously in JavaScript, is all other JavaScript execution in the page halts until a function call is completed. This is how all the current browsers execute JavaScript, and can cause real performance issues if you are trying to call too many things asynchronously at the same time. A long running function will actually "lock up" the browser for the user. The same is true for synchronous function calls too.

Another trick when calling function asynchronously is to pass in a callback function so your code can be notified when the function call is finished executing.

```javascript

var asyncArguments = null;
 var asyncCallback = null;
 
 function AddNumbers(a, b, callback)
 {
     // Save a reference to the arguments
     asyncArguments = arguments;

    // Save a reference to the callback function
     asyncCallback = callback;

    // Call Function Asynchronously
     window.setTimeout("AsynchronousAddNumbers();", 1);
 }

function AsynchronousAddNumbers()
 {
     // This is call asynchonously by AddNumbers, and then
     // calls the callback function when completed and passes
     // it the results.
     asyncCallback(asyncArguments[0] + asyncArguments[1]);
 }

function AddNumbersCallback(result)
 {
     // This gets called when AddNumbers is completed asynchronously
     alert(result);
 }

/// TO USE:

/// Call AddNumbers to do our addition asynchronously
 /// and pass it the callback function to call when done
 AddNumbers(5, 10, AddNumbersCallback);

```

**Conclusion**

In this article we covered some tips and tricks of using JavaScript Functions. Using these tips, you'll be able to write functions that are more reusable and flexible.

If you have any additional tips, feel free to post them in the comments.
