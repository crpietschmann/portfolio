---
layout: post
blogengineid: 20736f64-9876-4d0f-b60e-3fe20252d4c4
title: "CTP: Getting Started with Bing Maps Silverlight CTP Map Control SDK"
date: 2009-03-20 18:27:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "Silverlight"]
redirect_from: 
  - /post/2009/03/20/Getting-Started-Virtual-Earth-Silverlight-Map-Control-SDK-CTP
  - /post/2009/03/20/getting-started-virtual-earth-silverlight-map-control-sdk-ctp
  - /post.aspx?id=20736f64-9876-4d0f-b60e-3fe20252d4c4
---
<!-- more -->

**UPDATE: I have written a newer version of this article to specifically target the latest Bing Maps Silverlight Control Version 1.0 Release.**

**You can find the new article here: <a href="/post.aspx?id=82ad46e3-73c5-468f-be62-6247970f31e1">Getting Started with Bing Maps Silverlight Control v1.0</a>**
<hr />

It seems like forever since MIX&rsquo;08 when a demo was shown of a new Silverlight-based Virtual Earth Map Control. Well, now FINALLY we actually have a version of the control to &ldquo;play&rdquo; around with. The reason I say &ldquo;play&rdquo; is because it&rsquo;s still a CTP (Community Technology Preview). If you read the license file you&rsquo;ll see that basically the most important points of Microsoft&rsquo;s position on CTP&rsquo;s are: 1) You can NOT use it in a production environment, and 2) It&rsquo;s a Preview, so anything can change from now until the next release (CTP, Beta, whatever). Well, anyway&hellip;

**I introduce you to the Virtual Earth Silverlight Map Control SDK CTP!**

Before I dig into what&rsquo;s needed to begin development, and show you how simple it is to use; here&rsquo;s a few highlights of what&rsquo;s so Awesome about the control.
<h3>Why is the Virtual Earth Silverlight Map Control so Awesome?!?</h3>

Here&rsquo;s a few reason:
<ul>
<li>**Silverlight!** &ndash; Silverlight itself is truly a high point with this new control. You can now Plot/Overlay Rich Media Content (Images, Video, and any Silverlight/XAML content you can think of!) over the Map! </li>
<li>**Performance!** &ndash; If you&rsquo;ve used the Virtual Earth JavaScript Map Control, then you must be familiar with the fact that the Map really starts to slow down when you try to plot something around 300+ Pushpins or a hand full of Polygons with 1000+ points each. With the new Silverlight control you can literally plot THOUSANDS of Pushpins on the Map and you wont render it useless like you would with the previous JavaScript control. Your limit is really only based on the Client Computer that is running the application, and I expect that it&rsquo;ll probably improve a bit with Silverlight 3&rsquo;s ability to utilize the local GPU. </li>
<li>**No More JavaScript or Browser Inconsistencies! &ndash; **You no longer need to worry or hassle yourself with JavaScript and making sure it runs/works as expected in all the different web browsers (Internet Explorer, Firefox, Safari, etc.) No you can manipulate the map using pure .NET code. Don&rsquo;t fret if you need to integrate with existing JavaScript code; you can always use Silverlight&rsquo;s HTML Bridge to interact back and forth as needed. </li>
<li>**Virtual Earth!** &ndash; And, last but not least, we can not forget that part of the Vast Awesomeness of this control is just due to the fact that it&rsquo;s Virtual Earth Mapping!! </li>
</ul>
<h3>What&rsquo;s Needed to Get Started?</h3>

Firstly, Download the <a href="http://connect.microsoft.com/silverlightmapcontrolctp" target="_blank">Virtual Earth Silverlight Map Control SDK CTP from Microsoft Connect</a>: <a title="http://connect.microsoft.com/silverlightmapcontrolctp" href="http://connect.microsoft.com/silverlightmapcontrolctp">http://connect.microsoft.com/silverlightmapcontrolctp</a>

<span style="text-decoration: line-through;"><em>Note: At the time of posting this (3/20/2009 6:26PM CST) the CTP Download is currently down. You can still go to the Microsoft Connect website and Register, then you&rsquo;ll be able to download the bits when they&rsquo;re back up.</em></span> The download issue has been fixed.

