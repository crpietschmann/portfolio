---
layout: post
title: "Virtual Earth + ASP.NET AJAX Now Fixed in Safari"
date: 2008-05-17 13:13:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "Bing Maps"]
alias: ["/post/2008/05/17/Virtual-Earth-2b-ASPNET-AJAX-Now-Fixed-in-Safari", "/post/2008/05/17/virtual-earth-2b-aspnet-ajax-now-fixed-in-safari"]
---
<!-- more -->
<p>
A couple months ago I blogged about the fact that using <a href="/post.aspx?id=600a0bbc-5e22-4bd2-bef2-542d70e682b2">Virtual Earth and ASP.NET AJAX together on the same page caused errors in Safari</a>. There is good new to report back, the latest update to Virtual Earth has fixed this issue. In fact Virtual Earth v6.1 actually includes much better Safari support that previous versions; it actually works correctly in Safari. I found this to be especially helpful since I can now support Safari with my <a href="http://simplovation.com/page/webmapsve.aspx">Web.Maps.VE</a> product.
</p>
<p>
What&#39;s the catch? I can&#39;t work perfectly now can it. Well, as far as I can tell Virtual Earth works great. However, the code example in my post calling attention to the error actually still has a little bug in it. The bug is the calendar that is automatically shown on hover over by the AjaxControlToolkit CalendarExtender get hidden by the Map below the textbox. This is actually caused by a layering issue related to the z-index of the elements on the page. An easy way to fix this is to just set the z-index of the VEMap&#39;s DIV element to a lower value so all other elements on the page will be rendered over the top of it.
</p>
<p>
Here&#39;s the full example code showing example what I mean above:
</p>
<p>
[code:html]
</p>
<p>
&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot;&nbsp; CodeFile=&quot;Default.aspx.cs&quot; Inherits=&quot;_Default&quot; %&gt;<br />
&lt;%@ Register Assembly=&quot;AjaxControlToolkit&quot; Namespace=&quot;AjaxControlToolkit&quot; TagPrefix=&quot;ajaxToolkit&quot; %&gt;<br />
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;&gt;<br />
&lt;html xmlns=&quot;<a href="http://www.w3.org/1999/xhtml">http://www.w3.org/1999/xhtml</a>&quot;&gt;<br />
&lt;head id=&quot;Head1&quot; runat=&quot;server&quot;&gt;<br />
&lt;title&gt;Untitled Page&lt;/title&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;&gt;<br />
&lt;script type=&quot;text/javascript&quot; src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1&quot;&gt;&lt;/script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1&quot;&gt;&lt;/script</a>&gt;<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; var map = null;<br />
&nbsp;&nbsp;&nbsp; function GetMap()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map = new VEMap(&#39;myMap&#39;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.LoadMap();<br />
&nbsp;&nbsp;&nbsp; }<br />
&lt;/script&gt;<br />
&lt;/head&gt;<br />
&lt;body onload=&quot;GetMap();&quot;&gt;<br />
&lt;form id=&quot;form1&quot; runat=&quot;server&quot;&gt;<br />
&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;&lt;/asp:ScriptManager&gt;<br />
&lt;div&gt;<br />
&lt;asp:TextBox runat=&quot;server&quot; id=&quot;txtDate&quot;&gt;&lt;/asp:TextBox&gt;<br />
&lt;ajaxToolkit:CalendarExtender runat=&quot;server&quot; ID=&quot;CalendarExtender1&quot; TargetControlID=&quot;txtDate&quot;&gt;&lt;/ajaxToolkit:CalendarExtender&gt;<br />
&lt;br /&gt;&lt;br /&gt;<br />
&lt;div id=&#39;myMap&#39; style=&quot;position:relative; width:400px; height:400px; z-index: -100;&quot;&gt;&lt;/div&gt;<br />
&lt;/div&gt;<br />
&lt;/form&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;
</p>
<p>
[/code]
</p>
