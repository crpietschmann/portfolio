---
layout: post
title: "Windows Vista Device Drivers for Belkin F5D7000 Wireless Network Card"
date: 2007-04-11 17:57:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2007/04/11/Windows-Vista-Device-Drivers-for-Belkin-F5D7000-Wireless-Network-Card
 -  /post/2007/04/11/windows-vista-device-drivers-for-belkin-f5d7000-wireless-network-card
---
<!-- more -->
<p>Update 2009-08-08: Belkin has since released a new device driver for this network card that supports Windows Vista x32 and x64. You'll want to try their driver first before continueing on to my "work around" solution below. I did try this new Belkin driver with Windows 7 and it didn't work, so now I'm back to my work around...</p>
<p>You can find the driver here:</p>
<p><a href="http://en-us-support.belkin.com/app/product/detail/p/294" target="_blank">Belkin: Support: F5D7000 Driver Support Page</a></p>
<p>Or, alternatively you can download the driver from the following direct link:</p>
<p><a href="http://cache-www.belkin.com/support/dl/f5d7000v8_ww_2.00.09.exe" target="_blank">Belkin F5D7000 Driver Version 8xxx (Windows 2000, Windows XP 32 BIT, Windows Vista 32 bit, Windows Vista 64 bit)</a></p>
<hr />
<p>I bought a Belkin F5D7000 802.11b/g wireless network card for my Vista x64 desktop machine. There aren't any Vista drivers on the install CD that comes with the card, so I went to the Belkin website and downloaded there "beta" driver for Vista. Well, I couldn't get that driver to work. So I then searched and found a mention that an Atheros driver will work. So I tried it.</p>
<p>It works! The "Atheros Wireless Network Adapter" driver that comes with Vista will work for the Belkin F5D7000 card.</p>
<p>When installing the driver for this card, click on the "Browse my computer for driver software". Then click "Let me pick from a list of device drivers on my computer". Once the list of drivers comes up, select "Atheros Communications Inc." as the Manufacturer, and then select "Atheros Wireless Network Adapter" as the the driver to use.</p>
<p>I hope this helps anyone, whos trying to install a Belkin F5D7000 wireless network card in their Vista box, that is too lazy to return it to the store and buy one that comes with Vista drivers.</p>
