---
layout: post
blogengineid: 59c49b54-7263-4e42-805d-2d05691a3a1f
title: "SQL Compact And The 'Unable to load DLL 'sqlceme35.dll'' Runtime Exception"
date: 2009-01-07 19:40:00 -0600
comments: true
published: true
categories: ["SQL", "SQL Compact"]
tags: ["General"]
redirect_from: 
  - /post/2009/01/07/SQL-Compact-And-The-Unable-to-load-DLL-sqlceme35dll-Runtime-Exception.aspx
  - /post/2009/01/07/SQL-Compact-And-The-Unable-to-load-DLL-sqlceme35dll-Runtime-Exception
  - /post/2009/01/07/sql-compact-and-the-unable-to-load-dll-sqlceme35dll-runtime-exception
  - /post.aspx?id=59c49b54-7263-4e42-805d-2d05691a3a1f
---
<!-- more -->

I <a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=DC614AEE-7E1C-4881-9C32-3A6CE53384D9&amp;displaylang=en">installed SQL Server Compact 3.5 x86</a> and started testing it out when I got a nice "Unable to load DLL 'sqlceme35.dll" runtime exception. This seems like odd behaviour for a clean install. In a fairly quick search I found an article on the <a href="http://blogs.msdn.com/sqlservercompact">SQL Server Compact Team Blog</a> that covers a couple possible causes/solutions for this exception.

<a href="http://blogs.msdn.com/sqlservercompact/archive/2007/10/26/can-t-find-p-invoke-dll-sqlcemenn-dll.aspx">http://blogs.msdn.com/sqlservercompact/archive/2007/10/26/can-t-find-p-invoke-dll-sqlcemenn-dll.aspx</a>
<h3>My Solution - Target x86 Only
</h3>

Even though there are 5 possible causes/solutions listed, only one of them was the issue I was experiencing and I think is probably the most common issue.

Quoted from the above post:

*If your machine is a 64-bit box, you might have been got trapped into default target platform 'Any CPU' trap, please set the target platform as 'x86'.  Need more details, please visit ErikEJ's <a href="http://erikej.blogspot.com/2008/01/x64-and-sql-compact.html" target="_blank">blog post</a>. *

To fix it all you need to do is open up the Build Configuration Manager within Visual Studio and change the Active Solution Platform for your application from "Any CPU" to "x86". Then rebuild and it'll work just fine.

The reason for this issue according to ErikEJ's post is *"SQL Compact is only supported in 32 bit WoW (Windows on Windows) mode on the x64 platform."* From my understanding of how things work, when you compile for "Any CPU" your application will be run under the 64-bit .NET Framework on x64 Windows, and since SQL Compact is only 32-bit then Windows is unable to fire it up within the same process. This is because a single process in Windows can be either 32-bit or 64-bit and cannot run both 32-bit and 64-bit code within the same process. This is why it runs without throwing the exception once you change your app to target "x86" (32-bit).
<h3>What about 64-bit (x64) support?</h3>

Since the above SQL Server Compact Team Blog post was written, they have released a <a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=DC614AEE-7E1C-4881-9C32-3A6CE53384D9&amp;displaylang=en">x64 version of SQL Server Compact 3.5</a>. So x64 IS supported.

Now, if you distribute your application targeting "Any CPU" and bootstrap the SQL Compact x86 installer within your applications installer you will end up having issues if your users are running a 64-bit edition of Windows. So , to really support x64 Windows you really have two options:
<ol>
<li>Change your application to target "x86" and distribute it that way. It'll run on both x86 and x64 editions of Windows.</li>
<li>Alternatively, you could create two seperate versions of the installer for your application; one that targets x86 and one that targets x64.</li>
</ol>

I prefer the first option because it has a couple benefits. Even though it only targets x86, it will work on x64 systems too, and you relieve users from being required to understand whether they should install the x86 or x64 version. Plus this way you only need to worry about building your application and installer a single time for each release.

At the below link you can download both the x86 and x64 versions of SQL Server Compact 3.5 SP1:

<a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=DC614AEE-7E1C-4881-9C32-3A6CE53384D9&amp;displaylang=en">http://www.microsoft.com/downloads/details.aspx?FamilyId=DC614AEE-7E1C-4881-9C32-3A6CE53384D9&amp;displaylang=en</a>
