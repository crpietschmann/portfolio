---
layout: post
blogengineid: 7c154455-3caa-4855-9d04-8bb38b1b1593
title: "Windows System Properties - Add Custom Manufacturer Properties"
date: 2004-08-06 20:29:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/08/06/Windows-System-Properties-Add-Custom-Manufacturer-Properties
  - /post/2004/08/06/windows-system-properties-add-custom-manufacturer-properties
  - /post.aspx?id=7c154455-3caa-4855-9d04-8bb38b1b1593
---
<!-- more -->


Here is a pretty neat edit you can do to add your own manufacturer information and logo to the System Properties dialog.

<font size="-1">
</font>
<img src="/files/WinXPSysPropCustomManufacturer.jpg" alt="" align="right" />


<font size="-1"><span class="header">Show Computer Manufacturer and Support Information</span> *(All Windows)*

This tip lets you include company and support information on the System Properties page in Control Panel. This is especially useful if you run a computer store and want your customers to be reminded where they bought their PC and where to get technical support.



To add the manufacturer and support information you need to create two new files in the Windows system directly, normally &quot;C:\WINDOWS\SYSTEM&quot; for Windows 95, 98 and Me and &quot;C:\WINNT\SYSTEM32&quot; for Windows NT and 2000.</font>



<font size="-1">The first file is a text file called &quot;OEMINFO.INI&quot;. To create the file open notepad and copy the template below, make any changes and save the file in the System directory. 
</font>



<font size="-1">OEMINFO.INI Template 
</font>



 

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


<font size="-1">The other file you need to create is a logo file. This is a standard Windows bitmap file (172 x 172 pixels), saved as &quot;OEMLOGO.BMP&quot; in the Windows System directory. 
</font>



<font size="-1">Once you have created both these files open System Properties from Control Panel and your company information and logo will be displayed. The details you entered in the [Support Information] section will show up when you click on the Support Information button.</font>



<font size="-1"><font size="2">Original Page: </font><a href="http://www.winguides.com/registry/display.php/293/">*http://www.winguides.com/registry/display.php/293/*</a></font>



 

 
