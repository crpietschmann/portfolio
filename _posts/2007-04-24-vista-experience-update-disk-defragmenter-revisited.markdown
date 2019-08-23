---
layout: post
blogengineid: b2beb7a3-6297-4bd9-8496-ade8db7b02c8
title: "Vista Experience Update: Disk Defragmenter Revisited"
date: 2007-04-24 22:29:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2007/04/24/Vista-Experience-Update-Disk-Defragmenter-Revisited.aspx
  - /post/2007/04/24/Vista-Experience-Update-Disk-Defragmenter-Revisited
  - /post/2007/04/24/vista-experience-update-disk-defragmenter-revisited
  - /post.aspx?id=b2beb7a3-6297-4bd9-8496-ade8db7b02c8
---
<!-- more -->

About 5 months ago, way back when Vista RTM'd, I posted about how <a href="/Blog/Post.aspx?PostID=1338">Vista now automatically defragments your hard drives</a>. This is a really neat feature, especially since I would never remember to defrag until my system started to get noticably slow. So, I thought I would revisit this to just see how well is it working.

**But, How well does the automatically scheduled defrag work?**

I was wonder this, so I decided to check the defrag stats available from within the Disk Defragmenter tool. And to my dismay, they removed that display. I figured there's got to be a way; so I search my favorite search engine.

And, I found this post: <a href="http://www.thegline.com/windows/2007/03/whatever-happened-to-the-defra.html">Whatever Happened to ... The Defragmentation App?</a>

Apparently, the only way to view the fragmentation stats is to use the* *defrag tool from the command line. Well, I guess the stats really weren't usefull to the average use, so this works; but couldn't they've just left an "Analysis Report" button in the GUI of the tool?

**Steps to view the Fragmentation Analysis Report for the C drive**
<ol>
<li>Run the Command Prompt.
*Note: Don't forget to right-click the shortcut and click "Run as administrator"*</li>
<li>Type the following in the command line: *defrag c: -a*</li>
<li>Press Enter and in a few moments it's display the Percent file fragmentation</li>
</ol>

**My results of the auto-scheduled Defragmentation after 5 months**

After running Vista for 5 months and doing the usual install/uninstall and write/delete of programs and files (which usually results in about 22% fragmentation for me within a few months) I see that my C drive fragmentation is only at 1%. Looks good to me, and I haven't experienced any performance degradation over this time period either.

**Conclusion**

The auto-scheduling of the extremely important Disk Defragmenter tool has made my system (and presumably everyone elses) easier to manage over the long term. One less thing I need to think about (and do) is always nice; besided this is very important for those who don't even know (I'm refering to the average user) they have to run the defragmenter. Way to go Microsoft on this small improvement with such a big impact!
