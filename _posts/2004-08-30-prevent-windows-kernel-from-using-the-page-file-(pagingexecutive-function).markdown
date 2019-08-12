---
layout: post
blogengineid: 01088386-c027-466e-ab22-38c2be0f6cb6
title: "Prevent Windows Kernel From Using The Page File (PagingExecutive Function)"
date: 2004-08-30 14:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/08/30/Prevent-Windows-Kernel-From-Using-The-Page-File-(PagingExecutive-Function).aspx
  - /post/2004/08/30/Prevent-Windows-Kernel-From-Using-The-Page-File-(PagingExecutive-Function)
  - /post/2004/08/30/prevent-windows-kernel-from-using-the-page-file-(pagingexecutive-function)
  - /post.aspx?id=01088386-c027-466e-ab22-38c2be0f6cb6
---

## Description

Placing the Windows (2000/XP) Kernel into RAM is quicker than allowing it to be paged.

## Directions

If you system has more than 256MB of RAM, then you should try this tweak. In theory, the kernel (and thus Windows) should run faster if it kept in RAM instead of the slower page memory.

This involves editing the registry so make a registry backup before trying this.

**Navigate to:**

```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\DisablePagingExecutive
```

Setting the value to `1` will prevent the kernel from using slower page memory.

Changing it back to the default value of `0` will return your system back to normal.

> Remember that registry changes require reboot before you will see their effects.