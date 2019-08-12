---
layout: post
blogengineid: d0c69391-8049-4654-b7c6-e6c01f6b2b1a
title: ".NET Framework - Check if Windows booted in Normal or Safe Mode"
date: 2005-12-09 14:13:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
redirect_from: 
  - /post/2005/12/09/NET-Framework-Check-if-Windows-booted-in-Normal-or-Safe-Mode.aspx
  - /post/2005/12/09/NET-Framework-Check-if-Windows-booted-in-Normal-or-Safe-Mode
  - /post/2005/12/09/net-framework-check-if-windows-booted-in-normal-or-safe-mode
  - /post.aspx?id=d0c69391-8049-4654-b7c6-e6c01f6b2b1a
---

Heres a really small code sample on how to check which mode Windows was booted up in (Normal or Safe Mode). This works in <a title=".NET" href="http://www.microsoft.com/net/" target="_blank">.NET</a> 1.x and 2.0.

```VB
'  This code checks to see which mode Windows has booted up in.  
Select Case System.Windows.Forms.SystemInformation.BootMode
Case BootMode.FailSafe
  '  The computer was booted using only the basic files and drivers.  
  '  This is the same as Safe Mode  
Case BootMode.FailSafeWithNetwork
  '  The computer was booted using the basic files, drivers, and services necessary to start networking.  
  '  This is the same as Safe Mode with Networking  
Case BootMode.Normal
  '  The computer was booted in Normal mode.  
End Select
```
