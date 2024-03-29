---
layout: post
blogengineid: 991001f5-399b-42ff-829c-2b80cb49a8b8
title: "dotNetExt - .NET Extension Method Library - v0.1 Beta Released"
date: 2008-07-16 18:50:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2008/07/16/dotNetExt-NET-Extension-Method-Library-v01-Beta-Released
  - /post/2008/07/16/dotnetext-net-extension-method-library-v01-beta-released
  - /post.aspx?id=991001f5-399b-42ff-829c-2b80cb49a8b8
---
<!-- more -->

This is the first release of a small, new project I created. This is just the first release of the project, and I'll keep adding more functionality to it if there is enough interest by me or others in the project. So, please post any comments you have in the <a href="http://www.codeplex.com/dotNetExt/Thread/List.aspx">project discussion area</a>.
<h3>**dotNetExt - .NET Extension Method Library**</h3>

<span>dotNetExt is a small Extension Method Library for .NET 3.5 that extends the BCL Types with helper methods that make simple tasks simpler. So far there are extensions for the Object, Array and String BCL Types. The library is flexible so you can Import All Extension Methods or just the Extension Methods for the BCL Type you want.</span>

**Download Here: **<a href="http://codeplex.com/dotNetExt">http://codeplex.com/dotNetExt</a>
<h3>**Library Usage**</h3>

<span>You can include the entire library of Extension Methods by Importing the dotNetExt namespace. Alternatively you can Import just the Extension Methods you want (grouped by Base Class Library Type) by including that specific extension collections namespace.</span>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Include All Extension Methods
using dotNetExt;

// Include Only The Array Extension Methods
using dotNetExt.Array;

// Include Only The Object Extension Methods
using dotNetExt.Object;

// Include Only The String Extension Methods
using dotNetExt.String;</pre>
<h3>Extension Methods</h3>

**dotNetExt namespace**

Importing this namespace you will import all the Extension Methods from the below namespaces.

**dotNetExt.Array namespace**

This namespace includes Extension Methods for the System.Array Type only.
<ul>
<li>IsEmpty() - Returns a Boolean indicating whether the Array is Empty (is Null or has a length of zero).</li>
</ul>

**dotNetExt.Object namespace**

This namespace includes Extension Methods for the System.Object Type only.
<ul>
<li>IsType() - Returns a Boolean value indicating whether a variable is of the indicated Type</li>
<li>IsArray() - Returns a Boolean value indicating whether a variable points to a System.Array.</li>
<li>IsDate() - Returns a Boolean value indicating whether a variable points to a DateTime object.</li>
<li>IsDBNull() - Returns a Boolean value indicating whether an expression evaluates to the DBNull class.</li>
</ul>

**dotNetExt.String namespace**

This namespace includes Extension Methods for the System.String Type only.
<ul>
<li>Left() - Returns a string containing a specified number of characters from the left side of a string.</li>
<li>Right() - Returns a string containing a specified number of characters from the right side of a string.</li>
<li>EncodeHtml() - Returns the String HtmlEncoded.</li>
<li>DecodeHtml() - Returns the String HtmlDecoded.</li>
<li>EncodeUrl() - Returns the String UrlEncoded.</li>
<li>DecodeUrl() - Returns the String UrlDecoded.</li>
<li>EncodeBase64() - Returns the String Base64 Encoded.</li>
<li>DecodeBase64() - Returns the String Base64 Decoded.</li>
<li>ToByteArray() - Returns a Byte Array of the String.</li>
</ul>
