---
layout: post
title: "Virtualization on the Desktop: VirtualPC 2007 and Hyper-V"
date: 2008-04-28 17:11:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
alias: ["/post/2008/04/28/Virtualization-on-the-Desktop-VirtualPC-2007-and-Hyper-V", "/post/2008/04/28/virtualization-on-the-desktop-virtualpc-2007-and-hyper-v"]
---
<!-- more -->
<p>
About a year ago I started to use VirtualPC 2007 on my Vista x64 box to allow me to run other instances of OS&#39;s within isolation without requiring me to purchase anymore hardware for my desk. It&#39;s actually rather simple to do and makes it extremely easy to roll back any of your systems to a previous state in case they get screwed up by installing beta software or for any other reason. 
</p>
<p>
<strong>Benefits of Virtualization</strong>&nbsp; 
</p>
<p>
To backup a virtual machine, all you do is burn the virtual machines files to a DVD. And, to restore, all you do is copy those backups over the existing files, and things are restored to a previous state. Simple, clean and straight forward. 
</p>
<p>
Also, another benefit to using virtual machines is you only have to install and activate&nbsp;Windows XP or Vista once. Once you&#39;ve installed and activated, all you need to do to install a new instance is copy the virtual machine files for the &quot;fresh&quot; install from your backup to a folder of their own on your machine and you have a whole new virtual machine to play around with. 
</p>
<p>
<strong>How I&#39;ve been using&nbsp;Virtualization</strong>&nbsp; 
</p>
<p>
One thing that&#39;s been lacking in my use of virtualization&nbsp;(using VirtualPC 2007)&nbsp;is the fact that I have still been using the main installation on my machine for my own general purpose (development, testing, some games, etc.)&nbsp;use. And, the only thing I&#39;ve been using virtualization for, thus far, is for testing out new software or beta software. This is fine and all, but it still puts my machine at risk of getting messed up from the usual install and uninstall of random things, and getting full of alot of software being installed that just plain slows down the machine and such. 
</p>
<p>
<strong>What&#39;s new in Virtualization?</strong> 
</p>
<p>
The latest from Microsoft is <a href="http://www.microsoft.com/windowsserver2008/en/us/virtualization-consolidation.aspx">Hyper-V for Windows Server 2008</a>. I&#39;m still reading up on exactly what Hyper-V is, and what it&#39;s benefit are over Virtual Server 2005 and VirtualPC 2007. 
</p>
<p>
According to Microsoft, Windows Server 2008 Hyper-V is: 
</p>
<p>
<em>&quot;Windows Server 2008 Hyper-V, the next-generation hypervisor-based server virtualization technology, allows you to make the best use of your server hardware investments by consolidating multiple server roles as seperate virtual machines (VMs) running on a single physical machine. With Hyper-V, you can also efficiently run multiple different operating systems -- Windows, Linux and others -- in parallel, on a single server, and fully leverage the power of x64 computing.&quot;</em> 
</p>
<p>
Here are some links so you can learn more about Windows Server 2008 Hyper-V: 
</p>
<p>
<a href="http://www.microsoft.com/windowsserver2008/en/us/virtualization-consolidation.aspx">Windows Server 2008: Virtualization and Server Consolidation</a><br />
<a href="http://technet2.microsoft.com/windowsserver2008/en/library/c513e254-adf1-400e-8fcb-c1aec8a029311033.mspx">Step-by-Step Guide to Getting Started with Hyper-V</a><br />
<a href="http://www.microsoft.com/events/series/windowsserver2008.aspx?tab=webcasts&amp;id=42531">Windows Server 2008 Server Virtualization Webcasts</a><br />
<a href="http://blogs.technet.com/virtualization/">Microsoft Windows Virtualization Team Blog</a><br />
<a href="http://www.computerworld.com/action/article.do?command=viewArticleBasic&amp;taxonomyName=operating_systems&amp;articleId=9053781&amp;taxonomyId=89&amp;intsrc=kc_feat">Windows Server 2008 Revealed: Hyper-V Virtualization</a> 
</p>
<p>
<strong>What I&#39;m looking to do with Virtualization</strong> 
</p>
<p>
Lately, I&#39;ve been thinking about using&nbsp;Windows Server&nbsp;2008&nbsp;as the host&nbsp;OS on my main machine and using Vista and XP as guest OS&#39;s using virtualization. I&#39;m looking to break out each of the roles I perform into separate virtual machines. So, basically I&#39;m looking to having virtual machines for the following roles: 
</p>
<ul>
	<li>Development&nbsp;- Mainly Visual Studio and SQL Express using Vista</li>
	<li>Testing - Probably have two virtual machines for this, one Vista and the other XP</li>
	<li>General Purpose - Mainly Office 2007 and CD/DVD burning software</li>
	<li>Playground&nbsp;- Use for testing new software and beta/alpha software. Probably have a couple VM&#39;s for this, including one with Visual Studio for testing out &quot;found code&quot; and open source code downloaded from internet.</li>
	<li>Gaming - Install any games I play here</li>
</ul>
<p>
You may be thinking that I could use Virtual Server 2005 to do this, but it doesn&#39;t support Vista as the host OS and you can&#39;t see Vista&#39;s &quot;Aero&quot; Glass while using remote desktop from a non-Vista OS. And, I just plain like the way Vista looks, so that&#39;s out of the question. 
</p>
<p>
I can use VirtualPC 2007 with Vista as the host OS to do all this, and everything will be just dandy. However, since we now have Windows Server 2008 and Hyper-V, I might as well look at that as an option. 
</p>
<p>
I&#39;ll post an update once I decide what I&#39;m going to do to fill my virtualization needs.<br />
But until then, if you have any virtualization suggestions and/or tips using VirtualPC, Virtual Server or Hyper-V, please post them in the comments. 
</p>
