---
layout: post
blogengineid: bc314f2b-930f-48b4-9d8b-3bc84cc69f45
title: "Windows 7 Beta: Change the Logon UI Background Image"
date: 2009-03-16 19:03:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2009/03/16/Windows-7-Beta-Change-the-Logon-UI-Background-Image
  - /post/2009/03/16/windows-7-beta-change-the-logon-ui-background-image
  - /post.aspx?id=bc314f2b-930f-48b4-9d8b-3bc84cc69f45
---
<!-- more -->

Apparently, <a href="http://www.withinwindows.com/2009/03/15/windows-7-to-officially-support-logon-ui-background-customization/">Windows 7 will "officially" support Logon UI Background Customization</a>. The previous link describes what needs to be in place (a registry key and image file) for you to be able to have Windows 7 use any image you want as the Logon UI Background. What the previous link doesn't specify is if this works with the Windows 7 Beta (build 7000). Actually, I just test and confirmed that it does work perfectly in the Windows 7 Beta. Good news for us of whom can't (or don't want to) run a newer (possibly more buggy), "leaked" build of Windows 7.

<img style="padding-left: 5px" src="/images/posts/Windows7Beta_CustomLogonUIBackground.png" alt="" />

I'll describe the 2 basic steps needed to do this with the Windows 7 Beta, but to get more detail I recommend reading the article linked above.
<h3>Step 1: Add the Following Registry Key</h3>

Go to the "**HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background**" Registry location using Regedit.exe and add a DWORD value named "**OEMBackground**" and set it's value to **1** (enabled).
<h3>Step 2: Add an Image (JPG) file to be used</h3>

Add any image file you want to the "**%windir%\system32\oobe\info\backgrounds**" folder, and rename it to "**backgroundDefault.jpg**". Also, you'll want to make sure the image file is less than 256Kb in size. If the file size is bigger it wont use it.

And, it's that simple to set the Windows 7 Beta to use your own background image for the Logon UI.

 
