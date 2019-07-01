---
layout: post
blogengineid: 82ad46e3-73c5-468f-be62-6247970f31e1
title: "Getting Started with Bing Maps Silverlight Control v1.0"
date: 2009-11-12 05:45:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "C#", "Silverlight"]
redirect_from: 
  - /post/2009/11/12/Getting_Started_Bing_Maps_Silverlight_Control_Version_1_RTW
  - /post/2009/11/12/getting_started_bing_maps_silverlight_control_version_1_rtw
  - /post.aspx?id=82ad46e3-73c5-468f-be62-6247970f31e1
---
<!-- more -->

<a rel="nofollow" href="/images/posts/BingMapsRTW_BasicMap_8.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="BingMapsRTW_BasicMap" src="/images/posts/BingMapsRTW_BasicMap_thumb_6.png" border="0" alt="BingMapsRTW_BasicMap" width="244" height="179" align="right" /></a>It&rsquo;s been 8 months since the CTP release of the Bing Maps Silverlight Control at MIX&rsquo;08, and finally this week Microsoft released the Final v1.0 release of the control to the web.  Now, we can all finally start using the Bing Maps Silverlight Control in Production!

If you&rsquo;ve worked with the CTP, then you&rsquo;ll want to take a look at Ricky&rsquo;s &ldquo;<a rel="nofollow" href="http://rbrundritt.spaces.live.com/blog/cns!E7DBA9A4BFD458C5!1038.entry" target="_blank">Migrating from Bing Maps Silverlight CTP to Production Version</a>&rdquo; article. It explains all the stuff you&rsquo;ll need to modify within your project in order to gracefully switch from the CTP to the v1 Map Control.

Now for those of you who haven&rsquo;t worked with the CTP&hellip;
<h3>Where to Start?</h3>

First you&rsquo;ll need to make sure you have the following Tools installed:
<ul>
<li><a rel="nofollow" href="http://www.microsoft.com/downloads/details.aspx?familyid=FBEE1648-7106-44A7-9649-6D9F6D58056E&amp;displaylang=en" target="_blank">Visual Studio 2008 SP1</a> &ndash;or- <a rel="nofollow" href="http://go.microsoft.com/?linkid=7653519" target="_blank">Visual Web Developer 2008 Express with SP1</a> </li>
<li><a rel="nofollow" href="http://www.microsoft.com/downloads/details.aspx?familyid=9442b0f2-7465-417a-88f3-5e7b5409e9dd&amp;displaylang=en" target="_blank">Silverlight 3 Tools for Visual Studio 2008 SP1</a> </li>
</ul>

Of course you&rsquo;ll also need to at least be familiar with the basics of Silverlight development. I&rsquo;m mostly referring to XAML, so if your familiar with WPF that should be enough to get you started.

For those Bing Maps (formerly Virtual Earth) developers new to Silverlight; If you need a little help getting started learning the basics, here are some resources that will help you get started:
<ul>
<li><a rel="nofollow" href="http://silverlight.net/getstarted/" target="_blank">Getting Started Building Silverlight Applications at Silverlight.net</a> </li>
<li><a rel="nofollow" href="http://silverlight.net/Learn/" target="_blank">Silverlight Learning Resources at Silverlight.net</a> </li>
</ul>

Now that you have all the necessary tools installed, you can go ahead and download and install the Bing Maps Silverlight v1 Control.

**Download: **<a rel="nofollow" href="http://www.microsoft.com/downloads/details.aspx?displaylang=en&amp;FamilyID=beb29d27-6f0c-494f-b028-1e0e3187e830" target="_blank">**Bing Maps Silverlight Control SDK Version 1.0**</a>

The installer will install the Bing Maps Silverlight Control within the &ldquo;Program Files&rdquo; on your computer, along with an SDK Documentation Help (.chm) file.

