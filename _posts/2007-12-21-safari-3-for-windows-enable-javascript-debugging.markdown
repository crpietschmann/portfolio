  ---
  layout: post
  title: "Safari 3 for Windows: Enable JavaScript Debugging"
  date: 2007-12-21 23:31:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2007/12/21/Safari-3-for-Windows-Enable-JavaScript-Debugging", "/post/2007/12/21/safari-3-for-windows-enable-javascript-debugging"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>As you probably know, Safari 3 doesn't allow you to turn on the debug menu within any settings dialogs. It also doesn't come with a JavaScript Debugger either. This makes it almost impossible to do any JavaScript development for Safari. Luckily you can turn on the debug menu, and there is a debugger you can download.</p>
<h3>Turn on the Debug menu</h3>
<p><strong>Step 1:</strong> Open up the Preferences.plist file in notepad.</p>
<p>In Windows XP:<br /><em>C:\Documents and Settings\USERNAME\Application Data\Apple Computer\Safari\Preferences.plist</em></p>
<p>In Windows Vista:<br /><em>C:\Users\USERNAME\AppData\Roaming\Apple Computer\Safari\Preferences.plist</em></p>
<p><strong>Step 2:</strong> Add the following to the end of the file, just before "<em>&lt;/dict&gt;&lt;/plist&gt;</em>":</p>
<p><em>&lt;key&gt;IncludeDebugMenu&lt;/key&gt;&lt;true/&gt;</em></p>
<p><strong>Step 3:</strong> Now open up Safari and you have the Debug menu</p>
<h3>Where can I find a Debugger for Safari?</h3>
<p>You can download the Drosera debugger here: <a href="http://nightly.webkit.org">http://nightly.webkit.org</a><br />Now, before you go trying to run it, you'll want to read the next section below.</p>
<h3>How do I run Drosera in Windows?</h3>
<p><strong>Step 1:</strong> Make sure you download the Webkit Nightly Build located at <a href="http://nightly.webkit.org">http://nightly.webkit.org</a> and extract its contents&nbsp;somewhere on your harddrive.</p>
<p><strong>Step 2:</strong> If you're running Win Vista then&nbsp; you'll have to add the following to the WebKitPreferences.plist file, just before "<em>&lt;/dict&gt;&lt;/plist&gt;</em>":</p>
<p><em>&lt;key&gt;WebKitUserStyleSheetLocationPreferenceKey&lt;/key&gt;&lt;true/&gt;</em></p>
<p>You can find the WebKitPreferences.plist file within the same folder that the Preferences.plist file is in; it's path is shown above. Also, if you're running Vista and you don't add this snippet to the WebKitPreferences.plist file, then Safari will crash and you wont be able to debug until you add it.</p>
<p><strong>Step 3:</strong> Execute the <em>run-nightly-webkit.cmd</em> file. This will launch Safari.</p>
<p><strong>Step 4:</strong> Execute the <em>run-drosera.cmd</em> file. This will launch Drosera.</p>
<p><strong>Step 5:</strong> Execute the FindSafari.exe file. This will link up Drosera to your running instance of Safari.</p>
<p>If you have multiple instance you may want to close all but one. I don't know if multiple instances of Safari will cause this to not work, but it's better to be safe.</p>
<p><strong>Step 6:</strong> Now you can access web pages with Safari and step through / break on errors in the code.</p>
<h3>Additional Links</h3>
<p><a href="http://webkit.org">The WebKit Open Source Project</a><br /><a href="http://developer.apple.com/internet/safari/faq.html#anchor14">Safai Developer FAQ - How do I debug JavaScript in Safari?</a></p>
<h3>Additional Comments</h3>
<p>I'm not exactly sure why Apple makes us jump through these hoops to be able to debug JavaScript within Safari. It's quite a hassle, and even after all that work I still have the following issues with the experience:</p>
<ul>
<li>Debugging with Drosera is very slow, and actually froze up a couple times on me and I had to restart Safari and Drosera.</li>
<li>Since I'm used to the debugging experience in MS Visual Studio, I am very dissapointed in Drosera. You'll know what I mean when you use it.</li>
</ul>
<p>All in all, I hope this post saves someone the hours it took me to figure this all out. Afterall, there isn't any instructions (at least that I could find) on the WebKit site that tells you how to actually run Drosera on Windows.</p>
<p>Good luck, and I hope Apple improves the developer support for Safari.</p>
