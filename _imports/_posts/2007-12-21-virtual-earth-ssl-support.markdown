---
layout: post
blogengineid: 2b0b150d-b75c-4d4d-8926-82662e02237e
title: "Virtual Earth: SSL Support"
date: 2007-12-21 21:48:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2007/12/21/Virtual-Earth-SSL-Support
  - /post/2007/12/21/virtual-earth-ssl-support
  - /post.aspx?id=2b0b150d-b75c-4d4d-8926-82662e02237e
---
<!-- more -->


I&#39;ve implemented Virtual Earth within many web applications, but one thing that I&#39;ve only had to do a couple times is run the site under SSL. If you have ever done this, then you know that the web browser doesn&#39;t like this and complains with the &quot;Do you want to display nonsecure items?&quot; prompt. This can be a pain for users, escpecially when they click &quot;No&quot; and then wonder why the map isn&#39;t there.

<h3>Is SSL Supported?</h3>


Yes, even though it isn&#39;t documented, Virtual Earth does support being referenced under SSL. The reason I know this without it being documented is because <a href="http://weblogs.asp.net/davidbarkol">David Barkol</a> has blogged about it <a href="http://weblogs.asp.net/davidbarkol/archive/2007/11/23/ssl-support-for-virtual-earth-is-here.aspx">here</a>. This is the only place I&#39;ve found it mentioned, and it&#39;s not as simple as just using HTTPS.

<h3>How to reference Virtual Earth under SSL</h3>


To reference Virtual Earth v6 using SSL you must pass &quot;s=1&quot; in the querystring, as well as use HTTPS.



Here&#39;s the full URL to reference Virtual Earth using SSL:



<a href="https://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&amp;s=1">https://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&amp;s=1</a>

<h3>Why do we need &quot;s=1&quot;?</h3>


You&#39;d think that by just referencing Virtual Earth using HTTPS you&#39;d be all set. Even though you load the VE script using SSL, VE still requests all map images without SSL, thus causing the prompt to still pop up.



By adding &quot;s=1&quot; to the querystring, you are telling VE to load the map images and other stuff it references using SSL. Doing this removes the annoying prompt from coming up, and eliminating any user confusion when they click &quot;No&quot;.



Now, you&#39;re probably wondering the same thing I am, &quot;Why doesn&#39;t VE just see the HTTPS and reference everything accordingly?&quot; Well, I&#39;m not quite sure, but this may be something they change in a future release.

