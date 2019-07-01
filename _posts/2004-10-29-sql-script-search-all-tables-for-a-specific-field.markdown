---
layout: post
blogengineid: 6808cf63-ee08-4321-983a-133df4b75ebc
title: "SQL Script: Search all tables for a specific field"
date: 2004-10-29 12:36:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/10/29/SQL-Script-Search-all-tables-for-a-specific-field
  - /post/2004/10/29/sql-script-search-all-tables-for-a-specific-field
  - /post.aspx?id=6808cf63-ee08-4321-983a-133df4b75ebc
---
<!-- more -->

DECLARE @NAME_TO_SEARCH_FOR nvarchar(50)

SET @NAME_TO_SEARCH_FOR = '%photo%'

SELECT sysobjects.name AS Table_Name, syscolumns.name AS Column_Name <BR>FROM syscolumns INNER JOIN sysobjects ON syscolumns.id = sysobjects.id<BR>WHERE syscolumns.name LIKE @NAME_TO_SEARCH_FOR AND sysobjects.Type Like 'U%'
