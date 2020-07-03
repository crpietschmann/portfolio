---
layout: post
blogengineid: 927c0023-562d-4a51-9a96-f6cb6c587529
title: "T-SQL: Join Tables by a Field that contains a delimited string"
date: 2005-12-09 18:16:00 -0600
comments: true
published: true
categories: ["SQL"]
tags: ["General"]
redirect_from: 
  - /post/2005/12/09/T-SQL-Join-Tables-by-a-Field-that-contains-a-delimited-string.aspx
  - /post/2005/12/09/T-SQL-Join-Tables-by-a-Field-that-contains-a-delimited-string
  - /post/2005/12/09/t-sql-join-tables-by-a-field-that-contains-a-delimited-string
  - /post.aspx?id=927c0023-562d-4a51-9a96-f6cb6c587529
---

This is the first time I ran into a situation where I needed to Join two tables (one with a varchar field and one with a `varchar` field that contains pipe delimited data) so I decided to post it for other who may not know you can do this. Below is a simplified example with solution of getting all rows of the first table whos values are contained in the pipe delimited field of the second table. This is really simple to do and you don't even have to use any User-Defined Functions or Cursors to do it. And I'm sure that not all of you who may read this know that you can use LIKE in a JOIN.

```sql
SELECT City
FROM Table1
JOIN Table2 ON Table2.CityList LIKE '%' + Table1.City + '%'
```

**Table1**
- City `varchar(30)`

**Table1 Sample Data**
- West Bend
- Kewaskum
- Hartford

**Table2**
- CityList `varchar(2000)`

**Table2 Sample Data**
- West Bend|Kewaskum
- Kewaskum
- Hartford