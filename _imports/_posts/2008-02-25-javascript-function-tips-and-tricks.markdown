---
layout: post
id: 7847c5f4-64eb-4ca3-9c15-9992806d9aa2
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
<p>First, What is a JavaScript Function? As defined by W3Schools.com a JavaScript Function is:</p>
<p><em>"A function is a reusable code-block that will be executed by an event, or when the function is called."</em> - <a href="http://www.w3schools.com/js/js_functions.asp">http://www.w3schools.com/js/js_functions.asp</a></p>
<p>You're probably thinking, "Well, Yeah. I knew that." But, how much do you really know about JavaScript Functions?</p>
<p><strong>JavaScript Function uses you already know</strong></p>
<p>Here's the most basic ways of using functions to get things done that most web developers are familiar with:</p>
<p>[code:js]</p>
<p>///&nbsp;Function that performs an action&nbsp;<br /> function Test1()<br /> {<br /> &nbsp;&nbsp;&nbsp; alert("Test1");<br /> }<br /> <br /> /// Function that accepts arguments and performs an action<br /> function Test2(a, b)<br /> {<br /> &nbsp;&nbsp;&nbsp; alert(a + b);<br /> }</p>
<p>/// Function that returns returns a value<br /> function Test3(a, b)<br /> {<br /> &nbsp;&nbsp;&nbsp; return a + b;<br /> }</p>
<p>[/code]</p>
<p><strong>Ok, but what else could there be?</strong></p>
<p>Well, actually there are&nbsp;a couple more Function usages that most web developers aren't familiar with.<br /> <br /> To test your knowledge of JavaScript Functions, take the following quiz:</p>
<p>1) Is it possible to write a JavaScript Function "in-line"?<br /> 2) Is it possible to overload a JavaScript Function?<br /> 3) Is it possible to call a JavaScript Function Asynchronously?</p>
<p>If you answered "Yes" to all three questions, then you're probably familiar with the tips listed in this article. If not, definitely read on.</p>
<p><strong>In-Line JavaScript Functions</strong></p>
<p>You can write JavaScript Function "in-line".</p>
<p>[code:js]</p>
<p>var myFunction = function(a, b){ return a + b; };<br /> <br /> /// This actually does the exact same as the following:<br /> function myFunction(a, b)<br /> {<br /> &nbsp;&nbsp;&nbsp; return a + b;<br /> }</p>
<p>[/code]</p>
<p>You can also use "in-line" function to define custom functions for use within a specific context. This allows you to reference variables within the context that the "in-line" function was defined without having to actually pass them as arguments.</p>
<p>[code:js]</p>
<p>function AddNumbers(a, b)<br /> {<br /> &nbsp;&nbsp;&nbsp; var add = function(){ return a + b; };<br /> <br /> &nbsp;&nbsp;&nbsp; return add();<br /> }</p>
<p>[/code]</p>
<p><strong>JavaScript Function Overloading</strong></p>
<p>If you're a .NET developer, then you're definitely used to overloading methods so you can pass in different combinations of arguments. Contrary to popular belief, JavaScript does support this. It's just in a different way.</p>
<p>The "arguments" variable within a Function is an Array that&nbsp;contains all the arguments that were passed in. You can use this to define your function&nbsp;"overloads".</p>
<p>[code:js]</p>
<p>function Test()<br /> {<br /> &nbsp;&nbsp;&nbsp; /// Check&nbsp;how&nbsp;many arguments were passed in.<br /> &nbsp;&nbsp;&nbsp; alert("There were " + arguments.length + " argument(s) passed in.");<br /> }</p>
<p>[/code]</p>
<p>Here's an implementation of the above AddNumbers function that will add any number of values.</p>
<p>[code:js]</p>
<p>function AddNumbers()<br /> {<br /> &nbsp;&nbsp;&nbsp; var r = 0;<br /> &nbsp;&nbsp;&nbsp; for(var i = 0; i &lt; arguments.length; i++)<br /> &nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r += arguments[i];<br /> &nbsp;&nbsp;&nbsp; }<br /> &nbsp;&nbsp;&nbsp; return r;<br /> }</p>
<p>[/code]</p>
<p>You can also do some basic Type checking in JavaScript to overload your function for different object types.</p>
<p>[code:js]</p>
<p>function Test(a)<br /> {<br /> &nbsp;&nbsp;&nbsp; /// Get the Type of the object passed in<br /> &nbsp;&nbsp;&nbsp; var t = typeof(a);<br /> <br /> &nbsp;&nbsp;&nbsp; /// Execute different code depending on the type passed in<br /> &nbsp;&nbsp;&nbsp; switch (t)<br /> &nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; case "number":<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /// Number Type&nbsp;Overload Stuff Here<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "string":<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /// StringType&nbsp;Overload Stuff Here<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "boolean":<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /// Boolean Type&nbsp;Overload Stuff Here<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; case "object":<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /// Object Type&nbsp;Overload Stuff Here<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; default:<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; alert("No overload exists for this object type: " + t);<br /> &nbsp;&nbsp;&nbsp; }<br /> <br /> }</p>
<p>[/code]</p>
<p><strong>Calling JavaScript Function Asynchronously</strong></p>
<p>One trick with JavaScript Functions is that you can essentially call them asynchronously by using Timeouts.</p>
<p>[code:js]</p>
<p>function AddNumbers(a, b)<br /> {<br /> &nbsp;&nbsp;&nbsp; alert(a + b);<br /> }<br /> <br /> /// Call AddNumbers Asynchronously<br /> window.setTimeout("AddNumbers(5, 10);", 1);</p>
<p>[/code]</p>
<p>One thing to remember when executing functions asynchronously in JavaScript, is all other JavaScript execution in the page halts until&nbsp;a function call is completed. This is how all the current browsers execute JavaScript, and can cause real performance issues if you are trying to call too many things asynchronously at the same time. A long running function will actually "lock up" the browser for the user. The same is true for synchronous function calls too.</p>
<p>Another trick when calling function asynchronously is to pass in a callback function so your code can be notified when the function call is finished executing.</p>
<p>[code:js]</p>
<p>var asyncArguments = null;<br /> var asyncCallback = null;<br /> <br /> function AddNumbers(a, b, callback)<br /> {<br /> &nbsp;&nbsp;&nbsp; // Save a reference to the arguments<br /> &nbsp;&nbsp;&nbsp; asyncArguments = arguments;</p>
<p>&nbsp;&nbsp;&nbsp; // Save a reference to the callback function<br /> &nbsp;&nbsp;&nbsp; asyncCallback = callback;</p>
<p>&nbsp;&nbsp;&nbsp; // Call Function Asynchronously<br /> &nbsp;&nbsp;&nbsp; window.setTimeout("AsynchronousAddNumbers();", 1);<br /> }</p>
<p>function AsynchronousAddNumbers()<br /> {<br /> &nbsp;&nbsp;&nbsp; // This is call asynchonously by AddNumbers, and then<br /> &nbsp;&nbsp;&nbsp; // calls the callback function when completed and passes<br /> &nbsp;&nbsp;&nbsp; // it the results.<br /> &nbsp;&nbsp;&nbsp; asyncCallback(asyncArguments[0] + asyncArguments[1]);<br /> }</p>
<p>function AddNumbersCallback(result)<br /> {<br /> &nbsp;&nbsp;&nbsp; // This gets called when AddNumbers is completed asynchronously<br /> &nbsp;&nbsp;&nbsp; alert(result);<br /> }</p>
<p>/// TO USE:</p>
<p>/// Call AddNumbers to do our addition asynchronously<br /> /// and pass it the callback function to call when done<br /> AddNumbers(5, 10, AddNumbersCallback);</p>
<p>[/code]</p>
<p><strong>Conclusion</strong></p>
<p>In this article we covered some tips and tricks of using JavaScript Functions. Using these tips, you'll be able to write functions that are more reusable and flexible.</p>
<p>If you have any additional tips, feel free to post them in the comments.</p>
