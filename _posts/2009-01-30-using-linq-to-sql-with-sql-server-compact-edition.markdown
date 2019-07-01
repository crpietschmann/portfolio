---
layout: post
blogengineid: 006d7ee4-ac7d-4fc4-a748-3ba8d846deeb
title: "Using LINQ to SQL with SQL Server Compact Edition"
date: 2009-01-30 20:31:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2009/01/30/Using-LINQ-to-SQL-with-SQL-Server-Compact-Edition
  - /post/2009/01/30/using-linq-to-sql-with-sql-server-compact-edition
  - /post.aspx?id=006d7ee4-ac7d-4fc4-a748-3ba8d846deeb
---
<!-- more -->

I'm currently building a desktop application that needs to store a bunch of data on the users computer, so I've decided to use <a href="http://www.microsoft.com/Sqlserver/2008/en/us/compact.aspx">SQL Server Compact 3.5</a> for this. There's only one problem, Visual Studio 2008 doesn't support using LINQ to SQL with SQL Server Compact. However, the .NET Framework does and there's a work around to get it working in VS'08 that I'll describe below.

In case you aren't aware of what <a href="http://www.microsoft.com/Sqlserver/2008/en/us/compact.aspx">SQL Server Compact 3.5</a> is, here's the short description that Microsoft gives on their website: "Microsoft SQL Server Compact is a free SQL Server embedded database ideal for building standalone and occasionally connected applications for mobile devices, desktops, and Web clients." You can download it and view more information here: <a href="http://www.microsoft.com/Sqlserver/2008/en/us/compact.aspx">http://www.microsoft.com/Sqlserver/2008/en/us/compact.aspx</a>
<h3>Steps to create a LINQ to SQL application using SQL Server Compact</h3>

To make this easy to follow I'm going to start with Creating a Solution in Visual Studio and go through all the steps needed to get it running off of SQL Server Compact.

Also, you'll first want to make sure you have SQL Server Compact 3.5 installed. It may have been installed when Visual Studio 2008 installed; I'm not sure which editions install SQL Server Compact 3.5, when I installed Visual Studio 2008 Team Suite it did install SQL Server Compact 3.5 too. If you need to install it, you can find the installer here: <a href="http://www.microsoft.com/Sqlserver/2005/en/us/compact-downloads.aspx">http://www.microsoft.com/Sqlserver/2005/en/us/compact-downloads.aspx</a>

**Step 1: Create your new project within Visual Studio**

It doesn't matter if it's a Windows Forms or WPF applciation. For this example, I'll be creating a WPF application.

**Step 2: Create your SQL Server Compact database. For Example: MyDatabase.sdf**

You can do this by right-clicking on your Solution within the Solution Explorer and selecting "Add - New Item..." then select the "Data" category on the left and "Local Database" on the right.

<img src="/images/posts/LINQSQLCompact_CreateDatabaseFile.png" alt="" />

**Step 3: Add some Tables to the Database**

You can do this within Visual Studio 2008 using the "Server Explorer". The easiest way to open up the Database within the Server Explorer is to just double click it withinthe Solution Explorer.

Also, in this example I'm just going to create a "Person" table with ID, FirstName and LastName columns.

**Step 4: Create a .dbml descriptor file for the Database**

To do this you need to use the <a href="http://msdn.microsoft.com/en-us/library/bb386987.aspx">SqlMetal.exe tool</a>. Just type the following into the Visual Studio 2008 Command Prompt:

*SqlMetal.exe MyDatabase.sdf /dbml:MyDatabase.dbml*

By default, the SqlMetal.exe is located at *drive*:\Progream Files\Microsoft SDKs\Windows\v*n.nn*\bin.

**Step 5: Add the Existing .dbml file to your project**

Once you add the .dbml file, Visual Studio 2008 will automatically generate the .NET code (C# or VB.NET) for the System.Data.Linq.DataContext class that you'll use to access your data.

 <img src="/images/posts/LINQSQLCompact_DataContextClass.png" alt="" />

**Step 6: Start Coding away using LINQ to SQL! **

You can now code using LINQ and your new System.Data.Linq.DataContext class against your database.

<img src="/images/posts/LINQSQLCompact_LinqCode.png" alt="" />
<h3>A GUI UI for SqlMetal.exe</h3>

The <a href="http://www.codeplex.com/sqlmetalosui">SQL Metal Open Source User Interface</a> Project over on CodePlex has been built just for the purpose of making it easier to generate mapping files for SQL Server Compact databases.

You can download it here: <a href="http://www.codeplex.com/sqlmetalosui">http://www.codeplex.com/sqlmetalosui</a>
<h3>Related Links</h3>

Here are some related links on this topic:

<a href="http://blogs.msdn.com/sqlservercompact/archive/2007/08/21/linq-with-sql-server-compact-a-ka-dlinq-over-sql-ce.aspx">LINQ with SQL Server Compact (a.k.a. DLINQ with SQL CE)</a>

<a href="http://geekswithblogs.net/steveclements/archive/2007/11/13/linq-to-sql.compact.aspx">LINQ to SQL...compact!</a>

<a href="http://www.pluralsight.com/community/blogs/jimw/archive/2008/04/18/50753.aspx">Using LINQ to Access SQL Server Compact Directly - A follow up</a>