If you would like to see the Bing Maps Silverligth Control &ldquo;In Action&rdquo; and see the source code that powers each example, then you&rsquo;ll want to check out the <a rel="nofollow" href="http://www.microsoft.com/maps/isdk/silverlight/default.htm" target="_blank">Bing Maps Silverlight Control Interactive SDK</a>.
<h3>Display a Basic Map</h3>
<h5>Create a New Silverlight Application Project</h5>
<ul>
<li>Run VIsual Studio 2008 and Create a New Project using the Silverlight Application template.      
<a rel="nofollow" href="/images/posts/BingMapsRTW_CreateSilverlightProject.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_CreateSilverlightProject" src="/images/posts/BingMapsRTW_CreateSilverlightProject_thumb.png" border="0" alt="BingMapsRTW_CreateSilverlightProject" width="644" height="459" /></a> </li>
<li>In the &ldquo;**Add Silverlight Application**&rdquo; dialog box, select &ldquo;**Host the Silverlight application in a new Web site**&rdquo; option and click &ldquo;OK&rdquo;. You must select this option to create an ASP.NET Web Application Project, ASP.NET Website, or ASP.NET MVC Website because the <a rel="nofollow" href="http://msdn.microsoft.com/en-us/library/cc189008(VS.95).aspx" target="_blank">URL Access Restrictions in Silverlight</a> require the page that hosts the Map control be hosted using HTTP in order to load/access the Map TIle Imagery.       
<a rel="nofollow" href="/images/posts/BingMapsRTW_CreateHostWebsite.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_CreateHostWebsite" src="/images/posts/BingMapsRTW_CreateHostWebsite_thumb.png" border="0" alt="BingMapsRTW_CreateHostWebsite" width="452" height="271" /></a>  </li>
</ul>
<h5>Add a Reference to Microsoft.Maps.MapControl.dll</h5>
<ul>
<li>Go to the &ldquo;**Solution Explorer**&rdquo; and RIght-Click &ldquo; **References**&rdquo; in the Silverlight Project (not the ASP.NET Web Application Project), and Select &ldquo;**Add Reference&hellip;**&rdquo;       
<a rel="nofollow" href="/images/posts/BingMapsRTW_AddReference.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_AddReference" src="/images/posts/BingMapsRTW_AddReference_thumb.png" border="0" alt="BingMapsRTW_AddReference" width="417" height="344" /></a>  </li>
<li>Within the &ldquo;**Add Reference**&ldquo; Dialog, Select the &ldquo;**Browse**&ldquo; tab and navigate to the folder where the SDK is installed, then select the &ldquo;**Microsoft.Maps.MapControl.dll**&rdquo; and &ldquo;**Microsoft.Maps.MapControl.Common.dll**&rdquo; files.       
 
*Note: Be Default the SDK is installed in this folder on x64 version of Windows: &ldquo;C:\Program Files (x86)\Bing Maps Silverlight Control\V1\Libraries&rdquo;. On x86 (or 32-bit) versions of Windows it&rsquo;s installed within the &ldquo;Program Files&rdquo; folder instead of &ldquo;Program Files (x86)&rdquo;.* 
 
