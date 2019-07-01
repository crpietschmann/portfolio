---
layout: post
title: "Silverlight: Anatomy of an .XAP file"
date: 2008-03-05 13:24:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/05/Silverlight-Anatomy-of-an-XAP-file
 -  /post/2008/03/05/silverlight-anatomy-of-an-xap-file
---
<!-- more -->
<p>Silverlight 2 Beta 1 just came out this morning, so I started checking it out immediately. I installed the Silverlight Tools for Visual Studio and noticed that when a Silverlight Application is compiled a .xap file is created that contains the application. But, what exactly is a .xap file, and what exaclty is in there? </p>  <p><strong>What is an .xap file?</strong> </p>  <p>A .xap file is basically a compiled Silverlight application. The file is actually a .zip file that contains all the files necessary for the application. Just rename the .xap file to have a .zip extension and then you can open it up to see its contents. Just try it yourself. </p>  <p><strong>What files are contained within the .xap file?</strong> </p>  <p>The .xap file contains an application manifest (AppManifest.xaml) file and all the necessary DLL's that are required by the application. The first DLL contained is the compiled version of you application and has the same name of your application. In my test I created an application names &quot;SilverlightApplication1&quot;, so the DLL is named &quot;SilverlightApplication1.dll&quot;. The rest of the DLL's are the dependancies the application requires. </p>  <p><strong>What is the AppManifest.xaml file?</strong> </p>  <p>First lets look at an example AppManifest.xaml file:</p>  <pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">Deployment</span>
    <span class="attr">xmlns</span><span class="kwrd">=&quot;http://schemas.microsoft.com/client/2007/deployment&quot;</span>
    <span class="attr">xmlns:x</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;</span>
    <span class="attr">EntryPointAssembly</span><span class="kwrd">=&quot;SilverlightApplication1&quot;</span>
    <span class="attr">EntryPointType</span><span class="kwrd">=&quot;SilverlightApplication1.App&quot;</span>
    <span class="attr">RuntimeVersion</span><span class="kwrd">=&quot;2.0.30226.2&quot;</span><span class="kwrd">&gt;</span>
  <span class="kwrd">&lt;</span><span class="html">Deployment.Parts</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">AssemblyPart</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;SilverlightApplication1&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;SilverlightApplication1.dll&quot;</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">AssemblyPart</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;System.Windows.Controls&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;System.Windows.Controls.dll&quot;</span> <span class="kwrd">/&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">AssemblyPart</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;System.Windows.Controls.Extended&quot;</span> <span class="attr">Source</span><span class="kwrd">=&quot;System.Windows.Controls.Extended.dll&quot;</span> <span class="kwrd">/&gt;</span>
  <span class="kwrd">&lt;/</span><span class="html">Deployment.Parts</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">Deployment</span><span class="kwrd">&gt;</span></pre>
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

<p>The first element in the AppManifest.xaml is a Deployment node. This node defines the application and contains child AssemblyPart nodes. </p>

<p>As you can see the AssemblyPart nodes define what assemblies (DLLs) are contained within the .xap file, and give each of them a name. </p>

<p>Now, if you look back up to the top, you'll see the Deployment node has EntryPointAssembly and EntryPointType attributes. The EntryPointAssembly attribute defines which assembly defined below (as a child AssemblyPart node) is the main assembly (DLL) for the application. And, the EntryPointType attribute specifies the Class contained within the assembly (DLL), defined in the EntryPointAssembly attribute, is the main class that will be instantiated to start the application. </p>

<p>The Deployment node also has a RuntimeVersion attribute that defines the version of Silverlight the application is built for. </p>

<p><strong>Conclusion</strong>&#160; </p>

<p>There you go, now you have a basic understanding of what an .xap file is. This article was written using Silverlight 2 Beta 1, so things may change in the final release, but I image the basics described here will still remain the same. </p>

<p>I'm sure there are more child nodes and attributes that can be defined within the AppManifest.xaml file, but I have yet to see what they are since, I'm still new to Silverlight 2.0. </p>
