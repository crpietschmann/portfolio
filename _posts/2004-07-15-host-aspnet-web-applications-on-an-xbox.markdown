---
layout: post
blogengineid: 316772e6-af83-49bf-9d0d-547b2311982c
title: "Host ASP.NET Web Applications on an XBox"
date: 2004-07-15 23:16:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/07/15/Host-ASPNET-Web-Applications-on-an-XBox
  - /post/2004/07/15/host-aspnet-web-applications-on-an-xbox
  - /post.aspx?id=316772e6-af83-49bf-9d0d-547b2311982c
---
<!-- more -->
<P>As you all probably know, XBox is priced at $150, has a hard drive, built in Ethernet, and it has x86 architecture with a P3 cpu. There is a Linux distribution that is being ported to run on the XBox architecture. You may be thinking why does it need to be ported if it uses x86 architecture and uses a P3 cpu. Well, the reason is that it is only about 99% x86 compatible. There are some extra things (mostly copy protection stuff) that Microsoft added to it. That 99% compatibility is also the thing that keeps you from being able to run Windows on it. The controller ports are even USB, you have to get an adapter to plug in a keyboard and mouse but they are still USB.</P>
<P>You may also be thinking, how can I have an <A title=ASP.NET href="http://asp.net" target=_blank>ASP.NET</A> web server, if I'm running linux? The answer is... <A title="Mono Project" href="http://mono-project.com" target=_blank>Mono</A>!! Mono is an open source implementation of the <A title="Microsoft .NET Framework" href="http://www.microsoft.com/net/" target=_blank>.NET Framework</A>. All the necessary parts of the framework to run ASP.NET applications with Apache web server are complete.</P>
<P>Wow, what an idea! A $150 computer that I can use to host an ASP.NET web application. Granted there is only 64MB of ram in the XBox, it will be able to host a small website just the same. Now, all I need to do is buy an XBox, put Linux and Mono on it, and host my website on an XBox.</P>
<P>Linux on XBox: <A href="http://xbox-linux.org/">http://xbox-linux.org/</A></P>
<P>Mono: <A href="http://www.mono-project.org/">http://www.mono-project.org/</A> </P>
<P>Note: I have not seen anyone confirming that Mono will run under the Linux distribution for XBox, but it just seems fitting that if it will run on Linux/x86 then why wouldn't it run on an XBox since it has 99% the same architecture.</P>
