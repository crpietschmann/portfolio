---
layout: post
blogengineid: 0d9e4dc4-5353-4b82-9977-50d1aa34c01c
title: ".NET: How to Alias Namespaces and Data Types"
date: 2007-11-26 12:08:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
redirect_from: 
  - /post/2007/11/26/NET-How-to-Alias-Namespaces-and-Data-Types.aspx
  - /post/2007/11/26/NET-How-to-Alias-Namespaces-and-Data-Types
  - /post/2007/11/26/net-how-to-alias-namespaces-and-data-types
  - /post.aspx?id=0d9e4dc4-5353-4b82-9977-50d1aa34c01c
---
<!-- more -->

One of the little known features of .NET is that you can give complete namespaces and data types alias's that you can reference them with in code.
<h3>Aliasing Data Types</h3>

For this example we'll give a different name to the integer data type:

In VB.NET:

Imports MyInteger = System.Int32;

In C#:

using MyInteger = System.Int32;

Now to use the alias in code:

In VB.NET:

Public myVariable As MyInteger = 4;

In C#:

MyInteger myVariable = 4;
<h3>Aliasing Namespaces</h3>

For this example, lets assume we want to use an alias to rename the System namespace to Sys to its easier to type.

In VB.NET:

Imports Sys = System;

In C#

using Sys = System;

With the above alias in place, you can change this:

System.Int32 myInt = 4;

Into this:

Sys.Int32 myInt = 4;
<h3>Usage Tips</h3>

**Usage #1:** A good use of aliasing would be when you are working on a large project and you are dependant on another developer to finish their class or namespace before you can comlete a piece of your code. You can create "dummy" or stub objects and namespaces of your own and them give them an alias that is what the actual name will be when the other developer is finished. Then when they're finished, you can just take out your alias's and include their namespaces and everything will work fine. This trick allows you to still keep coding and successfully compiling without exceptions caused by the namespaces or objects not existing.

**Usage #2: **Another good use of aliasing would be if you are using Int32 in your code now, but you want to make it easier to switch to Double or Int64. Using aliasing allows you to change one line of code to change the data type that is being used.

**Usage #3:** The last usage tip and probably the best one, is to use aliasing to eliminate the confusion of Ambiguous data types when using multiple namespaces each having objects with the same name. This way you wont have to type out the entire namespace when using the ambiguous objects.

<a href="http://www.dotnetkicks.com/kick/?url=http%3a//pietschsoft.com/Blog/Post.aspx%3fPostID%3d1426"><img src="http://www.dotnetkicks.com/Services/Images/KickItImageGenerator.ashx?url=http%3a//pietschsoft.com/Blog/Post.aspx%3fPostID%3d1426&amp;bgcolor=0099FF" border="0" alt="kick it on DotNetKicks.com" /></a>
