---
layout: post
blogengineid: ab555281-0d40-4194-9132-bf7b4dbf8a26
title: "Fill DataSet with multiple Tables and update them with DataAdapter"
date: 2004-08-22 23:48:00 -0500
comments: true
published: true
categories: [".NET"]
tags: ["General"]
redirect_from: 
  - /post/2004/08/22/Fill-DataSet-with-multiple-Tables-and-update-them-with-DataAdapter.aspx
  - /post/2004/08/22/Fill-DataSet-with-multiple-Tables-and-update-them-with-DataAdapter
  - /post/2004/08/22/fill-dataset-with-multiple-tables-and-update-them-with-dataadapter
  - /post.aspx?id=ab555281-0d40-4194-9132-bf7b4dbf8a26
---

One way to fill a DataSet with multiple tables is to send the database multiple requests. Another way to do this is to use multiple SELECT statements in a single request.

There are a couple of problems with doing it this way:

- The DataTables don't have the same name as the tables in the database, you have to set them yourself
- You can't update/save the tables to the database; to do that you must use a separate DataAdapter for each table.

```VB
Dim myAdapter as SqlDataAdapter = new SqlDataAdapter(
      “SELECT * FROM Customers; SELECT * FROM Orders“, connection)

myAdapter.Fill(dsTables)
dsTables.Tables(0).TableName = “Customers“)
dsTables.Tables(1).TableName = “Orders“)
```

It would be so much easier if they made it so you can use the same DataAdapter to update all the tables you load into the DataSet with the DataAdapter.

If you do try to update all the tables with the same DataAdapter, then you will get an error like the one below (this error really frustrated me for a couple hours):

```
An unhandled exception of type 'System.InvalidOperationException' occurred in system.data.dll

Additional information: Missing the DataColumn 'Date' in the DataTable 'FeeChargeAttendance' for the SourceColumn 'Date'.
```

I wonder if <a title="Mono Project" href="http://mono-project.com" target="_blank">Mono</a> has this same issue??
