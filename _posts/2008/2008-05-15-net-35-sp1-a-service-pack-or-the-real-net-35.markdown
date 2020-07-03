---
layout: post
blogengineid: 7b976614-8d22-4d53-86c1-3b7bd19dd2e9
title: ".NET 3.5 SP1: A Service Pack or The Real .NET 3.5"
date: 2008-05-15 22:44:24 -0500
comments: true
published: true
categories: [".NET"]
tags: ["General"]
redirect_from: 
  - /post/2008/05/15/NET-35-SP1-A-Service-Pack-or-The-Real-NET-35.aspx
  - /post/2008/05/15/NET-35-SP1-A-Service-Pack-or-The-Real-NET-35
  - /post/2008/05/15/net-35-sp1-a-service-pack-or-the-real-net-35
  - /post.aspx?id=7b976614-8d22-4d53-86c1-3b7bd19dd2e9
---
<!-- more -->

Microsoft just RTM'd Visual Studio 2008 and .NET 3.5 last November and launched them in February. And, their already releasing a Service Pack? What could they possibly have to all fix in a Service Pack this soon? Well, actually they aren't just fixing stuff; they are adding a huge amount of functionality too. ScottGu has a long post about what's all in it <a href="http://weblogs.asp.net/scottgu/archive/2008/05/12/visual-studio-2008-and-net-framework-3-5-service-pack-1-beta.aspx">here</a>. 
I'm thinking that .NET 3.5 needed to ship, so they took out everything that just wasn't quite all the way there and are including it in this Service Pack. That's the only way I can explain such a huge service pack (with so many New features) so soon. You know it's nice to have new stuff added, especially in an off cycle release, but at least do it in a way that wont cause any potential confusion. 
Ok, here's a simple scenario... I have an application that I'm distributing and I post in the requirements that it supports .NET 3.5 Service Pack 1. Well, to most people (not as techie as I) they see it supports .NET 3.5, and try to run it. Well, guess what? They have .NET 3.5 without SP1 and the app throws an exception and crashes when they try to run it. Because of their undesirable experience they delete my app and never look at it again. Now, only if they would have had SP1 installed, they wouldn't have had any issues. 
Well, the first thing you'll probably point out is that I claimed .NET 3.5 SP1 support and they only had .NET 3.5 installed. To the normal person who doesn't know what "Service Pack 1" means, they are the same thing. 
Secondly, I could probably include the framework and service pack as part of my installer. This way if they don't have .NET 3.5 or SP1 installed, it will install it when they install the app. Now this would work fine and dandy, just as long as I wasn't just distributing the EXE without an installer, or if I didn't (and my users didn't) mind the installer being 25+ MB. 
I'm not sure if you agree with me on this, but there is definitely some potential confusion here. However, I don't think this potential confusion is a big enough issue to warrant calling this release .NET 4.0. That would be much worse, since it's easier to get your sys admins to install a service pack instead of a full release. 
Anyway, like I said above, maybe .NET 3.5 SP1 is the .NET 3.5 that was supposed to RTM and ship back in November, but they just didn't have enough time to meet the deadline. And, don't get me wrong, I am look forward to the improvements and new features in this service pack, I just wish we had the final release instead of a Beta. I'm leery about installing a .NET Framework Beta on my workstation. 
Ok the rant is over...
