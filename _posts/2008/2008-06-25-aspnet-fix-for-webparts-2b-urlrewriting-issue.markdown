---
layout: post
blogengineid: 0ab8de98-7bbc-4140-8172-2fddbbe990df
title: "ASP.NET: Fix for WebParts + UrlRewriting/UrlMapping Issue"
date: 2008-06-25 23:16:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/06/25/ASPNET-Fix-for-WebParts-2b-UrlRewriting-Issue.aspx
  - /post/2008/06/25/ASPNET-Fix-for-WebParts-2b-UrlRewriting-Issue
  - /post/2008/06/25/aspnet-fix-for-webparts-2b-urlrewriting-issue
  - /post.aspx?id=0ab8de98-7bbc-4140-8172-2fddbbe990df
---
<!-- more -->

The problem with using WebParts with UrlRewriting (or UrlMapping) is the WebPart PersonalizationProvider uses the path of the page being rendered to save/load the personalization state, not the path that was rewritten that the user sees. So, to fix this you just need to create a custom PersonalizationProvider and override all the methods that reference path, and call the base methods but pass in the path that was requested instead of the path being rendered.

Here's a SqlPersonalizationProvider I wrote that does this:
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public class SqlPersonalizationProvider : System.Web.UI.WebControls.WebParts.SqlPersonalizationProvider
{
    protected override void LoadPersonalizationBlobs(WebPartManager webPartManager, string path, string userName, ref byte[] sharedDataBlob, ref byte[] userDataBlob)
    {
        base.LoadPersonalizationBlobs(webPartManager, this.GetActualPath(), userName, ref sharedDataBlob, ref userDataBlob);
    }

    protected override void ResetPersonalizationBlob(WebPartManager webPartManager, string path, string userName)
    {
        base.ResetPersonalizationBlob(webPartManager, this.GetActualPath(), userName);
    }

    public override int ResetState(PersonalizationScope scope, string[] paths, string[] usernames)
    {
        return base.ResetState(scope, paths, usernames);
    }

    public override int ResetUserState(string path, DateTime userInactiveSinceDate)
    {
        return base.ResetUserState(this.GetActualPath(), userInactiveSinceDate);
    }

    protected override void SavePersonalizationBlob(WebPartManager webPartManager, string path, string userName, byte[] dataBlob)
    {
        base.SavePersonalizationBlob(webPartManager, this.GetActualPath(), userName, dataBlob);
    }

    protected string GetActualPath()
    {
        HttpApplication app = HttpContext.Current.ApplicationInstance;
        string p = app.Request.RawUrl;

        // Convert Absolute to Relative
        if (p.ToLowerInvariant().StartsWith(VirtualPathUtility.ToAbsolute("~/").ToLowerInvariant()))
        {
            p = "~/" + p.Substring(VirtualPathUtility.ToAbsolute("~/").Length);
        }

        // Remove QueryString Parameters
        if (p.Contains("?"))
            p = p.Substring(0, p.IndexOf("?"));

        return p;
    }   
}</pre>

Another implementation (possibly a better one) would be to create a custom WebPartManager and change the path that is sent to the PersonalizationProvider, but the way shown above was simplier for me to implement and it works.
