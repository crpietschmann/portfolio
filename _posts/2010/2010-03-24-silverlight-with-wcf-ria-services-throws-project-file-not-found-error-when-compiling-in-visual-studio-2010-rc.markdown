---
layout: post
blogengineid: c4f6aa92-1aea-4632-8397-d0b0baabc900
title: "Silverlight with WCF RIA Services Throws 'Project File ... Not Found' Error When Compiling in Visual Studio 2010 RC"
date: 2010-03-24 15:24:00 -0500
comments: true
published: true
categories: ["Silverlight", "WCF"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2010/03/24/Silverlight-with-WCF-RIA-Services-Throws-Project-File-Not-Found-Error-When-Compiling-in-Visual-Studio-2010-RC.aspx
  - /post/2010/03/24/Silverlight-with-WCF-RIA-Services-Throws-Project-File-Not-Found-Error-When-Compiling-in-Visual-Studio-2010-RC
  - /post/2010/03/24/silverlight-with-wcf-ria-services-throws-project-file-not-found-error-when-compiling-in-visual-studio-2010-rc
  - /post.aspx?id=c4f6aa92-1aea-4632-8397-d0b0baabc900
---
<!-- more -->

While working with the Silverlight Business Application template in Visual Studio 2010 RC I discovered a peculiar issue that if the project specified as the "WCF RIA Services Link" for the Silverlight Project can not be found a compile time error of "Project File ... Not Found" will be generated. This is a very cryptic error message since it's the same message that gets thrown if you delete a Project File (.csproj or .vbproj) from the hard drive but it's still references within the Solution File. This took me a little while to figure out, and I only discovered it when I looked through the Project File of my Silverlight Application. This particular issue may also apply to the VS'10 RTM once it's release, only time will tell if they fix it before then.
<h3>The project file "..\App.Website\App.Website.csproj" was not found.</h3>

 
<h3>What Causes The Error
</h3>

What I did to cause this issue to come up was I created a New Project using the Silverlight 4 Business Application Template. Then I moved the each Projects folder to a different sub-folder to better organize the code since I needed to add multiple more projects/assemblies to each application (ASP.NET and Silverlight) to build out the application I'm working in a more module fashion. The reason I usually tend to do this is to keep the "Standard .NET" and "Silverlight-only" assemblies separate since you can not include a non-Silverlight Assembly within a Silverlight Project. (If only .NET and Silverlight made it easier to share whole assemblies...)

After moving the projects to different sub-folders, and fixing the linked file references that I broke in the process, I tried building the project to make sure everything was "ok" and the compiler threw a *"The project file ... was not found." *error.

To fix this is really simple, but then again only if you know what to look for.
<h3>How To Fix It
</h3>

To fix this all you need to do is go to the Project Properties for the Silverlight Project, and change the "WCF RIA Services link" dropdown to select the correct ASP.NET Project; then you'll be all ready to compile and keep developing.

Below is a screenshot of VS'10RC showing the Error Message and the Properties UI for changing the WCF RIA Services link.

<a href="/files/2010/3/VS2010RC1_Silverlight_BusinessTemplate_WCFRIAServicesLink_ProjectNotFound.png"><img src="/files/2010/3/VS2010RC1_Silverlight_BusinessTemplate_WCFRIAServicesLink_ProjectNotFound.png" border="0" alt="" /></a>
<h3>Is This A Bug?</h3>

I certainly consider this to be a bug, since the error message that is shown if you have the "WCF RIA Services link" set to a non-existent project doesn't really point you in the direction of fixing the issue; at least directly. Yes, if you look at the "Project" specified for the Error it does specify the Silverlight Project, but doesn't exactly spell out where to look to fix the issue.

Instead of the cryptic message, I propose that it state something like *"WCF RIA Services link Error; the "App.Website" project was not found."*

I hope this article helps others solve this potentially very perplexing issue.