<a rel="nofollow" href="/images/posts/BingMapsRTW_AddReferenceBrowse.png">**<img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_AddReferenceBrowse" src="/images/posts/BingMapsRTW_AddReferenceBrowse_thumb.png" border="0" alt="BingMapsRTW_AddReferenceBrowse" width="644" height="394" />**</a>** ** </li>
</ul>
<h5>Display a Bing Maps Map!</h5>
<ul>
<li>Add a Namespace declaration to Page.xaml for the Microsoft Maps.MapControl namespace.      
To do this add the following to the <UserControl> tag:       
*xmlns:m=&rdquo;clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl&rdquo;* </li>
<li>Add the Map Control to the Page by adding the following tag within the Grid in the Page:      
*<m:Map></m:Map>* The resulting Page.xaml will look like this: </li>
</ul>
<ul>
<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="BingMapsSilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:d</span><span class="kwrd">="http://schemas.microsoft.com/expression/blend/2008"</span> <span class="attr">xmlns:mc</span><span class="kwrd">="http://schemas.openxmlformats.org/markup-compatibility/2006"</span> 
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">mc:Ignorable</span><span class="kwrd">="d"</span> <span class="attr">d:DesignWidth</span><span class="kwrd">="640"</span> <span class="attr">d:DesignHeight</span><span class="kwrd">="480"</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">m:Map</span><span class="kwrd">></</span><span class="html">m:Map</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>
<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --> 
</ul>
<ul>
Now, when you run the application (press F5 within Visual Studio) you will see a fully interactive Bing Maps map displayed. 
</ul>
<ul>
<a rel="nofollow" href="/images/posts/BingMapsRTW_BasicMap_9.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_BasicMap" src="/images/posts/BingMapsRTW_BasicMap_thumb_7.png" border="0" alt="BingMapsRTW_BasicMap" width="504" height="369" /></a> 
</ul>
<h3><a rel="nofollow" href="/images/posts/BingMapsRTW_BasicMapWithDevAccountSignUpWarning.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="BingMapsRTW_BasicMapWithDevAccountSignUpWarning" src="/images/posts/BingMapsRTW_BasicMapWithDevAccountSignUpWarning_thumb.png" border="0" alt="BingMapsRTW_BasicMapWithDevAccountSignUpWarning" width="244" height="179" align="right" /></a>Setting Up a Bing Maps Developer Account</h3>

When running the above example you may have noticed the &ldquo;*Invalid Credentials. Sign up for a developer account at: *<a rel="nofollow" href="http://www.microsoft.com/maps/developers">*http://www.microsoft.com/maps/developers*</a>&rdquo; message being displayed over top of the Map. This is because in order for you to use the Silverlight Map control within an application, Microsoft is requiring you to setup a Developer Account for the domain you will be hosting your application in.
<h5>Setup a Bing Maps Developer Account</h5>
<ul>
<li>Go to the Bing Maps Account Center at <a rel="nofollow" href="https://www.bingmapsportal.com">https://www.bingmapsportal.com</a> </li>
<li>Click the &ldquo;Create an Account&rdquo; link on the left side of the site. </li>
<li>Sign in with your Windows Live ID </li>
<li>Enter it the required Account Details </li>
</ul>
<h5>Get a Bing Maps Key</h5>
<h5><a rel="nofollow" href="/images/posts/BingMapsRTW_CreateBingMapsKey.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="BingMapsRTW_CreateBingMapsKey" src="/images/posts/BingMapsRTW_CreateBingMapsKey_thumb.png" border="0" alt="BingMapsRTW_CreateBingMapsKey" width="244" height="158" align="right" /></a></h5>
<ul>
<li>Once you have created a Bing Maps Developer Account, just click the &ldquo;Create or view keys&rdquo; link on the left side of the Bing Maps Account Center website. </li>
<li>Type in some Application Name. This is your name for the application. </li>
<li>Type if the Application URL. This is the domain name that you will be hosting the application at. </li>
<li>Click the &ldquo;Create key&rdquo; button. Now you have a Bing Maps Key that you can use within your application to get rid of that pesky little warning message displayed over the top of the Map and everything on it.</li>
</ul>
<ul>
*Note: For testing purposes I entered in an Application Name of &ldquo;Test&rdquo; and Application URL of &ldquo;http://localhost&rdquo;. This way I have a Bing Maps Key to use for testing/playing with the Silverlight Map Control that wont track any usage to the application I&rsquo;ll eventually build.* 
</ul>
<h5>Use the Bing Maps Key within Your Application</h5>

Now that you have a Bing Maps Key for your application, you can set your Map within that application to use this key.

To do so, just set the Map controls &ldquo;CredentialsProvider&rdquo; property value within XAML to the Bing Maps Key. Just copy and paste the key from the Bing Maps Account Center into your XAML code.
<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="BingMapsSilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:d</span><span class="kwrd">="http://schemas.microsoft.com/expression/blend/2008"</span> <span class="attr">xmlns:mc</span><span class="kwrd">="http://schemas.openxmlformats.org/markup-compatibility/2006"</span> 
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">mc:Ignorable</span><span class="kwrd">="d"</span> <span class="attr">d:DesignWidth</span><span class="kwrd">="640"</span> <span class="attr">d:DesignHeight</span><span class="kwrd">="480"</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">m:Map</span> <span class="attr">CredentialsProvider</span><span class="kwrd">="[Bing Maps Key Here]"</span><span class="kwrd">></</span><span class="html">m:Map</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>

 
<h3>Set Map Properties Declaratively Using XAML and Programmatically Using Code</h3>

