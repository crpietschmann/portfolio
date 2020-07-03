---
layout: post
blogengineid: c15168f1-60fa-4ea0-9766-172d54efdee3
title: "WinXP SP2 limits max. number of TCP connections/second"
date: 2004-07-23 11:06:00 -0500
comments: true
published: true
categories: ["Windows XP"]
tags: ["General"]
redirect_from: 
  - /post/2004/07/23/WinXP-SP2-limits-max-number-of-TCP-connectionssecond.aspx
  - /post/2004/07/23/WinXP-SP2-limits-max-number-of-TCP-connectionssecond
  - /post/2004/07/23/winxp-sp2-limits-max-number-of-tcp-connectionssecond
  - /post.aspx?id=c15168f1-60fa-4ea0-9766-172d54efdee3
---

Apparently, to reduce the spread of worms like Sasser, Windows XP Service Pack 2 will limit the maximum number of TCP connections your computer can have at one time. I can see what they are thinking, but I wont mind unless some of my applications (like my multi-threaded port scanner) wont work correctly with this new setting. I guess I'll hold off on increasing the max. untill an application generates an error because of it.

Here is a registry edit you can do to increase the max:

```TcpNumConnections
Key: Tcpip\Parameters
Value Type: REG_DWORD - Number
Valid Range: 0 - 0xfffffe
Default: 0xfffffe
Description: This parameter limits the maximum number of connections that TCP can have open at the same time.
```

TCP/IP and NBT configuration parameters for Windows XP: <a href="http://support.microsoft.com/default.aspx?kbid=314053">http://support.microsoft.com/default.aspx?kbid=314053</a>
