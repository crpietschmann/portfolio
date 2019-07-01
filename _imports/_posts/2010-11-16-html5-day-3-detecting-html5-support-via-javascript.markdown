---
layout: post
blogengineid: a74bb15d-fc92-4f33-9d43-c112b33857d9
title: "HTML5 Day 3: Detecting HTML5 Support via JavaScript"
date: 2010-11-16 09:19:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["HTML", "JavaScript"]
redirect_from: 
  - /post/2010/11/16/HTML5-Day-3-Detecting-HTML5-Support-via-JavaScript
  - /post/2010/11/16/html5-day-3-detecting-html5-support-via-javascript
  - /post.aspx?id=a74bb15d-fc92-4f33-9d43-c112b33857d9
---
<!-- more -->

On <a title="HTML5 Day 1: New tags work in older browsers? Awesome!" href="/post/2010/11/14/HTML5-Day-1-New-tags-work-in-older-browsers-Awesome.aspx">Day 1</a>, I covered exactly what HTML5 is and what&rsquo;s necessary to convince older web browsers to render/style the new tags properly. Once you told the browser how to style the element, it still wont show special UI for the user. The good news is that you can &ldquo;patch&rdquo; the browser using JavaScript to enable such functionality. In this post we&rsquo;ll discuss how to detect if a certain feature is supported by the browser or not.
<h3>Why is the UserAgent unreliable for detection?</h3>
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; ">Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64;
 Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729;
 .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E;
 InfoPath.3; MS-RTC LM 8; Zune 4.7) </pre>

You could always check the UserAgent of the request on the web server and return the necessary javascript accordingly, however, that would require a tremendous amount of work. You would need to figure out what HTML5 features are supported by each version of each web browser that a user might use. That would be a tremendous nightmare.

So the only reliable method is to use a little JavaScript code to do the detection on the client-side. This way you can check if each feature is supported before executing your &ldquo;patch&rdquo; code to add support.
<h3>Individual Attribute Detection</h3>

Lets take the following as an example:
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><input type="text" placeholder="enter value" /></pre>

One of the new features in HTML5 is the <a title="Dive into HTML5 - Placeholder Text" href="http://diveintohtml5.org/forms.html#placeholder">&ldquo;placeholder&rdquo; attribute on the <input> tag</a>. This attribute allows you to show some specified text (as a watermark) in the input box until the user enters a value.

Let&rsquo;s imagine we want to add our own &ldquo;placeholder&rdquo; functionality in older web browsers that do not natively support this feature using a JavaScript &ldquo;patch&rdquo;. Before we &ldquo;patch&rdquo; the browser, we must first detect whether this feature is already supported. To do this, we can use the following JavaScript code:
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">function IsAttributeSupported(tagName, attrName) {
    var val = false;
    // Create element
    var input = document.createElement(tagName);
    // Check if attribute (attrName)
    // attribute exists
    if (attrName in input) {
        val = true;
    }
    // Delete "input" variable to
    // clear up its resources
    delete input;
    // Return detected value
    return val;
}

if (!IsAttributeSupported("input", "placeholder")) {
    // Do something special here
    alert("placeholder attribute is not supported");
}</pre>

You can use the above code with any attributes you want to detect on any element, just change the &ldquo;input&rdquo; and &ldquo;placeholder&rdquo; within the method call accordingly.
<h3>Input Type Detection</h3>

There are a number of new input types added in HTML5. The good news is that older browsers will render any unknown types as type=&rdquo;text&rdquo;. A couple of the new types are:
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><input type="date" />
<input type="email" /></pre>

Let&rsquo;s imagine we want to add you own UI to allow the user to select the date from a date picker control and the email from a list of contacts in older browsers that do not support these features natively. First we must detect if the browser supports these input types. To do this, we can use the following JavaScript code:
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">funciton IsInputTypeSupported(typeName) {
    // Create element
    var input = document.createElement("input");
    // attempt to set the specified type
    input.setAttribute("type", typeName);
    // If the "type" property equals "text"
    // then that input type is not supported
    // by the browser
    var val = (input.type !== "text");
    // Delete "input" variable to
    // clear up its resources
    delete input;
    // Return the detected value
    return val;
}

if (!IsInputTypeSupported("date")) {
    // Do something special
    alert("date input is not supported");
}

if (!IsInputTypeSupported("email")) {
    // Do something special
    alert("email input is not supported");
}</pre>

Now you can execute your own &ldquo;patch&rdquo; in older browsers to add custom UI to these input fields.

While there are some exceptions in certain browsers, the above code will work for basic feature detection. One such exception is that the Chrome web browser supports the &ldquo;date&rdquo; input, but it doesn&rsquo;t show any special UI for the user. This is an example where you may want to still show you one UI, but the above detection script will report that &ldquo;date&rdquo; inputs are supported in Chrome.
<h3>Modernizr Detection Script</h3>

You could detect HTML5 features yourself using the previous JavaScript code, but that is probably like using your own JavaScript code to perform animations instead of using jQuery. The <a href="http://www.modernizr.com">Modernizr</a> script does for feature detection as jQuery has done for the HTML DOM itself.

Here&rsquo;s an example of using <a href="http://www.modernizr.com">Modernizr</a> to detect if the &ldquo;date&rdquo; input type is supported:
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">if (!Modernizr.inputtypes.date) {
    // Do something special
    alert("date input is not supported");
}</pre>

You can view the full <a href="http://www.modernizr.com/docs/">Modernizr documentation</a> for its full usage.
<h3>Additional Resources</h3>
<ul>
<li><a href="http://diveintohtml5.org/detect.html">Dive into HTML5: Detecting HTML5 Features</a></li>
<li><a href="http://html5doctor.com/how-to-use-html5-in-your-client-work-right-now/">HTML5 Doctor: How to use HTML5 in your client work right now</a></li>
</ul>
<h3>Conclusion</h3>

Just like most things with JavaScript, it&rsquo;s easy to perform basic feature detection. Although, you can get a lot of benefit of using a full framework to assist you in the process. Just as I use jQuery over custom HTML DOM code in most cases, I am liking the HTML5 detection support that Modernizr adds.

In tomorrows post I&rsquo;ll move on to adding some &ldquo;patch&rdquo; code to add some support for new features in old browsers now that feature detection is out of the way.
