---
layout: post
title: "DotNetKicks auto bookmarklet"
date: 2007-03-29 13:34:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
alias: ["/post/2007/03/29/DotNetKicks-auto-bookmarklet", "/post/2007/03/29/dotnetkicks-auto-bookmarklet"]
---
<!-- more -->
<P>Here's a bookmarklet for submitting a link to <A href="http://dotnetkicks.com/">DotNetKicks </A>that automatically passes in the URL, Title and Description. To specify&nbsp;the&nbsp;description to submit all you have to do is highlight text on the page.</P>
<P>Try it:<BR><A href="javascript:var d='';if (window.getSelection){d=window.getSelection();}else if (document.getSelection){d=document.getSelection();}else if (document.selection){d=document.selection.createRange().text;}document.location.href='http://dotnetkicks.com/kick?url='+escape(document.location.href)+'&amp;title='+escape(document.title)+'&amp;description='+d;">DotNetKicks (Auto Bookmarklet)</A></P>
<P>To add this bookmarklet to your favorites, just drag it to the favorites or right-click and select "Add to Favorites".</P>
<P><STRONG>What is a bookmarklet?<BR></STRONG>A bookmarklet is a small JavaScript program that can be stored as a URL within a bookmark in most popular web browsers, or within hyperlinks on a web page.<BR><A href="http://en.wikipedia.org/wiki/Favelet"><STRONG>http://en.wikipedia.org/wiki/Favelet</STRONG></A></P>
