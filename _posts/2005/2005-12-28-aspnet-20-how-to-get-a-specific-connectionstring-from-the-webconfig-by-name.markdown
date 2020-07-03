---
layout: post
blogengineid: fc854e6c-0c56-4265-977b-cf3e4e89ebd2
title: "ASP.NET: How to get a specific ConnectionString from the Web.Config by name"
date: 2005-12-28 23:18:00 -0600
comments: true
published: true
categories: ["ASP.NET"]
tags: ["asp.net"]
redirect_from: 
  - /post/2005/12/28/ASPNET-20-How-to-get-a-specific-ConnectionString-from-the-WebConfig-by-name.aspx
  - /post/2005/12/28/ASPNET-20-How-to-get-a-specific-ConnectionString-from-the-WebConfig-by-name
  - /post/2005/12/28/aspnet-20-how-to-get-a-specific-connectionstring-from-the-webconfig-by-name
  - /post.aspx?id=fc854e6c-0c56-4265-977b-cf3e4e89ebd2
---

You have your ConnectionString for your ASP.NET web app stored in the Web.Config file. Now how exactly how do you get that ConnectionString out of there from within your code?

Sample Web.Config section with a ConnectionString:

```xml
<connectionStrings>
    <remove name="LocalSqlServer" />
    <add name="LocalSqlServer"
        connectionString="Data Source=myDBServer;database=myDB;Integrated Security=True;"
        providerName="System.Data.SqlClient"/>
</connectionStrings>
```

Now lets get the ConnectionString from the Web.Config file with only one line of code (C#):

```csharp
var conString = ConfigurationManager.ConnectionStrings["LocalSqlServer"];
string strConnString = conString.ConnectionString;
```

and with Visual Basic .NET:

```VB
Dim conString = ConfigurationManager.ConnectionStrings("LocalSqlServer")
Dim strConnString As String = conString.ConnectionString
```

Now isn't that simple? I'm posting this because I did a search and didn't find an example of how to do this. I had to poke around a little and discover this on my own. I hope this helps someone avoid some frustration.
