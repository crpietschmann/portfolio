---
layout: post
blogengineid: 83b0a1cb-e4a7-4635-9c4d-108aa49fbf4f
title: "Hack to Force new Skype for Business UI over Lync"
date: 2015-04-24 06:57:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2015/04/24/Hack-to-Force-new-Skype-for-Business-UI-over-Lync1
  - /post/2015/04/24/hack-to-force-new-skype-for-business-ui-over-lync1
  - /post.aspx?id=83b0a1cb-e4a7-4635-9c4d-108aa49fbf4f
---
<!-- more -->

<a style="float: right;" href="/images/posts/2015/04/SkypeForBusinessRestartPrompt.PNG" target="_blank"><img style="width: 200px;" src="/images/posts/2015/04/SkypeForBusinessRestartPrompt.PNG" alt="" /></a>Microsoft recently released an update that rebrands Lync as Skype for Business. Many got the update automatically through Windows Update, but not everyone gets the new user interface (UI). There is a Lync Server setting that tells the client to use the either the old Lync or the new Skype for Business UI. If the server doesn't have this setting, such as older Lync servers that haven't been updated yet, then the default is to show the old Lync UI. One frustrating part of this update/change from a user perspective is that you have no real choice of which UI version you want to see/use everyday; or is there?

Fortunately, I figured out a hack to allow you to use the new Skype for Business UI even if your organizations Lync server hasn't been updated, or the admins just want you to use the Lync UI instead. The hack involves making a small edit to the Windows Registry for the app.
<h3>Steps to Enable Skype UI</h3>

Follow these simple steps to enable the new Skype UI:
<ol>
<li>Make sure the Skype for Business client application is closed</li>
<li>Make sure your user account on the local computer is an "Administrator"</li>
<li>Run "regedit.exe"</li>
<li>Navigate to the registry key</li>
<li>Change the value to "00 00 00 01"</li>
<li>Run Skype for Business client application</li>
<li>When prompted to restart, click "Restart Later"</li>
</ol>

<em>Note: Modify the Windows Registry at your own risk. If you modify the wrong setting it could have bad, unintended consequences. It is always a good idea to backup the registry before modifying it.</em>
<h3>Registry Key to Change</h3>

To force the Skype for Business UI you need to update the following registry key to be a value that equivalent to "True."

**HKEY_CURRENT_USER\Software\Microsoft\Office\Lync\EnableSkypeUI**

The "False" value is "00 00 00 00". So updating this to "00 00 00 01" will set it to "True". Here's a screenshot of the Registry Editor:

<img src="/images/posts/2015/04/SkypeForBusinessRegistryHack.PNG" alt="" />
<h3> </h3>
<h3>Requirements and Pitfalls</h3>

There are a few things to keep in mind for this hack:
<ol>
<li>"Administrator" access to your local computer is required in order to use the Registry Editor (regedit.exe)</li>
<li>You need to make this registry edit before you launch the app each time. Every time the app is closed, the value will be forced back to the setting sent from the Lync server.</li>
<li>Some of the new Skype for Business features may not work since they require the new Skype for Business Server Update. If the server is an old Lync server, then the new features will not be supported even though the Skype for Business client application may show them available.</li>
<li>If your admins are forcing the Lync UI, then they will not be happy with any support calls regarding the new Skype for Business UI. So, implement this hack at your own risk.</li>
</ol>

Enjoy the new Skype for Business UI!
