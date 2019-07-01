---
layout: post
blogengineid: b4619c83-9e85-4aa9-9c27-b224eb23efef
title: "Configure Visual Studio 2005 for "Classic" ASP syntax highlighting and intellisense"
date: 2005-10-31 17:58:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/10/31/Configure-Visual-Studio-2005-for-Classic-ASP-syntax-highlighting-and-intellisense
  - /post/2005/10/31/configure-visual-studio-2005-for-classic-asp-syntax-highlighting-and-intellisense
  - /post.aspx?id=b4619c83-9e85-4aa9-9c27-b224eb23efef
---
<!-- more -->
<P>You can use the Visual Studio 2005 IDE to edit your Classic ASP files and still utilize syntax highlighting and intellisense. All you have to do is associate the &#8220;.asp&#8220; file extension with the Web Form Editor. When doing this you are telling the IDE to treat &#8220;.asp&#8220; files the same as &#8220;.aspx&#8220; files, in turn sort of &#8220;tricking&#8220; the IDE in to giving you the syntax highlighting and intellisense that you want.</P>
<P>The steps in setting up the IDE are as follows:</P>
<OL>
<LI>Open Visual Studio</LI>
<LI>Goto the "Tools" menu and click "Options..."</LI>
<LI>Check the "Show all options" checkbox in the bottom left of the dialog box.</LI>
<LI>In the right pane expand "Text Editor" and select "File Extension"</LI>
<LI>Enter "ASP" extension in the "Extension" textbox</LI>
<LI>Select "Web Form Editor" in the Editor dropdown box</LI>
<LI>Click the "Add" button and click "Ok" on the dialog box.</LI></OL>
<P>And now enjoy all the syntax highlighting and intellisense features for JavaScript, HTML and Visual Basic while editing your Classic ASP files.</P>
