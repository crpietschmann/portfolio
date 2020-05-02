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
  - /post/2006/06/29/C-NET-Convert-SystemDrawingColor-to-HTML-color.aspx
  - /post/2006/06/29/C-NET-Convert-SystemDrawingColor-to-HTML-color
  - /post/2006/06/29/c-net-convert-systemdrawingcolor-to-html-color
  - /post.aspx?id=6b4b3c76-4943-4038-8dc1-87501084a397
---

The `System.Drawing.ColorTranslator` class has some static methods that can be used to convert to/from HTML colors and the `System.Drawing.Color` object for that color in C# other .NET languages. There are times when this task is necessary, and it's somewhat of a little known feature within the `System.Drawing` namespace.

To convert from an HTML color code to `System.Drawing.Color`, use the following:

```csharp
System.Drawing.ColorTranslator.FromHtml("#F5F7F8");
```

To convert from `System.Drawing.Color` to an equivalent HTML color code, use the following:

```csharp
System.Drawing.ColorTranslator.ToHtml(c);
```

Here is a small C# example of how to convert a `System.Drawing.Color` to the HTML color format (Hex value or HTML color name value) and back.

```csharp
System.Drawing.Color c = System.Drawing.ColorTranslator.FromHtml("#F5F7F8");
String strHtmlColor = System.Drawing.ColorTranslator.ToHtml(c);
```

Hopefully this helps you with the color code conversions you are needing to perform within your applications.
