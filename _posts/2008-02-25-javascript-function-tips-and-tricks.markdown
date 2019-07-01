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

<em>"A function is a reusable code-block that will be executed by an event, or when the function is called."</em> - <a href="http://www.w3schools.com/js/js_functions.asp">http://www.w3schools.com/js/js_functions.asp</a>

You're probably thinking, "Well, Yeah. I knew that." But, how much do you really know about JavaScript Functions?

**JavaScript Function uses you already know**

Here's the most basic ways of using functions to get things done that most web developers are familiar with:

```javascript

/// Function that performs an action <br /> function Test1()<br /> {<br />     alert("Test1");<br /> }<br /> <br /> /// Function that accepts arguments and performs an action<br /> function Test2(a, b)<br /> {<br />     alert(a + b);<br /> }

/// Function that returns returns a value<br /> function Test3(a, b)<br /> {<br />     return a + b;<br /> }

```

**Ok, but what else could there be?**

Well, actually there are a couple more Function usages that most web developers aren't familiar with.<br /> <br /> To test your knowledge of JavaScript Functions, take the following quiz:

1) Is it possible to write a JavaScript Function "in-line"?<br /> 2) Is it possible to overload a JavaScript Function?<br /> 3) Is it possible to call a JavaScript Function Asynchronously?

If you answered "Yes" to all three questions, then you're probably familiar with the tips listed in this article. If not, definitely read on.

**In-Line JavaScript Functions**

You can write JavaScript Function "in-line".

```javascript

var myFunction = function(a, b){ return a + b; };<br /> <br /> /// This actually does the exact same as the following:<br /> function myFunction(a, b)<br /> {<br />     return a + b;<br /> }

```

You can also use "in-line" function to define custom functions for use within a specific context. This allows you to reference variables within the context that the "in-line" function was defined without having to actually pass them as arguments.

```javascript

function AddNumbers(a, b)<br /> {<br />     var add = function(){ return a + b; };<br /> <br />     return add();<br /> }

```

**JavaScript Function Overloading**

If you're a .NET developer, then you're definitely used to overloading methods so you can pass in different combinations of arguments. Contrary to popular belief, JavaScript does support this. It's just in a different way.

The "arguments" variable within a Function is an Array that contains all the arguments that were passed in. You can use this to define your function "overloads".

```javascript

function Test()<br /> {<br />     /// Check how many arguments were passed in.<br />     alert("There were " + arguments.length + " argument(s) passed in.");<br /> }

```

Here's an implementation of the above AddNumbers function that will add any number of values.

```javascript

function AddNumbers()<br /> {<br />     var r = 0;<br />     for(var i = 0; i &lt; arguments.length; i++)<br />     {<br />         r += arguments[i];<br />     }<br />     return r;<br /> }

```

You can also do some basic Type checking in JavaScript to overload your function for different object types.

```javascript

function Test(a)<br /> {<br />     /// Get the Type of the object passed in<br />     var t = typeof(a);<br /> <br />     /// Execute different code depending on the type passed in<br />     switch (t)<br />     {<br />         case "number":<br />             /// Number Type Overload Stuff Here<br />             break;<br />         case "string":<br />             /// StringType Overload Stuff Here<br />             break;<br />         case "boolean":<br />             /// Boolean Type Overload Stuff Here<br />             break;<br />         case "object":<br />             /// Object Type Overload Stuff Here<br />             break;<br />         default:<br />             alert("No overload exists for this object type: " + t);<br />     }<br /> <br /> }

```

**Calling JavaScript Function Asynchronously**

One trick with JavaScript Functions is that you can essentially call them asynchronously by using Timeouts.

```javascript

function AddNumbers(a, b)<br /> {<br />     alert(a + b);<br /> }<br /> <br /> /// Call AddNumbers Asynchronously<br /> window.setTimeout("AddNumbers(5, 10);", 1);

```

One thing to remember when executing functions asynchronously in JavaScript, is all other JavaScript execution in the page halts until a function call is completed. This is how all the current browsers execute JavaScript, and can cause real performance issues if you are trying to call too many things asynchronously at the same time. A long running function will actually "lock up" the browser for the user. The same is true for synchronous function calls too.

Another trick when calling function asynchronously is to pass in a callback function so your code can be notified when the function call is finished executing.

```javascript

var asyncArguments = null;<br /> var asyncCallback = null;<br /> <br /> function AddNumbers(a, b, callback)<br /> {<br />     // Save a reference to the arguments<br />     asyncArguments = arguments;

    // Save a reference to the callback function<br />     asyncCallback = callback;

    // Call Function Asynchronously<br />     window.setTimeout("AsynchronousAddNumbers();", 1);<br /> }

function AsynchronousAddNumbers()<br /> {<br />     // This is call asynchonously by AddNumbers, and then<br />     // calls the callback function when completed and passes<br />     // it the results.<br />     asyncCallback(asyncArguments[0] + asyncArguments[1]);<br /> }

function AddNumbersCallback(result)<br /> {<br />     // This gets called when AddNumbers is completed asynchronously<br />     alert(result);<br /> }

/// TO USE:

/// Call AddNumbers to do our addition asynchronously<br /> /// and pass it the callback function to call when done<br /> AddNumbers(5, 10, AddNumbersCallback);

```

**Conclusion**

In this article we covered some tips and tricks of using JavaScript Functions. Using these tips, you'll be able to write functions that are more reusable and flexible.

If you have any additional tips, feel free to post them in the comments.
