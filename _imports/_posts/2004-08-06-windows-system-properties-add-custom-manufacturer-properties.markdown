---
layout: post
title: "Windows System Properties - Add Custom Manufacturer Properties"
date: 2004-08-06 20:29:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
alias: ["/post/2004/08/06/Windows-System-Properties-Add-Custom-Manufacturer-Properties", "/post/2004/08/06/windows-system-properties-add-custom-manufacturer-properties"]
---
<!-- more -->
<p>
Here is a pretty neat edit you can do to add your own manufacturer information and logo to the System Properties dialog.
</p>
<font size="-1">
</font>
<img src="/images/postsWinXPSysPropCustomManufacturer.jpg" alt="" align="right" />
<p>
<font size="-1"><span class="header">Show Computer Manufacturer and Support Information</span> <em>(All Windows)</em><br />
This tip lets you include company and support information on the System Properties page in Control Panel. This is especially useful if you run a computer store and want your customers to be reminded where they bought their PC and where to get technical support.<br />
<br />
To add the manufacturer and support information you need to create two new files in the Windows system directly, normally &quot;C:\WINDOWS\SYSTEM&quot; for Windows 95, 98 and Me and &quot;C:\WINNT\SYSTEM32&quot; for Windows NT and 2000.</font>
</p>
<p>
<font size="-1">The first file is a text file called &quot;OEMINFO.INI&quot;. To create the file open notepad and copy the template below, make any changes and save the file in the System directory. 
</font>
</p>
<p>
<font size="-1">OEMINFO.INI Template 
</font>
</p>
<p>
&nbsp;
</p>
<pre>
<font size="-1">[General]
Manufacturer=Your Company, Inc.
Model=Your Computer Model
SupportURL=http://your.support.site/
LocalFile=c:\your\local\support\file.htm
[Support Information]
Line1</font><font size="-1">=first line
Line2=second line
Line3=third line
Line4=fourth line
...
LineN=nth line
; Create as many lines as you need by incrementing the Line number
</font>
</pre>
<p>
<font size="-1">The other file you need to create is a logo file. This is a standard Windows bitmap file (172 x 172 pixels), saved as &quot;OEMLOGO.BMP&quot; in the Windows System directory. 
</font>
</p>
<p>
<font size="-1">Once you have created both these files open System Properties from Control Panel and your company information and logo will be displayed. The details you entered in the [Support Information] section will show up when you click on the Support Information button.</font>
</p>
<p>
<font size="-1"><font size="2">Original Page: </font><a href="http://www.winguides.com/registry/display.php/293/"><em>http://www.winguides.com/registry/display.php/293/</em></a></font>
</p>
<p>
&nbsp;
</p>
&nbsp;
