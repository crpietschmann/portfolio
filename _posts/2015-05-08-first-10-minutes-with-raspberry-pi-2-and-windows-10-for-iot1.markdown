---
layout: post
blogengineid: a8b8af34-4bf2-47ec-ab22-19d83e7f03af
title: "First 10 Minutes with Raspberry Pi and Windows 10 for IoT"
date: 2015-05-08 07:53:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Internet of Things", "Raspberry Pi"]
redirect_from: 
  - /post/2015/05/08/First-10-Minutes-with-Raspberry-Pi-2-and-Windows-10-for-IoT1
  - /post/2015/05/08/first-10-minutes-with-raspberry-pi-2-and-windows-10-for-iot1
  - /post.aspx?id=a8b8af34-4bf2-47ec-ab22-19d83e7f03af
---
<!-- more -->

<img style="float: right;" src="/images/posts/2015/05/RaspberryPi2withMicroSDCard.png" alt="" />

My very first Raspberry Pi arrived yesterday. I'm super excited to get playing, and frankly I probably should have gotten one of the older versions sooner. Now that I've got Pi, I can start hacking! Since this is a <a href="http://amzn.to/2bUfR3e" target="_blank">Raspberry Pi 2</a> (same goes for the <a href="http://amzn.to/2bUfR3e" target="_blank">Raspberry Pi 3</a>!), it can run the new Windows 10 for IoT making it easy to build apps for it with C# and Visual Studio. Well, I haven't gotten to actually building any apps yet, but was able to get Windows 10 for IoT setup.
<h3>Install Windows 10 for IoT</h3>

Installing Windows 10 for IoT to the Raspberry Pi is a bit different than booting up a PC from USB or DVD to install Windows. To "install" Windows 10 for IoT you need to copy the disk image for Windows 10 for IoT over to a Micro SD card using a PC then put that card into the Raspberry Pi 2. I successfully referenced <a href="http://www.hanselman.com/blog/SettingUpWindows10ForIoTOnYourRaspberryPi2.aspx" target="_blank">Scott Hanselman's "Setting up Windows 10 for IoT on your Raspberry Pi 2"</a> post for doing this.

For quick reference, the steps taken:
<ol>
<li>Go to <a href="https://connect.microsoft.com/windowsembeddedIoT/Downloads/">Windows Embedded Connect</a> site and download the Windows 10 for IoT Insider Preview for Raspberry Pi 2</li>
<li>Plug your Micro SD card into a Windows 10 PC (I used my Surface Pro, but for others a Micro SD card adapter may be required)</li>
<li>Open the command line on the Windows 10 PC with Administrator privileges</li>
<li>Run "*wmic diskdrive list brief*" to get the physical disk number of your Micro SD card</li>
<li>Run *"dism.exe /Apply-Image /ImageFile:flash.ffu /ApplyDrive:\\.\PhysicalDrive**#** /SkipPlatformCheck"* The '#' will be the number for disk number for the Micro SD card.</li>
<li>Put the Micro SD card into the Raspberry Pi 2</li>
<li>Connect Raspberry Pi 2 to HDMI and power on</li>
</ol>

If you want a bigger explanation of the steps, see Scott Hanselman's post. Thanks Scott!

Here's a screenshot of the console installing the "flash.ffu" image to the Micro SD card:

<img src="/images/posts/2015/05/InstalWin10ImageOnMicroSDCard.PNG" alt="" />
<h3>Micro SD Card Details</h3>

<img style="float: right;" src="/images/posts/2015/05/Win10IOTDiskSpaceUsageOnMicroSDCard.PNG" alt="" />

A couple questions I wondered when I bought the Raspberry Pi 2 were:
<ol>
<li>How big of a Micro SD card is needed?</li>
<li>What speed / class of Micro SD card is needed?</li>
</ol>

After some searching on what size Micro SD card to get I decided to get an 8GB. For a Windows machine that seems really small, but this is an IoT device after all. Plus after downloading the Windows 10 for IoT Raspberry Pi 2 build, I was able to find that the "flash.ff" disk image file was only 802MB. After installing the image to the disk, I opened Explorer to find that the total formatted disk space is 63.7MB with **only 12.7MB used**.

For the SD Card Speed / Class, I did find somewhere that only a "Class 10" Micro SD card is supported. Then to verify I was able to find the following Known Issue within the Windows 10 for IoT readme:
<blockquote>

27. A black screen may be seen during boot because the default app is failing on slow class 4 SD cards. (2462306)
        WORKAROUND:    Do not use a class 4 SD card.
</blockquote>

So, at least with the Insider Preview build, a **Class 10 Micro SD Card is needed**.
<h3>Booting up Windows 10 for IoT</h3>

Once you have the Windows 10 for IoT image on the Micro SD card, you can put it into the Raspberry Pi 2 and power it on. Make sure you connect an HDMI monitor to it so you can see the screen. Also, for it to connect to the network you'll need to connect an Ethernet cable too.

Initially, it went though a couple different screens, including a mysterious blank screen.

<img src="/images/posts/2015/05/Win10IoTRaspberryPi2InitialStartupScreens.png" alt="" />

Then after a couple minutes, it displayed the default screen displaying the machine name and IP Address configuration.

<img src="/images/posts/2015/05/IMG_1875.JPG" alt="" />
<h3>Conclusion</h3>

This is pretty much as far as I got on day 1. I didn't have much time, but I just could wait to get things booted up. Now that I know it works I can start hacking soon, hopefully I'll have time this weekend!

*P.S. With the initial research and writing this blog post, I definitely ended up spending more than 10 minutes. But only about 10 minutes of it was spent on Windows 10 for IoT and Raspberry PI.*
