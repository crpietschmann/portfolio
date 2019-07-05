---
layout: post
blogengineid: adddb895-e44a-4354-b21a-eecbb5c294bf
title: "JavaScript Basics: String Contains Function"
date: 2015-09-18 06:30:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2015/09/18/JavaScript-Basics-String-Contains-Function
  - /post/2015/09/18/javascript-basics-string-contains-function
  - /post.aspx?id=adddb895-e44a-4354-b21a-eecbb5c294bf
---
<!-- more -->

In many of the server-side programming languages like C#, the String object has a "Contains" method that returns a boolean indicating if the string contains another specified string. JavaScript however does not have a ".contains" method. Fortunately, the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf" target="_blank">".indexOf" method in JavaScript</a> can easily be used to mimic or build your own ".contains" method.
<h3>Simple JavaScript String Contains Method</h3>

Here's a simple implementation of a ".contains" function that is case sensitive:

```js
function contains(value, searchFor)
{
	return (value || '').indexOf(searchFor) > -1;
}
```

Sample Usage:

```js
// returns true
var v1 = contains('one value', 'value');

// returns false
var v2 = contains('another value', 'two');
```

Something to note about the above method is that it implements a <a href="/post/2008/10/14/JavaScript-Gem-Null-Coalescing-using-the-OR-Operator">JavaScript Null Coallesce</a> to prevent the method from throwing an exception if 'null' or 'undefined' are passed in. This may or may not be necessary for your use, but most times a false result is preferred over a JavaScript exception.
<h3>Make it Ignore Case</h3>

To make it ignore case you just need to modify the function to convert the passed in strings to be either all uppercase or all lowercase. Here's a modified version that does this:

```js
function contains(value, searchFor)
{
	var v = (value || '').toLowerCase();
	var v2 = searchFor;
	if (v2) {
		v2 = v2.toLowerCase();
	}
	return v.indexOf(v2) > -1;
}
```
