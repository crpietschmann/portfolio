---
layout: post
blogengineid: 51e7a0ad-809c-40eb-8b8a-50bf49848a43
title: "JavaScript int.TryParse Equivalent"
date: 2008-01-14 21:47:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/01/14/JavaScript-intTryParse-Equivalent
  - /post/2008/01/14/javascript-inttryparse-equivalent
  - /post.aspx?id=51e7a0ad-809c-40eb-8b8a-50bf49848a43
---
<!-- more -->

One of the most handy methods in .NET is the *int.TryParse* method. It makes it really convenient when evaluating a string value as an integer. But, JavaScript has no equivalent so you need to do your own evaluation every time.

Here's a simple JavaScript method I wrote that takes the work out of evaluating a string to an integer:

```javascript
function TryParseInt(str,defaultValue) {
     var retValue = defaultValue;
     if(str !== null) {
         if(str.length > 0) {
             if (!isNaN(str)) {
                 retValue = parseInt(str);
             }
         }
     }
     return retValue;
}
```

The first parameter of the TryParseInt method is the string you want to evaluate, and the second parameter is the default value to return if the string cannot be evaluated to an integer.

Here are some example usages:

```javascript
//This will return 5
var a = TryParseInt("5", 0);
alert(a);

//This will return 0
var b = TryParseInt("5d", 0);
alert(b);

//This will return null
var c = TryParseInt("chris", null);
alert(c);
```
