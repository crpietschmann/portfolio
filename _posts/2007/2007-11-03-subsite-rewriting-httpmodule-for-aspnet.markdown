---
layout: post
blogengineid: b68ec42e-5a4f-4d08-8c83-1a7346dd36c6
title: "Subsite Rewriting HttpModule for ASP.NET"
date: 2007-11-03 17:24:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2007/11/03/Subsite-Rewriting-HttpModule-for-ASPNET.aspx
  - /post/2007/11/03/Subsite-Rewriting-HttpModule-for-ASPNET
  - /post/2007/11/03/subsite-rewriting-httpmodule-for-aspnet
  - /post.aspx?id=b68ec42e-5a4f-4d08-8c83-1a7346dd36c6
---
<!-- more -->

Here's some simple code for easily adding Subsite functionality to an ASP.NET website using UrlRewriting/UrlMapping.

Urls are rewritten in the following fashion:

~/jdoe/default.aspx  => ~/default.aspx?site=jdoe
 ~/jdoe/subfolder/default.aspx => ~/subfolder/default.aspx?site=jdoe

And this is all done by the 65 line HttpModule below:

```csharp

using System;
 using System.Web;

/// <summary>
 /// Summary description for SubsiteRewriteModule
 /// </summary>
 public class SubsiteRewriteModule : IHttpModule
 {
     #region IHttpModule Members

    void IHttpModule.Dispose() { }

    void IHttpModule.Init(HttpApplication context)
     {
         context.BeginRequest += new EventHandler(context_BeginRequest);
     }

    #endregion

    private void context_BeginRequest(object sender, EventArgs e)
     {
         HttpContext context = ((HttpApplication)sender).Context;
         HttpRequest Request = context.Request;

        if (Request.Path.ToLowerInvariant().EndsWith(".aspx"))
         {
             string UrlToRewrite = VirtualPathUtility.ToAppRelative(Request.Path).ToLowerInvariant();
             bool doRewrite = false;
             System.Text.RegularExpressions.Regex regex;


             regex = new System.Text.RegularExpressions.Regex("~/(\\w+)/(.*)");
             if (regex.Match(UrlToRewrite).Success)
             {
                 UrlToRewrite = regex.Replace(UrlToRewrite, "~/$2?site=$1");
                 doRewrite = true;
             }


             /// Rewrite the URL and inlude all querystring criteria so we don't lose it
             if (doRewrite)
             {
                 if (UrlToRewrite.Contains("?"))
                 {
                     UrlToRewrite = UrlToRewrite + "&amp;" + GetQueryString(context);
                 }
                 else
                 {
                     UrlToRewrite = UrlToRewrite + "?" + GetQueryString(context);
                 }
                 context.RewritePath(UrlToRewrite, false);
             }
         }

    }

    private static string GetQueryString(HttpContext context)
     {
         string returnVal = context.Request.QueryString.ToString();
         if (string.IsNullOrEmpty(returnVal))
             return "";
         else
             return returnVal;
     }
 }

```

<a href="/download/blog/1419/urlrewritingsubsites.zip">Download a sample site</a> using the above HttpModule <a href="/download/blog/1419/urlrewritingsubsites.zip">here</a>
