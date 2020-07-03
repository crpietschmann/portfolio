---
layout: post
blogengineid: 7850f65e-8f57-4877-8ddf-f79e0d7a76b4
title: "Safari 3 for Windows: Enable JavaScript Debugging"
date: 2007-12-21 23:31:00 -0600
comments: true
published: true
categories: ["JavaScript", "Safari"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2007/12/21/Safari-3-for-Windows-Enable-JavaScript-Debugging.aspx
  - /post/2007/12/21/Safari-3-for-Windows-Enable-JavaScript-Debugging
  - /post/2007/12/21/safari-3-for-windows-enable-javascript-debugging
  - /post.aspx?id=7850f65e-8f57-4877-8ddf-f79e0d7a76b4
---
<!-- more -->

As you probably know, Safari 3 doesn't allow you to turn on the debug menu within any settings dialogs. It also doesn't come with a JavaScript Debugger either. This makes it almost impossible to do any JavaScript development for Safari. Luckily you can turn on the debug menu, and there is a debugger you can download.
<h3>Turn on the Debug menu</h3>

**Step 1:** Open up the Preferences.plist file in notepad.

In Windows XP:
*C:\Documents and Settings\USERNAME\Application Data\Apple Computer\Safari\Preferences.plist*

In Windows Vista:
*C:\Users\USERNAME\AppData\Roaming\Apple Computer\Safari\Preferences.plist*

**Step 2:** Add the following to the end of the file, just before "*</dict></plist>*":

*<key>IncludeDebugMenu</key><true/>*

**Step 3:** Now open up Safari and you have the Debug menu
<h3>Where can I find a Debugger for Safari?</h3>

You can download the Drosera debugger here: <a href="http://nightly.webkit.org">http://nightly.webkit.org</a>
Now, before you go trying to run it, you'll want to read the next section below.
<h3>How do I run Drosera in Windows?</h3>

**Step 1:** Make sure you download the Webkit Nightly Build located at <a href="http://nightly.webkit.org">http://nightly.webkit.org</a> and extract its contents somewhere on your harddrive.

**Step 2:** If you're running Win Vista then  you'll have to add the following to the WebKitPreferences.plist file, just before "*</dict></plist>*":

*<key>WebKitUserStyleSheetLocationPreferenceKey</key><true/>*

You can find the WebKitPreferences.plist file within the same folder that the Preferences.plist file is in; it's path is shown above. Also, if you're running Vista and you don't add this snippet to the WebKitPreferences.plist file, then Safari will crash and you wont be able to debug until you add it.

**Step 3:** Execute the *run-nightly-webkit.cmd* file. This will launch Safari.

**Step 4:** Execute the *run-drosera.cmd* file. This will launch Drosera.

**Step 5:** Execute the FindSafari.exe file. This will link up Drosera to your running instance of Safari.

If you have multiple instance you may want to close all but one. I don't know if multiple instances of Safari will cause this to not work, but it's better to be safe.

**Step 6:** Now you can access web pages with Safari and step through / break on errors in the code.
<h3>Additional Links</h3>

<a href="http://webkit.org">The WebKit Open Source Project</a>
<a href="http://developer.apple.com/internet/safari/faq.html#anchor14">Safai Developer FAQ - How do I debug JavaScript in Safari?</a>
<h3>Additional Comments</h3>

I'm not exactly sure why Apple makes us jump through these hoops to be able to debug JavaScript within Safari. It's quite a hassle, and even after all that work I still have the following issues with the experience:
<ul>
<li>Debugging with Drosera is very slow, and actually froze up a couple times on me and I had to restart Safari and Drosera.</li>
<li>Since I'm used to the debugging experience in MS Visual Studio, I am very dissapointed in Drosera. You'll know what I mean when you use it.</li>
</ul>

All in all, I hope this post saves someone the hours it took me to figure this all out. Afterall, there isn't any instructions (at least that I could find) on the WebKit site that tells you how to actually run Drosera on Windows.

Good luck, and I hope Apple improves the developer support for Safari.
