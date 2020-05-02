---
layout: post
blogengineid: 3fab0ff2-25a5-47f2-a7b6-a1dfefb9e4c6
title: "Design Patterns: Basics of Dependency Injection"
date: 2012-04-13 14:42:29 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "Design Patterns"]
redirect_from: 
  - /post/2012/04/13/Design-Patterns-Basics-of-Dependency-Injection.aspx
  - /post/2012/04/13/Design-Patterns-Basics-of-Dependency-Injection
  - /post/2012/04/13/design-patterns-basics-of-dependency-injection
  - /post.aspx?id=3fab0ff2-25a5-47f2-a7b6-a1dfefb9e4c6
---
<!-- more -->

<a href="http://en.wikipedia.org/wiki/Dependency_injection" target="_blank">Dependency Injection</a> and <a href="http://en.wikipedia.org/wiki/Inversion_of_control" target="_blank">Inversion of Control</a> (IoC) have become popular buzz words in the .NET development world over the last couple years. However, It seems that not very many developers really know what they are. Like most design patterns they are rather simple in idea, but the various implementations can become complex to someone new to them. Also, it seems that these two are often considered that they must go together or even mistaken as the same thing. This prompted me to write up this short article to describe what Dependency Injection is.  <h3>What is Dependency Injection?</h3>  
It is very common that you will instantiate an objects properties or internal members to some value other than null within the objects constructor; thus setting up the object for use when it is created. These values are considered “dependencies” since the object depends on them in order to function. The pattern at its most basic is just passing in these dependencies to the objects constructor instead of instantiating them directly within the objects constructor. By doing this you can change the objects dependencies without needing to modify, refactor or inherit the class. Also, dependency injection doesn’t rely on IoC and can be used without it.  <h3>Basic Implementation</h3>  
Here’s a simple class that does not use dependency injection:  <pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> DataAccessLayer
{
    <span class="kwrd">public</span> DataAccessLayer()
    {
        <span class="rem">// Instantiate the needed dependency</span>
        <span class="kwrd">this</span>.Service = <span class="kwrd">new</span> DataService();
    }

    <span class="kwrd">private</span> IDataService Service { get; set; }

    <span class="kwrd">public</span> IQueryable<Person> GetOldPeople()
    {
        <span class="rem">// A method that depends on the &quot;Service&quot; property</span>
        <span class="kwrd">return</span> <span class="kwrd">this</span>.Service.People.Where(d => d.Age > 65);
    }
}</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


In the above example, you would need to modify the DataAccessLayer class in order to change the IDataService implementation that it uses. This makes Unit Testing the DataAccessLayer class extremly difficult since your tests will likely need to connect to a database in order to work.


Now, here’s the same class that uses Dependency Injection for the “Service” property:

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> DataAccessLayer
{
    <span class="kwrd">public</span> DataAccessLayer(IDataService service)
    {
        <span class="rem">// use the injected dependency</span>
        <span class="kwrd">this</span>.Service = service;
    }

    <span class="kwrd">private</span> IDataService Service { get; set; }

    <span class="kwrd">public</span> IQueryable<Person> GetOldPeople()
    {
        <span class="rem">// a method that depends on the &quot;Service&quot; property</span>
        <span class="kwrd">return</span> <span class="kwrd">this</span>.Service.People.Where(d => d.Age > 65);
    }
}</pre>


All that really changed when adding Dependency Injection was to make the constructor accept and require a reference to the desired IDataService implementation for the class to use. Now, in order to change the IDataService implementation to use you no longer need to modify the DataAccessLayer class itself.


Here’s an example of instantiating an instance of the DataAccessLayer class and passing in the desired dependency:

<pre class="csharpcode">var myservice = <span class="kwrd">new</span> DataAccessLayer(<span class="kwrd">new</span> DataService());</pre>


Lastly, you can create a parameterless constructor to give the object a “default” IDataService to use if one is not specified. This can be handy for using at runtime, while the injection is used for unit testing. Here’s the DataAccessLayer class modified to include the parameterless constructor:

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> DataAccessLayer
{
    <span class="rem">// parameterless constructor</span>
    <span class="rem">// using a &quot;default&quot; dependency</span>
    <span class="kwrd">public</span> DataAccesLayer()
        : <span class="kwrd">this</span>(<span class="kwrd">new</span> DataService())
    { }

    <span class="rem">// dependency injection constructor</span>
    <span class="kwrd">public</span> DataAccessLayer(IDataService service)
    {
        <span class="rem">// use the injected dependency</span>
        <span class="kwrd">this</span>.Service = service;
    }

    <span class="kwrd">private</span> IDataService<Person> GetOldPeople()
    {
        <span class="rem">// a method that depends on the &quot;Service&quot; property</span>
        <span class="kwrd">return</span> <span class="kwrd">this</span>.Service.People.Where(d => d.Age > 65);
    }
}</pre>

<h3>How about Unit Testing?</h3>


When unit testing the above DataAccessLayer class you can create a simple IDataService class that contains all the test data in memory instead of requiring the database to execute the tests.


Here’s an example of a simple IDataService implementation that would contain all it’s data in memory for unit testing purposes:

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> MemeryDataService : IDataService
{
    <span class="kwrd">public</span> IQueryable<Person> People
    {
        <span class="kwrd">return</span> (
                 <span class="kwrd">new</span> List<Person>()
                 {
                     <span class="kwrd">new</span> Person { ID = 1, Age = 23, FirstName = <span class="str">&quot;Bob&quot;</span>, LastName = <span class="str">&quot;Antonio&quot;</span> },
                     <span class="kwrd">new</span> Person { ID = 2, Age = 30, FirstName = <span class="str">&quot;Sue&quot;</span>, LastName = <span class="str">&quot;Antonio&quot;</span> },
                     <span class="kwrd">new</span> Person { ID = 3, Age = 70, FirstName = <span class="str">&quot;Steve&quot;</span>, LastName = <span class="str">&quot;Sanders&quot;</span> },
                 }
            ).AsQueryable();
    }
}</pre>

<h3>Conclusion</h3>


As you can see, Dependency Injection is really a simple design pattern to implement. It can be used without IoC (if desired) and doesn’t require any third party libraries or tools.