There is also a <a href="https://sharepoint.connect.microsoft.com/silverlightmapcontrolctp/iSDK/default.htm" target="_blank">Virtual Earth Silverlight Map Control CTP Interactive SDK</a> (in the same style of the Virtual Earth JavaScript control) here: <a title="https://sharepoint.connect.microsoft.com/silverlightmapcontrolctp/iSDK/default.htm" href="https://sharepoint.connect.microsoft.com/silverlightmapcontrolctp/iSDK/default.htm">https://sharepoint.connect.microsoft.com/silverlightmapcontrolctp/iSDK/default.htm</a>

Secondly, you&rsquo;ll need a couple Tools installed first:
<ol>
<li><a href="http://www.microsoft.com/downloads/details.aspx?familyid=FBEE1648-7106-44A7-9649-6D9F6D58056E&amp;displaylang=en" target="_blank">Visual Studio 2008 SP1</a> **&ndash;or-** <a href="http://go.microsoft.com/?linkid=7653519" target="_blank">Visual Web Developer 2008 Express with SP1</a> </li>
<li><a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=c22d6a7b-546f-4407-8ef6-d60c8ee221ed&amp;displaylang=en" target="_blank">Silverlight Tools for Visual Studio 2008 SP1</a> </li>
</ol>

Of course you&rsquo;ll also need to at least be familiar with the basics of Silverlight development. I&rsquo;m referring to XAML for the most part, so if your familiar with WPF that should be enough to get you started.

For those Virtual Earth developers new to Silverlight; If you need help getting started with learning the basics of Silverlight development, here are some resources that will help:
<ul>
<li><a href="http://silverlight.net/getstarted/" target="_blank">Get Started Building Silverlight Applications at http://silverlight.net</a> </li>
<li><a href="http://silverlight.net/Learn/" target="_blank">Silverlight Learning Resources at http://silverlight.net</a> </li>
</ul>
<h3>Let&rsquo;s Display a Map in Silverlight</h3>
<h5>Create a New Silverlight Application Project</h5>
<ol>
<li>Run Visual Studio 2008 and create a New Project using the **Silverlight Application** template.       <br /> <br /><a href="/images/postsCreateSilverlightApplicationProject.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="CreateSilverlightApplicationProject" src="/images/postsCreateSilverlightApplicationProject_thumb.png" border="0" alt="CreateSilverlightApplicationProject" width="706" height="486" /></a> </li>
<li>In the &ldquo;Add Silverlight Application&rdquo; dialog box, select the &ldquo;**Add a new ASP.NET Web project to the solution to host Silverlight**&rdquo; option and click &ldquo;OK&rdquo;. You must select this option to create an ASP.NET Web Application Project or ASP.NET Website because the <a href="http://msdn.microsoft.com/en-us/library/cc189008(VS.95).aspx" target="_blank">URL Access Restrictions in Silverlight</a> require the page that hosts the Map control to be hosted using HTTP in order to load/access the Virtual Earth Map Tiles.       <br /> <br /><a href="/images/postsAddNewASP.NETWebProject.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="AddNewASP.NETWebProject" src="/images/postsAddNewASP.NETWebProject_thumb.png" border="0" alt="AddNewASP.NETWebProject" width="457" height="409" /></a> </li>
</ol>
<h4>Add a Reference to Microsoft.VirtualEarth.MapControl.dll</h4>
<ol>
<li>Go to the &ldquo;**Solution Explorer**&rdquo; and Right-Click &ldquo;**References**&rdquo; in the Silverlight Project (not the ASP.NET Web Application Project), and Select &ldquo;**Add Reference&hellip;**&rdquo;       <br /> <br /><a href="/images/postsVEJS_003_AddReferenceToMapControlDLL.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_003_AddReferenceToMapControlDLL" src="/images/postsVEJS_003_AddReferenceToMapControlDLL_thumb.png" border="0" alt="VEJS_003_AddReferenceToMapControlDLL" width="365" height="354" /></a> </li>
<li>Within the &ldquo;Add Reference&rdquo; Dialog, Select the &ldquo;**Browse**&rdquo; tab and navigate to the folder where the SDK is installed, and select the &ldquo;**Microsoft.VirtualEarth.MapControl.dll**&rdquo;.       <br /> <br /><em>Note: By Default the SDK is installed in this folder &ldquo;C:\Program Files (x86)\Microsoft Virtual Earth Silverlight Map Control\CTP\Libraries&rdquo;        <br /> <br /><a href="/images/postsVEJS_004_AddReferenceToMapControlDLL_SelectDLLFile.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_004_AddReferenceToMapControlDLL_SelectDLLFile" src="/images/postsVEJS_004_AddReferenceToMapControlDLL_SelectDLLFile_thumb.png" border="0" alt="VEJS_004_AddReferenceToMapControlDLL_SelectDLLFile" width="735" height="450" /></a> </em></li>
</ol>
<h4>Display a Virtual Earth Map</h4>
<ol>
<li>Add a Namespace declaration to to Page.xaml for the Microsoft.VirtualEarth.MapControl namespace.      <br />To do this add the following to the &lt;UserControl&gt; tag:       <br /><em>xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"        <br /></em></li>
<li>Add the Map Control to Page by adding the following tag within the Grid in the Page:      <br /><em>&lt;m:Map&gt;&lt;/m:Map&gt;</em> </li>
</ol>

