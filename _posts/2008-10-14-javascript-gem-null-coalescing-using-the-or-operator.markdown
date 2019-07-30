---
layout: post
blogengineid: fb118562-11e5-4287-8fd4-214b2ab5b0ca
title: "JavaScript: Null Coalesce using the || Operator"
date: 2008-10-14 09:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/10/14/JavaScript-Gem-Null-Coalescing-using-the-OR-Operator
  - /post/2008/10/14/javascript-gem-null-coalescing-using-the-or-operator
  - /post.aspx?id=fb118562-11e5-4287-8fd4-214b2ab5b0ca
---
<!-- more -->

I recently purchased <a href="https://amzn.to/2XtWRz6">JavaScript: The Good Parts by Douglas Crockford</a>, and I found this little gem on page 21, although he listed it in the section *Objects - Retrieval*.

**It is possible to use Null Coalescing in JavaScript by using the `||` operator!**

```javascript
// Note: only this code example is quoted from the book

var middle = stooge["middle-name"] || "(none)";

var status = flight.status || "unknown";
```

Since JavaScript returns a boolean value of *true* when your looking at a variable that is not set to* null* or *undefined*, you can use the `||` (or) operator to do null coalescing. Basically, as long as the first value is not *null* or *undefined* it's returned, otherwise the second value is returned. This really simplifies the process of getting object property values when you need to use a default value if it's not set yet, and keeps you from needing to use an if statement.

{% include embedad.html %}

Below is an example of what I used to do Previous to learning this trick: 

```javascript
var middle = (stooge["middle-name"] != null ? stoog["middle-name"] : "(none)");

var status = (flight.status != null ? flight.status : "unknown");
```

This new trick makes the code much easier to read, and checks for *undefined *also so I no longer need to worry about the value being equal to *undefined* in some rare circumstance.

### Reference:

JavaScript: The Good Parts by Douglas Crockford. Copyright 2008 Yahoo! inc., 978-0-596-51774-8.
