---
layout: post
title: "Subsite Rewriting HttpModule for ASP.NET"
date: 2007-11-03 17:24:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2007/11/03/Subsite-Rewriting-HttpModule-for-ASPNET
 -  /post/2007/11/03/subsite-rewriting-httpmodule-for-aspnet
---
<!-- more -->
<p>Here's some simple code for easily adding Subsite functionality to an ASP.NET website using UrlRewriting/UrlMapping.</p>
<p>Urls are rewritten in the following fashion:</p>
<p>~/jdoe/default.aspx&nbsp; =&gt; ~/default.aspx?site=jdoe<br /> ~/jdoe/subfolder/default.aspx =&gt; ~/subfolder/default.aspx?site=jdoe</p>
<p>And this is all done by the&nbsp;65 line HttpModule below:</p>
<p>[code:c#]</p>
<p>using System;<br /> using System.Web;</p>
<p>/// &lt;summary&gt;<br /> /// Summary description for SubsiteRewriteModule<br /> /// &lt;/summary&gt;<br /> public class SubsiteRewriteModule : IHttpModule<br /> {<br /> &nbsp;&nbsp;&nbsp; #region IHttpModule Members</p>
<p>&nbsp;&nbsp;&nbsp; void IHttpModule.Dispose() { }</p>
<p>&nbsp;&nbsp;&nbsp; void IHttpModule.Init(HttpApplication context)<br /> &nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context.BeginRequest += new EventHandler(context_BeginRequest);<br /> &nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; #endregion</p>
<p>&nbsp;&nbsp;&nbsp; private void context_BeginRequest(object sender, EventArgs e)<br /> &nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HttpContext context = ((HttpApplication)sender).Context;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HttpRequest Request = context.Request;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (Request.Path.ToLowerInvariant().EndsWith(".aspx"))<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string UrlToRewrite = VirtualPathUtility.ToAppRelative(Request.Path).ToLowerInvariant();<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool doRewrite = false;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.Text.RegularExpressions.Regex regex;</p>
<p><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regex = new System.Text.RegularExpressions.Regex("~/(\\w+)/(.*)");<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (regex.Match(UrlToRewrite).Success)<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UrlToRewrite = regex.Replace(UrlToRewrite, "~/$2?site=$1");<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doRewrite = true;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /// Rewrite the URL and inlude all querystring criteria so we don't lose it<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (doRewrite)<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (UrlToRewrite.Contains("?"))<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UrlToRewrite = UrlToRewrite + "&amp;" + GetQueryString(context);<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UrlToRewrite = UrlToRewrite + "?" + GetQueryString(context);<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context.RewritePath(UrlToRewrite, false);<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; private static string GetQueryString(HttpContext context)<br /> &nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string returnVal = context.Request.QueryString.ToString();<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (string.IsNullOrEmpty(returnVal))<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "";<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return returnVal;<br /> &nbsp;&nbsp;&nbsp; }<br /> }</p>
<p>[/code]</p>
<p><a href="/download/blog/1419/urlrewritingsubsites.zip">Download a sample site</a> using the above HttpModule <a href="/download/blog/1419/urlrewritingsubsites.zip">here</a></p>