You can change/set the Bing Maps Controls properties Declaratively using XAML, and Programmatically using Code.

Below is an example of setting the Map Mode to Aerial using XAML:
<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="BingMapsSilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:d</span><span class="kwrd">="http://schemas.microsoft.com/expression/blend/2008"</span> <span class="attr">xmlns:mc</span><span class="kwrd">="http://schemas.openxmlformats.org/markup-compatibility/2006"</span> 
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">mc:Ignorable</span><span class="kwrd">="d"</span> <span class="attr">d:DesignWidth</span><span class="kwrd">="640"</span> <span class="attr">d:DesignHeight</span><span class="kwrd">="480"</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">m:Map</span> <span class="attr">Mode</span><span class="kwrd">="Aerial"</span><span class="kwrd">></</span><span class="html">m:Map</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>

 

Below is an example of setting the Map Mode to Aerial using C# code:
<pre class="csharpcode"><span class="kwrd">using</span> System.Windows.Controls;
<span class="kwrd">using</span> Microsoft.Maps.MapControl;

<span class="kwrd">namespace</span> BingMapsSilverlightApplication1
{
    <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> MainPage : UserControl
    {
        <span class="kwrd">public</span> MainPage()
        {
            InitializeComponent();

            Map1.Mode = <span class="kwrd">new</span> AerialMode();
        }
    }
}</pre>

<!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } -->

 

First, in order to access the Map Control programmatically you&rsquo;ll need to assign its &ldquo;*Name&rdquo;*  property within XAML so you have a name to reference it by; like the following:
<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">="BingMapsSilverlightApplication1.MainPage"</span>
    <span class="attr">xmlns</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml/presentation"</span> 
    <span class="attr">xmlns:x</span><span class="kwrd">="http://schemas.microsoft.com/winfx/2006/xaml"</span>
    <span class="attr">xmlns:d</span><span class="kwrd">="http://schemas.microsoft.com/expression/blend/2008"</span> <span class="attr">xmlns:mc</span><span class="kwrd">="http://schemas.openxmlformats.org/markup-compatibility/2006"</span> 
    <span class="attr">xmlns:m</span><span class="kwrd">="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"</span>
    <span class="attr">mc:Ignorable</span><span class="kwrd">="d"</span> <span class="attr">d:DesignWidth</span><span class="kwrd">="640"</span> <span class="attr">d:DesignHeight</span><span class="kwrd">="480"</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">Grid</span> <span class="attr">x:Name</span><span class="kwrd">="LayoutRoot"</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">m:Map</span> <span class="attr">Name</span><span class="kwrd">="Map1"</span><span class="kwrd">></</span><span class="html">m:Map</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>
<h3> </h3>
<h3>Additional Articles</h3>

Here are some links to additional articles on using the Bing Maps Silverlight Version 1.0 Control:
<ul>
<li><a rel="nofollow" href="/post.aspx?id=b3812d3c-cb64-4947-b6df-4ebb8e3a2e43" target="_blank">Display OpenStreetMap Imagery using Bing Maps Silverlight Control</a></li>
</ul>
<h3>Conclusion</h3>

It&rsquo;s pretty exciting that we now have a Bing Maps Silverlight control to use within our applications, and finally there is an option other than the JavaScript Control that has far superior performance when plotting over just a couple hundred Pushpins. Plus the Silverlight controls bring the full power of Silverlight to Bing Maps development; which allows for much richer mapping applications to be built.

Keep an eye out, I&rsquo;ll be posting more articles/tutorials to help you out in exploring this shiny, new Bing Maps Silverlight Control.
