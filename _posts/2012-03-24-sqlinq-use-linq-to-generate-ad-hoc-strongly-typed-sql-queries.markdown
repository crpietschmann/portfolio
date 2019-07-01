---
layout: post
title: "SQLinq: Use LINQ to generate Ad-Hoc, strongly typed SQL queries"
date: 2012-03-24 10:33:33 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "SQL"]
alias: ["/post/2012/03/24/SQLinq-Use-LINQ-to-generate-Ad-Hoc-strongly-typed-SQL-queries", "/post/2012/03/24/sqlinq-use-linq-to-generate-ad-hoc-strongly-typed-sql-queries"]
---
<!-- more -->
<p>SQLinq is a new library that allows ad-hoc SQL code to be generated at runtime in a strongly typed manner that allows for compile time validation of your SQL code.</p>  <h3>Why SQLinq?</h3>  <p>SQLinq is built with the core idea of simplicity and ease of use. SQLinq wont get in your way like other Data Access Layers will.</p>  <p>SQLinq is not so much a Data Access Layer (DAL) as it is a code generation tool. Although, it’s not a code generator like others you may be used to. If you look at Entity Framework, you’ll see a ton of C# or VB.NET code that gets generated from a complex data model defined in XML. Yes, Entity Framework gives you compile time validation of your queries, but it also can be a bit bloated (depending on your needs) and can be difficult to setup.</p>  <p>Personally, I have moved away from using Entity Framework for the most part due to the fact that it has performance issues with complex SQL queries that involve a lot of table joins and many where parameters to limit the results returned. The SQL code that Entity Framework generates generally has good performance, but Entity Framework’s performance issues can be seen when it loops through the data to instantiate the resulting object model. Because of these issues, I have mostly moved to manually writing SQL code and using straight ADO.NET for data access within the applications I build; that is at least until I created SQLinq.</p>  <p>With SQLinq there are no complex object models. You simply create Class or Interface that matches the scheme of your database table or view, and you can start querying it in a strongly typed manner.</p>  <pre class="csharpcode">IEnumerable&lt;Person&gt; data = con.Query(
    from p <span class="kwrd">in</span> SQLinq&lt;Person&gt;()
    <span class="kwrd">where</span> p.FirstName.StartsWith(<span class="str">&quot;C&quot;</span>) &amp;&amp; p.Age &gt; 21
    orderby p.FirstName
    select p
);</pre>
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

<h3>Basic SQLinq Usage</h3>

<p><strong>Step 1:</strong> Create your data object in code (like the following examples) that matches the database table or view you want to select from. It can either be a class or interface. You can also name the object and/or its properties differently than the database by using the SQLinqTable and SQLinqColumn attributes to specify their name in the database.</p>

<pre class="csharpcode">[SQLinqTable(<span class="str">&quot;PersonTable&quot;</span>)]
<span class="kwrd">public</span> <span class="kwrd">class</span> Person
{
    <span class="kwrd">public</span> Guid ID { get; set; }

    [SQLinqColumn(<span class="str">&quot;First_Name&quot;</span>)]
    <span class="kwrd">public</span> <span class="kwrd">string</span> FirstName { get; set; }

    [SQLinqColumn(<span class="str">&quot;Last_Name&quot;</span>)]
    <span class="kwrd">public</span> <span class="kwrd">string</span> LastName { get; set; }

    <span class="kwrd">public</span> <span class="kwrd">int</span> Age { get; set; }
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

<p><strong>Step 2:</strong> Use LINQ to generate the ad-hoc SQL query necessary</p>

<pre class="csharpcode">var query = from d <span class="kwrd">in</span> <span class="kwrd">new</span> SQLinq&lt;Person&gt;()
            <span class="kwrd">where</span> d.FirstName.StartsWith(<span class="str">&quot;C&quot;</span>)
                 &amp;&amp; d.Age &gt; 18
            orderby d.FirstName
            select <span class="kwrd">new</span> {
                id = d.ID,
                firstName = d.FirstName
            };</pre>

<p><strong>Step 3:</strong> Generate the SQL code and necessary query parameter key/value pairs.</p>

<pre class="csharpcode">var queryResult = query.ToSQL();

<span class="rem">// get the full SQL code</span>
var sqlCode = queryResult.ToQuery();

<span class="rem">// get the query parameters necessary to execute the above query</span>
var sqlParameters = queryResult.Parameters;</pre>

<p><strong>Step 4:</strong> Create SqlCommand and set the SQL code and query parameters.</p>

<pre class="csharpcode">var cmd = <span class="kwrd">new</span> SqlCommand(dbconnection, sqlCode);
<span class="kwrd">foreach</span>(var p <span class="kwrd">in</span> sqlParameters)
{
    cmd.Parameters.AddWithValue(p.Key, p.Value);
}
// now execute the command and get the results from the database</pre>

<h3>Now add SQLinq.Dapper</h3>

<p>SQLinq.Dapper is a small extension library that bridges SQLinq and Dapper to make querying much simpler.</p>

<p>Here’s a modified version of the above example that uses Dapper:</p>

<pre class="csharpcode">IEnumerable&lt;Person&gt; data = <span class="kwrd">null</span>;
<span class="kwrd">using</span>(IDbConnection con = GetDbConnection())
{
    con.Open();
    data = con.Query(
        from p <span class="kwrd">in</span> SQLinq&lt;Person&gt;()
        <span class="kwrd">where</span> p.FirstName.StartsWith(<span class="str">&quot;C&quot;</span>) &amp;&amp; p.Age &gt; 21
        orderby p.FirstName
        select p
    );
    con.Close();
}
// <span class="kwrd">do</span> something with the data that was returned</pre>

<h3>Install SQLinq and SQLinq.Dapper via Nuget</h3>

<p>Both SQLinq and SQLinq.Dapper are available via Nuget.</p>

<p><a href="http://nuget.org/packages/SQLinq">http://nuget.org/packages/SQLinq</a></p>

<p><a href="http://nuget.org/packages/sqlinq"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" border="0" src="http://sqlinq.codeplex.com/Download?ProjectName=sqlinq&amp;DownloadId=357830" /></a></p>

<p><a href="http://nuget.org/packages/SQLinq.Dapper">http://nuget.org/packages/SQLinq.Dapper</a></p>

<p><a href="http://nuget.org/packages/SQLinq.Dapper"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" border="0" src="http://download.codeplex.com/Download?ProjectName=sqlinq&amp;DownloadId=358422" /></a></p>

<h3>Current Limitations of SQLinq</h3>

<p>Currently the only real limitation of SQLinq is that is currently doesn’t support the ability to join multiple tables together using it. This requires you to only select data from existing database tables and/or views. However, by using a View to base your SQLinq query you can basically “pre” join different tables together for specific uses.</p>

<h3>Conclusion</h3>

<p>Personally, I think the concept of SQLinq is pretty neat and will be using it in my own projects. Although, I must admit that mixing SQLinq with other data access methods within a single application is probably best, and allows you to use the best method for your needs as they arise.</p>
