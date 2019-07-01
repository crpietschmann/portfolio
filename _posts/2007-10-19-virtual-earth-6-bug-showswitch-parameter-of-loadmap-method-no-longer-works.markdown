  ---
  layout: post
  title: "Virtual Earth 6 Bug: ShowSwitch parameter of LoadMap method no longer works"
  date: 2007-10-19 19:14:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["Bing Maps"]
  alias: ["/post/2007/10/19/Virtual-Earth-6-Bug-ShowSwitch-parameter-of-LoadMap-method-no-longer-works", "/post/2007/10/19/virtual-earth-6-bug-showswitch-parameter-of-loadmap-method-no-longer-works"]
  ---
<!-- more -->
<p>
<em>Update 12/29/2007: This is no longer a bug. It has been fixed since I originally posted this.</em> 
</p>
<p>
This is the second bug in Virtual Earth 6 that I&#39;ve found today. It appears that the <a href="http://msdn2.microsoft.com/en-us/library/bb412546.aspx">showSwitch parameter of the LoadMap </a>method is broken and no longer works. 
</p>
<p>
As the documentation states:<br />
<em>&quot;A Boolean value that specifies whether to show the map mode switch on the dashboard control. Optional. Default is true (the switch is displayed).&quot;</em> 
</p>
<p>
Below is a screenshot showing what is incorrectly happening and what should be happening: 
</p>
<p>
&nbsp;
</p>
<img src="/image.axd?picture=VE6Bug_ShowSwitchOptionIsBroken.png" alt="" />
