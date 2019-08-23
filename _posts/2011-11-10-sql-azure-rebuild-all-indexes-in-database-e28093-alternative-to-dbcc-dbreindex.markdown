---
layout: post
blogengineid: e4ba6b86-79cc-4d7d-81d0-f53e35dff7ca
title: "SQL Azure: REBUILD All Indexes in Database – Alternative to DBCC DBREINDEX"
date: 2011-11-10 17:43:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["SQL"]
redirect_from: 
  - /post/2011/11/10/SQL-Azure-REBUILD-All-Indexes-in-Database-e28093-Alternative-to-DBCC-DBREINDEX.aspx
  - /post/2011/11/10/SQL-Azure-REBUILD-All-Indexes-in-Database-e28093-Alternative-to-DBCC-DBREINDEX
  - /post/2011/11/10/sql-azure-rebuild-all-indexes-in-database-e28093-alternative-to-dbcc-dbreindex
  - /post.aspx?id=e4ba6b86-79cc-4d7d-81d0-f53e35dff7ca
---
<!-- more -->

Unfortunately there are some differences between SQL Server and SQL Azure. One of these differences is that SQL Azure does not support the &ldquo;DBCC DBREINDEX&rdquo; command. Thankfully there is an alternative you can use to rebuild the indexes within your SQL Azure databases.

The alternative is to use &ldquo;ALTER INDEX&rdquo; instead.
<pre class="brush: sql; first-line: 1; tab-size: 4; toolbar: false; ">ALTER INDEX ALL ON TableName REBUILD</pre>

Here&rsquo;s an example that loops through all the tables in a database and rebuilds all their indexes:
<pre class="brush: sql; first-line: 1; tab-size: 4; toolbar: false; ">DECLARE @TableName varchar(255) 
DECLARE TableCursor CURSOR FOR 
SELECT table_name FROM information_schema.tables
WHERE table_type = 'base table'

OPEN TableCursor 
FETCH NEXT FROM TableCursor INTO @TableName 
WHILE @@FETCH_STATUS = 0 
BEGIN 
  exec('ALTER INDEX ALL ON ' + @TableName + ' REBUILD')
  FETCH NEXT FROM TableCursor INTO @TableName 
END 
CLOSE TableCursor 
DEALLOCATE TableCursor</pre>

You likely wont want to just execute this on your database as it will slow down any database access performed while rebuilding ALL the indexes. You could run this late at night, or just replace the &ldquo;exec&rdquo; with &ldquo;print&rdquo; to have it generate all the ALTER INDEX statements. Then you could run them one by one to space them out as to no affect database performance.

Rebuilding the table indexes on SQL Azure can be useful if there have been a lot of rows deleted from certain tables, since this will free up disk space used by the now deleted rows. This can result in a reduction in cost of your SQL Azure database if enough data rows have been deleted.
