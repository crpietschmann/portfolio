---
layout: post
blogengineid: aa54ec2f-c8db-4472-ba47-ea06fef3eba0
title: "Windows Server 2008 Hyper-V RC0 and Athlon 64 X2 4200+"
date: 2008-05-12 12:33:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2008/05/12/Windows-Server-2008-Hyper-V-RC0-and-Athlon-64-X2-4200.aspx
  - /post/2008/05/12/Windows-Server-2008-Hyper-V-RC0-and-Athlon-64-X2-4200
  - /post/2008/05/12/windows-server-2008-hyper-v-rc0-and-athlon-64-x2-4200
  - /post.aspx?id=aa54ec2f-c8db-4472-ba47-ea06fef3eba0
---
<!-- more -->


I used virtualization through VirtualPC 2007 on this computer, an Athlon 64 X2 4200+ with a Gigabyte GA-M55SLI-S4 motherboard, and it worked perfectly. The Athlon 64 X2 even support Hardware-Assisted Virtualization, so things actually run pretty smooth. 



Now I&#39;ve upgraded to Windows Server 2008 so I can run virtual machines with the new Hyper-V (RC0), but when I try to start any virtual machine it gives me an error saying &quot;The virtual machine could not be started because the hypervisor is not running.&quot; What?? I just installed it. Did I miss configuring something? 



The error dialog box has a &quot;See details&quot; linke, upon clicking this link it reveals the following information: 



*The virtual machine could not be started because the hypervisor is not running. The following actions may help you resolve the problem:* 



*1) Verify that the processor of the physical computer has a supported version of hardware-assisted virtualization.* 



*2) Verify that hardware-assisted virtualization and hardware-assisted data execution protection are enabled in the BIOS of the physical computer. (If you edit the BIOS to enable either setting, you must turn off the power to the physical computer and then turn it back on. Resetting the physical computer is not sufficient.)* 



*3) If you have made changes to the Boot Configuration Data store, review these changes to ensure that the hypervisor is configured to launch automatically.* 



Um, ok... What&#39;s the problem. It sounds like it could be any number of things. Well, lets start checking things off the list. 



1) Yes, I know my cpu supports hardware-assisted virtualization. AMD&#39;s documentation states so, and VirtualPC 2007 was able to use it.

3) Um.. I didn&#39;t change anything, so it wont be this. 



Ok, it must something to do with option number 2. 



Let go check the BIOS settings to make sure it&#39;s turned on; which it should be, after all it was working with VirtualPC 2007 just fine. Well, after inspecting my BIOS settings, I discovered that there isn&#39;t a setting in my motherboards BIOS to turn it on or off. Hmm... That&#39;s interesting. 



Time to check for a BIOS update. Well, as it turns out, it doesn&#39;t look like Gigabyte has an update for my motherboard that will enable any virtualization features within the BIOS. 



Stalemate... I guess I&#39;ll have to wait until the final release of Hyper-V or until may Gigabyte puts out a BIOS update for my motherboard. 



I&#39;m assuming the final release of Hyper-V wont support my motherboard/cpu configuration, since their main target for Hyper-V is server, but hopefully they take into account the scenario of using virtualization heavily in a development environment where you don&#39;t have a &quot;server&quot; class cpu in your machine. 



**Update 7/2/2008:** I received the 11H BIOS update from Gigabyte for this motherboard
(GA-M55SLI-S4) and it enabled Virtualization (AMD-V) in the bios
perfectly. 



**Update 11/20/2008:** You can download the <a href="http://ggts.gigabyte.com.tw/FileList/619667/m55slis4.11h">GA-M55SLI-S4 11H BIOS Update here</a>.

