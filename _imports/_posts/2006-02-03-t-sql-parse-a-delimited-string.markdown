---
layout: post
blogengineid: 4eaf5aa0-047d-49cd-a1ba-bca96f99e68d
title: "T-SQL: Parse a delimited string"
date: 2006-02-03 10:53:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2006/02/03/T-SQL-Parse-a-delimited-string
  - /post/2006/02/03/t-sql-parse-a-delimited-string
  - /post.aspx?id=4eaf5aa0-047d-49cd-a1ba-bca96f99e68d
---
<!-- more -->
<p>Parsing a delimeted string in T-SQL is fairly simple to do, but it does take a nice little chunk of code. I most commonly use this chunk of code when I need to pass an array from an application into a SQL Stored Procedure. The best way to implement this code into an application would be to create a SQL Function that you pass in a delimted string and it returns a table of values. This way you don't have to duplicate the code everytime you want to use it.</p>
<p>The following example parses the delimeted string and places each value into a variable of type Table. Once the values are placed into the table you can do anything you need to save/process these values.</p>
<pre class="csharpcode">--<span class="kwrd">declare</span> the list <span class="kwrd">of</span> Cities
<span class="kwrd">DECLARE</span> @CityList <span class="kwrd">varchar</span>(8000)
<span class="kwrd">SET</span> @CityList = <span class="str">'Milwaukee|Chicago|New York|Seattle|San Francisco'</span>

--<span class="kwrd">declare</span> the delimeter <span class="kwrd">between</span> <span class="kwrd">each</span> City
<span class="kwrd">DECLARE</span> @Delimeter <span class="kwrd">char</span>(1)
<span class="kwrd">SET</span> @Delimeter = <span class="str">'|'</span>

--Parse the string <span class="kwrd">and</span> insert <span class="kwrd">each</span> city <span class="kwrd">into</span> the @tblCity <span class="kwrd">table</span>
<span class="kwrd">DECLARE</span> @tblCity <span class="kwrd">TABLE</span>(City <span class="kwrd">varchar</span>(50))
<span class="kwrd">DECLARE</span> @City <span class="kwrd">varchar</span>(50)
<span class="kwrd">DECLARE</span> @StartPos <span class="kwrd">int</span>, @Length <span class="kwrd">int</span>
<span class="kwrd">WHILE</span> LEN(@CityList) &gt; 0
  <span class="kwrd">BEGIN</span>
    <span class="kwrd">SET</span> @StartPos = CHARINDEX(@Delimeter, @CityList)
    <span class="kwrd">IF</span> @StartPos &lt; 0 <span class="kwrd">SET</span> @StartPos = 0
    <span class="kwrd">SET</span> @Length = LEN(@CityList) - @StartPos - 1
    <span class="kwrd">IF</span> @Length &lt; 0 <span class="kwrd">SET</span> @Length = 0
    <span class="kwrd">IF</span> @StartPos &gt; 0
      <span class="kwrd">BEGIN</span>
        <span class="kwrd">SET</span> @City = <span class="kwrd">SUBSTRING</span>(@CityList, 1, @StartPos - 1)
        <span class="kwrd">SET</span> @CityList = <span class="kwrd">SUBSTRING</span>(@CityList, @StartPos + 1, LEN(@CityList) - @StartPos)
      <span class="kwrd">END</span>
    <span class="kwrd">ELSE</span>
      <span class="kwrd">BEGIN</span>
        <span class="kwrd">SET</span> @City = @CityList
        <span class="kwrd">SET</span> @CityList = <span class="str">''</span>
      <span class="kwrd">END</span>
    INSERT @tblCity (City) <span class="kwrd">VALUES</span>(@City)
<span class="kwrd">END</span>

--Show <span class="kwrd">all</span> Cities <span class="kwrd">in</span> the @tblCity <span class="kwrd">table</span>
<span class="kwrd">SELECT</span> * <span class="kwrd">FROM</span> @tblCity</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
