---
layout: post
title: "jQuery Basics: Is Element Hidden or Visible?"
date: 2015-09-24 06:33:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2015/09/24/JavaScript-Basics-Is-Element-Hidden-or-Visible
  - /post/2015/09/24/javascript-basics-is-element-hidden-or-visible
---
<!-- more -->
<p>A very common code snippet that's used a lot in various applications is the ability to detect if a specific element in the page is hidden or visible. jQuery provides some very useful functionality that allows for this to be easily determined; as well as making it easy to toggle the visibility of HTML elements on the page.</p>
<h3>Detect if Element is Visible</h3>
<p>Using a bit of CSS and the jQuery ".is" method makes it very easy to determine if the HTML element in the jQuery selector is either hidden or visible.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">// jQuery selector to get an element
var query = $('#elementId');

// check if element is Visible
var isVisible = query.is(':visible');

if (isVisible === true) {
   // element is Visible
} else {
  // element is Hidden
}</pre>
<h3>What is jQuery ".is" method?</h3>
<p>The jQuery ".is" method will check the current set of elements of the selector (see the 'query' variable in above code sample) against the specified CSS selector passed to the ".is" method. This method does not create a new jQuery object, but rather allows for the contents of a jQuery object to be tested without any modifications.</p>
<p>Full Documentation: <a href="http://api.jquery.com/is/" target="_blank">http://api.jquery.com/is/</a></p>
<h3>What is the ":visible" selector?</h3>
<p>The ":visible" selector will match an elements that are essentially Visible to the user within the page. This is determined by inspecting the elements to determine if they are taking up any visible space on the page; that is having a height or width greater than zero on the page.</p>
<p>Helpful Hint: If the CSS "display: none" is applied to the element, then ":visible" will evaluate to False.</p>
<p>Full Documentation: <a href="https://api.jquery.com/visible-selector/" target="_blank">https://api.jquery.com/visible-selector/</a></p>
<h3>Toggle Element Visibility</h3>
<p>On a related note, toggling element visibility can be done using the ".hide()" and ".show()" jQuery methods.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">// jQuery selector to get element(s)
var query = $('div.className');

// Hide all matching elements
query.hide();

// Display all matching elements
query.show();</pre>
