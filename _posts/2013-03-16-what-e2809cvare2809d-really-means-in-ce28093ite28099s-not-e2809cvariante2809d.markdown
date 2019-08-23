---
layout: post
blogengineid: 208e1052-daef-4bb0-aea3-b90a9f199701
title: "What “var” really means in C#–It’s not “variant”"
date: 2013-03-16 04:57:23 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#"]
redirect_from: 
  - /post/2013/03/16/What-e2809cvare2809d-really-means-in-Ce28093Ite28099s-not-e2809cvariante2809d.aspx
  - /post/2013/03/16/What-e2809cvare2809d-really-means-in-Ce28093Ite28099s-not-e2809cvariante2809d
  - /post/2013/03/16/what-e2809cvare2809d-really-means-in-ce28093ite28099s-not-e2809cvariante2809d
  - /post.aspx?id=208e1052-daef-4bb0-aea3-b90a9f199701
---
<!-- more -->

With the release of C# 3.0 came the addition (among many others) of the “var” keyword. I’ve seen MANY people confused about what this keyword is, does and means. Among these people with incorrect assumptions to the function of the “var” keyword, I have seen programmers/developers with varying amounts / years of experience. So, I’ve decided to write up a simple explanation; actually the same one I’ve told and/or emailed people over the last couple years.  <h3>“var” is not variant!</h3>  
Since “var” is the beginning of the word “variant”, and especially since JavaScript uses “var” and is dynamically typed it is easy to assume that “var” means “variant.” Although, it is important to remember that C# is a statically typed language; which leaves no room for variant types.  
Straight from <a href="http://msdn.microsoft.com/en-us/library/bb384061.aspx">MSDN</a>:    
*”It is important to understand that the var keyword does not mean “variant” and does not indicate that the variable is loosely typed, or late-bound. It just means that the compiler determines and assigns the most appropriate type.”*  
The C# compiler wants to know what type a variable is so it can validate (at compile-time) all method calls and property accessors against the object that variable references.  
It’s also important to remember that as “var” is not “variant”, neither does it mean “dynamic.” **Variables declared using “var” are strongly typed.**  <h3>What does “var” do?</h3>  
It’s easier to think of “var” as a short-hand version of declaring your variables. Instead of defining what Type your variable is twice, you get to do it once with “var.” Take the following traditional examples:  <pre class="csharpcode"><span class="rem">// traditional variable declarations in C#</span>
<span class="rem">// using primitives</span>
<span class="kwrd">string</span> name = <span class="str">&quot;Chris&quot;</span>;
<span class="kwrd">int</span> month = 3;

<span class="rem">// using complex object</span>
Person student = <span class="kwrd">new</span> Person();</pre>
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


The above declarations are fine; they work and are easy to read. However, why must we declare that “name” is a string, or month is a int, or “student” is a Person? Since we are assigning them an initial value on declaration, **shouldn’t the compiler be able to tell what they they are implicitly?**


Actually,** YES!!** That is why the “var” keyword was introduced. Here are the same examples using the “var” keyword:

<pre class="csharpcode"><span class="rem">// variable declarations using &quot;var&quot; in C#</span>
<span class="rem">// using primitives</span>
var name = <span class="str">&quot;Chris&quot;</span>;
var month = 3;

<span class="rem">// using complex object</span>
var student = <span class="kwrd">new</span> Person();</pre>
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


Now, I must admit the use of “var” in the above primitive examples is rather trivial, but it can **save typing and reduce verbosity** for complex object types; as in the “student” example. If you must include the full namespace of the complex object type or a longer object type name will help give you more benefit of using “var.”

<pre class="csharpcode"><span class="rem">// standard (verbose)</span>
Company.Namespace.People.Person student = <span class="kwrd">new</span> Company.Namespace.People.Person();

<span class="rem">// &quot;var&quot; (easier to read)</span>
var student = <span class="kwrd">new</span> Company.Namespace.People.Person();</pre>
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


As you can see in this example, using “var” makes the variable declaration easier to read. Remember that the **compiler automatically replaces “var”** with “Company.Namespace.People.Person” in the underlying MSIL that gets executed at runtime since it “knows” (based on the assignment) that “student” is Typed as a “Person” object.

<h3>Refactoring Types is Easier with “var”</h3>


When you change the return type of a method, you generally need to modify all the code that references that method. However, using “var” makes these refactorings a tiny bit simpler.


First, take the following IPerson interface and Factory that returns an instance of Teacher:

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> Teacher {
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}

<span class="kwrd">public</span> <span class="kwrd">class</span> Student {
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}

