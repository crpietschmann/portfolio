---
layout: post
blogengineid: 82ad46e3-73c5-468f-be62-6247970f31e1
title: "Getting Started with Bing Maps Silverlight Control v1.0"
date: 2009-11-12 05:45:00 -0600
comments: true
published: true
categories: ["Bing Maps", "Silverlight"]
tags: ["Bing Maps", "C#", "Silverlight"]
redirect_from: 
  - /post/2009/11/12/Getting_Started_Bing_Maps_Silverlight_Control_Version_1_RTW.aspx
  - /post/2009/11/12/Getting_Started_Bing_Maps_Silverlight_Control_Version_1_RTW
  - /post/2009/11/12/getting_started_bing_maps_silverlight_control_version_1_rtw
  - /post.aspx?id=82ad46e3-73c5-468f-be62-6247970f31e1
---
<!-- more -->

<a rel="nofollow" href="/files/BingMapsRTW_BasicMap_8.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="BingMapsRTW_BasicMap" src="/files/BingMapsRTW_BasicMap_thumb_6.png" border="0" alt="BingMapsRTW_BasicMap" width="244" height="179" align="right" /></a>It&rsquo;s been 8 months since the CTP release of the Bing Maps Silverlight Control at MIX&rsquo;08, and finally this week Microsoft released the Final v1.0 release of the control to the web.  Now, we can all finally start using the Bing Maps Silverlight Control in Production!

If you've worked with the CTP, then you'll want to take a look at Ricky's &ldquo;<a rel="nofollow" href="http://rbrundritt.spaces.live.com/blog/cns!E7DBA9A4BFD458C5!1038.entry" target="_blank">Migrating from Bing Maps Silverlight CTP to Production Version</a>&rdquo; article. It explains all the stuff you'll need to modify within your project in order to gracefully switch from the CTP to the v1 Map Control.

Now for those of you who haven't worked with the CTP&hellip;

## Where to Start?

First you'll need to make sure you have the following Tools installed:

- <a rel="nofollow" href="http://www.microsoft.com/downloads/details.aspx?familyid=FBEE1648-7106-44A7-9649-6D9F6D58056E&amp;displaylang=en" target="_blank">Visual Studio 2008 SP1</a> &ndash;or- <a rel="nofollow" href="http://go.microsoft.com/?linkid=7653519" target="_blank">Visual Web Developer 2008 Express with SP1</a>
- <a rel="nofollow" href="http://www.microsoft.com/downloads/details.aspx?familyid=9442b0f2-7465-417a-88f3-5e7b5409e9dd&amp;displaylang=en" target="_blank">Silverlight 3 Tools for Visual Studio 2008 SP1</a>

Of course you&rsquo;ll also need to at least be familiar with the basics of Silverlight development. I&rsquo;m mostly referring to XAML, so if your familiar with WPF that should be enough to get you started.

For those Bing Maps (formerly Virtual Earth) developers new to Silverlight; If you need a little help getting started learning the basics, here are some resources that will help you get started:

- <a rel="nofollow" href="http://silverlight.net/getstarted/" target="_blank">Getting Started Building Silverlight Applications at Silverlight.net</a>
- <a rel="nofollow" href="http://silverlight.net/Learn/" target="_blank">Silverlight Learning Resources at Silverlight.net</a>

Now that you have all the necessary tools installed, you can go ahead and download and install the Bing Maps Silverlight v1 Control.

**Download:** <a rel="nofollow" href="http://www.microsoft.com/downloads/details.aspx?displaylang=en&amp;FamilyID=beb29d27-6f0c-494f-b028-1e0e3187e830" target="_blank">**Bing Maps Silverlight Control SDK Version 1.0**</a>

The installer will install the Bing Maps Silverlight Control within the `Program Files` on your computer, along with an SDK Documentation Help (`.chm`) file.

If you would like to see the Bing Maps Silverlight Control &ldquo;In Action&rdquo; and see the source code that powers each example, then you'll want to check out the <a rel="nofollow" href="http://www.microsoft.com/maps/isdk/silverlight/default.htm" target="_blank">Bing Maps Silverlight Control Interactive SDK</a>.

## Display a Basic Map

### Create a New Silverlight Application Project

- Run Visual Studio 2008 and Create a New Project using the Silverlight Application template.      
    
    <a rel="nofollow" href="/files/BingMapsRTW_CreateSilverlightProject.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_CreateSilverlightProject" src="/files/BingMapsRTW_CreateSilverlightProject_thumb.png" border="0" alt="BingMapsRTW_CreateSilverlightProject" width="644" height="459" /></a>

