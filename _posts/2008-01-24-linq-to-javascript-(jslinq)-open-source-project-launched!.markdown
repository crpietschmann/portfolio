---
layout: post
blogengineid: c7f8e44c-0ee9-41f9-b164-79b1aca705ef
title: "LINQ to JavaScript (JSLINQ) Open Source Project Launched!"
date: 2008-01-24 15:00:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/01/24/LINQ-to-JavaScript-(JSLINQ)-Open-Source-Project-Launched!.aspx
  - /post/2008/01/24/LINQ-to-JavaScript-(JSLINQ)-Open-Source-Project-Launched!
  - /post/2008/01/24/linq-to-javascript-(jslinq)-open-source-project-launched!
  - /post.aspx?id=c7f8e44c-0ee9-41f9-b164-79b1aca705ef
---
<!-- more -->

I know LINQ is still rather fresh to everyone yet, and you may not have really used it much, but I just started a new Open Source project called "<a href="http://www.codeplex.com/JSLINQ">LINQ to JavaScript</a>". Or, <a href="http://www.codeplex.com/JSLINQ">JSLINQ</a> for short. This project brings the ease of querying data collections down to the JavaScript world.

Here are some simple examples of using LINQ to JavaScript:

<span style="color: #0000ff; font-size: x-small;"> </span>

<span style="color: #0000ff; font-size: x-small;">var</span><span style="font-size: x-small;"> myList = [
{FirstName:</span><span style="color: #a31515; font-size: x-small;">"Chris"</span><span style="font-size: x-small;">,LastName:</span><span style="color: #a31515; font-size: x-small;">"Pearson"</span><span style="font-size: x-small;">},
{FirstName:</span><span style="color: #a31515; font-size: x-small;">"Kate"</span><span style="font-size: x-small;">,LastName:</span><span style="color: #a31515; font-size: x-small;">"Johnson"</span><span style="font-size: x-small;">},
{FirstName:</span><span style="color: #a31515; font-size: x-small;">"Josh"</span><span style="font-size: x-small;">,LastName:</span><span style="color: #a31515; font-size: x-small;">"Sutherland"</span><span style="font-size: x-small;">},
{FirstName:</span><span style="color: #a31515; font-size: x-small;">"John"</span><span style="font-size: x-small;">,LastName:</span><span style="color: #a31515; font-size: x-small;">"Ronald"</span><span style="font-size: x-small;">},
{FirstName:</span><span style="color: #a31515; font-size: x-small;">"Steve"</span><span style="font-size: x-small;">,LastName:</span><span style="color: #a31515; font-size: x-small;">"Pinkerton"</span><span style="font-size: x-small;">}
];

</span><span style="color: #008000; font-size: x-small;">// Select some data by passing in the clauses as Strings
</span><span style="color: #0000ff; font-size: x-small;">var</span><span style="font-size: x-small;"> test = From(myList).
                Where(</span><span style="color: #a31515; font-size: x-small;">"item.FirstName == 'Chris'"</span><span style="font-size: x-small;">).
                OrderBy(</span><span style="color: #a31515; font-size: x-small;">"item.FirstName"</span><span style="font-size: x-small;">).
                Select(</span><span style="color: #a31515; font-size: x-small;">"item.FirstName"</span><span style="font-size: x-small;">);
</span><span style="color: #008000; font-size: x-small;">
// Select some data by passing in the clauses as Methods
</span><span style="color: #0000ff; font-size: x-small;">var</span><span style="font-size: x-small;"> test2 = From(myList).
                Where(</span><span style="color: #0000ff; font-size: x-small;">function</span><span style="font-size: x-small;">(item){</span><span style="color: #0000ff; font-size: x-small;">return</span><span style="font-size: x-small;"> item.FirstName == </span><span style="color: #a31515; font-size: x-small;">'Chris'</span><span style="font-size: x-small;">;}).
                OrderBy(</span><span style="color: #0000ff; font-size: x-small;">function</span><span style="font-size: x-small;">(item){</span><span style="color: #0000ff; font-size: x-small;">return</span><span style="font-size: x-small;"> item.FirstName}).
                Select(</span><span style="color: #0000ff; font-size: x-small;">function</span><span style="font-size: x-small;">(item){</span><span style="color: #0000ff; font-size: x-small;">return</span><span style="font-size: x-small;"> item.FirstName});

</span><span style="font-size: x-small;"><span style="color: #008000; font-size: x-small;">// You can also mix the two
</span><span style="color: #0000ff; font-size: x-small;">var</span><span style="font-size: x-small;"> test3 = From(myList).
                Where(</span><span style="color: #0000ff; font-size: x-small;">function</span><span style="font-size: x-small;">(item){</span><span style="color: #0000ff; font-size: x-small;">return</span><span style="font-size: x-small;"> item.FirstName == </span><span style="color: #a31515; font-size: x-small;">'Chris'</span><span style="font-size: x-small;">;}).
                OrderBy(</span><span style="color: #a31515; font-size: x-small;">"item.FirstName"</span><span style="font-size: x-small;">).
                Select(</span><span style="color: #a31515; font-size: x-small;">"item.FirstName"</span><span style="font-size: x-small;">);</span></span>

<span style="font-size: x-small;"></span>

As you can see from the above examples JSLINQ supports two methods of defining the operator clauses:

1) You can pass in a string representation of the clause that will get evaluated to return the desired data.

2) You can pass in a method that will get evaluated to return the desired data.

By supporting both of these methods we are able to support two different, easy to write, yet powerful methods of querying any data you may have within JavaScript.

<a href="http://www.codeplex.com/JSLINQ">Go check out LINQ to JavaScript here, and download the source!</a>
