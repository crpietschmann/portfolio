---
layout: post
blogengineid: 0a7d9d3f-9f03-4c26-8536-620a899d1903
title: "Silverlight: Modify MEF to load plugins from DLL and XAP files"
date: 2010-10-22 12:44:42 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight", "C#"]
redirect_from: 
  - /post/2010/10/22/Silverlight-Modify-MEF-to-load-plugins-from-DLL-and-XAP-files
  - /post/2010/10/22/silverlight-modify-mef-to-load-plugins-from-dll-and-xap-files
  - /post.aspx?id=0a7d9d3f-9f03-4c26-8536-620a899d1903
---
<!-- more -->

I’m using MEF in a new project, and the limitation that I’ve found in using MEF with Silverlight is that it only supports downloading and loading plugins/assemblies from XAP files. What I would really like to do is support plugins that are compiled into either individual DLL’s or more complex plugins within a XAP.  
Update: I have also posted this to the <a href="http://mef.codeplex.com/workitem/12328">Issue Tracker on the MEF CodePlex site</a>.  <h3>Why individual DLL’s?</h3>  
The really answer to this is flexibility. I don’t think they creators of MEF made a mistake supporting XAP file, but I think they made a mistake by not supporting DLL’s in addition.  
XAP files are great. They allow you to package your entire plugin, along with its dependencies, into a single file that gets loaded by the app at runtime. You never have to worry about the plugin breaking due to a missing assembly reference since they are all right there.  
However, where XAPs fail is when you have many XAPs that have dependencies on the same assemblies that are already referenced in the host application. These assemblies are added to the XAP (basically only the 3rd party assemblies, not core Silverlight assemblies) and downloaded with each XAP separately.  
Lets say you have an application where you are using a 3rd party library, say the Bing Maps Silverlight Control, and you have 10 plugins all compiled into their own XAP that have references to the 3rd party library. This mean that the file size of each XAP is increased with the 3rd party library. When each XAP is downloaded, so is the 3rd party library. In this case it’s needlessly downloaded 10 times!  
In this scenario, the XAP files are adding bloat by including the 3rd party library. You could remove the reference, to leave the library out, but then your XAP file wouldn’t compile.  
This is the very reason why supporting DLL’s, in addition to XAP’s, is important. If you know that multiple plugins to your application will be utilizing the same 3rd party library, then you could add its reference to the host application. Then with the host already having it loaded, you could load the plugins compiled as DLL’s, and only be downloading the 3rd party library once; when the application loads. This will reduce bandwidth costs, and speed up the time it takes to load the plugins.  <h3>Modify the DeploymentCatalog to also support DLL’s</h3>  
Luckily the way that MEF is designed, the change to support DLL’s in addition to XAP’s is only a matter of adding a few lines of code to the private HandleOpenReadCompleted method of the DeploymentCatalog.  
Here’s the DeploymentCatalog.HandleOpenReadCompleted method with its modifications:  <pre class="csharpcode"><span class="kwrd">private</span> <span class="kwrd">void</span> HandleOpenReadCompleted(<span class="kwrd">object</span> sender, OpenReadCompletedEventArgs e)
{
    Exception error = e.Error;
    <span class="kwrd">bool</span> cancelled = e.Cancelled;
    <span class="kwrd">if</span> (Interlocked.CompareExchange(<span class="kwrd">ref</span> <span class="kwrd">this</span>._state, 0xbb8, 0x7d0) != 0x7d0)
    {
        cancelled = <span class="kwrd">true</span>;
    }
    <span class="kwrd">if</span> ((error == <span class="kwrd">null</span>) &amp;&amp; !cancelled)
    {
        <span class="kwrd">try</span>
        {
            <span class="rem">// Check if a XAP or DLL was downloaded, based on file extension</span>
            <span class="kwrd">if</span> (<span class="kwrd">this</span>._uri.OriginalString.ToLower().EndsWith(<span class="str">&quot;.xap&quot;</span>))
            {
                <span class="rem">// Load Assemblies from XAP</span>
                IEnumerable<Assembly> assemblies = Package.LoadPackagedAssemblies(e.Result);
                <span class="kwrd">this</span>.DiscoverParts(assemblies);
            }
            <span class="kwrd">else</span> <span class="rem">// if (this._uri.OriginalString.ToLower().EndsWith(&quot;.dll&quot;))</span>
            {
                <span class="rem">// Load DLL Assembly</span>
                var assemblies = <span class="kwrd">new</span> List<Assembly>();
                assemblies.Add((<span class="kwrd">new</span> AssemblyPart()).Load(e.Result));
                <span class="kwrd">this</span>.DiscoverParts(assemblies);
            }
        }
        <span class="kwrd">catch</span> (Exception exception2)
        {
            error = <span class="kwrd">new</span> InvalidOperationException(Strings.InvalidOperationException_ErrorReadingXap, exception2);
        }
    }
    <span class="kwrd">this</span>.OnDownloadCompleted(<span class="kwrd">new</span> AsyncCompletedEventArgs(error, cancelled, <span class="kwrd">this</span>));
}</pre>
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


&#160;

<h3>SuperDeploymentCatalog – Add DLL Support to Silverlight 4</h3>


The above modification is fine if you were to recompile MEF yourself, but it would be much easier to utilize this with MEF as it is in Silverlight 4. Below is the full code to the SuperDeploymentCatalog class that can be used in place of the standard DeploymentCatalog with Silverlight 4.


A note about the code: Instead of just inheriting from DeploymentCatalog and overriding the necessary methods, I needed to implement this by copying the DeploymentCatalog code, along with a couple dependencies marked internal, and make the modification mentioned above. A little more code to include in your application, but definitely worth it.


You can download the source file here:


<a href="/file.axd?file=SuperDeploymentCatalog_1.cs">SuperDeploymentCatalog.cs</a>
