---
layout: post
blogengineid: 75287b5b-1d1f-47d1-a9ed-6d5c0eb4a545
title: "JavaScript: Loop through all elements in a form"
date: 2006-06-01 09:02:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2006/06/01/JavaScript-Loop-through-all-elements-in-a-form.aspx
  - /post/2006/06/01/JavaScript-Loop-through-all-elements-in-a-form
  - /post/2006/06/01/javascript-loop-through-all-elements-in-a-form
  - /post.aspx?id=75287b5b-1d1f-47d1-a9ed-6d5c0eb4a545
---

Since I've been doing a lot of JavaScript programming lately, I figured I could start blogging some code snippets. Here is a JavaScript snippet that shows how to loop through all the elements in a form and retrieve their element type, name and values. I had to use this code to gather all form values so I could post them to the server using AJAX.

```html
<html>
<head>
<script type="text/javascript">
    function DisplayFormValues()
    {
        var str = '';
        var elem = document.getElementById('frmMain').elements;
        for(var i = 0; i < elem.length; i++)
        {
            str += "<b>Type:</b>" + elem[i].type + "&amp;nbsp&amp;nbsp";
            str += "<b>Name:</b>" + elem[i].name + "&amp;nbsp;&amp;nbsp;";
            str += "<b>Value:</b><i>" + elem[i].value + "</i>&amp;nbsp;&amp;nbsp;";
            str += "<BR>";
        } 
        document.getElementById('lblValues').innerHTML = str;
    }
</script>
</head>
<body>
    <form id="frmMain" name="frmMain">
        <input type="hidden" name="ElemHidden" value="some hidden text" />
        <input type="text" name="ElemText" value="some text" />

        <textarea name="ElemTextArea">Some text area text</textarea>

        

        <input type="button" value="Test" onclick="DisplayFormValues();" /> 
    </form>
    <hr />
    <div id="lblValues"></div>
</body>
</html>
```

I revisited this code and tested it again to make sure it still works. I found that it works with the latest browser versions available today, in addition to older browsers, such as:

- Internet Explorer 6, 7, 8
- FireFox 3 &amp; 4 Beta 4
- Google Chrome
