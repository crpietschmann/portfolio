---
layout: post
blogengineid: d03762d3-5282-49b1-b774-c8f6bb3e8605
title: "SQL Azure: Calculate Database Usage Percentage of Max Size"
date: 2013-03-10 14:24:51 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Azure", "SQL"]
redirect_from: 
  - /post/2013/03/10/SQL-Azure-Calculate-Database-Usage-Percentage-of-Max-Size
  - /post/2013/03/10/sql-azure-calculate-database-usage-percentage-of-max-size
  - /post.aspx?id=d03762d3-5282-49b1-b774-c8f6bb3e8605
---
<!-- more -->

Some times it can be useful to programmatically monitor your SQL Azure database usage statistics. Luckily, there is some short SQL code that can be run on the database to check how much disk space is currently used and what the currently allotted max database size is. The following script does just that.  <pre class="csharpcode"><span class="kwrd">DECLARE</span> @dbName nvarchar(255) = <span class="str">'{database_name}'</span>;

<span class="kwrd">DECLARE</span> @<span class="kwrd">Max</span> BIGINT = <span class="kwrd">CONVERT</span>(BIGINT,
    (<span class="kwrd">SELECT</span> DATABASEPROPERTYEX(@dbName , <span class="str">'MaxSizeInBytes'</span>)));
<span class="kwrd">DECLARE</span> @Used BIGINT = (
    <span class="kwrd">SELECT</span> <span class="kwrd">TOP</span> 1 <span class="kwrd">SUM</span>(reserved_page_count) * 8192
    <span class="kwrd">FROM</span> sys.dm_db_partition_stats);

<span class="kwrd">SELECT</span> @Used <span class="kwrd">AS</span> [Currently Used],
       @<span class="kwrd">Max</span> <span class="kwrd">AS</span> [<span class="kwrd">Max</span> Alloted],
       (<span class="kwrd">CONVERT</span>(<span class="kwrd">FLOAT</span>, @Used) / <span class="kwrd">CONVERT</span>(<span class="kwrd">FLOAT</span>, @<span class="kwrd">Max</span>) * 100) <span class="kwrd">AS</span> [<span class="kwrd">Percent</span> Used]</pre>


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


To use the above script, just change the string “{database_name}” to be the name of the database your running this on. Also, this script must be run directly on the database you are checking.


Also, here’s a sample of the output from this query in SQL Management Studio:


<a href="/images/posts/SQLAzure_CalcDBUsagePercentage.png"><img title="SQLAzure_CalcDBUsagePercentage" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="SQLAzure_CalcDBUsagePercentage" src="/images/posts/SQLAzure_CalcDBUsagePercentage_thumb.png" width="328" height="81" /></a>
