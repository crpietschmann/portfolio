---
layout: post
blogengineid: 097d3ea5-f899-4b91-a251-9f371c1bdd4e
title: "Minimize Microsoft Outlook to the System Tray"
date: 2004-09-29 11:16:00 -0500
comments: true
published: true
categories: ["Tools"]
tags: ["General"]
redirect_from: 
  - /post/2004/09/29/Minimize-Microsoft-Outlook-to-the-System-Tray.aspx
  - /post/2004/09/29/Minimize-Microsoft-Outlook-to-the-System-Tray
  - /post/2004/09/29/minimize-microsoft-outlook-to-the-system-tray
  - /post.aspx?id=097d3ea5-f899-4b91-a251-9f371c1bdd4e
---

I don't know why they took this option out of the settings within Outlook, but the registry setting for this is still there.

To minimize it to the system tray, start regedit and follow the steps below:

```
HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\Preferences
New Data Type: REG_DWORD
Value Name: MinToTray
Data: 1 (0 to disable MinToTray)
```

`10.0` is version number for Office 2000; `11.0` is Office 2003.
