---
layout: post
blogengineid: d76a12f5-9ead-4847-b21a-be221e790681
title: "Simple Port Scanner Written in VB.NET 2003/2008"
date: 2009-01-20 18:00:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General", "vb.net"]
redirect_from: 
  - /post/2009/01/20/Simple-Port-Scanner-Written-in-VBNET-2003-2008
  - /post/2009/01/20/simple-port-scanner-written-in-vbnet-2003-2008
  - /post.aspx?id=d76a12f5-9ead-4847-b21a-be221e790681
---
<!-- more -->
<p>
I was looking over some of the old prototypes&nbsp;I&#39;ve written&nbsp;in the past, and I can across a Simple Port Scanner&nbsp;that I originally wrote in VB.NET 2003. I originally wrote this back in&nbsp;2004 (I think), and even posted a compiled version on my website that I have since removed/deleted. So, since it&#39;s just&nbsp;sitting on my hard drive collecting virtual dust, I thought I&#39;d post it here in case anyone else can find it usefull. 
</p>
<p>
This Port Scanner implements Multi-Threading via the ThreadPool class in the .NET Framework, so at the very least it can be used as an example of how to use the ThreadPool class to queue up &quot;work units&quot; to be executed asynchronously. 
</p>
<p>
Also, as you see in the screenshot below, there is a &quot;Service&quot; column shown in the Grid. This column tells you what Protocol/Service is normally run on that specific port. It doesn&#39;t check for that Protocol/Service on that port, but it helps as a quick reference as to what Protocol/Service may be running there. It&#39;s nice sometimes to not be required to memorize all the possible Protocols/Services that run on some of the most common ports used. This list of Port Numbers and Services is stored in th eApp.Config file. 
</p>
<p>
Here&#39;s a couple download links for the source code in VB.NET 2003 and VB.NET 2008&nbsp;Solution/Project files: 
</p>
<p>
<a href="/file.axd?file=VBdotNet_PortScanner_VS2003.zip">VB.NET 2003 - Simple Port Scanner Source Code (15kb)</a> 
</p>
<a href="/file.axd?file=VBdotNET_PortScanner_VS2008.zip">VB.NET 2008 - Simple Port Scanner Source Code (16kb)</a> 
<p>
<img src="/images/postsVBdotNet_SimplePortScanner.png" alt="" /> 
</p>
