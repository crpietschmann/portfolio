---
layout: post
blogengineid: bbe74b06-3d56-49a2-a5ea-67f3777db21c
title: "Peeking inside the Twitter Windows 8 App"
date: 2013-03-17 07:54:32 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Windows Store App"]
redirect_from: 
  - /post/2013/03/17/Peeking-inside-the-Twitter-Windows-8-App
  - /post/2013/03/17/peeking-inside-the-twitter-windows-8-app
  - /post.aspx?id=bbe74b06-3d56-49a2-a5ea-67f3777db21c
---
<!-- more -->

I decide to peek inside the Twitter Windows 8 App package to see what language they are using and to see if I can find any open source projects being used within. Well, I found some interesting stuff…  <h3>How to view inside the package</h3>  
   
You can view any Windows 8 app package that is installed on your computer as it resides within the following folder:  
*C:\Program Files\WindowsApps*  
Each package has it’s own folder within that folder. Here’s the full path to the package folder where the Twitter apps files reside:  
*C:\Program Files\WindowsApps\9E2F88E3.Twitter_1.0.0.1_x64__wgeqdkkx372wm*  
The “x64” in the folder indicates that I have the Intel dependent 64-bit version of the app. If you have a Windows RT tablet, then you’ll have a different package that could either just be compiled for ARM or it could be different source code too.  
FYI: You wont have persmissions to view the contents of the WindowsApp folder by default. You can grant yourself access by opening up this folders Advanced Security Settings dialog and setting your local user or Administrators group as the “Owner” of the folder. This will allow you to peek within without messing up any other permissions related to the folder. However, please do this at your own risk as I cannot take responsibility if you mess anything up.  <h3>Twitter App Package Contents</h3>  
Here’s a screenshot of the root view of the Twitter apps package folder:  
<a href="/images/posts/Twitter_Win8App_PackageContents.png"><img title="Twitter_Win8App_PackageContents" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="Twitter_Win8App_PackageContents" src="/images/posts/Twitter_Win8App_PackageContents_thumb.png" width="504" height="710" /></a>  <h3>Written in XAML</h3>  
See all the “.xaml” files (for example the “App.xaml” in the screenshot above)? This indicates that the app is written in XAML.  
I actually suspected that Twitter would write the app using JavaScript. I’m actually slightly surprised to see that they chose to use XAML instead.  <h3>Local Data Storage</h3>  
The app does persist some data local (your recent tweets, etc.) I kind of wondered what they were using to do so,and now I know… The app uses **SQLite** as gleemed from the &quot;”sqlite3.dll” file.  <h3>Open Source</h3>  
While the app itself is NOT open source, they did decide to utilize a couple open source tools within the app. The tools used are:  
<a href="http://winrtxamltoolkit.com/">Callisto</a> – a helpful toolkit containing some utilities and UI controls to help complete your app’s Windows UI style quickly as well as consistent with the Windows UI guidelines.  
<a href="http://mvvmhelpers.codeplex.com/">JulMar MVVM Helpers</a> – a set of classes for developers to help them build Model-View-ViewModel oriented applications.  
<a href="http://winrtxamltoolkit.codeplex.com/">WinRT XAML Toolkit</a> – a set of controls, extensions and helper classes for Windows Runtime XAML applications.  <h3>Lots of Images</h3>  
The application also contains quite a few image resources used within it. These images are used for such things as: retweet and favorite indicators, the tweet and search buttons, and more.  
I’m not surprised they are using images to graphically represent these things. This is something that is pretty typical. If it were JavaScript they would need to, but since it’s XAML they could have written XAML controls to describe these images in a resolution independent manner instead. They likely chose not to since it really is easier to create static images.  
<a href="/images/posts/Twitter_Win8App_AssetsContents.png"><img title="Twitter_Win8App_AssetsContents" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="Twitter_Win8App_AssetsContents" src="/images/posts/Twitter_Win8App_AssetsContents_thumb.png" width="504" height="461" /></a>  
<a href="/images/posts/Twitter_Win8App_PackageContents_UserList.png"><img title="Twitter_Win8App_PackageContents_UserList" style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px" border="0" alt="Twitter_Win8App_PackageContents_UserList" src="/images/posts/Twitter_Win8App_PackageContents_UserList_thumb.png" width="504" height="134" /></a>  <h3>Conclusion</h3>  
While I didn’t find anything anything really out of the ordinary within the package, I am slightly surprised that they didn’t use JavaScript, as I assume Twitter would.  
Also, this same technique can be used to peek within any Windows 8 App’s package contents. XAML apps (like this one) are compiled into binary assemblies, so you can not view the full source code directly. However, if the app were written in JavaScript, then you would have the full source code to read.
