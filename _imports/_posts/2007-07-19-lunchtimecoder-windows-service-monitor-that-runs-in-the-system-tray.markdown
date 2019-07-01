---
layout: post
title: "LunchTimeCoder: Windows Service Monitor that runs in the System Tray"
date: 2007-07-19 12:21:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2007/07/19/LunchTimeCoder-Windows-Service-Monitor-that-runs-in-the-System-Tray
 -  /post/2007/07/19/lunchtimecoder-windows-service-monitor-that-runs-in-the-system-tray
---
<!-- more -->
<P>Yesterday I started writing a Windows Service Monitor, but I didn't finish it during my lunch time. And, since I had a little extra time last night and this morning (I'm off work today by the way), I spent some time finishing it. Yeah I know it's cheating but I'm the one who wrote the rules for this initiative anyway.</P>
<P><IMG alt="LunchTimeCoder.ServiceMonitor minimized to the system tray" hspace=0 src="/download/lunchtimecoder/dotnet/windowsservicemonitor/images/screenshot002.png" align=right border=0></P>
<P>This app is relatively simple, you pick what services to monitor on the local machine and it minimizes to the system tray. When a service you are monitoring stops, it will change the system tray icon to have a red X on it and popup a balloon tip telling you what services are stopped. You can then double-click the system tray icon to bring up the main UI of the app where you can start/stop any of the services you are monitoring.</P>
<P>Both source code (C# only) and the compiled executable are available for download. If you have any additional suggestions for this app, let me know by posting a comment to this post.</P>
<P><A href="/download/lunchtimecoder/dotnet/windowsservicemonitor">More information on LunchTimeCoder.ServiceMonitor here</A></P>
