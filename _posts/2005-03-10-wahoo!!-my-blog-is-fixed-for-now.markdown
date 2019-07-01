---
layout: post
blogengineid: 63b64e72-f156-4a60-bb9d-b221accfb1ee
title: "Wahoo!! My blog is fixed for now..."
date: 2005-03-10 00:54:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/03/10/Wahoo!!-My-blog-is-fixed-for-now
  - /post/2005/03/10/wahoo!!-my-blog-is-fixed-for-now
  - /post.aspx?id=63b64e72-f156-4a60-bb9d-b221accfb1ee
---
<!-- more -->
<P>I Googled the problem, and found this article <A href="http://odetocode.com/Blogs/scott/archive/2004/05/26/259.aspx">http://odetocode.com/Blogs/scott/archive/2004/05/26/259.aspx</A></P>
<P>And, I came to the conclusion that instead of trying to edit the code, I'd figure out a work around for now. I found that since I can't force a restart of the IIS process that is running my site (since I have a remote host), I deleted the DotText.Framework.dll file in the bin directory of my blog, and then just copied the same version of the file back into the folder (forcing IIS/ASP.NET to restart the .Text applciation), and like magic my blog is fixed. This whole error occurred after I tried out the wBloggar program. I will be forever using the web interface to post to my blog (in fear of this error happening), and I like the web interface better than wBloggar anyway.</P>
