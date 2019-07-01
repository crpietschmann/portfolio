---
layout: post
blogengineid: 22671886-2906-4a2b-b184-5a4371785b1a
title: "HTML5 Day 6: New Range Input Type <input type=range />"
date: 2010-11-22 07:43:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["HTML", "JavaScript"]
redirect_from: 
  - /post/2010/11/22/HTML5-Day-6-New-Range-Input-Type-3cinput-type3drange-3e
  - /post/2010/11/22/html5-day-6-new-range-input-type-3cinput-type3drange-3e
  - /post.aspx?id=22671886-2906-4a2b-b184-5a4371785b1a
---
<!-- more -->

Some times a Range slider is the appropriate UI tool to allow a user to select a number within a given range. HTML5 adds such an element with it&rsquo;s <a href="http://www.w3.org/TR/html-markup/input.range.html">new &ldquo;range&rdquo; input type</a>.

<a href="/images/posts/HTML5_Day6_InputRange_Screenshot.png"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="HTML5_Day6_InputRange_Screenshot" src="/images/posts/HTML5_Day6_InputRange_Screenshot_thumb.png" alt="HTML5_Day6_InputRange_Screenshot" width="464" height="251" border="0" /></a>
<h3>Display in Modern Browsers</h3>

In the above screenshot shows an example of the <input type=range/> element as it is rendered in the Opera web browser.

Here&rsquo;s the code for the range input shown:
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><input type=range
    min=0
    max=100
    value=25
    step=5 /></pre>

This code defines a range input that allows the user to select value from 0 to 100 with increments of 5.

There are a couple new attributes added to the input element for the new &ldquo;range&rdquo; type. The definitions of these attributes are:
<ul>
<li>**min &ndash; **The expected lower bound for the element&rsquo;s value.</li>
<li>**max &ndash; **The expected upper bound for the element&rsquo;s value.</li>
<li>**step** &ndash;Specifies the value granularity of the element&rsquo;s value.</li>
</ul>

One thing to remember about these attributes is they are really just suggestions. You&rsquo;ll still want to validate the field on post back, as with any form field.
<h3>What about Older Browsers?</h3>

Just as with the <a href="/post/2010/11/18/HTML5-Day-5-New-Date-Input-Type.aspx">New Date Input type</a>, the Range Input will be rendered as a standard textbox in older browsers. This will allow users to still use the field to enter a number, but they will need to type in it&rsquo;s value. This may not be your desired input. To get a nice range slider to show in older browsers you can employ a little help from jQuery and jQuery UI.

The right side of the screenshot at the top of this post shows an example of the jQuery UI Slider being used to augment the <input type=range /> UI in older browsers (Firefox in this case) that do not natively support it.

Here&rsquo;s some fairly simple jQuery code that will loop through all <input type=range /> elements in the page and essentially convert them to jQuery UI Sliders.
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$(function(){
    // Check if browser supports <input type=range/>
    var i = document.createElement("input");
    i.setAttribute("type", "range");
    var rangeNotSupported = (i.type === "text");
    delete i;

    // If browser doesn't support <input type=range/>
    // then use jQuery UI to display them
    if(rangeNotSupported) {
        // loop through all <input type=range/>
        // on the page
        $("input[type=range]").each(function(){
            var range = $(this);
            
            // Create <div/> to hold jQuery UI Slider
            var sliderDiv = $("<div/>");
            sliderDiv.width(range.width());
            
            // Insert jQuery UI Slider where the
            // <input type=range/> is located
            range.after(
                sliderDiv.slider({
                    // Set values that are set declaratively
                    // in the <input type=range/> element
                    min: parseFloat(range.attr("min")),
                    max: parseFloat(range.attr("max")),
                    value: parseFloat(range.val()),
                    step: parseFloat(range.attr("step")),
                    // Update the <input type=range/> when
                    // value of slider changes
                    slide: function(evt, ui) {
                        range.val(ui.value);
                    },
                    change: function(evt, ui) {
                        // set <input type=range/> value
                        range.val(ui.value);
                    }
                })
            ).
            // Hide <input type=range/> from display
            hide();
        });
    }
});</pre>

I believe I have commented the above code well enough to make it self explanatory. If you have any questions, feel free to leave a comment or consult the <a href="http://docs.jquery.com/">jQuery</a> and /or <a href="http://jqueryui.com">jQuery UI</a> documentation.
<h3>Additional Resources</h3>
<ul>
<li><a href="http://www.w3.org/TR/html-markup/input.range.html">HTML5: input type=range &ndash; imprecise number-input control (NEW)</a></li>
<li><a href="http://www.w3schools.com/html5/html5_form_input_types.asp">W3Schools: HTML5 New Input Types</a></li>
<li><a href="http://jqueryui.com/demos/slider/">jQuery UI Slider</a></li>
</ul>
<h3>Conclusion</h3>

The new functionality added with HTML5 are all much needed additions to building web applications with HTML. Fortunately, you can add support for those features to older web browsers with a little help from some of the modern JavaScript frameworks, like jQuery. Don&rsquo;t let older web browsers hold you back from using HTML5.

Oh, BTW, this code works in Internet Explorer, Firefox, Opera, Chrome and Safari!
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:8fd12086-e81c-4783-99a5-9104822a0797" class="wlWriterEditableSmartContent" style="margin: 0px; display: inline; float: none; padding: 0px;">
<div>Full Source:<a href="/file.axd?file=HTML5_Day6_Input_Range_1.zip" target="_self">HTML5_Day6_Input_Range.zip</a></div>
</div>
