---
layout: post
blogengineid: d03762d3-5282-49b1-b774-c8f6bb3e8605
title: "SQL Azure: Calculate Database Usage Percentage of Max Size"
date: 2013-03-10 14:24:51 -0500
comments: true
published: true
categories: ["Azure", "SQL", "Database"]
tags: ["Azure", "SQL"]
redirect_from: 
  - /post/2013/03/10/SQL-Azure-Calculate-Database-Usage-Percentage-of-Max-Size.aspx
  - /post/2013/03/10/SQL-Azure-Calculate-Database-Usage-Percentage-of-Max-Size
  - /post/2013/03/10/sql-azure-calculate-database-usage-percentage-of-max-size
  - /post.aspx?id=d03762d3-5282-49b1-b774-c8f6bb3e8605
---

Some times it can be useful to programmatically monitor your SQL Azure database usage statistics. Luckily, there is some short SQL code that can be run on the database to check how much disk space is currently used and what the currently allotted max database size is. The following script does just that.  

```sql
DECLARE @dbName nvarchar(255) = '{database_name}';

DECLARE @Max BIGINT = CONVERT(BIGINT,
    (SELECT DATABASEPROPERTYEX(@dbName , 'MaxSizeInBytes')));
DECLARE @Used BIGINT = (
    SELECT TOP 1 SUM(reserved_page_count) * 8192
    FROM sys.dm_db_partition_stats);

SELECT @Used AS [Currently Used],
       @Max AS [Max Alloted],
       (CONVERT(FLOAT, @Used) / CONVERT(FLOAT, @Max) * 100) AS [Percent Used]
```

To use the above script, just change the string “{database_name}” to be the name of the database your running this on. Also, this script must be run directly on the database you are checking.

Also, here’s a sample of the output from this query in SQL Management Studio:

<a href="/files/SQLAzure_CalcDBUsagePercentage.png"><img title="SQLAzure_CalcDBUsagePercentage" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="SQLAzure_CalcDBUsagePercentage" src="/files/SQLAzure_CalcDBUsagePercentage_thumb.png" width="328" height="81" /></a>
