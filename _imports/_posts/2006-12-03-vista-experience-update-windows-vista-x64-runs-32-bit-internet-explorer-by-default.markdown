---
layout: post
blogengineid: a355a85d-e17e-425f-9600-cb7ceec16a6f
title: "Vista Experience Update: Windows Vista x64 runs 32-bit Internet Explorer by Default"
date: 2006-12-03 11:59:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2006/12/03/Vista-Experience-Update-Windows-Vista-x64-runs-32-bit-Internet-Explorer-by-Default
  - /post/2006/12/03/vista-experience-update-windows-vista-x64-runs-32-bit-internet-explorer-by-default
  - /post.aspx?id=a355a85d-e17e-425f-9600-cb7ceec16a6f
---
<!-- more -->

The Internet Explorer shortcut in the Quick Launch toolbar and in the Start menu of Vista x64 will run the 32-bit version of Internet Explorer by default. Why run the 32-bit version if IE on the 64-bit version of Vista?

There are actually two shortcuts for Internet Explorer in the "All Programs" menu. Why two and what's the difference?

Here's the title of each and the exe's they run:

Internet Explorer
"C:\Program Files (x86)\Internet Explorer\iexplore.exe"

Internet Explorer (64-bit)
"C:\Program Files\Internet Explorer\iexplore.exe"

The first one runs IE from the "Program Files (x86)" folder, this is the 32-bit version. The second one is the 64-bit version.

**How do I make the Quick Launch shortcut run the 64-bit version of IE?**
<ol>
<li>Right-Click the Shortcut</li>
<li>Click "Properties"</li>
<li>On the Shortcut tab, replace the content of the "Target" textbox with the target from the "Internet Explorer (64-bit)" shortcut in the "All Programs" menu.</li>
<li>Happy surfing via IE 64-bit</li>
</ol>

**Are there any gotchas to running the 64-bit version of IE?**

Actually there is one that I know of. At the time I'm posting this there is no 64-bit version of Flash Player. So, if you need to view a website that uses Flash, then you'll need to use the 32-bit version IE; at least for now. I'm sure Adobe will release a 64-bit version of Flash Player by the end of January when Vista ships to consumers. But then again, maybe not since Vista x64 runs 32-bit IE by default.

I wonder what other oddities like this are hidden within Vista.
