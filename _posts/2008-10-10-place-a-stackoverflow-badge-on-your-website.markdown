---
layout: post
blogengineid: 36e89f5e-4e11-4a73-81c6-3dde5c757fba
title: "Place a StackOverflow badge on your website"
date: 2008-10-10 07:09:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/10/10/Place-a-StackOverflow-badge-on-your-website
  - /post/2008/10/10/place-a-stackoverflow-badge-on-your-website
  - /post.aspx?id=36e89f5e-4e11-4a73-81c6-3dde5c757fba
---
<!-- more -->

**Update:** StackOverflow.com has since added the ability to include <a href="http://stackoverflow.com/users/flair">StackOverflow "Flair"</a> on your own website; basically a "badge" that contains your StackOverflow.com Name, Avatar, Score and Medal counts within a nice little box. I'm not sure when they added it, but now it's officially supported.


<script src="http://stackoverflow.com/users/flair/7831.js?theme=default" type="text/javascript"></script>


<a href="http://stackoverflow.com/users/flair">http://stackoverflow.com/users/flair</a>

And, for reference, my original StackOverflow Badge code is still below:
<hr />

I was thinking it would be cool if you could place a StackOverflow "badge" on your website or blog showing your current Reputation score with a link to your profile. So I look into it, and it actually wasn't that difficult to "scrape" the information off the StackOverflow.com website.

<em>Disclaimer: I didn't see any terms of use on the site prohibiting this, but it very well may be against the terms of use. Use at your own risk.</em>

Well, here's a small ASP.NET User Control that does it:

<img src="/images/postsStackOverflowBadge.png" alt="" width="193" height="52" />

And here's the usage code for putting your badge on your site:

[ code:html ]

