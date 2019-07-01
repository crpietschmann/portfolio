---
layout: post
blogengineid: fa4fbb6a-6f47-4f43-91c1-f0ebb04544f8
title: "How To Use ASP.NET MVC in Website rather than Web Application Project"
date: 2008-08-15 16:15:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "ASP.NET MVC"]
redirect_from: 
  - /post/2008/08/15/How-To-Use-ASPNET-MVC-in-Website-rather-than-Web-Application-Project
  - /post/2008/08/15/how-to-use-aspnet-mvc-in-website-rather-than-web-application-project
  - /post.aspx?id=fa4fbb6a-6f47-4f43-91c1-f0ebb04544f8
---
<!-- more -->


<img src="/images/postsASPNETMVC_Preview4_WebsiteFileStructure.png" alt="" align="right" />
I recently started getting to know the ASP.NET MVC Framework (more specifically the Preview 4 release). The first thing I noticed upon installation is that it only comes with a Web Application Project Template. There is no regular ASP.NET Website template. So, I decided to try converting the Web Application Project Template to a regular ASP.NET Website. I actually prefer to use Website projects instead of Web Application projects since it gives a little more flexibility to deploy changes to the website after the website is already live. Plus, you can still throw anything you want into a DLL that goes into the Bin if you want.



I only needed to make a couple small changes when copying over the code into a new ASP.NET Website:

<ol>
	<li>Convert the .aspx pages from using CodeBehind to CodeFile.</li>
	<li>Place the Controllers folder into the App_Code.</li>
	<li>Change the Global.asax to be ASP.NET Website friendly (aka Not compile into DLL like in Web Application Project) </li>
</ol>


That&#39;s pretty much it, now I have a nice ASP.NET MVC Website template that I can use. To the right is an image of the file layout of the new ASP.NET MVC Website project.



The ASP.NET MVC release I used for this was the <a href="http://www.codeplex.com/aspnet/Release/ProjectReleases.aspx?ReleaseId=15389#ReleaseFiles">ASP.NET MVC Preview 4 release available on CodePlex</a>. 



Also, here&#39;s a link to download the code: <a rel="enclosure" href="/file.axd?file=ASPNETMVC_Preview4_Website.zip">ASP.NET MVC_Preview4_Website Project.zip (192.03 kb) <br />
</a>

