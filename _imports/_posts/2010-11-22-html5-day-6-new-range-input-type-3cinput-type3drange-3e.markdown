  ---
  layout: post
  title: "HTML5 Day 6: New Range Input Type <input type=range />"
  date: 2010-11-22 07:43:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["HTML", "JavaScript"]
  alias: ["/post/2010/11/22/HTML5-Day-6-New-Range-Input-Type-3cinput-type3drange-3e", "/post/2010/11/22/html5-day-6-new-range-input-type-3cinput-type3drange-3e"]
  ---
<!-- more -->
<p>Some times a Range slider is the appropriate UI tool to allow a user to select a number within a given range. HTML5 adds such an element with it&rsquo;s <a href="http://www.w3.org/TR/html-markup/input.range.html">new &ldquo;range&rdquo; input type</a>.</p>
<p><a href="http://pietschsoft.com/image.axd?picture=HTML5_Day6_InputRange_Screenshot.png"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="HTML5_Day6_InputRange_Screenshot" src="http://pietschsoft.com/image.axd?picture=HTML5_Day6_InputRange_Screenshot_thumb.png" alt="HTML5_Day6_InputRange_Screenshot" width="464" height="251" border="0" /></a></p>
<h3>Display in Modern Browsers</h3>
<p>In the above screenshot shows an example of the &lt;input type=range/&gt; element as it is rendered in the Opera web browser.</p>
<p>Here&rsquo;s the code for the range input shown:</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;input type=range
    min=0
    max=100
    value=25
    step=5 /&gt;</pre>
<p>This code defines a range input that allows the user to select value from 0 to 100 with increments of 5.</p>
<p>There are a couple new attributes added to the input element for the new &ldquo;range&rdquo; type. The definitions of these attributes are:</p>
<ul>
<li><strong>min &ndash; </strong>The expected lower bound for the element&rsquo;s value.</li>
<li><strong>max &ndash; </strong>The expected upper bound for the element&rsquo;s value.</li>
<li><strong>step</strong> &ndash;Specifies the value granularity of the element&rsquo;s value.</li>
</ul>
<p>One thing to remember about these attributes is they are really just suggestions. You&rsquo;ll still want to validate the field on post back, as with any form field.</p>
<h3>What about Older Browsers?</h3>
<p>Just as with the <a href="http://pietschsoft.com/post/2010/11/18/HTML5-Day-5-New-Date-Input-Type.aspx">New Date Input type</a>, the Range Input will be rendered as a standard textbox in older browsers. This will allow users to still use the field to enter a number, but they will need to type in it&rsquo;s value. This may not be your desired input. To get a nice range slider to show in older browsers you can employ a little help from jQuery and jQuery UI.</p>
<p>The right side of the screenshot at the top of this post shows an example of the jQuery UI Slider being used to augment the &lt;input type=range /&gt; UI in older browsers (Firefox in this case) that do not natively support it.</p>
<p>Here&rsquo;s some fairly simple jQuery code that will loop through all &lt;input type=range /&gt; elements in the page and essentially convert them to jQuery UI Sliders.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$(function(){
    // Check if browser supports &lt;input type=range/&gt;
    var i = document.createElement("input");
    i.setAttribute("type", "range");
    var rangeNotSupported = (i.type === "text");
    delete i;

    // If browser doesn't support &lt;input type=range/&gt;
    // then use jQuery UI to display them
    if(rangeNotSupported) {
        // loop through all &lt;input type=range/&gt;
        // on the page
        $("input[type=range]").each(function(){
            var range = $(this);
            
            // Create &lt;div/&gt; to hold jQuery UI Slider
            var sliderDiv = $("&lt;div/&gt;");
            sliderDiv.width(range.width());
            
            // Insert jQuery UI Slider where the
            // &lt;input type=range/&gt; is located
            range.after(
                sliderDiv.slider({
                    // Set values that are set declaratively
                    // in the &lt;input type=range/&gt; element
                    min: parseFloat(range.attr("min")),
                    max: parseFloat(range.attr("max")),
                    value: parseFloat(range.val()),
                    step: parseFloat(range.attr("step")),
                    // Update the &lt;input type=range/&gt; when
                    // value of slider changes
                    slide: function(evt, ui) {
                        range.val(ui.value);
                    },
                    change: function(evt, ui) {
                        // set &lt;input type=range/&gt; value
                        range.val(ui.value);
                    }
                })
            ).
            // Hide &lt;input type=range/&gt; from display
            hide();
        });
    }
});</pre>
<p>I believe I have commented the above code well enough to make it self explanatory. If you have any questions, feel free to leave a comment or consult the <a href="http://docs.jquery.com/">jQuery</a> and /or <a href="http://jqueryui.com">jQuery UI</a> documentation.</p>
<h3>Additional Resources</h3>
<ul>
<li><a href="http://www.w3.org/TR/html-markup/input.range.html">HTML5: input type=range &ndash; imprecise number-input control (NEW)</a></li>
<li><a href="http://www.w3schools.com/html5/html5_form_input_types.asp">W3Schools: HTML5 New Input Types</a></li>
<li><a href="http://jqueryui.com/demos/slider/">jQuery UI Slider</a></li>
</ul>
<h3>Conclusion</h3>
<p>The new functionality added with HTML5 are all much needed additions to building web applications with HTML. Fortunately, you can add support for those features to older web browsers with a little help from some of the modern JavaScript frameworks, like jQuery. Don&rsquo;t let older web browsers hold you back from using HTML5.</p>
<p>Oh, BTW, this code works in Internet Explorer, Firefox, Opera, Chrome and Safari!</p>
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:8fd12086-e81c-4783-99a5-9104822a0797" class="wlWriterEditableSmartContent" style="margin: 0px; display: inline; float: none; padding: 0px;">
<div>Full Source:<a href="http://pietschsoft.com/file.axd?file=HTML5_Day6_Input_Range_1.zip" target="_self">HTML5_Day6_Input_Range.zip</a></div>
</div>
