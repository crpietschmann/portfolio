---
layout: post
blogengineid: 03f86b97-ffe5-4137-932c-61b0ea73d386
title: "Visual Studio 2005 Beta 2: Error 50266 installing .NET Framework 2.0"
date: 2005-05-15 11:42:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/05/15/Visual-Studio-2005-Beta-2-Error-50266-installing-NET-Framework-20
  - /post/2005/05/15/visual-studio-2005-beta-2-error-50266-installing-net-framework-20
  - /post.aspx?id=03f86b97-ffe5-4137-932c-61b0ea73d386
---
<!-- more -->

I ordered Visual Studio 2005 Beta 2 about 2 weeks ago, and I received it in the mail yesterday! The SQL Server 2005 CTP cam with it! I couldn't wait to install them and start playing. I didn't play around much with Beta 1; I just didn't make the point to spend much time with it (There are so many things to learn/do I can hardly find the time for it all.) One of the reasons I'm so excited about Beta 2 is because of the Go Live license (which you must go onlin and sign first; located here: <A href="http://lab.msdn.microsoft.com/vs2005/golive/">http://lab.msdn.microsoft.com/vs2005/golive/</A>). And so my journey began...

I uninstalled VS2005 Beta 1 and .NET Framework 2.0 Beta 1. Then I realized I forgot to uninstall Microsoft Visual J# .NET Redistributable Package 2.0 Beta, so I then uninstalled that. Then I started the Install of SQL Server 2005 CTP and go the following error:

*Errors occurred during the installation:<BR>Beta components detected.<BR>Error 50266 installing .NET Framework 2.0*

I then went and found that there were still 2.0 files on the drive and registry entries for them. So I made a copy of the files and registry entries (for backup) and then deleted the originals trying to manually uninstall the remaining .NET 2.0 Beta 1 components. To make a long story short, this didn't work so I had to restore the copies of these files.

After all that (took like 4 hours, I think) I searched Google and found this page: <A href="http://lab.msdn.microsoft.com/vs2005/uninstall">http://lab.msdn.microsoft.com/vs2005/uninstall</A>

Apparently there is an exact order to uninstall the Beta 1 components in order to be able to install Beta 2. The part I screwed up with was I uninstalled the J# Redistributable Package 2.0 Beta 1 after I uninstalled .NET Framework 2.0 Beta 1.

Opps! I began wondering if I would need to reinstall Windows in order to get those bits off my machine so I could install Beta 2. Well, further down the page I saw this:

*Notes:<BR>1. If you see an erro removing J# .NET Redistributable Package 2.0 from Add/Remove Programs, please run &#8220;msiexec /x {9046F10C-F5E7-4871-BED9-8288F19C70DF}&#8221; from a command line window.<BR>1. If you see an error removing .NET Framework 2.0 from Add/Remove Programs, please run &#8220;msiexec /x {71F8EFBF-09AF-418D-91F1-52707CDFA274}&#8221; from a command line window.*

Wahoo! Exactly what I needed. I ran the part at the command lin to uninstall J# .NET Redistributable Package 2.0 and it worked like a charm. I am now successfully installing SQL Server 2005 CTP and Visual Studio 2005 Beta 2 while I type this post.