<span class="rem">// a static factory</span>
<span class="kwrd">public</span> <span class="kwrd">static</span> Factory {
    <span class="kwrd">public</span> <span class="kwrd">static</span> Teacher GetPerson() {
        <span class="kwrd">return</span> <span class="kwrd">new</span> Teacher();
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


Using the factory is straight forward, like this:

<pre class="csharpcode"><span class="rem">// use factory</span>
Teacher myPerson = Factory.GetPerson();

<span class="rem">// set Name property</span>
myPerson.Name = <span class="str">&quot;John&quot;</span>;</pre>
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


Now, imagine that we need to change our Factory.GetPerson method from returning a Teacher instance to returning a Student instance. The code would need to be changed to this:

<pre class="csharpcode"><span class="rem">// static factory changes to this</span>
<span class="kwrd">public</span> <span class="kwrd">static</span> Factory {
    <span class="kwrd">public</span> <span class="kwrd">static</span> Student GetPerson() {
        <span class="kwrd">return</span> <span class="kwrd">new</span> Student();
    }
}

<span class="rem">// use factory</span>
Student myPerson = Factory.GetPerson();

<span class="rem">// set Name property</span>
myPerson.Name = <span class="str">&quot;John&quot;</span>;</pre>
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


Now, if we had declared “myPerson” using the “var” keyword then the compiler would know that it’s a “Teacher” in the first example and then automatically know that the second example is now a “Student.” And since they both have a “Name” string property, then changing the return type of the Factory.GetPerson method would be all that is necessary and the compiler would automatically (via “var”) change the Typing of “myPerson” implicitly.


If the following example, you could change the return Type of “Factory.GetPerson” from Teacher to Student without needing to edit the usage code at all.

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> Teacher {
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}

<span class="kwrd">public</span> <span class="kwrd">class</span> Student {
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}

<span class="rem">// a static factory</span>
<span class="kwrd">public</span> <span class="kwrd">static</span> Factory {
    <span class="kwrd">public</span> <span class="kwrd">static</span> Student GetPerson() {
        <span class="rem">// original</span>
        <span class="rem">// return new Teacher();</span>

        <span class="rem">// newly refactored return type</span>
        <span class="kwrd">return</span> <span class="kwrd">new</span> Student();
    }
}

<span class="rem">// usage code</span>
<span class="rem">// use factory</span>
var myPerson = Factory.GetPerson();

<span class="rem">// set Name property</span>
myPerson.Name = <span class="str">&quot;Steve&quot;</span>;</pre>
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


The reason the compiler automatically handles this refactoring is that our usage of the “myPerson” variable (specifically the “Name” property) is identical between the two objects so the compiler is able to implicitly handle the changes made without requiring us to change additional code other than the return type of the factory method.


*On a related note:* Yes, it would generally be best practice to use an interface or base class in the above example, but I wrote it this way to demonstrate the capabilities of how “var” can make refactoring simpler. Also, using the above example where you start with a “Teacher” object and then change it to an “IPerson” interface instead of a “Student” object as shown will exhibit the same behavior and therefore utilize the same concept of easy refactoring.


For better visualization, here’s the above refactor example using an interface:

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">interface</span> IPerson {
    <span class="kwrd">string</span> Name { get; set; }
}

<span class="kwrd">public</span> <span class="kwrd">class</span> Teacher : IPerson {
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}

<span class="kwrd">public</span> <span class="kwrd">class</span> Student : IPerson {
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}

<span class="rem">// a static factory</span>
<span class="kwrd">public</span> <span class="kwrd">static</span> Factory {
    <span class="kwrd">public</span> <span class="kwrd">static</span> IPerson GetPerson() {
        <span class="rem">// original</span>
        <span class="rem">// return new Teacher();</span>

        <span class="rem">// newly refactored return type</span>
        <span class="kwrd">return</span> <span class="kwrd">new</span> Student();
    }
}


<span class="rem">// Since &quot;var&quot; is used we can change</span>
<span class="rem">// Teacher to IPerson without needing to</span>
<span class="rem">// change this usage code.</span>

<span class="rem">// use factory</span>
var myPerson = Factory.GetPerson();

<span class="rem">// set Name property</span>
myPerson.Name = <span class="str">&quot;Steve&quot;</span>;</pre>


&#160;

<h3>Additional Reading</h3>


<a href="http://msdn.microsoft.com/en-us/library/bb383973(v=vs.110).aspx">MSDN: var (C# Reference)</a>

  
<a href="http://msdn.microsoft.com/en-us/library/bb384061.aspx">MSDN: Implicitly Typed Local Variables (C# Programming Guide)</a>
