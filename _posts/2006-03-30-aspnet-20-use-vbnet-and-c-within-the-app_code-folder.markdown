---
layout: post
blogengineid: f31bec4c-4716-48fb-826b-ca5926e83c42
title: "ASP.NET: Use VB.NET and C# within the App_Code folder"
date: 2006-03-30 21:39:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2006/03/30/ASPNET-20-Use-VBNET-and-C-within-the-App_Code-folder
  - /post/2006/03/30/aspnet-20-use-vbnet-and-c-within-the-app_code-folder
  - /post.aspx?id=f31bec4c-4716-48fb-826b-ca5926e83c42
---
<!-- more -->

When I was creating my new blog site (this site your looking at), I chose to write it in C#. I had a problem with the App_Code folder because I had some code in VB.NET code and some C# code I needed to put in there. I didn't want to rewrite my VB.NET code in the App_Code folder just so I could write the rest of the code for the site in C#.

Luckily, the ASP.NET Team had already thought about just this kind of circumstance. They implemented a way to partition the App_Code folder into sub-folders, one for each set of code files written in the same programming language. Awesome, I didn't have to spend a couple hours converting code from VB.NET to C#!

The below works with ASP.NET 2.0 and later.

Even if you don't use multiple different programming languages for your code files in the App_Code folder, you could use this feature to organize your sets of related code files into sub-folders.

**Step 1:** Add the following lines to the web.config
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><configuration>
    <system.web>
        <compilation>
            <codeSubDirectories>
                <add directoryName="VB_Code"/>
                <add directoryName="CS_Code"/>
            </codeSubDirectories>
        </compilation>
    </system.web>
</configuration></pre>

**Step 2:** Create a sub-folder in the App_Code folder for each language you want to support.<br /> For Example:<br /> /App_Code/VB_Code<br /> /App_Code/CS_Code

**Step 3:** Place your VB.NET code in the VB_Code folder and place C# code in the CS_Code folder.
