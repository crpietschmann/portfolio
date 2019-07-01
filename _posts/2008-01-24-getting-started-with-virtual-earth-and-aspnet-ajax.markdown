---
layout: post
blogengineid: dd29204f-fbcb-4c8c-a348-bf091b48847d
title: "Getting Started with Virtual Earth and ASP.NET AJAX"
date: 2008-01-24 03:40:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/01/24/Getting-Started-with-Virtual-Earth-and-ASPNET-AJAX
  - /post/2008/01/24/getting-started-with-virtual-earth-and-aspnet-ajax
  - /post.aspx?id=dd29204f-fbcb-4c8c-a348-bf091b48847d
---
<!-- more -->
<p>
About a month ago, I wrote an article titled &quot;<a href="/Blog/Post.aspx?PostID=1435">Virtual Earth: Getting Started - Adding a basic Map to a page</a>&quot;. In that article I explained the basics of using Virtual Earth with plain HTML and JavaScript. This time I&#39;m going to explain the basics of using Virtual Earth with ASP.NET AJAX. 
</p>
<h3>Virtual Earth and ASP.NET AJAX</h3>
<p>
<strong>Step 1:</strong> Create a new ASP.NET AJAX Web Site in Visual Studio 2005, or just an ASP.NET Web Site in Visual Studio 2008. 
</p>
<p>
<strong>Step 2:</strong> Open up the Default.aspx page. 
</p>
<p>
<strong>Step 3:</strong> Add a ScriptManager to the page. 
</p>
<p>
[code:html]<br />
&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;&lt;/asp:ScriptManager&gt;<br />
[/code]<font size="2" color="#0000ff"></font>
</p>
<p>
<strong>Step 4:</strong> Tell the ScriptManager to load the Virtual Earth API JavaScript file into the page. 
</p>
<p>
[code:html]<br />
&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;Scripts&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:ScriptReference Path=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/Scripts&gt;<br />
&lt;/asp:ScriptManager&gt;<br />
[/code]
</p>
<p>
<strong>Step 5:</strong> Add a DIV to the page below the ScriptManager&nbsp;that will be the host for our Virtual Earth Map.
</p>
<p>
[code:html]<br />
&lt;div id=&quot;myMap&quot; style=&quot;position:relative; width:600px; height:400px;&quot;&gt;&lt;/div&gt;<br />
[/code]
</p>
<p>
<strong>Step 6:</strong> Add a JavaScript method to the page that contains code for instantiating the map.
</p>
<p>
[code:html]<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; var map = null;
</p>
<p>
&nbsp;&nbsp;&nbsp; function LoadMap()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map = new VEMap(&quot;myMap&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.LoadMap(new VELatLong(47.6, -122.33), 10, VEMapStyle.Road);<br />
&nbsp;&nbsp;&nbsp; }<br />
&lt;/script&gt;<br />
[/code]
</p>
<p>
<strong>Step 7:</strong> Add a line of JavaScript within the script block that attaches the LoadMap method to the application&#39;s load event. With this in place the map will get loaded once the&nbsp;asp.net ajax&nbsp;application has finished loading within the browser. 
</p>
<font size="2">
<p>
Sys.Application.add_load(LoadMap); 
</p>
</font>
<p>
<strong>Step 8:</strong> Run the page and you&#39;ll have a basic Virtual Earth Map on it. 
</p>
<h3>Complete Code For This Article</h3>
<p>
<strong>Default.aspx</strong> 
</p>
<p>
[code:html]<br />
&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot;&nbsp; CodeFile=&quot;Default.aspx.cs&quot; Inherits=&quot;_Default&quot; %&gt; 
</p>
<p>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;&gt; 
</p>
<p>
&lt;html xmlns=&quot;<a href="http://www.w3.org/1999/xhtml">http://www.w3.org/1999/xhtml</a>&quot;&gt;<br />
&lt;head runat=&quot;server&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;title&gt;Untitled Page&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;form id=&quot;form1&quot; runat=&quot;server&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;div&gt;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; &lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Scripts&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:ScriptReference Path=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/Scripts&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/asp:ScriptManager&gt;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; &lt;div id=&quot;myMap&quot; style=&quot;position:relative; width:600px; height:400px;&quot;&gt;&lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; &lt;script type=&quot;text/javascript&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var map = null;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function LoadMap()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map = new VEMap(&quot;myMap&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.LoadMap(new VELatLong(47.6, -122.33), 10, VEMapStyle.Road);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Attach our LoadMap method to get executed<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // when the Application has finished loading.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sys.Application.add_load(LoadMap);<br />
&nbsp;&nbsp;&nbsp; &lt;/script&gt;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/form&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
[/code] 
</p>
<h3>Conclusion</h3>
<p>
If you compare this article with the &quot;<a href="/Blog/Post.aspx?PostID=1435">Virtual Earth: Getting Started - Adding a basic Map to a page</a>&quot; article, you&#39;ll see that there aren&#39;t very many differences in how you place a Virtual Earth Map on the page. The only big differences are: 1) you can use the ScriptManager in ASP.NET AJAX to include the VE API script in the page, and 2) ASP.NET AJAX makes it easier to attach&nbsp;a method to get executed when the page/application has loaded. 
</p>