- In the &ldquo;**Add Silverlight Application**&rdquo; dialog box, select &ldquo;**Host the Silverlight application in a new Web site**&rdquo; option and click &ldquo;OK&rdquo;. You must select this option to create an ASP.NET Web Application Project, ASP.NET Website, or ASP.NET MVC Website because the <a rel="nofollow" href="http://msdn.microsoft.com/en-us/library/cc189008(VS.95).aspx" target="_blank">URL Access Restrictions in Silverlight</a> require the page that hosts the Map control be hosted using HTTP in order to load/access the Map TIle Imagery.       

    <a rel="nofollow" href="/files/BingMapsRTW_CreateHostWebsite.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_CreateHostWebsite" src="/files/BingMapsRTW_CreateHostWebsite_thumb.png" border="0" alt="BingMapsRTW_CreateHostWebsite" width="452" height="271" /></a>

### Add a Reference to `Microsoft.Maps.MapControl.dll`

- Go to the &ldquo;**Solution Explorer**&rdquo; and RIght-Click &ldquo; **References**&rdquo; in the Silverlight Project (not the ASP.NET Web Application Project), and Select &ldquo;**Add Reference&hellip;**&rdquo;       
<a rel="nofollow" href="/files/BingMapsRTW_AddReference.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_AddReference" src="/files/BingMapsRTW_AddReference_thumb.png" border="0" alt="BingMapsRTW_AddReference" width="417" height="344" /></a>

- Within the &ldquo;**Add Reference**&ldquo; Dialog, Select the **Browse** tab and navigate to the folder where the SDK is installed, then select the &ldquo;**Microsoft.Maps.MapControl.dll**&rdquo; and &ldquo;**Microsoft.Maps.MapControl.Common.dll**&rdquo; files.       
 
    > **Note:** Be Default the SDK is installed in this folder on x64 version of Windows: `C:\Program Files (x86)\Bing Maps Silverlight Control\V1\Libraries`. On x86 (or 32-bit) versions of Windows it&rsquo;s installed within the `Program Files` folder instead of `Program Files (x86)`.
    
    <a rel="nofollow" href="/files/BingMapsRTW_AddReferenceBrowse.png">**<img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_AddReferenceBrowse" src="/files/BingMapsRTW_AddReferenceBrowse_thumb.png" border="0" alt="BingMapsRTW_AddReferenceBrowse" width="644" height="394" />**</a>

### Display a Bing Maps Map!

- Add a Namespace declaration to Page.xaml for the Microsoft Maps.MapControl namespace.      

    To do this add the following to the `<UserControl>` tag:       

    ```
    xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
    ```

- Add the Map Control to the Page by adding the following tag within the Grid in the Page:      

    ```xml
    <m:Map></m:Map>
    ```

    The resulting Page.xaml will look like this:

    ```xml
    <UserControl x:Class="BingMapsSilverlightApplication1.MainPage"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
        xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
        mc:Ignorable="d" d:DesignWidth="640" d:DesignHeight="480">
        <Grid x:Name="LayoutRoot">
            <m:Map></m:Map>
        </Grid>
    </UserControl>
    ```

Now, when you run the application (press F5 within Visual Studio) you will see a fully interactive Bing Maps map displayed. 

<a rel="nofollow" href="/files/BingMapsRTW_BasicMap_9.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px" title="BingMapsRTW_BasicMap" src="/files/BingMapsRTW_BasicMap_thumb_7.png" border="0" alt="BingMapsRTW_BasicMap" width="504" height="369" /></a> 

## Setting Up a Bing Maps Developer Account

<a rel="nofollow" href="/files/BingMapsRTW_BasicMapWithDevAccountSignUpWarning.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="BingMapsRTW_BasicMapWithDevAccountSignUpWarning" src="/files/BingMapsRTW_BasicMapWithDevAccountSignUpWarning_thumb.png" border="0" alt="BingMapsRTW_BasicMapWithDevAccountSignUpWarning" width="244" height="179" align="right" /></a>

When running the above example you may have noticed the `Invalid Credentials`. Sign up for a developer account at: *<a rel="nofollow" href="http://www.microsoft.com/maps/developers">*http://www.microsoft.com/maps/developers*</a>&rdquo; message being displayed over top of the Map. This is because in order for you to use the Silverlight Map control within an application, Microsoft is requiring you to setup a Developer Account for the domain you will be hosting your application in.

