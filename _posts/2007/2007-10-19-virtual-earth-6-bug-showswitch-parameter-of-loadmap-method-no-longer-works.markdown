---
layout: post
blogengineid: 9c55056b-9d3e-4ea2-aa60-3f9ddd7a5421
title: "Virtual Earth 6 Bug: ShowSwitch parameter of LoadMap method no longer works"
date: 2007-10-19 19:14:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2007/10/19/Virtual-Earth-6-Bug-ShowSwitch-parameter-of-LoadMap-method-no-longer-works.aspx
  - /post/2007/10/19/Virtual-Earth-6-Bug-ShowSwitch-parameter-of-LoadMap-method-no-longer-works
  - /post/2007/10/19/virtual-earth-6-bug-showswitch-parameter-of-loadmap-method-no-longer-works
  - /post.aspx?id=9c55056b-9d3e-4ea2-aa60-3f9ddd7a5421
---
<!-- more -->


*Update 12/29/2007: This is no longer a bug. It has been fixed since I originally posted this.* 



This is the second bug in Virtual Earth 6 that I&#39;ve found today. It appears that the <a href="http://msdn2.microsoft.com/en-us/library/bb412546.aspx">showSwitch parameter of the LoadMap </a>method is broken and no longer works. 



As the documentation states:

*&quot;A Boolean value that specifies whether to show the map mode switch on the dashboard control. Optional. Default is true (the switch is displayed).&quot;* 



Below is a screenshot showing what is incorrectly happening and what should be happening: 



 

<img src="/files/VE6Bug_ShowSwitchOptionIsBroken.png" alt="" />
