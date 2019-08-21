---
layout: post
blogengineid: ae065d67-d849-419d-9091-2df37e1afee5
title: "HTML5 Day 5: New Date Input Type <input type=date />"
date: 2010-11-18 13:35:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["HTML", "JavaScript"]
redirect_from: 
  - /post/2010/11/18/HTML5-Day-5-New-Date-Input-Type
  - /post/2010/11/18/html5-day-5-new-date-input-type
  - /post.aspx?id=ae065d67-d849-419d-9091-2df37e1afee5
---
<!-- more -->

<a href="http://www.w3.org/TR/html-markup/input.date.html">Date</a> is one of the new, and much needed, input types added in HTML5. This has been added as a replacement of using a text box for the input of dates. Below is a screenshot of the custom UI that the Opera web browser automatically implements for this new input type.

## Display in Modern Browsers

<a href="/files/HTML5_INPUT_DATE_OPERA.png"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="HTML5_INPUT_DATE_OPERA" src="/files/HTML5_INPUT_DATE_OPERA_thumb.png" alt="HTML5_INPUT_DATE_OPERA" width="308" height="326" border="0" /></a>

This is a screenshot of the Opera web browser&rsquo;s UI for the date input field. The actual display of this field is handled by the web browser and will vary in each browser and device the page is being viewed on. For example, iOS and other mobile devices will display a more mobile friendly calendar picker than the desktop version of Opera shown above.

Here&rsquo;s the HTML5 source for the above screenshot:

```html
<!DOCTYPE html>
<meta charset="utf-8">
<html lang="en">
<head>
</head>
<body>

Date: <input type=date />

</body>
</html>
```

As you can see in the screenshot the format for the date is &ldquo;yyyy-mm-dd&rdquo; That is a four digit year, two digit month and a two digit day in that order, separated each by a hyphen.

## What about Older Browsers?

Older web browsers render any `<input>` tags with an &ldquo;unknown&rdquo; type as a regular text box. So consequentially older web browsers will render the above date input type as a text input type.

Even though older web browsers do not display any special UI for the date input type, you can still use your own JavaScript code or the jQuery UI DatePicker to display your own UI in those browsers.

<a href="/files/HTML5_INPUT_DATE_jQuery_IE8.png"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="HTML5_INPUT_DATE_jQuery_IE8" src="/files/HTML5_INPUT_DATE_jQuery_IE8_thumb.png" alt="HTML5_INPUT_DATE_jQuery_IE8" width="221" height="244" border="0" /></a>

Here&rsquo;s a modified version of the above code including a &ldquo;patch&rdquo; using the jQuery UI DatePicker and Modernizr to display custom UI in older browsers that do not support the date input type. The above screenshot is an example of this in action in Internet Explorer 8.

```html
<!DOCTYPE html>
<meta charset="utf-8">
<html lang="en">
<head>
<!-- Include jQuery, jQuery UI and Modernizr -->
<script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.4.js"></script>
<script src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.5/jquery-ui.js"></script>
<script src="http://cachedcommons.org/cache/modernizr/1.5.0/javascripts/modernizr.js"></script>

<link href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.5/themes/redmond/jquery-ui.css"
    rel="stylesheet" type="text/css" />
</head>
<body>

Date: <input type=date />

<script>
$(function() {
    // Check if the browser supports the date input type
    if (!Modernizr.inputtypes.date){
        // Add the jQuery UI DatePicker to all
        // input tags that have their type attributes
        // set to 'date'
        $('input[type=date]').datepicker({
            // specify the same format as the spec
            dateFormat: 'yy-mm-dd'
        });
    }
});
</script>

</body>
</html>
```

## Conclusion

Support for the Date Input, as is the same it seems with every aspect of HTML5, can be &ldquo;patched&rdquo; in older web browsers whilst maintaining future compatibility with modern browsers and future browsers to come. The current JavaScript frameworks (jQuery, jQuery UI, Modernizr, etc.) offer some real power to building applications and now the HTML5 specification offers a target to shoot for with those frameworks that offers unity across websites. Once you have enough &ldquo;patches&rdquo; built, like the one in this article, you could include them all in any HTML5 site to add support for older browsers. HTML5 is usable today and not just a dream about the future of web development.
