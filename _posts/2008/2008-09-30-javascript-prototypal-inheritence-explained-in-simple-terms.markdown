---
layout: post
blogengineid: 5c7d6bc1-2926-467d-a47a-5d826dbc467f
title: "JavaScript Prototypal Inheritence Explained in Simple Terms"
date: 2008-09-30 16:45:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/09/30/JavaScript-Prototypal-Inheritence-Explained-in-Simple-Terms.aspx
  - /post/2008/09/30/JavaScript-Prototypal-Inheritence-Explained-in-Simple-Terms
  - /post/2008/09/30/javascript-prototypal-inheritence-explained-in-simple-terms
  - /post.aspx?id=5c7d6bc1-2926-467d-a47a-5d826dbc467f
---

Recently, I started working on a new open source project (you'll have to wait until the first release to find out what it is), and the goal of it is to play nicely with any JavaScript Library you want to use. That means it needs to work nicely with jQuery, prototype, ASP.NET AJAX and the such. This means that I need to grow all my own code for [registering namespaces](https://pietschsoft.com/post/2007/07/10/creating-namespaces-in-javascript-is-actually-rather-simple) and using inheritance.

One major JavaScript feature that I needed a refresher on, and ultimately get figured out, is Prototypal Inheritance. Sounds fancy, right? Well, it's actually rather simple to do, but can be a little cryptic since there isn't much info out there that just shows you a really basic example of doing it. So, this is why I decided to write this post; to give a really simple example and explanation on JavaScript Prototypal Inheritance.

## Basics of Prototypal Inheritance

First, here's the really simple code:

```javascript

FirstClass = function() {
  /// Constructor
  this.test1 = `Chris`;
};

FirstClass.prototype.GetTest1 = function() { return this.test1; };

SecondClass = function() {
  /// Constructor
};

SecondClass.prototype = new FirstClass;

SecondClass.prototype.GetTest1 = function() { return &quot;SecondClass: &quot; + this.test1; };

```

First, we have the FirstClass object defined. In the constructor we are defining and setting the objects `test1` variable to `Chris`. Then a `GetTest1` function is being defined using prototype that returns the value of the `test1` variable. Now, we have a simple object that will return the test `Chris` when you execute the `GetTest1` method.

Here's an example of using the FirstClass object:

```javascript

var a = new FirstClass();

alert(a.GetTest1()); 

```

Secondly, we have our SecondClass object, that also sets a variable named `test1` and implements a GetTest1 function. This object would basically be the same, except we want to return a slightly modified string from `GetTest1` instead of returning what FirstClass returns. So, for this we need to use inheritance.

The key to prototypal inheritance is, the line that reads `SecondClass.prototype = new FirstClass`. This basically takes a copy of FirstClass, constructor and prototype stuff, and sets SecondClass's prototype to that. Then after we do this, then we redefine the `GetTest1` method to be what we want it to be. And, now when we execute `GetTest1` it will return `SecondClass: Chris` instead of just `Chris`.

Here's an example of using the SecondClass object:

```javascript

var b = new SecondClass();

alert(b.GetTest1()); 

```

Now isn't that simple? I told you so.

## Calling Base Object Methods

Now, one thing that you're probably used to (especially if you're used to .NET) is being able to access the Base objects version of the methods. In the example above that would be `GetTest1`.

To do this, we need to grab a copy of the base objects `GetTest1` method within our SecondClass objects constructor. Then we can use this within our new `GetTest1` method.

Here's an example of doing this:

```javascript

SecondClass = function() {
  this.base_GetTest1 = FirstClass.prototype.GetTest1;
};

SecondClass.prototype = new FirstClass;

SecondClass.prototype.GetTest1 = function() {
  return "SecondClass: " + this.base_GetTest1();
};

```

Using this technique, you can easily copy any logic that the Base object used within the method and reuse it within our new method. This same technique can be used for copying methods over from other objects, not only the one that our object inherits, but if you do this you need to make sure any variables and methods it calls exist in your object.
