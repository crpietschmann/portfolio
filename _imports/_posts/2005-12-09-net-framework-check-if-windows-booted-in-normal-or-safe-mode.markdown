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
  - /post/2005/12/09/NET-Framework-Check-if-Windows-booted-in-Normal-or-Safe-Mode
  - /post/2005/12/09/net-framework-check-if-windows-booted-in-normal-or-safe-mode
  - /post.aspx?id=d0c69391-8049-4654-b7c6-e6c01f6b2b1a
---
<!-- more -->

Heres a really small code sample on how to check which mode Windows was booted up in (Normal or Safe Mode). This works in <a title=".NET" href="http://www.microsoft.com/net/" target="_blank">.NET</a> 1.x and 2.0.

<span style="COLOR: #000000"><span style="COLOR: #008080">  1</span> <span style="COLOR: #008000">'</span><span style="COLOR: #008000">This code checks to see which mode Windows has booted up in.</span><span style="COLOR: #008000">
</span><span style="COLOR: #008080">  2</span> <span style="COLOR: #0000ff">Select</span><span style="COLOR: #000000"> </span><span style="COLOR: #0000ff">Case</span><span style="COLOR: #000000"> System.Windows.Forms.SystemInformation.BootMode
</span><span style="COLOR: #008080">  3</span> <span style="COLOR: #0000ff">Case</span><span style="COLOR: #000000"> BootMode.FailSafe
</span><span style="COLOR: #008080">  4</span> <span style="COLOR: #000000">     </span><span style="COLOR: #008000">'</span><span style="COLOR: #008000">The computer was booted using only the basic files and drivers.</span><span style="COLOR: #008000">
</span><span style="COLOR: #008080">  5</span> <span style="COLOR: #000000">     </span><span style="COLOR: #008000">'</span><span style="COLOR: #008000">This is the same as Safe Mode</span><span style="COLOR: #008000">
</span><span style="COLOR: #008080">  6</span> <span style="COLOR: #0000ff">Case</span><span style="COLOR: #000000"> BootMode.FailSafeWithNetwork
</span><span style="COLOR: #008080">  7</span> <span style="COLOR: #000000">     </span><span style="COLOR: #008000">'</span><span style="COLOR: #008000">The computer was booted using the basic files, drivers, and services necessary to start networking.</span><span style="COLOR: #008000">
</span><span style="COLOR: #008080">  8</span> <span style="COLOR: #000000">     </span><span style="COLOR: #008000">'</span><span style="COLOR: #008000">This is the same as Safe Mode with Networking</span><span style="COLOR: #008000">
</span><span style="COLOR: #008080">  9</span> <span style="COLOR: #0000ff">Case</span><span style="COLOR: #000000"> BootMode.Normal
</span><span style="COLOR: #008080">10</span> <span style="COLOR: #000000">     </span><span style="COLOR: #008000">'</span><span style="COLOR: #008000">The computer was booted in Normal mode.</span><span style="COLOR: #008000">
</span><span style="COLOR: #008080">11</span> <span style="COLOR: #0000ff">End</span><span style="COLOR: #000000"> </span><span style="COLOR: #0000ff">Select</span><span style="COLOR: #000000">
</span>
</span>

 
