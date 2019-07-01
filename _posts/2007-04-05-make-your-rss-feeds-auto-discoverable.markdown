---
layout: post
blogengineid: ed99da1a-d955-48d0-bfec-20c31cbe6771
title: "Make your RSS feeds Auto-Discoverable"
date: 2007-04-05 01:07:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2007/04/05/Make-your-RSS-feeds-Auto-Discoverable
  - /post/2007/04/05/make-your-rss-feeds-auto-discoverable
  - /post.aspx?id=ed99da1a-d955-48d0-bfec-20c31cbe6771
---
<!-- more -->

RSS Autodiscovery is a technique that makes it possible for browsers and other software to automatically find a site's RSS feed. This feature is actually support by both Firefox 2.0 and Internet Explorer 7.

To make your RSS feeds auto-discoverable just include an HTML/XHTML Link tag inside the Head tag of your website. You can even include multiple Link tags, which allows you to make all your RSS feeds auto-discoverable at the same time.

For Example:<BR><EM>&lt;link rel="alternative" type="application/rss+xml" title="Chris Pietschmann's RSS Feed" href="/blog/rss.aspx" /&gt;</EM>

The most notible effect within IE7 that this will have, is it will cause the orange RSS icon in the top right of the browser to light up. This will notify the user that your website has a feed that they can subscribe to. It makes it easier for "normal" people to subscribe to blogs.

This feature has actually been around for awhile. If you do a search, you'll find other blogs posting about it back in 2005. The reason I'm blogging it, is because I just found out that this feature exists and I figure there are still alot of people that don't know you can do this.

For more info:<BR><A href="http://www.rssboard.org/rss-autodiscovery">RSS Advisory Board - RSS Autodiscovery</A>
