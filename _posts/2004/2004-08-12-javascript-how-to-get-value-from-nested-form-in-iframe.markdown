---
layout: post
blogengineid: 2326526f-7253-4770-8a9e-55287c29b30e
title: "JavaScript: How to get value from nested form in iframe?"
date: 2004-08-12 23:12:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/08/12/JavaScript-How-to-get-value-from-nested-form-in-iframe.aspx
  - /post/2004/08/12/JavaScript-How-to-get-value-from-nested-form-in-iframe
  - /post/2004/08/12/javascript-how-to-get-value-from-nested-form-in-iframe
  - /post.aspx?id=2326526f-7253-4770-8a9e-55287c29b30e
---

Here is an example of how to get a value from a nested form in an iframe. It works in IE6, but not Netscape 7.1.

## PageOne.htm

```html
<html>
<head>
<script language='JavaScript'>

 function Search() {
  alert(document.frames("PageTwo").document.forms("Members").elements("Search").value);
 }

</script>
</head>
<body>
<input type='button' value='Search' onclick='Search();'>
<iframe name='PageTwo' src="PageTwo.htm" width='100%' height='100'>
</body>
</html>
```

## PageTwo.htm

```html
<html>
<body>
<form name='Members'>
    <input type='text' name='Search' value='Chris'>
</form>
</body>
</html>
```