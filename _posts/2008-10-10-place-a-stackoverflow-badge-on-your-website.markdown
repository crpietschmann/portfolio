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

*Disclaimer: I didn't see any terms of use on the site prohibiting this, but it very well may be against the terms of use. Use at your own risk.*

Well, here's a small ASP.NET User Control that does it:

<img src="/files/StackOverflowBadge.png" alt="" width="193" height="52" />

And here's the usage code for putting your badge on your site:

[ code:html ]

<%@ Register Src="~/StackOverflowBadge.ascx" TagPrefix="StackOverflow" TagName="Badge" %> 
 
 <style type="text/css">
     .stackoverflow-badge {border: solid 1px black; padding: 2px;}
     .stackoverflow-badge .user-info .user-gravatar32{float: left; width: 32px;}
     .stackoverflow-badge .user-info .user-gravatar32 img{border: none;}
     .stackoverflow-badge .user-info .user-details{
      float: left; margin-left: 5px; width: 138px; overflow: hidden; white-space: nowrap;
     }
     .stackoverflow-badge .user-details{color: #888; line-height:17px;}
     .stackoverflow-badge .reputation-score{font-weight: bold; color: #333; font-size: 120%; margin-right:2px;}
     .stackoverflow-badge .badge{
      color: #fff; background-color: #333; border: 1px solid #333; margin: 0 3px 3px 0;
      padding: 4px 8px 4px 3px; color: white !important; text-decoration: none; line-height: 1.9;
     }
     .stackoverflow-badge .badge:hover{border: 1px solid #555;background-color: #555;text-decoration: none;}
     .stackoverflow-badge .badge1{margin-left:3px;font-size: 120%;color: #FFCC00;}
     .stackoverflow-badge .badge2{margin-left:3px;font-size: 120%;color: #C0C0C0;}
     .stackoverflow-badge .badge3{margin-left:3px;font-size: 120%;color: #CC9966;}
     .stackoverflow-badge .badgecount{padding-left: 1px; color: #808185;}
 </style>
 
 <StackOverflow:Badge runat="server" id="sob1" DisplayName="Chris Pietschmann"></StackOverflow:Badge>

[/ code ]

See pretty simple to use, just make sure you put the CSS in your site so it's styled appropriately.

And finally, here's the source for the StackOverflowBadge.ascx user control:

**StackOverflowBadge.ascx:**

[ code:html ]

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StackOverflowBadge.ascx.cs" Inherits="StackOverflowBadge" %>
 <%=this.HTML%>

[/ code ]

**StackOverflowBadge.ascx.cs:**

```csharp

using System;
 using System.IO;
 using System.Net;
 using System.Text;

public partial class StackOverflowBadge : System.Web.UI.UserControl
 {
     protected void Page_Load(object sender, EventArgs e)
     {
         GetStackOverflowData();
     }

    public string DisplayName { get; set; }
     public string Reputation { get; set; }
     public string UserID { get; set; }
     public string ImageURL { get; set; }
     public string HTML { get; set; }

    protected void GetStackOverflowData()
     {
         string username = this.DisplayName;
         username = username.ToLowerInvariant();


         WebRequest r = WebRequest.Create("http://stackoverflow.com/users/browser-filter");
         ((HttpWebRequest)r).UserAgent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0;)";
         r.Method = "POST";

        Byte[] byteArray = Encoding.ASCII.GetBytes("filter=" + username);

        r.ContentType = "application/x-www-form-urlencoded";
         r.ContentLength = byteArray.Length;

        Stream requestStream = r.GetRequestStream();
         requestStream.Write(byteArray, 0, byteArray.Length);
         requestStream.Close();


         WebResponse resp = r.GetResponse();

        StreamReader reader = new StreamReader(resp.GetResponseStream());

        string responseContent = reader.ReadToEnd();


         // Fix username to look for in HTML returned
         username = username.Replace(" ", "-");


         // Get UserID
         string userid = null;
         if (responseContent.IndexOf("<a href=\"/users/") > 0)
         {
             string tempUserID = responseContent.Substring(responseContent.IndexOf("<a href=\"/users/"));
             if (tempUserID.Length > 16)
             {
                 tempUserID = tempUserID.Substring(16);
                 if (tempUserID.IndexOf("/" + username) > 0)
                 {
                     userid = tempUserID.Substring(0, tempUserID.IndexOf("/" + username));
                 }
             }
             this.UserID = userid;
         }

        // Get Reputation Score
         string rep = null;
         if (responseContent.IndexOf("title=\"reputation score\">") > 0)
         {
             string tempRep = responseContent.Substring(responseContent.IndexOf("title=\"reputation score\">"));
             if (tempRep.Length > 25)
             {
                 tempRep = tempRep.Substring(25);
                 if (tempRep.IndexOf("</span>") > 0)
                 {
                     rep = tempRep.Substring(0, tempRep.IndexOf("</span>"));
                 }
             }
         }
         this.Reputation = rep;


         // Get Image URL
         string img = null;
         if (responseContent.IndexOf("\"><img src=\"") > 0)
         {
             string tempImg = responseContent.Substring(responseContent.IndexOf("\"><img src=\""));
             if (tempImg.Length > 12)
             {
                 tempImg = tempImg.Substring(12);
                 if (tempImg.IndexOf("\" height=32 width=32 />") > 0)
                 {
                     img = tempImg.Substring(0, tempImg.IndexOf("\" height=32 width=32 />"));
                 }
             }
         }
         this.ImageURL = img;

 

        // Get Full Html for Display
         string html = null;
         if (responseContent.IndexOf("; width:860px;\">") > 0)
         {
             string tempHtml = responseContent.Substring(responseContent.IndexOf("; width:860px;\">"));
             if (tempHtml.Length > 16)
             {
                 tempHtml = tempHtml.Substring(16);
                 if (tempHtml.IndexOf("<div style=\"float:") > 0)
                 {
                     html = tempHtml.Substring(0, tempHtml.IndexOf("<div style=\"float:"));
                     html = html.Replace("<a href=\"/users", "<a href=\"<a href="http://stackoverflow.com/users">http://stackoverflow.com/users</a>");
                     html = html.Replace("<table style=\"margin: 0px 5px 5px;\">", "<table cellpadding='0' cellspacing='0' class=\"stackoverflow-badge\">");
                     html = html.Replace("<div class=\"user-action-time\">
</div>", "");
                     html = html.Replace("<td width=200>", "<td>");
                 }
             }
         }
         this.HTML = html;
     }

}

```
