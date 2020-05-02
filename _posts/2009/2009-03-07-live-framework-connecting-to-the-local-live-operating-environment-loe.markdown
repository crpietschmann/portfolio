---
layout: post
blogengineid: 047fae73-c0f0-457c-a0ec-9d7454f6810e
title: "Live Framework: Connecting to the Local Live Operating Environment (LOE) for Offline Applications"
date: 2009-03-07 20:28:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2009/03/07/Live-Framework-Connecting-to-the-Local-Live-Operating-Environment-LOE.aspx
  - /post/2009/03/07/Live-Framework-Connecting-to-the-Local-Live-Operating-Environment-LOE
  - /post/2009/03/07/live-framework-connecting-to-the-local-live-operating-environment-loe
  - /post.aspx?id=047fae73-c0f0-457c-a0ec-9d7454f6810e
---
<!-- more -->

One of the things the <a href="http://dev.live.com/liveframework/">Live Framework</a> has to offer is a Local Live Operating Environment you can connect to so that you can Offline Enable your Live Framework Enabled Desktop Applications. I found the process of getting it to work a little tricky (especially since I was running Win7 Beta; I'll explain down further) so I've decided to write up a summary of my experience to help anyone else interested.

This was written using the Live Framework CTP.
<h3>Connecting to the Live Operating Environment</h3>

The "Live Operating Environment" is the main service that is hosted in the cloud by Microsoft. To connect to it and use it you are required to be connected to the Internet.

Basically to connect to the Live Operating Environment you need to prompt the user for their Windows Live ID and Password. Below is a very simple example of what is needed to create an instance of the LiveOperatingEnvironment object in C# and connect to the Live Operating Environment server.

```csharp

var credentials = new System.Net.NetworkCredentials(windowsLiveID, password);

var LOE = new LiveOperatingEnvironment();

LOE.Connect(credentials);

```

I you haven't really looked in to how this works, you can look at the ConnectCloud method of the Login.xaml.cs file of the Project Manager sample code within the Live Framework CTP SDK.
<h3>Connecting to the Local Live Operating Environment</h3>

Now, to connect to the **Local **Live Operating Environment instead, you basically just call the <a href="http://msdn.microsoft.com/en-us/library/dd139363.aspx">LiveOperatingEnvironment.ConnectLocal()</a> method instead of the <a href="http://msdn.microsoft.com/en-us/library/dd157894.aspx">Connect()</a> method shown above. Also, another big difference is you don't need to prompt the user for their Windows Live ID and Password, since the Local Live Operating Environment handles all the authentication for you.

```csharp

var LOE = new LiveOperatingEnvironment();

LOE.ConnectLocal();

```

This also has the benefit of only requiring the user to type in their Windows Live ID and Password once when they login with the Live Framework Client; which can actually save their password and auto log them in when they login to Windows.
<h3>Mesh Client or Live Framework Client? What's the difference?</h3>

When you go to <a href="http://mesh.com">http://mesh.com</a>, login, and click "Add Device" so you can Sync files with Mesh Folders, it has you install the Mesh Client. This install does not contain the Local Live Operating Environment you need when programming against the Live Framework SDK.

When you go to <a href="http://developer.mesh-ctp.com">http://developer.mesh-ctp.com</a>, login, and click "Add Device" so you can Sync files with the "dev" version of Mesh, it has you install the Live Framework Client. This is in fact the install you want that contains the Local Live Operating Environment.
<h3><span style="text-decoration: line-through;">Beware </span>the Mesh Client and Live Framework Client <span style="text-decoration: line-through;">don't</span> play well together</h3>

Actually, the latest update (April CTP) to the Live Framework Client does install and work correctly along-side the Mesh Client.AND, it now works on the Windows 7 Beta.

<span style="text-decoration: line-through;">There is a known issue of running the Live Framework Client and Mesh Client on the same machine; they simply don't work as installed out of the box. You need to perform a little registry edit to fix the issue. It sounds bad, but it is actually quite painless. </span>

<span style="text-decoration: line-through;">Here's instructions on how to get the Mesh Client and Live Framework Client to run Side By Side: </span>
<ol>
<li><span style="text-decoration: line-through;">Uninstall Live Framework Client.</span></li>
<li><span style="text-decoration: line-through;">Install Mesh Client Beta from <a href="http://mesh.com">http://mesh.com</a></span></li>
<li><span style="text-decoration: line-through;">Add the following registry item: HKCU\Software\Microsoft\Live Framework Client\AllowSxS = 1 (DWORD)</span></li>
<li><span style="text-decoration: line-through;">Install Live Framework Client from <a href="http://developer.mesh-ctp.com">http://developer.mesh-ctp.com</a>
</span></li>
</ol>

<span style="text-decoration: line-through;">The original posting of these instructions and a little more detail about them can be found here: </span>

<span style="text-decoration: line-through;"><a href="http://social.msdn.microsoft.com/Forums/en-US/liveframework/thread/2fa9d3f1-029e-44af-9568-1cea81ca78a9/">http://social.msdn.microsoft.com/Forums/en-US/liveframework/thread/2fa9d3f1-029e-44af-9568-1cea81ca78a9/</a></span>
<h3><span style="text-decoration: line-through;">Current Live Framework Client does not work on the Windows 7 Beta</span></h3>

<span style="text-decoration: line-through;">One thing to note before you start trying to develop against the Local Live Operating Environment is it does NOT run correctly on the Windows 7 Beta. In order to develop for it and use it you'll need to install it on Windows Vista (or presumably Windows XP). </span>