&lt;%@ Register Src="~/StackOverflowBadge.ascx" TagPrefix="StackOverflow" TagName="Badge" %&gt; <br /> <br /> &lt;style type="text/css"&gt;<br />     .stackoverflow-badge {border: solid 1px black; padding: 2px;}<br />     .stackoverflow-badge .user-info .user-gravatar32{float: left; width: 32px;}<br />     .stackoverflow-badge .user-info .user-gravatar32 img{border: none;}<br />     .stackoverflow-badge .user-info .user-details{<br />      float: left; margin-left: 5px; width: 138px; overflow: hidden; white-space: nowrap;<br />     }<br />     .stackoverflow-badge .user-details{color: #888; line-height:17px;}<br />     .stackoverflow-badge .reputation-score{font-weight: bold; color: #333; font-size: 120%; margin-right:2px;}<br />     .stackoverflow-badge .badge{<br />      color: #fff; background-color: #333; border: 1px solid #333; margin: 0 3px 3px 0;<br />      padding: 4px 8px 4px 3px; color: white !important; text-decoration: none; line-height: 1.9;<br />     }<br />     .stackoverflow-badge .badge:hover{border: 1px solid #555;background-color: #555;text-decoration: none;}<br />     .stackoverflow-badge .badge1{margin-left:3px;font-size: 120%;color: #FFCC00;}<br />     .stackoverflow-badge .badge2{margin-left:3px;font-size: 120%;color: #C0C0C0;}<br />     .stackoverflow-badge .badge3{margin-left:3px;font-size: 120%;color: #CC9966;}<br />     .stackoverflow-badge .badgecount{padding-left: 1px; color: #808185;}<br /> &lt;/style&gt;<br /> <br /> &lt;StackOverflow:Badge runat="server" id="sob1" DisplayName="Chris Pietschmann"&gt;&lt;/StackOverflow:Badge&gt;

[/ code ]

See pretty simple to use, just make sure you put the CSS in your site so it's styled appropriately.

And finally, here's the source for the StackOverflowBadge.ascx user control:

**StackOverflowBadge.ascx:**

[ code:html ]

&lt;%@ Control Language="C#" AutoEventWireup="true" CodeFile="StackOverflowBadge.ascx.cs" Inherits="StackOverflowBadge" %&gt;<br /> &lt;%=this.HTML%&gt;

[/ code ]

**StackOverflowBadge.ascx.cs:**

[code:c#]

using System;<br /> using System.IO;<br /> using System.Net;<br /> using System.Text;

public partial class StackOverflowBadge : System.Web.UI.UserControl<br /> {<br />     protected void Page_Load(object sender, EventArgs e)<br />     {<br />         GetStackOverflowData();<br />     }

    public string DisplayName { get; set; }<br />     public string Reputation { get; set; }<br />     public string UserID { get; set; }<br />     public string ImageURL { get; set; }<br />     public string HTML { get; set; }

    protected void GetStackOverflowData()<br />     {<br />         string username = this.DisplayName;<br />         username = username.ToLowerInvariant();

<br />         WebRequest r = WebRequest.Create("http://stackoverflow.com/users/browser-filter");<br />         ((HttpWebRequest)r).UserAgent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0;)";<br />         r.Method = "POST";

        Byte[] byteArray = Encoding.ASCII.GetBytes("filter=" + username);

        r.ContentType = "application/x-www-form-urlencoded";<br />         r.ContentLength = byteArray.Length;

        Stream requestStream = r.GetRequestStream();<br />         requestStream.Write(byteArray, 0, byteArray.Length);<br />         requestStream.Close();

<br />         WebResponse resp = r.GetResponse();

        StreamReader reader = new StreamReader(resp.GetResponseStream());

        string responseContent = reader.ReadToEnd();

<br />         // Fix username to look for in HTML returned<br />         username = username.Replace(" ", "-");

<br />         // Get UserID<br />         string userid = null;<br />         if (responseContent.IndexOf("&lt;a href=\"/users/") &gt; 0)<br />         {<br />             string tempUserID = responseContent.Substring(responseContent.IndexOf("&lt;a href=\"/users/"));<br />             if (tempUserID.Length &gt; 16)<br />             {<br />                 tempUserID = tempUserID.Substring(16);<br />                 if (tempUserID.IndexOf("/" + username) &gt; 0)<br />                 {<br />                     userid = tempUserID.Substring(0, tempUserID.IndexOf("/" + username));<br />                 }<br />             }<br />             this.UserID = userid;<br />         }

        // Get Reputation Score<br />         string rep = null;<br />         if (responseContent.IndexOf("title=\"reputation score\"&gt;") &gt; 0)<br />         {<br />             string tempRep = responseContent.Substring(responseContent.IndexOf("title=\"reputation score\"&gt;"));<br />             if (tempRep.Length &gt; 25)<br />             {<br />                 tempRep = tempRep.Substring(25);<br />                 if (tempRep.IndexOf("&lt;/span&gt;") &gt; 0)<br />                 {<br />                     rep = tempRep.Substring(0, tempRep.IndexOf("&lt;/span&gt;"));<br />                 }<br />             }<br />         }<br />         this.Reputation = rep;

<br />         // Get Image URL<br />         string img = null;<br />         if (responseContent.IndexOf("\"&gt;&lt;img src=\"") &gt; 0)<br />         {<br />             string tempImg = responseContent.Substring(responseContent.IndexOf("\"&gt;&lt;img src=\""));<br />             if (tempImg.Length &gt; 12)<br />             {<br />                 tempImg = tempImg.Substring(12);<br />                 if (tempImg.IndexOf("\" height=32 width=32 /&gt;") &gt; 0)<br />                 {<br />                     img = tempImg.Substring(0, tempImg.IndexOf("\" height=32 width=32 /&gt;"));<br />                 }<br />             }<br />         }<br />         this.ImageURL = img;

 

        // Get Full Html for Display<br />         string html = null;<br />         if (responseContent.IndexOf("; width:860px;\"&gt;") &gt; 0)<br />         {<br />             string tempHtml = responseContent.Substring(responseContent.IndexOf("; width:860px;\"&gt;"));<br />             if (tempHtml.Length &gt; 16)<br />             {<br />                 tempHtml = tempHtml.Substring(16);<br />                 if (tempHtml.IndexOf("&lt;div style=\"float:") &gt; 0)<br />                 {<br />                     html = tempHtml.Substring(0, tempHtml.IndexOf("&lt;div style=\"float:"));<br />                     html = html.Replace("&lt;a href=\"/users", "&lt;a href=\"<a href="http://stackoverflow.com/users">http://stackoverflow.com/users</a>");<br />                     html = html.Replace("&lt;table style=\"margin: 0px 5px 5px;\"&gt;", "&lt;table cellpadding='0' cellspacing='0' class=\"stackoverflow-badge\"&gt;");<br />                     html = html.Replace("&lt;div class=\"user-action-time\"&gt;&lt;br /&gt;&lt;/div&gt;", "");<br />                     html = html.Replace("&lt;td width=200&gt;", "&lt;td&gt;");<br />                 }<br />             }<br />         }<br />         this.HTML = html;<br />     }

}

```
