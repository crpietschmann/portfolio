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


About a month ago, I wrote an article titled &quot;<a href="/Blog/Post.aspx?PostID=1435">Virtual Earth: Getting Started - Adding a basic Map to a page</a>&quot;. In that article I explained the basics of using Virtual Earth with plain HTML and JavaScript. This time I&#39;m going to explain the basics of using Virtual Earth with ASP.NET AJAX. 

<h3>Virtual Earth and ASP.NET AJAX</h3>


**Step 1:** Create a new ASP.NET AJAX Web Site in Visual Studio 2005, or just an ASP.NET Web Site in Visual Studio 2008. 



**Step 2:** Open up the Default.aspx page. 



**Step 3:** Add a ScriptManager to the page. 



[code:html]<br />
<asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;></asp:ScriptManager><br />
```<font size="2" color="#0000ff"></font>



**Step 4:** Tell the ScriptManager to load the Virtual Earth API JavaScript file into the page. 



[code:html]<br />
<asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;><br />
    <Scripts><br />
        <asp:ScriptReference Path=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>&quot; /><br />
    </Scripts><br />
</asp:ScriptManager><br />
```



**Step 5:** Add a DIV to the page below the ScriptManager that will be the host for our Virtual Earth Map.



[code:html]<br />
<div id=&quot;myMap&quot; style=&quot;position:relative; width:600px; height:400px;&quot;></div><br />
```



**Step 6:** Add a JavaScript method to the page that contains code for instantiating the map.



[code:html]<br />
<script type=&quot;text/javascript&quot;><br />
    var map = null;



    function LoadMap()<br />
    {<br />
        map = new VEMap(&quot;myMap&quot;);<br />
        map.LoadMap(new VELatLong(47.6, -122.33), 10, VEMapStyle.Road);<br />
    }<br />
</script><br />
```



**Step 7:** Add a line of JavaScript within the script block that attaches the LoadMap method to the application&#39;s load event. With this in place the map will get loaded once the asp.net ajax application has finished loading within the browser. 

<font size="2">


Sys.Application.add_load(LoadMap); 

</font>


**Step 8:** Run the page and you&#39;ll have a basic Virtual Earth Map on it. 

<h3>Complete Code For This Article</h3>


**Default.aspx** 



[code:html]<br />
<%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot;  CodeFile=&quot;Default.aspx.cs&quot; Inherits=&quot;_Default&quot; %> 



<!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;> 



<html xmlns=&quot;<a href="http://www.w3.org/1999/xhtml">http://www.w3.org/1999/xhtml</a>&quot;><br />
<head runat=&quot;server&quot;><br />
    <title>Untitled Page</title><br />
</head><br />
<body><br />
    <form id=&quot;form1&quot; runat=&quot;server&quot;><br />
    <div><br />
    <br />
    <asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;><br />
        <Scripts><br />
            <asp:ScriptReference Path=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>&quot; /><br />
        </Scripts><br />
    </asp:ScriptManager><br />
    <br />
    <div id=&quot;myMap&quot; style=&quot;position:relative; width:600px; height:400px;&quot;></div><br />
    <br />
    <script type=&quot;text/javascript&quot;><br />
        var map = null;<br />
        <br />
        function LoadMap()<br />
        {<br />
            map = new VEMap(&quot;myMap&quot;);<br />
            map.LoadMap(new VELatLong(47.6, -122.33), 10, VEMapStyle.Road);<br />
        }<br />
        <br />
        // Attach our LoadMap method to get executed<br />
        // when the Application has finished loading.<br />
        Sys.Application.add_load(LoadMap);<br />
    </script><br />
    <br />
    </div><br />
    </form><br />
</body><br />
</html><br />
``` 

<h3>Conclusion</h3>


If you compare this article with the &quot;<a href="/Blog/Post.aspx?PostID=1435">Virtual Earth: Getting Started - Adding a basic Map to a page</a>&quot; article, you&#39;ll see that there aren&#39;t very many differences in how you place a Virtual Earth Map on the page. The only big differences are: 1) you can use the ScriptManager in ASP.NET AJAX to include the VE API script in the page, and 2) ASP.NET AJAX makes it easier to attach a method to get executed when the page/application has loaded. 

