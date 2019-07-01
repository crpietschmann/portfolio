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
  - /post/2004/09/07/How-do-you-call-a-Console-application-from-ASPNET-and-get-the-results
  - /post/2004/09/07/how-do-you-call-a-console-application-from-aspnet-and-get-the-results
  - /post.aspx?id=5251fbd7-bf4b-4621-89ae-19ccbb9680e1
---
<!-- more -->

Here is a VB.NET version of a C# example that I found to do just that. It's really simple to do.

&lt;%@ Page Language="vb" %&gt;<BR>&lt;%@ Import Namespace="System.Diagnostics" %&gt;<BR>&lt;% <BR>      ''Get a file name relative to the current Web app. <BR>      Dim file As String = Server.MapPath("Program.exe") <BR>      Dim info As ProcessStartInfo = new ProcessStartInfo(file, "/arguments") <BR>      ''Redirect output so we can read it.<BR>      info.RedirectStandardOutput = true <BR>      ''To redirect, we must not use shell execute.<BR>      info.UseShellExecute = false <BR>      ''Create and execute the process.<BR>      Dim p As Process = Process.Start(info) p.Start() <BR>      ''Send whatever was returned through the output to the client. <BR>      Response.Write(Replace(Replace(p.StandardOutput.ReadToEnd(), vbCrLf, " "), " ", " "))<BR>%&gt;
