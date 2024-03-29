---
layout: post
blogengineid: 96ea5cad-e161-4bbb-b90a-12522b711312
title: "Silverlight: Anatomy of an .XAP file"
date: 2008-03-05 13:24:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/05/Silverlight-Anatomy-of-an-XAP-file
  - /post/2008/03/05/silverlight-anatomy-of-an-xap-file
  - /post.aspx?id=96ea5cad-e161-4bbb-b90a-12522b711312
---
<!-- more -->

Silverlight 2 Beta 1 just came out this morning, so I started checking it out immediately. I installed the Silverlight Tools for Visual Studio and noticed that when a Silverlight Application is compiled a .xap file is created that contains the application. But, what exactly is a .xap file, and what exaclty is in there?   
**What is an .xap file?**   
A .xap file is basically a compiled Silverlight application. The file is actually a .zip file that contains all the files necessary for the application. Just rename the .xap file to have a .zip extension and then you can open it up to see its contents. Just try it yourself.   
**What files are contained within the .xap file?**   
The .xap file contains an application manifest (AppManifest.xaml) file and all the necessary DLL's that are required by the application. The first DLL contained is the compiled version of you application and has the same name of your application. In my test I created an application names &quot;SilverlightApplication1&quot;, so the DLL is named &quot;SilverlightApplication1.dll&quot;. The rest of the DLL's are the dependancies the application requires.   
**What is the AppManifest.xaml file?**   
First lets look at an example AppManifest.xaml file:  <pre class="csharpcode"><span class="kwrd"><</span><span class="html">Deployment</span>
    <span class="attr">xmlns</span><span class="kwrd">=&quot;http://schemas.microsoft.com/client/2007/deployment&quot;</span>
    <span class="attr">xmlns:x</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;</span>
    <span class="attr">EntryPointAssembly</span><span class="kwrd">=&quot;SilverlightApplication1&quot;</span>
    <span class="attr">EntryPointType</span><span class="kwrd">=&quot;SilverlightApplication1.App&quot;</span>
    <span class="attr">RuntimeVersion</span><span class="kwrd">=&quot;2.0.30226.2&quot;</span><span class="kwrd">></span>
  <span class="kwrd"><</span><span class="html">Deployment.Parts</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">AssemblyPart</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;SilverlightApplication1&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;SilverlightApplication1.dll&quot;</span> <span class="kwrd">/></span>
    <span class="kwrd"><</span><span class="html">AssemblyPart</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;System.Windows.Controls&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;System.Windows.Controls.dll&quot;</span> <span class="kwrd">/></span>
    <span class="kwrd"><</span><span class="html">AssemblyPart</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;System.Windows.Controls.Extended&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;System.Windows.Controls.Extended.dll&quot;</span> <span class="kwrd">/></span>
  <span class="kwrd"></</span><span class="html">Deployment.Parts</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">Deployment</span><span class="kwrd">></span></pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


The first element in the AppManifest.xaml is a Deployment node. This node defines the application and contains child AssemblyPart nodes. 


As you can see the AssemblyPart nodes define what assemblies (DLLs) are contained within the .xap file, and give each of them a name. 


Now, if you look back up to the top, you'll see the Deployment node has EntryPointAssembly and EntryPointType attributes. The EntryPointAssembly attribute defines which assembly defined below (as a child AssemblyPart node) is the main assembly (DLL) for the application. And, the EntryPointType attribute specifies the Class contained within the assembly (DLL), defined in the EntryPointAssembly attribute, is the main class that will be instantiated to start the application. 


The Deployment node also has a RuntimeVersion attribute that defines the version of Silverlight the application is built for. 


**Conclusion**&#160; 


There you go, now you have a basic understanding of what an .xap file is. This article was written using Silverlight 2 Beta 1, so things may change in the final release, but I image the basics described here will still remain the same. 


I'm sure there are more child nodes and attributes that can be defined within the AppManifest.xaml file, but I have yet to see what they are since, I'm still new to Silverlight 2.0. 
