---
layout: post
blogengineid: 5a6945d0-933a-4971-aac1-13dcd73711d9
title: "Custom Themes in ASP.NET MVC Updated for Preview 5"
date: 2008-08-29 18:49:00 -0500
comments: true
published: true
categories: ["ASP.NET", "MVC"]
tags: ["ASP.NET MVC"]
redirect_from: 
  - /post/2008/08/29/Custom-Themes-in-ASPNET-MVC-Updated-for-Preview-5.aspx
  - /post/2008/08/29/Custom-Themes-in-ASPNET-MVC-Updated-for-Preview-5
  - /post/2008/08/29/custom-themes-in-aspnet-mvc-updated-for-preview-5
  - /post.aspx?id=5a6945d0-933a-4971-aac1-13dcd73711d9
---
<!-- more -->

<img src="/files/ASPNETMVC_Preview4_CustomThemeFolderLayout.png" alt="" align="right" />

**Update 2009/03/26:** There is an updated version of this code (with improvements) that targets the ASP.NET MVC 1.0 RTW located here: <a href="/post/2009/03/ASPNET-MVC-Implement-Theme-Folders-using-a-Custom-ViewEngine.aspx">/post/2009/03/ASPNET-MVC-Implement-Theme-Folders-using-a-Custom-ViewEngine.aspx</a> 

About two weeks ago I posted on how to <a href="/post.aspx?id=ee0e253d-c746-4099-9795-81aaf14ad608">Implement Custom Theme support in ASP.NET MVC</a>. There were some breaking changes made when the Preview 5 release was released yesterday.

Here's a short list to a couple of the changes I had to make to my code from the previous post to get it working in ASP.NET MVC Preview 5:
<ul>
<li>Delete WebFormThemeViewLocator - The contents of this object is now contained within the ViewEngine itself</li>
<li>Delete WebFormThemeControllerFactory- This isn't needed anymore.</li>
<li>Modify WebFormThemeViewEngine - Write a bunch of code that finds the appropriate View to use.</li>
<li>Modify Global.asax - Remove code that adds the old ControllerFactory, and replace it with code that adds our newly improved WebFormThemeViewEngine</li>
<li>Modify ControllerBase - Firstly, rename this to ThemeControllerBase since there is not a ControllerBase in System.Web.Mvc. Then, modify the code for the Execute method since it now takes in a RequestContext object as a parameter instead of a ControllerContext object.</li>
</ul>

Just for reference here's the code for the WebFormThemeViewEngine.

**Download Code:** <a href="/files/ASPNETMVC_Preview5_CustomThemeImplementation.zip" rel="enclosure">ASPNETMVC_Preview5_CustomThemeImplementation.zip (226.05 kb)</a>

Below is the entire code for the WebFormThemeViewEngine, just for reference. If you are interested in looking at how I implemented this, just download and check out the entire code sample at the link above.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;

public class WebFormThemeViewEngine : System.Web.Mvc.WebFormViewEngine
{
    public WebFormThemeViewEngine()
    {
        base.ViewLocationFormats = new string[] {
                "~/Views/{2}/{1}/{0}.aspx",
                "~/Views/{2}/{1}/{0}.ascx",
                "~/Views/{2}/Shared/{0}.aspx",
                "~/Views/{2}/Shared/{0}.ascx"
            };

        base.MasterLocationFormats = new string[] {
                "~/Views/{2}/{1}/{0}.master",
                "~/Views/{2}/Shared/{0}.master"
            };

        base.PartialViewLocationFormats = new string[] {
                "~/Views/{2}/{1}/{0}.aspx",
                "~/Views/{2}/{1}/{0}.ascx",
                "~/Views/{2}/Shared/{0}.aspx",
                "~/Views/{2}/Shared/{0}.ascx"
            };
    }

    public override ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName)
    {
        if (controllerContext == null)
        {
            throw new ArgumentNullException("controllerContext");
        }
        if (string.IsNullOrEmpty(viewName))
        {
            throw new ArgumentException("Value is required.", "viewName");
        }

        string themeName = this.GetThemeToUse(controllerContext);

        string[] searchedViewLocations;
        string[] searchedMasterLocations;

        string controllerName = controllerContext.RouteData.GetRequiredString("controller");

        string viewPath = this.GetPath(this.ViewLocationFormats, viewName, controllerName, themeName, out searchedViewLocations);
        string masterPath = this.GetPath(this.MasterLocationFormats, viewName, controllerName, themeName, out searchedMasterLocations);

        if (!(string.IsNullOrEmpty(viewPath)) &amp;&amp; (!(masterPath == string.Empty) || string.IsNullOrEmpty(masterName)))
        {
            return new ViewEngineResult(this.CreateView(controllerContext, viewPath, masterPath));
        }
        return new ViewEngineResult(searchedViewLocations.Union<string>(searchedMasterLocations));
    }

    public override ViewEngineResult FindPartialView(ControllerContext controllerContext, string partialViewName)
    {
        if (controllerContext == null)
        {
            throw new ArgumentNullException("controllerContext");
        }
        if (string.IsNullOrEmpty(partialViewName))
        {
            throw new ArgumentException("Value is required.", partialViewName);
        }

        string themeName = this.GetThemeToUse(controllerContext);

        string[] searchedLocations;

        string controllerName = controllerContext.RouteData.GetRequiredString("controller");

        string partialPath = this.GetPath(this.PartialViewLocationFormats, partialViewName, controllerName, themeName, out searchedLocations);

        if (string.IsNullOrEmpty(partialPath))
        {
            return new ViewEngineResult(searchedLocations);
        }
        return new ViewEngineResult(this.CreatePartialView(controllerContext, partialPath));
    }

    private string GetThemeToUse(ControllerContext controllerContext)
    {
        string themeName = controllerContext.HttpContext.Items["themeName"] as string;
        if (themeName == null) themeName = "Default";
        return themeName;
    }

    private string GetPath(string[] locations, string viewName, string controllerName, string themeName, out string[] searchedLocations)
    {
        string path = null;

        searchedLocations = new string[locations.Length];

        for (int i = 0; i < locations.Length; i++)
        {
            path = string.Format(CultureInfo.InvariantCulture, locations[i], new object[] { viewName, controllerName, themeName });
            if (this.VirtualPathProvider.FileExists(path))
            {
                searchedLocations = new string[0];
                return path;
            }
            searchedLocations[i] = path;
        }
        return null;
    }
}</pre>