### Setup a Bing Maps Developer Account

- Go to the Bing Maps Account Center at <a rel="nofollow" href="https://www.bingmapsportal.com">https://www.bingmapsportal.com</a>
- Click the &ldquo;Create an Account&rdquo; link on the left side of the site.
- Sign in with your Windows Live ID
- Enter it the required Account Details

## Get a Bing Maps Key

### <a rel="nofollow" href="/files/BingMapsRTW_CreateBingMapsKey.png"><img style="border-right-width: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; margin-left: 0px; border-left-width: 0px; margin-right: 0px" title="BingMapsRTW_CreateBingMapsKey" src="/files/BingMapsRTW_CreateBingMapsKey_thumb.png" border="0" alt="BingMapsRTW_CreateBingMapsKey" width="244" height="158" align="right" /></a>

- Once you have created a Bing Maps Developer Account, just click the &ldquo;Create or view keys&rdquo; link on the left side of the Bing Maps Account Center website.
- Type in some Application Name. This is your name for the application.
- Type if the Application URL. This is the domain name that you will be hosting the application at.
- Click the &ldquo;Create key&rdquo; button. Now you have a Bing Maps Key that you can use within your application to get rid of that pesky little warning message displayed over the top of the Map and everything on it.

> **Note:** For testing purposes I entered in an Application Name of `Test` and Application URL of `http://localhost`. This way I have a Bing Maps Key to use for testing/playing with the Silverlight Map Control that wont track any usage to the application I'll eventually build.

#### Use the Bing Maps Key within Your Application

Now that you have a Bing Maps Key for your application, you can set your Map within that application to use this key.

To do so, just set the Map controls `CredentialsProvider` property value within XAML to the Bing Maps Key. Just copy and paste the key from the Bing Maps Account Center into your XAML code.

```xml
<UserControl x:Class="BingMapsSilverlightApplication1.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
    xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
    mc:Ignorable="d" d:DesignWidth="640" d:DesignHeight="480">
    <Grid x:Name="LayoutRoot">
        <m:Map CredentialsProvider="[Bing Maps Key Here]"></m:Map>
    </Grid>
</UserControl>
```

## Set Map Properties Declaratively Using XAML and Programmatically Using Code

You can change/set the Bing Maps Controls properties Declaratively using XAML, and Programmatically using Code.

Below is an example of setting the Map Mode to Aerial using XAML:

```xml
<UserControl x:Class="BingMapsSilverlightApplication1.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
    xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
    mc:Ignorable="d" d:DesignWidth="640" d:DesignHeight="480">
    <Grid x:Name="LayoutRoot">
        <m:Map Mode="Aerial"></m:Map>
    </Grid>
</UserControl>
``` 

Below is an example of setting the Map Mode to Aerial using C# code:

```csharp
namespace BingMapsSilverlightApplication1
{
    public partial class MainPage : UserControl
    {
        public MainPage()
        {
            InitializeComponent();

            Map1.Mode = new AerialMode();
        }
    }
}
``` 

First, in order to access the Map Control programmatically you&rsquo;ll need to assign its `Name`  property within XAML so you have a name to reference it by; like the following:

```xml
<UserControl x:Class="BingMapsSilverlightApplication1.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
    xmlns:m="clr-namespace:Microsoft.Maps.MapControl;assembly=Microsoft.Maps.MapControl"
    mc:Ignorable="d" d:DesignWidth="640" d:DesignHeight="480">
    <Grid x:Name="LayoutRoot">
        <m:Map Name="Map1"></m:Map>
    </Grid>
</UserControl>
```

## Additional Articles

Here are some links to additional articles on using the Bing Maps Silverlight Version 1.0 Control:

- <a rel="nofollow" href="/post/2009/11/12/getting_started_bing_maps_silverlight_control_version_1_rtw" target="_blank">Display OpenStreetMap Imagery using Bing Maps Silverlight Control</a>

## Conclusion

It&rsquo;s pretty exciting that we now have a Bing Maps Silverlight control to use within our applications, and finally there is an option other than the JavaScript Control that has far superior performance when plotting over just a couple hundred Pushpins. Plus the Silverlight controls bring the full power of Silverlight to Bing Maps development; which allows for much richer mapping applications to be built.

Keep an eye out, I&rsquo;ll be posting more articles/tutorials to help you out in exploring this shiny, new Bing Maps Silverlight Control.
