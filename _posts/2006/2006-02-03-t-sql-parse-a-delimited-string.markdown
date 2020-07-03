---
layout: post
blogengineid: 4eaf5aa0-047d-49cd-a1ba-bca96f99e68d
title: "T-SQL: Parse a delimited string"
date: 2006-02-03 10:53:00 -0600
comments: true
published: true
categories: ["SQL", "SQL Server"]
tags: ["General"]
redirect_from: 
  - /post/2006/02/03/T-SQL-Parse-a-delimited-string.aspx
  - /post/2006/02/03/T-SQL-Parse-a-delimited-string
  - /post/2006/02/03/t-sql-parse-a-delimited-string
  - /post.aspx?id=4eaf5aa0-047d-49cd-a1ba-bca96f99e68d
---

Parsing a delimeted string in T-SQL is fairly simple to do, but it does take a nice little chunk of code. I most commonly use this chunk of code when I need to pass an array from an application into a SQL Stored Procedure. The best way to implement this code into an application would be to create a SQL Function that you pass in a delimted string and it returns a table of values. This way you don't have to duplicate the code everytime you want to use it.

The following example parses the delimeted string and places each value into a variable of type Table. Once the values are placed into the table you can do anything you need to save/process these values.

```sql
--declare the list of Cities
DECLARE @CityList varchar(8000)
SET @CityList = 'Milwaukee|Chicago|New York|Seattle|San Francisco'

--declare the delimeter between each City
DECLARE @Delimeter char(1)
SET @Delimeter = '|'

--Parse the string and insert each city into the @tblCity table
DECLARE @tblCity TABLE(City varchar(50))
DECLARE @City varchar(50)
DECLARE @StartPos int, @Length int
WHILE LEN(@CityList) > 0
  BEGIN
    SET @StartPos = CHARINDEX(@Delimeter, @CityList)
    IF @StartPos < 0 SET @StartPos = 0
    SET @Length = LEN(@CityList) - @StartPos - 1
    IF @Length < 0 SET @Length = 0
    IF @StartPos > 0
      BEGIN
        SET @City = SUBSTRING(@CityList, 1, @StartPos - 1)
        SET @CityList = SUBSTRING(@CityList, @StartPos + 1, LEN(@CityList) - @StartPos)
      END
    ELSE
      BEGIN
        SET @City = @CityList
        SET @CityList = ''
      END
    INSERT @tblCity (City) VALUES(@City)
END

--Show all Cities in the @tblCity table
SELECT * FROM @tblCity
```