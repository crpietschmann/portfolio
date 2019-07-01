---
layout: post
blogengineid: 52c4845b-11a5-4522-8ff1-22a7dccc52c9
title: "Creating Namespaces in JavaScript is actually rather simple..."
date: 2007-07-10 19:31:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2007/07/10/Creating-Namespaces-in-JavaScript-is-actually-rather-simple
  - /post/2007/07/10/creating-namespaces-in-javascript-is-actually-rather-simple
  - /post.aspx?id=52c4845b-11a5-4522-8ff1-22a7dccc52c9
---
<!-- more -->


Creating Namespaces in JavaScript is rather simple due to the fact that JavaScript is a very flexible language. As far as I know all the popular Ajax frameworks do this (including the ASP.NET AJAX Extensions). Being a .NET programmer (I&#39;m assuming Java programmers would feel the same way), having classes devided up into namespaces makes code alot easier to manage.



**Here&#39;s some code that wraps up the ability to add namespaces into a namespace of it&#39;s own:**



```javascript 



/// Create the Namespace Manager that we&#39;ll use to

/// make creating namespaces a little easier.



if (typeof Namespace == &#39;undefined&#39;) var Namespace = {};

if (!Namespace.Manager) Namespace.Manager = {};



Namespace.Manager = {

 Register:function(namespace){

  namespace = namespace.split(&#39;.&#39;);



  if(!window[namespace[0]]) window[namespace[0]] = {};

  

  var strFullNamespace = namespace[0];

  for(var i = 1; i < namespace.length; i++)

  {

   strFullNamespace += &quot;.&quot; + namespace[i];

   eval(&quot;if(!window.&quot; + strFullNamespace + &quot;)window.&quot; + strFullNamespace + &quot;={};&quot;);

  }

 }

};



``` 



**Here&#39;s a sample usage of the above code to create and use an object that&#39;s placed inside a namespace:**



```javascript 



// Register our Namespace

Namespace.Manager.Register(&quot;PietschSoft.Utility.Class&quot;);



// Add the Triplet class to the namespace created above

PietschSoft.Utility.Class.Triplet = function(one, two, three)

{

 this.First = one;

 this.Second = two;

 this.Third = three;

}



// Create an instance of our Triplet class

var myTriplet = new PietschSoft.Utility.Class.Triplet(&quot;1&quot;, &quot;2&quot;, &quot;3&quot;);



// Read the values out of the properties of you Triplet class

alert(myTriplet.First + &quot;\n&quot; + myTriplet.Second + &quot;\n&quot; + myTriplet.Third);



```



 



**Why would I want this snippet?**



Well, you really don&#39;t if you use any of the popular Ajax frameworks that implement their own namespace management. But at least this gives you an idea of how it&#39;s done. Plus, using this snippet will allow you to utilize namespaces if you are hand coding everything in your app and not using an Ajax framework.

