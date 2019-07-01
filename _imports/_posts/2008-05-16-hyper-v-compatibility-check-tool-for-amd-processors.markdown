---
layout: post
id: 34bdeb30-4c2c-4b41-81fa-e2e3981d3461
title: "Hyper-V Compatibility Check Tool for AMD Processors"
date: 2008-05-16 10:44:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2008/05/16/Hyper-V-Compatibility-Check-Tool-for-AMD-Processors
  - /post/2008/05/16/hyper-v-compatibility-check-tool-for-amd-processors
  - /post.aspx?id=34bdeb30-4c2c-4b41-81fa-e2e3981d3461
---
<!-- more -->
<p>I just found that AMD has a tool titled "<a href="http://www.amd.com/us-en/Processors/TechnicalResources/0,,30_182_871_9033,00.html">AMD-V Technology and Microsoft Hyper-V System Compatibility Check Utility</a>". You can run this tool on Windows Vista or Windows Server 2008 (make sure you run it with elevated privileges) to see if your hardware combination of AMD Processor and Motherboard support Hyper-V.</p>
<p>I guess this would have saved me from the trouble of installing Win 2008 with Hyper-V just to figure out that <a href="/post.aspx?id=aa54ec2f-c8db-4472-ba47-ea06fef3eba0">my AMD Athlon 64 X2 4200+ supports Hyper-V, but my motherboard doesn't</a>.</p>
<p>I ran this tool on my system (AMD Athlon 64 X2 4200+ processor&nbsp;with a Gigabyte GA-M55SLI-S4 motherboard) to see what it says, and here's the results it displayed:</p>
<p><em><strong>Test Results from Microsoft Hyper-V compatibility check for systems with AMD processors<br /></strong><span style="color: red">This system is not compatible with Hyper-V.</span><br />This utility detected that a necessary BIOS patch is not installed.<br />Please contact your system vendor to determine whether a BIOS upgrade is available.<br />If so, upgrade your BIOS and re-run the utility.<br />If not, consider upgrading to a new AMD64 system to get the latest in virtualization capabilities, performace, and power efficiency.<br />AMD's most current processors do not require a BIOS patch to run Hyper-V.</em></p>
<p>So, basically my processor supports hardware assisted virtualization (which I knew), but my motherboard doesn't. Now I just need to check Gigabyte to see if they have a BIOS update available for this motherboard that will enable support for hardware assisted virtualization.</p>
<p><strong>Update June 18, 2008:</strong> After talking with Gigabyte tech support on and off for the last couple weeks, they had me try out a couple BIOS updates that aren't posted on their website. The latest one, m55slis4.11h, finally enabled the Hardware Assisted Virtualization switch in the BIOS on my machine. I am currently running Vista x64 on this machine and I am now finally able to use virtual machines within VirtualPC now that hardware assisted virtualization is fully enabled. Maybe some day I'll get around to trying out Hyper-V again since I have a machine that'll be able to handle it. I'll write a blog post about my expereinces when I do.</p>
<p><strong>Update July 3, 2008:</strong> I had a request recently asking where the 11h bios update can be found, since they don't have it available for download within the BIOS Updates on their website. You can get it from the support ticket conversation I had with them, located at the following url: <a href="http://ggts.gigabyte.com.tw/detailEmail.asp?EmailID=620026&amp;EmailPreviousID=607096&amp;LanguageID=1">http://ggts.gigabyte.com.tw/detailEmail.asp?EmailID=620026&amp;EmailPreviousID=607096&amp;LanguageID=1</a></p>
