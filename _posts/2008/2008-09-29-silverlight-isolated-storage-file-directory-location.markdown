---
layout: post
blogengineid: 8d43d52a-981b-4086-9afc-26d0913edf26
title: "Silverlight Isolated Storage File/Directory Location"
date: 2008-09-29 16:33:00 -0500
comments: true
published: true
categories: ["Silverlight"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/09/29/Silverlight-Isolated-Storage-File-Directory-Location.aspx
  - /post/2008/09/29/Silverlight-Isolated-Storage-File-Directory-Location
  - /post/2008/09/29/silverlight-isolated-storage-file-directory-location
  - /post.aspx?id=8d43d52a-981b-4086-9afc-26d0913edf26
---
<!-- more -->


I was just building something in Silverlight that makes use of the Isolated Storage, and I uncovered a bug in Silverlight 2 Beta 2 that cause&#39;s it to crash and you are unable to write to the Isolated Storage. So, I dug in and found the location on disk where Silverlight stores the files for Isolated Storage.



Here&#39;s the file location under Windows Vista where Silverlight stores the files for Isolated Storage:



*C:\Users\{username}\AppData\LocalLow\Microsoft\Silverlight\is*



Just replace the text &quot;{username}&quot; with the Windows Username of the user the data is stored for.



The bug that I ran into was also causing the Silverlight Configuration dialog (which pops up when you right click on Silverlight content within the browser) to crash when I selected the Application Storage tab. So, this bug prevented me from clearing the cache, and I wasn&#39;t able to get my app working again. I just deleted all the files within the above directory and if fixed my problem.



If I figure out what I did to cause the issue, I&#39;ll find the place to report the bug. 

