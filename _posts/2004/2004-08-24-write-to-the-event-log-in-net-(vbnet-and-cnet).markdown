---
layout: post
blogengineid: e33bc9c0-b7d1-42f6-bbf7-15b97d1cce38
title: "Write to the Event Log in .NET (VB.NET and C#.NET)"
date: 2004-08-24 18:03:00 -0500
comments: true
published: true
categories: ["VB.NET", ".NET"]
tags: ["C#", "General", "vb.net"]
redirect_from: 
  - /post/2004/08/24/Write-to-the-Event-Log-in-NET-(VBNET-and-CNET).aspx
  - /post/2004/08/24/Write-to-the-Event-Log-in-NET-(VBNET-and-CNET)
  - /post/2004/08/24/write-to-the-event-log-in-net-(vbnet-and-cnet)
  - /post.aspx?id=e33bc9c0-b7d1-42f6-bbf7-15b97d1cce38
---

It is as simple as this to write to the Windows Event Log in .NET

### Declaration

```VB
Imports System.Diagnostics
```

### Code

```VB
Public Function WriteToEventLog(ByVal Entry As String, _
  Optional ByVal AppName As String = "APlusFeeCalc", _
  Optional ByVal EventType As EventLogEntryType = EventLogEntryType.Information, _
  Optional ByVal LogName As String = "Application") As Boolean
     Dim objEventLog As New EventLog
     Try
          'Register the App as an Event Source
          If Not objEventLog.SourceExists(AppName) Then
               objEventLog.CreateEventSource(AppName, LogName)
          End If
          objEventLog.Source = AppName
          'WriteEntry is overloaded; this is one of 10 ways to call it
         objEventLog.WriteEntry(Entry, EventType)
          Return True
     Catch Ex As Exception
          Return False
     End Try
End Function
```
