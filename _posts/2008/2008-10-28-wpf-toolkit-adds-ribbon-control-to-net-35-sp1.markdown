---
layout: post
blogengineid: 195a44a8-f7ab-4fb0-8038-e88e67b3c10c
title: "WPF Toolkit adds Ribbon Control to .NET 3.5 SP1"
date: 2008-10-28 17:49:00 -0500
comments: true
published: true
categories: ["WPF", ".NET"]
tags: ["General"]
redirect_from: 
  - /post/2008/10/28/WPF-Toolkit-adds-Ribbon-Control-to-NET-35-SP1.aspx
  - /post/2008/10/28/WPF-Toolkit-adds-Ribbon-Control-to-NET-35-SP1
  - /post/2008/10/28/wpf-toolkit-adds-ribbon-control-to-net-35-sp1
  - /post.aspx?id=195a44a8-f7ab-4fb0-8038-e88e67b3c10c
---
<!-- more -->

The first release of the new WPF Toolkit was released today. This toolkit includes a new Ribbon control as well as the following: new WPF DataGrid, DatePicker/Calendar, and VisualStateManger. The coolest feature of this Toolkit (IMO) is the new Ribbon control. In .NET 4.0 there will be a ribbon control baked in, but thanks to the WPF Toolkit we have access to utilize the new Ribbon control today in WPF with .NET 3.5 SP1!

Download the WPF Toolkit October 2008 Release: <a href="http://www.codeplex.com/wpf/Release/ProjectReleases.aspx?ReleaseId=15598">http://www.codeplex.com/wpf/Release/ProjectReleases.aspx?ReleaseId=15598</a>

Ribbon Feature Walkthrough: <a href="http://windowsclient.net/wpf/wpf35/wpf-35sp1-ribbon-walkthrough.aspx">http://windowsclient.net/wpf/wpf35/wpf-35sp1-ribbon-walkthrough.aspx</a>

<img src="/files/WPFToolkit_RibbonControl.png" alt="" />

Here's some sample XAML markup for a complete Ribbon Tab with Button Groups defined:

[code:xml]

<r:Ribbon>
    <r:RibbonTab Label="Banking">
        <r:RibbonGroup>
            <r:RibbonButton Command="me:AppCommands.Cut"/>
            <r:RibbonButton Command="me:AppCommands.Copy"/>
            <r:RibbonButton Command="me:AppCommands.Paste"/>
        </r:RibbonGroup>

        <r:RibbonGroup>
            <r:RibbonButton Command="me:AppCommands.AddNew"/>
            <r:RibbonButton Command="me:AppCommands.Clear" />
            <r:RibbonButton Command="me:AppCommands.Delete"/>
        </r:RibbonGroup>

        <r:RibbonGroup>
            <r:RibbonButton Command="me:AppCommands.DownloadStatements"/>
            <r:RibbonButton Command="me:AppCommands.DownloadCreditCards"/>
            <r:RibbonButton Command="me:AppCommands.Transfer"/>
        </r:RibbonGroup>
    </r:RibbonTab>
</r:Ribbon>

```
