---
layout: post
blogengineid: 6b4b3c76-4943-4038-8dc1-87501084a397
title: "C# .NET: Convert System.Drawing.Color to HTML color"
date: 2006-06-29 14:48:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
redirect_from: 
  - /post/2006/06/29/C-NET-Convert-SystemDrawingColor-to-HTML-color
  - /post/2006/06/29/c-net-convert-systemdrawingcolor-to-html-color
  - /post.aspx?id=6b4b3c76-4943-4038-8dc1-87501084a397
---
<!-- more -->

Here is a small example of how to convert a System.Drawing.Color to the HTML color format (Hex value or HTML color name value) and back.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">System.Drawing.Color c = System.Drawing.ColorTranslator.FromHtml("#F5F7F8");
String strHtmlColor = System.Drawing.ColorTranslator.ToHtml(c);</pre>