The resulting Page.xaml will look like this:

&lt;UserControl x:Class="VirtualEarthSilverlightApplication1.Page"    <br />    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     <br />    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"     <br />    xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"     <br />    Width="400" Height="300"&gt;     <br />    &lt;Grid x:Name="LayoutRoot" Background="White"&gt;     <br />        &lt;m:Map&gt;&lt;/m:Map&gt;     <br />    &lt;/Grid&gt;     <br />&lt;/UserControl&gt;

 

Now, when you run the application (press F5) you will see a fully interactive Virtual Earth Map displayed:

<a href="/images/postsVEJS_005_SimpleMapDisplayed.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="VEJS_005_SimpleMapDisplayed" src="/images/postsVEJS_005_SimpleMapDisplayed_thumb.png" border="0" alt="VEJS_005_SimpleMapDisplayed" width="489" height="304" /></a>
<h3>Change/Set Map Properties Declaratively using XAML and Programatically using C#</h3>

You can change/set the Map Control&rsquo;s properties Declaratively using XAML and Programatically using C# (or any other .NET language).

Below are examples using XAML and C#.

**XAML:** You can change the Map Mode declaratively using XAML by just setting the &ldquo;Mode&rdquo; property. For Example, setting it to &ldquo;Aerial&rdquo; will change the Map Mode to AerialMapMode.

&lt;UserControl x:Class="VirtualEarthSilverlightApplication1.Page"    <br />    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     <br />    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"     <br />    xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"     <br />    Width="400" Height="300"&gt;     <br />    &lt;Grid x:Name="LayoutRoot" Background="White"&gt;     <br />        &lt;m:Map Mode="Aerial"&gt;&lt;/m:Map&gt;     <br />    &lt;/Grid&gt;     <br />&lt;/UserControl&gt;

 

**C#:** You can also change the Map Mode just as easily programatically using C#. Here&rsquo;s the same example of setting the Map Mode to AerialMapMode within the Page constructor:

using System.Windows.Controls;    <br />using Microsoft.VirtualEarth.MapControl;

namespace VirtualEarthSilverlightApplication1    <br />{     <br />    public partial class Page : UserControl     <br />    {     <br />        public Page()     <br />        {     <br />            InitializeComponent();

            Map1.Mode = new AerialMode();    <br />        }     <br />    }     <br />}

 

First, in order to access the Map Control programatically you&rsquo;ll need to set it&rsquo;s &ldquo;Name&rdquo; property within XAML; like the following:

&lt;UserControl x:Class="VirtualEarthSilverlightApplication1.Page"    <br />    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     <br />    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"     <br />    xmlns:m="clr-namespace:Microsoft.VirtualEarth.MapControl;assembly=Microsoft.VirtualEarth.MapControl"     <br />    Width="400" Height="300"&gt;     <br />    &lt;Grid x:Name="LayoutRoot" Background="White"&gt;     <br />        &lt;m:Map Name="Map1"&gt;&lt;/m:Map&gt;     <br />    &lt;/Grid&gt;     <br />&lt;/UserControl&gt;

 
<h3>Conclusion</h3>

I hope your as psyched about the new Virtual Earth Silverlight control as I am. I&rsquo;m really looking forward to exploring all the capabilities of the new control; most of which just weren&rsquo;t possible with the old JavaScript control. One downside is we&rsquo;ll have to wait until a future release for a &ldquo;Go Live&rdquo; license, but until then I&rsquo;m sure the guys on the Virtual Earth team will be making this control the absolute best it can be; after all it&rsquo;s pretty darn awesome already.

Keep an eye out, I&rsquo;ll be posting more articles/tutorials to help you out in exploring this new control.
<h4>Next Tutorial/Article: <a href="/post.aspx?id=6a098f41-2df4-4362-a577-606863de838c">Basics of Adding Polygons and Polylines using XAML and Code </a></h4>
