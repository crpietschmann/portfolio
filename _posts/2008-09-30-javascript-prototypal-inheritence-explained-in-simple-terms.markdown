---
layout: post
title: "JavaScript Prototypal Inheritence Explained in Simple Terms"
date: 2008-09-30 16:45:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
alias: ["/post/2008/09/30/JavaScript-Prototypal-Inheritence-Explained-in-Simple-Terms", "/post/2008/09/30/javascript-prototypal-inheritence-explained-in-simple-terms"]
---
<!-- more -->
<p>
Recently, I started working on a new open source project (you&#39;ll have to wait until the first release to find out what it is), and the goal of it is to play nicely with any JavaScript Library you want to use. That means it needs to work nicely with jQuery, prototype, ASP.NET AJAX and the such. This means that I need to grow all my own code for <a href="/post.aspx?id=52c4845b-11a5-4522-8ff1-22a7dccc52c9">registering namespaces</a> and using inheritence.
</p>
<p>
One major JavaScript feature that I needed a refresher on, and ultimately get figured out, is Prototypal Inheritence. Sounds fancy, right? Well, it&#39;s actually rather simple to do, but can be a little cryptic since there isn&#39;t much info out there that just shows you a really basic example of doing it. So, this is why I decided to write this post; to give a really simple example and explanation on JavaScript Prototypal Inheritence.
</p>
<h3>Basics of Prototypal Inheritence <br />
</h3>
<p>
First, here&#39;s the really simple code:
</p>
<p>
[code:js]
</p>
<p>
FirstClass = function() {<br />
&nbsp;&nbsp;&nbsp; /// Constructor<br />
&nbsp;&nbsp; this.test1 = &quot;Chris&quot;;<br />
};<br />
FirstClass.prototype.GetTest1 = function() { return this.test1; };<br />
<br />
SecondClass = function() {<br />
&nbsp;&nbsp;&nbsp; /// Constructor<br />
};<br />
SecondClass.prototype = new FirstClass;<br />
SecondClass.prototype.GetTest1 = function() { return &quot;SecondClass: &quot; + this.test1; };
</p>
<p>
[/code]
</p>
<p>
First, we have the FirstClass object defined. In the constructor we are defining and setting the objects &quot;test1&quot; variable to &quot;Chris&quot;. Then a &quot;GetTest1&quot; function is being defined using prototype that returns the value of the &quot;test1&quot; variable. Now, we have a simple objec that will return the test &quot;Chris&quot; when you execute the &quot;GetTest1&quot; method.
</p>
<p>
Here&#39;s an example of using the FirstClass object:
</p>
<p>
[code:js]
</p>
<p>
var a = new FirstClass();<br />
alert(a.GetTest1()); 
</p>
<p>
[/code]
</p>
<p>
Secondly, we have our SecondClass object, that also sets a variable named &quot;test1&quot; and implements a GetTest1 function. This object woud basically be the same, except we want to return a slightly modified string from &quot;GetTest1&quot; instead of returning what FirstClass returns. So, for this we need to use inheritence.
</p>
<p>
The key to prototypal inheritence is, the line that reads &quot;<strong>SecondClass.prototype = new FirstClass</strong>&quot;. This basically takes a copy of FirstClass, constructor and prototype stuff, and sets SecondClass&#39;s prototype to that. Then after we do this, then we redefine the &quot;GetTest1&quot; method to be what we want it to be. And, now when we execute &quot;GetTest1&quot; it will return &quot;SecondClass: Chris&quot; instead of just &quot;Chris&quot;.
</p>
<p>
Here&#39;s an example of using the SecondClass object:
</p>
<p>
[code:js]
</p>
<p>
var b = new SecondClass();<br />
alert(b.GetTest1()); 
</p>
<p>
[/code] 
</p>
<p>
Now isn&#39;t that simple? I told you so.
</p>
<h3>Calling Base Object Methods</h3>
<p>
Now, one thing that you&#39;re probably used to (especially if you&#39;re used to .NET) is being able to access the Base objects version of the methods. In the example above that would be &quot;GetTest1&quot;. 
</p>
<p>
To do this, we need to grab a copy of the base objects &quot;GetTest1&quot; method within our SecondClass objects constructor. Then we can use this within our new &quot;GetTest1&quot; method.
</p>
<p>
Here&#39;s an example of doing this:
</p>
<p>
[code:js]
</p>
<p>
SecondClass = function() {<br />
&nbsp;&nbsp;&nbsp; this.base_GetTest1 = FirstClass.prototype.GetTest1;<br />
};<br />
SecondClass.prototype = new FirstClass;<br />
SecondClass.prototype.GetTest1 = function() { return &quot;SecondClass: &quot; + this.base_GetTest1(); }; 
</p>
<p>
[/code]
</p>
<p>
Using this technique, you can easily copy any logic that the Base object used within the method and reuse it within our new method. This same technique can be used for copying methods over from other objects, not only the one that our object inherits, but if you do this you need to make sure any variables and methods it calls exist in your object. 
</p>
