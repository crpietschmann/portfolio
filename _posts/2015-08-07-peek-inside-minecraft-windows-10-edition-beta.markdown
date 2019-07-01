---
layout: post
blogengineid: d9031fc9-fa01-4f33-b729-3f4d5a0d955d
title: "Peek Inside Minecraft Windows 10 Edition Beta"
date: 2015-08-07 17:15:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Windows Store App"]
redirect_from: 
  - /post/2015/08/07/Peek-Inside-Minecraft-Windows-10-Edition-Beta
  - /post/2015/08/07/peek-inside-minecraft-windows-10-edition-beta
  - /post.aspx?id=d9031fc9-fa01-4f33-b729-3f4d5a0d955d
---
<!-- more -->
<p><img style="float: right;" src="/images/posts/2015/08/Win10MinecraftBeta001_300x168.png" alt="" />Microsoft recently released the Minecraft: Windows 10 Edition Beta. It's a free app for existing Mojang customers who have already purchased the desktop/Java version of Minecraft. This is one of the first UWP apps for Windows 10 from Microsoft and given Minecraft's long history with Java, I thought I'd peek inside and see how much implementation details I could gleam. This post chronicles what I've been able to find out.</p>
<p><strong>Platform Details</strong></p>
<p>The current Beta release of Minecraft: Windows 10 Edition only supports 64-bit (x64) and 32-bit (x86) CPU's. This is visible since x64 is the only listed platform in the Windows Store listing for the app.</p>
<p>Here's the full platform list:</p>
<ul>
<li>x64 (64-bit) or x86 (32-bit) only; no ARM currently</li>
<li>DirectX 11</li>
<li>written in C++</li>
</ul>
<p><strong>Minecraft App Package Contents</strong></p>
<p>Below is the folder location where the app package is stored, along with a screen shot of the root folders contents.</p>
<p><em>C:\Program Files\WindowsApps\Microsoft.MinecraftUWP_0.12.1.0_x64__8wekyb3d8bbwe</em></p>
<p><img src="/images/posts/2015/08/Win10MinecraftBetaPackageFolder.png" alt="" /></p>
<p><strong>Package Inspection</strong></p>
<p><img style="float: right;" src="/images/posts/2015/08/MCSquare310x310Logo.scale-100.png" alt="" /></p>
<p>Upon further inspection of the image resources contained within the app package, it appears that this is the "Minecraft: Pocket Edition". Looking at the ".png" file in the root package folder, the images show "Pocket Edition" instead of "Windows 10 Edition Beta". This indicates that they possibly started with the Pocket Edition code base and ported it over to Windows 10.</p>
<p>The "<em>Minecraft.Win10.DX11.exe</em>" contains virtually the entire application, as there's only a single additional DLL within the package. This makes it difficult to tell what additional libraries, open source or otherwise, are used within the app. Also, being C++ there may possibly be some shared code between this and the XBox version, but again there isn't really any certain way to tell.</p>
<p>The "data" sub-folder within the package contains all the game asset (images, audio, etc) files.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/posts/2015/08/Win10MinecraftImageAssets.png" alt="" /></p>
<p>It can be concluded that the Minecraft Beta for Windows 10 uses DirectX 11, rather than the newer DirectX 12. This can be determined by the fact that the .EXE filename contains "DX11" as well as the existence of the "<em>data/shaders/dx11</em>" sub-folder within the package.</p>
<p>This is interesting since DirectX 12 does ship with Windows 10, and there shouldn't be any technical reason Microsoft wouldn't have used it with Minecraft. The leads me to believe that the reason it uses DirectX 11 is because they are leveraging an existing "Pocket Edition" code base that was built for DirectX 11. There are many reason this would be the case, but one theory is that Minecraft was originally to be released for Windows 8 and some where along the development cycle it was decided to hold off the release until Windows 10. This could possibly be one of the many tactics being employed in an attempt to lure users to upgrade to Windows 10 sooner than later.</p>
<p>Since the Minecraft Windows 10 Beta is written in C++, that definitely puts a stop on the theory that Microsoft would be porting / converting Minecraft over to use the .NET Framework instead of Java. It seems the native apps will still be C++, but this doesn't give us any details on the longer term life and future of the desktop, Java based version.</p>
<p><strong>Minecraft Features</strong></p>
<p>As a result of the Minecraft: Windows 10 Edition Beta being some kind of evolution of the "Pocket Edition" there are many conclusion you could come to. However, before you do here's a list of ways you can create / play:</p>
<ol>
<li>Worlds - local play</li>
<li>Realms - well, "coming soon" anyway</li>
<li>Friends - can connect to servers via IP/Address and Port number</li>
</ol>
<p>You can not connect to a standard Minecraft server you or some one else is hosting using the "Friends" feature. Basically, this is the "Pocket Edition" all the way through, and with it comes the "Pocket Edition" limitations we've all come accustomed to (No mods, no custom server, etc).</p>
<p><strong>Conclusion</strong></p>
<p>While it's really nice that Microsoft has brought Minecraft to the Windows Store; it is basically the Pocket Edition so no Mods are supported. We are unable to tell at this time whether Microsoft will bring ARM (yup I went there) support for the app in the future. Lastly, if you love your Mods and Server, as anyone serious about Minecraft does, then you'll likely want to stay away from this version as it's just as limited as the other "Pocket Editions"</p>
<p><sub><em>P.S. Sorry if I mispoke about Minecraft, people reading this post likely know more about it than I do. Feel free to leave a comment or contact me and I'll update the post. Thanks!!</em></sub></p>
