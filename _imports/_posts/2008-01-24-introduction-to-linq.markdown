---
layout: post
blogengineid: 3016b3d2-25b0-4a49-8b21-40d0c78fa88a
title: "Introduction to LINQ"
date: 2008-01-24 02:00:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["vb.net"]
redirect_from: 
  - /post/2008/01/24/Introduction-to-LINQ
  - /post/2008/01/24/introduction-to-linq
  - /post.aspx?id=3016b3d2-25b0-4a49-8b21-40d0c78fa88a
---
<!-- more -->
<h3>What is LINQ?</h3>

LINQ (Language INtegrated Query) is more than just a new method of embedding SQL queries within code. It allows to to perform Strongly Typed queries on any kind of data, just as long as the collection of data implements the IEnumerable interface.

The most important part is "Language Integrated". This allows you to more easily write queries in C# 3.0 and VB 9.0 such as:

 

<span style="color: #2b91af; font-size: x-small;">IEnumerable</span><span style="font-size: x-small;"><</span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;">> filterExample1 = </span><span style="color: #0000ff; font-size: x-small;">from</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">in</span><span style="font-size: x-small;"> people
                                                                </span><span style="color: #0000ff; font-size: x-small;">where</span><span style="font-size: x-small;"> Person.FirstName.ToUpperInvariant().StartsWith(</span><span style="color: #a31515; font-size: x-small;">"J"</span><span style="font-size: x-small;">)
</span><span style="color: #0000ff; font-size: x-small;">                                                                select</span><span style="font-size: x-small;"> Person;</span>

 

Instead of:

 

<span style="color: #2b91af; font-size: x-small;">IEnumerable</span><span style="font-size: x-small;"><</span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;">> filterExample2 = people
                                                            .Where(p => p.FirstName.ToUpperInvariant().StartsWith(</span><span style="color: #a31515; font-size: x-small;">"J"</span><span style="font-size: x-small;">))
                                                            .Select(p => p);</span>

As you can see the second option takes a little longer to write and isn't quite as easy to read as the first option or a standard SQL query. It essentially allows us to query our data in a SQL-like fashion that we're already familiar with.

The second important part of LINQ (and probably just as important) is since all you query code is written in .NET, you get the benefit of things being Strongly Types, and the compiler type checking the code at compile time. You'll no longer get strange type exceptions at run-time with LINQ that you would traditionally get if you used SQL string within your code.
<h3>There's more than one type of LINQ?</h3>

Yes, but don't get scared away just yet. The different types of LINQ are for querying different types of data. The differnet types of LINQ are as follows:
<ul>
<li>LINQ to Objects - This type is geared towards working with collections of Objects, hence the name. </li>
<li>LINQ to SQL - This type is geared towards working with data from a database. </li>
<li>LINQ to XML - This type is geared toward working with data in XML documents.</li>
</ul>

In the rest of this article we'll be using LINQ to Objects.
<h3>Basic Query Syntax</h3>

First lets look at the following example; which filters out all the Person objects with a FirstName that starts with the letter "J":

 

<span style="color: #2b91af; font-size: x-small;">IEnumerable</span><span style="font-size: x-small;"><</span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;">> filterExample1 = </span><span style="color: #0000ff; font-size: x-small;">from</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">in</span><span style="font-size: x-small;"> people
                                                                    </span><span style="color: #0000ff; font-size: x-small;">where</span><span style="font-size: x-small;"> Person.FirstName.ToUpperInvariant().StartsWith(</span><span style="color: #a31515; font-size: x-small;">"J"</span><span style="font-size: x-small;">)
</span><span style="color: #0000ff; font-size: x-small;">                                                                    select</span><span style="font-size: x-small;"> Person;</span>

 

First we declare the collection of data we're going to query from using the "from" operator, "<span style="font-size: x-small;"><span style="color: #0000ff;">from</span> <span style="color: #2b91af;">Person</span> <span style="color: #0000ff;">in</span> people</span>". "people" is our collection that inherits from IEnumerable<T> and "Person" is type of object that collection contains.

Second we define any query criteria using the "where" operator. You can define as many where clauses as necessary.

And lastly, we declare the data we're going to select using the "select" operator.

One thing to note when using LINQ: you must define the data to select Last, as compared to First with the SQL language.
<h3>Other Simple LINQ Examples</h3>

**"orderby" Operator: **The "orderby" operator allows you to sort your query results.

 

<span style="color: #2b91af; font-size: x-small;">IEnumerable</span><span style="font-size: x-small;"><</span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;">> orderByAge = </span><span style="color: #0000ff; font-size: x-small;">from</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">in</span><span style="font-size: x-small;"> people
</span><span style="color: #0000ff; font-size: x-small;">                                                                    orderby</span><span style="font-size: x-small;"> Person.Age
</span><span style="color: #0000ff; font-size: x-small;">                                                                    select</span><span style="font-size: x-small;"> Person;</span>

 

**"let" Operator: **The "let" operator allows you to declare a new variable within the scope of the query. This new variable can only be used by query clauses that are declared after the use of the "let" operator.

 

<span style="color: #2b91af; font-size: x-small;">IEnumerable</span><span style="font-size: x-small;"><</span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;">> letExample1 = </span><span style="color: #0000ff; font-size: x-small;">from</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">in</span><span style="font-size: x-small;"> people
                                                                </span><span style="color: #0000ff; font-size: x-small;">let</span><span style="font-size: x-small;"> firstname = Person.FirstName.ToUpperInvariant()
</span><span style="color: #0000ff; font-size: x-small;"><span style="color: #000000;">                                                                </span>where</span><span style="font-size: x-small;"> firstname.StartsWith(</span><span style="color: #a31515; font-size: x-small;">"J"</span><span style="font-size: x-small;">)
</span><span style="color: #0000ff; font-size: x-small;"><span style="color: #000000;">                                                                </span>select</span><span style="font-size: x-small;"> Person;</span>

 

**Select Distinct Items:** You can use the Distinct() method to grab just the distinct items in the collection.

 

<span style="color: #2b91af; font-size: x-small;">IEnumerable</span><span style="font-size: x-small;"><</span><span style="color: #2b91af; font-size: x-small;">String</span><span style="font-size: x-small;">> distinctExample2 = (</span><span style="color: #0000ff; font-size: x-small;">from</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Person</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">in</span><span style="font-size: x-small;"> people
                                                                       </span><span style="color: #0000ff; font-size: x-small;">select</span><span style="font-size: x-small;"> Person.FirstName).Distinct();</span>

 
<h3>Conclusion</h3>

As you can see, LINQ is rather simple to use the basics of. However, it is rather involved and will definately take some time to master.

For further reading:
<ul>
<li><a href="http://msdn2.microsoft.com/en-us/netframework/aa904594.aspx">The LINQ Project at MSDN</a> </li>
<li><a href="http://msdn.microsoft.com/msdnmag/issues/07/06/CSharp30/">The Evolution Of LINQ And Its Impact On The Design Of C#</a> </li>
<li><a href="http://download.microsoft.com/download/5/8/6/5868081c-68aa-40de-9a45-a3803d8134b8/standard_query_operators.doc">LINQ: Standard Query Operators</a> </li>
<li><a href="http://msdn2.microsoft.com/en-us/vcsharp/aa336746.aspx">101 C# LINQ Samples on MSDN</a> </li>
<li><a href="http://blogs.msdn.com/lukeh/archive/2007/10/01/taking-linq-to-objects-to-extremes-a-fully-linqified-raytracer.aspx">Example of LINQ to Object taken to the Extreme</a></li>
</ul>
