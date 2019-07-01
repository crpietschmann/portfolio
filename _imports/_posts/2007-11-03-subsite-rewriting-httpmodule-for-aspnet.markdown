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
  - /post/2007/11/03/Subsite-Rewriting-HttpModule-for-ASPNET
  - /post/2007/11/03/subsite-rewriting-httpmodule-for-aspnet
  - /post.aspx?id=b68ec42e-5a4f-4d08-8c83-1a7346dd36c6
---
<!-- more -->

Here's some simple code for easily adding Subsite functionality to an ASP.NET website using UrlRewriting/UrlMapping.

Urls are rewritten in the following fashion:

~/jdoe/default.aspx  => ~/default.aspx?site=jdoe<br /> ~/jdoe/subfolder/default.aspx => ~/subfolder/default.aspx?site=jdoe

And this is all done by the 65 line HttpModule below:

[code:c#]

using System;<br /> using System.Web;

/// <summary><br /> /// Summary description for SubsiteRewriteModule<br /> /// </summary><br /> public class SubsiteRewriteModule : IHttpModule<br /> {<br />     #region IHttpModule Members

    void IHttpModule.Dispose() { }

    void IHttpModule.Init(HttpApplication context)<br />     {<br />         context.BeginRequest += new EventHandler(context_BeginRequest);<br />     }

    #endregion

    private void context_BeginRequest(object sender, EventArgs e)<br />     {<br />         HttpContext context = ((HttpApplication)sender).Context;<br />         HttpRequest Request = context.Request;

        if (Request.Path.ToLowerInvariant().EndsWith(".aspx"))<br />         {<br />             string UrlToRewrite = VirtualPathUtility.ToAppRelative(Request.Path).ToLowerInvariant();<br />             bool doRewrite = false;<br />             System.Text.RegularExpressions.Regex regex;

<br />             regex = new System.Text.RegularExpressions.Regex("~/(\\w+)/(.*)");<br />             if (regex.Match(UrlToRewrite).Success)<br />             {<br />                 UrlToRewrite = regex.Replace(UrlToRewrite, "~/$2?site=$1");<br />                 doRewrite = true;<br />             }

<br />             /// Rewrite the URL and inlude all querystring criteria so we don't lose it<br />             if (doRewrite)<br />             {<br />                 if (UrlToRewrite.Contains("?"))<br />                 {<br />                     UrlToRewrite = UrlToRewrite + "&amp;" + GetQueryString(context);<br />                 }<br />                 else<br />                 {<br />                     UrlToRewrite = UrlToRewrite + "?" + GetQueryString(context);<br />                 }<br />                 context.RewritePath(UrlToRewrite, false);<br />             }<br />         }

    }

    private static string GetQueryString(HttpContext context)<br />     {<br />         string returnVal = context.Request.QueryString.ToString();<br />         if (string.IsNullOrEmpty(returnVal))<br />             return "";<br />         else<br />             return returnVal;<br />     }<br /> }

```

<a href="/download/blog/1419/urlrewritingsubsites.zip">Download a sample site</a> using the above HttpModule <a href="/download/blog/1419/urlrewritingsubsites.zip">here</a>
