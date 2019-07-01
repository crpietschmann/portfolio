---
layout: post
blogengineid: 75287b5b-1d1f-47d1-a9ed-6d5c0eb4a545
title: "JavaScript: Loop through all elements in a form"
date: 2006-06-01 09:02:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2006/06/01/JavaScript-Loop-through-all-elements-in-a-form
  - /post/2006/06/01/javascript-loop-through-all-elements-in-a-form
  - /post.aspx?id=75287b5b-1d1f-47d1-a9ed-6d5c0eb4a545
---
<!-- more -->
<p>Since I've been doing alot of JavaScript programming lately, I figured I could start blogging some code snippets. Here is a JavaScript snippet that shows how to loop through all the elements in a form and retrieve their element type, name and values. I had to use this code to gather all form values so I could post them to the server using AJAX.</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;html&gt;
&lt;head&gt;
&lt;script type="text/javascript"&gt;
    function DisplayFormValues()
    {
        var str = '';
        var elem = document.getElementById('frmMain').elements;
        for(var i = 0; i &lt; elem.length; i++)
        {
            str += "&lt;b&gt;Type:&lt;/b&gt;" + elem[i].type + "&amp;nbsp&amp;nbsp";
            str += "&lt;b&gt;Name:&lt;/b&gt;" + elem[i].name + "&amp;nbsp;&amp;nbsp;";
            str += "&lt;b&gt;Value:&lt;/b&gt;&lt;i&gt;" + elem[i].value + "&lt;/i&gt;&amp;nbsp;&amp;nbsp;";
            str += "&lt;BR&gt;";
        } 
        document.getElementById('lblValues').innerHTML = str;
    }
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;form id="frmMain" name="frmMain"&gt;
        &lt;input type="hidden" name="ElemHidden" value="some hidden text" /&gt;
        &lt;input type="text" name="ElemText" value="some text" /&gt;&lt;br /&gt;
        &lt;textarea name="ElemTextArea"&gt;Some text area text&lt;/textarea&gt;&lt;br /&gt;
        &lt;br /&gt;
        &lt;input type="button" value="Test" onclick="DisplayFormValues();" /&gt; 
    &lt;/form&gt;
    &lt;hr /&gt;
    &lt;div id="lblValues"&gt;&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
<p>I revisited this code and tested it again to make sure it still works. I found that it works with the latest browser versions available today, in addition to older browsers, such as:</p>
<ul>
<li>Internet Explorer 6, 7, 8</li>
<li>FireFox 3 &amp; 4 Beta 4</li>
<li>Google Chrome</li>
</ul>
