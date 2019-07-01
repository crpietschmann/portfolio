---
layout: post
blogengineid: 7290da55-6015-41cc-a8a4-9d4d87b9aa66
title: "Setting Up Ubuntu with virtualization on Vista x64"
date: 2007-01-12 22:49:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2007/01/12/Setting-Up-Ubuntu-with-virtualization-on-Vista-x64
  - /post/2007/01/12/setting-up-ubuntu-with-virtualization-on-vista-x64
  - /post.aspx?id=7290da55-6015-41cc-a8a4-9d4d87b9aa66
---
<!-- more -->
<P>I've decided to make the leap into Ubuntu; well sorta. I'm going to run it in a Virtual Machine for now. I'll set it up in a multi boot on my main pc once I'm more familiar with Linux and related stuff, but then again I may keep it running in a virtual machine if virtualization works out&nbsp;well enough.</P>
<P>Below are the steps I took to get things setup.</P>
<P><STRONG>Step 1: Install Virtual Server 2005 R2<BR></STRONG>Since I have Vista x64 installed on my pc; I am forced to use Virtual Server 2005 R2 instead of Virtual PC 2004 because VPC'04 wont install on it. Before installing Virtual Server 2005 you need to install/enable IIS on Vista first. Oh yeah, and don't forget to install all the IIS6 Compatibility stuff. This post helped me with this; <A href="http://blogs.msdn.com/virtual_pc_guy/archive/2006/06/05/618547.aspx">Installing Virtual Server on Windows Vista Beta 2</A></P>
<P>Yes, I know I could use Virtual PC 2007, but I want to try not to put Beta software on my primary box if I can help it. But, once Virtual PC 2007 RTM's I'll be installing it and using that instead. But, for now we'll just continue along...</P>
<P><STRONG>Step 2: Make sure the Virtual Server Adminstration website has the appropriate access rights.</STRONG><BR>You'll find out if it's not setup correctly if you cannot create a new Virtual Machine as described in the next step.</P>
<P>If the access rights aren't setup correctly; heres what I did to get it to work:<BR>1) Goto the IIS Manager<BR>2) Open up the "Advanced Settings" dialog for the "Virtaul Server" virtual folder within the Default Web Site.<BR>3) Change the Physical Path Credentials from "Application user" to "Specific user" and enter the username and password for a user that has Admin rights on the box. Ok, I know this isn't the most secure way (and I don't recommend it if you don't want everyone that accesses the VS Admin Site to run as Admin), but I am installing this on my Home PC and I don't have those Security concerns on this box.</P>
<P><STRONG>Step 3: Setup a Virtual Machine that will be used to install Ubuntu on<BR></STRONG>Look at "Chapter3: Setting Up a virtual Machine" withing the Getting Started Guide that is install when you install Virtual Server. This document can be found in: Start Menu - All Programs - Virtual Server - Getting Started Guide</P>
<P>Here are the steps I followed:<BR>1) Open the Virtual Server Administration web site within IE<BR>2) Click on "Create" under the "Virtual Machines" section in the navigation bar on the left side.<BR>3) Fill out the required/desired fields:<BR>Virtual Machine Name: UBUNTU<BR>Memory: 256MB<BR>Virtual hard disk: Select "Create a new virtual hard disk" - Size: 16 - Units: GB - Bus: IDE<BR>Virtual network adapter: Connected to: Internal Network<BR>4) Click the "Create" button</P>
<P><STRONG>Step 4: Install Ubuntu on our Virtual Machine<BR></STRONG>Follow the instructions within the Virtual Server Getting Started Guide to do this. Below are the steps I took:<BR>1) Open the Virtual Server Administration web site withing IE<BR>2) Click on the "UBUNTU" option within the "Configure" popup menu under the "Virtual Machines" section in the navigation bar on the left side. If you just created this Virtual Machine it will open up this page upon finishing its creation.<BR>3) Click the "CD / DVD" link under "UBUNTU Configuration"<BR>4) Select the "Known image files" option and enter the fully qualified path to the Ubuntu installation ISO image file. In my case I am using the location of "E:\UBUNTU\ubuntu-6.10-desktop-i386.iso".<BR>5) Click the "OK" button<BR>6) Now that you're back at the Virtual Machine Status page; point to the the Virtual Machine name (in this case it's UBUNTU) and Click "Turn On"<BR>7) Once turned on; run the Virtual Machine Remote Control Client - this can be found in Start Menu - All Programs - Virtual Server<BR>9) Type in the location of the Virtual Machine to connect to and connect to it. In my case it's "vmrc://chrisdesktop/UBUNTU"<BR>10) Follow the Ubuntu setup program</P>
<P>If you have any issues getting your Virtual Machine setup within Virtual Server 2005 R2 just reference the Getting Started Guide.</P>
<P>For help with the install process of Ubuntu check out the <A href="https://help.ubuntu.com/community/HowToConfigureUbuntuForMicrosoftVirtualPC2004">How To Configure Ubuntu For Microsoft Virtual PC 2004</A></P>
<P>&nbsp;</P>
