---
layout: post
blogengineid: 5251fbd7-bf4b-4621-89ae-19ccbb9680e1
title: "How do you call a Console application from ASP.NET and get the results??"
date: 2004-09-07 17:32:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/09/07/How-do-you-call-a-Console-application-from-ASPNET-and-get-the-results.aspx
  - /post/2004/09/07/How-do-you-call-a-Console-application-from-ASPNET-and-get-the-results
  - /post/2004/09/07/how-do-you-call-a-console-application-from-aspnet-and-get-the-results
  - /post.aspx?id=5251fbd7-bf4b-4621-89ae-19ccbb9680e1
---

Here is a VB.NET version of a C# example that I found to do just that. It's really simple to do.

```VB
<%@ Page Language="vb" %>
<%@ Import Namespace="System.Diagnostics" %>
<% 
      ''Get a file name relative to the current Web app. 
      Dim file As String = Server.MapPath("Program.exe") 
      Dim info As ProcessStartInfo = new ProcessStartInfo(file, "/arguments") 
      ''Redirect output so we can read it.
      info.RedirectStandardOutput = true 
      ''To redirect, we must not use shell execute.
      info.UseShellExecute = false 
      ''Create and execute the process.
      Dim p As Process = Process.Start(info) p.Start() 
      ''Send whatever was returned through the output to the client. 
      Response.Write(Replace(Replace(p.StandardOutput.ReadToEnd(), vbCrLf, " "), " ", " "))
%>
```