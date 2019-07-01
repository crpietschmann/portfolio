---
layout: post
title: "Minimize Microsoft Outlook to the System Tray"
date: 2004-09-29 11:16:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/09/29/Minimize-Microsoft-Outlook-to-the-System-Tray
  - /post/2004/09/29/minimize-microsoft-outlook-to-the-system-tray
---
<!-- more -->
<P>I don't know why they took this option out of the settings within Outlook, but the registry setting for this is still there.</P>
<P>To minimize it to the system tray, start regedit and follow the steps below:<BR><BR>HKEY_CURRENT_USER \ Software \ Microsoft \ Office \ <FONT color=#ff0000>10.0</FONT> \ Outlook \ Preferences <BR>New Data Type: REG_DWORD <BR>Value Name: MinToTray <BR>Data: 1 (0 to disable MinToTray)</P>
<P>The number in <FONT color=#ff0000>red </FONT><FONT color=#000000>above is the MS-Office version number; 10 is Office 2000; 11 is Office 2003.</FONT></P>
