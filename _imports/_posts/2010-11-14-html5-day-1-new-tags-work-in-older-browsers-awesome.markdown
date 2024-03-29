---
layout: post
blogengineid: 82a3b9b6-8165-4b91-adce-4c613c95c068
title: "HTML5 Day 1: New tags work in older browsers? Awesome!"
date: 2010-11-14 14:51:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["HTML"]
redirect_from: 
  - /post/2010/11/14/HTML5-Day-1-New-tags-work-in-older-browsers-Awesome
  - /post/2010/11/14/html5-day-1-new-tags-work-in-older-browsers-awesome
  - /post.aspx?id=82a3b9b6-8165-4b91-adce-4c613c95c068
---
<!-- more -->

I recently decided to really dig into HTML5 to see what it&rsquo;s all about. After all, the web (err... <a title="Ted Stevens: Series of Tubes" href="http://www.youtube.com/watch?v=f99PcP0aFNE">tubes</a>) is full of talk about how the new HTML5 Canvas element will bring an end to both Silverlight and Flash. In reality HTML5 is much more than just the Canvas element. In fact, HTML5 brings with it a large list of enhancements, including 28 new elements and form controls that do client-side data validation for you!
<h3>Specification Doc or Book?</h3>

Instead of reading the enormous HTML5 Specifications, I decided to purchase a book that would sum things up much more nicely. Below is the book:

<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; float: left; padding-top: 0px; border-width: 0px;" title="IntoHtml5SharpLawson" src="/files/IntoHtml5SharpLawson.jpg" alt="IntoHtml5SharpLawson" width="48" height="61" align="left" border="0" />*<a href="http://amzn.to/2acBCG7" target="_blank">Introducing HTML5</a> 
by Bruce Lawson and Remy Sharp*

This book is relatively short at 223 pages and sums everything up very nicely. I&rsquo;m not finished with the book yet, as I&rsquo;m playing around with things more rather than reading cover to cover.

I know there are other resources available online (for free), but nothing beats a good book to get you up to speed with a new technology.
<h3>HTML5 Design Principles</h3>

There are a number of <a title="HTML Design Principles" href="http://www.w3.org/TR/html-design-principles/" target="_blank">guiding principles that are being used to design HTML5</a>. In my opinion, the two most important principles are:

**Degrade Gracefully 
***&rdquo;On the World Wide Web, authors are often reluctant to use new language features that cause problems in older user agents, or that do not provide some sort of graceful fallback. HTML 5 document conformance requirements should be designed so that Web content can degrade gracefully in older or less capable user agents, even when making use of new elements, attributes, APIs and content models.&ldquo;*

The specifies that when designing HTML5 it must be done in a way that allows older browsers to gracefully handle rendering HTML5 code to the best of their ability, even though they may not know what certain tags are.

For example, this is what allows you to use the new &ldquo;email&rdquo; or &ldquo;date&rdquo; Input elements, and they end up being rendered as a standard <input type=&rsquo;text&rsquo;/> element in older browsers.
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">basically <input type="email"/> render as <input type="text"/> and
<article></article> and <section></section> render as <span></span></pre>

**Do not Reinvent the Wheel 
***&ldquo;If there is already a widely used and implemented technology covering particular use cases, consider specifying that technology in preference to inventing something new for the same purpose.&rdquo;*

This means that certain existing functionality that web browsers already support, but weren&rsquo;t part of HTML previously, will now be part of HTML5.

One very important feature is the <a href="http://en.wikipedia.org/wiki/XMLHttpRequest" target="_blank">XMLHttpRequest</a> (XHR). You know the object that powers all Ajax calls! XHR was first added by Microsoft to Internet Explorer 5 and support for it has since been added to all web browsers. Even though it was never part of the HTML specification, we all use it. Now with HTML5, it is specified as an object to be used from JavaScript code.

There are other factors that make it possible to use other HTML5 features, even though older web browsers do not natively support them. This is what I&rsquo;ll cover next.
<h3>Using HTML5 in Older Browsers</h3>

Even though some of the newer tags in HTML5 will automatically degrade when rendered in order browsers. It would still be nice to fully support those features in older web browsers so that you can start using HTML5 today without worry about it not working if someone is using Internet Explorer 7 or Firefox 3. The good news is you can do just that!

Using the following two tips you can enable the rendering of most of the new HTML5 elements within older web browsers. Some elements, such as the new &ldquo;date&rdquo; element, will require further scripting, but this will get you pages to display correctly across new and older browsers alike.

**HTML5 Enabling Script 
**The <a href="http://code.google.com/p/html5shim/" target="_blank">html5shiv script by Remy Sharp</a> enables all the new HTML5 elements within Internet Explorer versions older than Internet Explorer 9.

To use this script, just place the following markup within the pages <head> tag:
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--></pre>

This is a conditional comment that tells Internet Explorer version older than version 9 to include the html5shiv script. Firefox and other browsers will correctly ignore this script include since they don&rsquo;t require it in order to render the HTML5 elements.

Here&rsquo;s an article by John Resig that explains how this script works: <a title="http://ejohn.org/blog/html5-shiv/" href="http://ejohn.org/blog/html5-shiv/">http://ejohn.org/blog/html5-shiv/</a>

**HTML5 Reset Stylesheet 
**Even though the older web browsers don&rsquo;t natively know how to style the new HTML5 elements, you can include a simple stylesheet in your pages that will tell it how.
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><link href="http://html5resetcss.googlecode.com/files/html5reset-1.6.1.css"
    rel="Stylesheet"
    type="text/css" /></pre>

Just add the above stylesheet link to your pages before you include your own CSS stylesheets and it will explicitly tell the web browser how to render each of the HTML5 elements.

You can find a little more information about this stylesheet here: 
<a title="http://code.google.com/p/html5resetcss/" href="http://code.google.com/p/html5resetcss/">http://code.google.com/p/html5resetcss/</a> 
and here: 
<a title="http://html5doctor.com/html-5-reset-stylesheet/" href="http://html5doctor.com/html-5-reset-stylesheet/">http://html5doctor.com/html-5-reset-stylesheet/</a>
<h3>Additional Resources</h3>

I really recommend the book &ldquo;Introduction HTML5&rdquo; by Bruce Lawson and Remy Sharp.

If you are looking for additional resources on HTML5, then you should find the following links useful:
<ul>
<li><a href="http://dev.w3.org/html5/spec/" target="_blank">HTML5 &ndash; W3C Working Draft 9 November 2010</a></li>
<li><a title="http://html5doctor.com/" href="http://html5doctor.com/">http://html5doctor.com/</a></li>
</ul>
<h3>Conclusion</h3>

I&rsquo;m really liking the new additions to HTML5, and it&rsquo;s awesome that you can still use them in older browsers with only a little help.

I plan on continuing this series for a little while, and will post links to subsequent articles below as they are posted.
<ul>
<li><a href="/post/2010/11/15/HTML5-Day-2-Upgrade-ASPNET-MVC-2-Site-Template-to-HTML5.aspx">Day 2: Upgrade ASP.NET MVC 2 Site Template to HTML5</a></li>
<li><a href="/post/2010/11/16/HTML5-Day-3-Detecting-HTML5-Support-via-JavaScript.aspx">Day 3: Detecting HTML5 Support via JavaScript</a></li>
<li><a href="/post/2010/11/17/HTML5-Day-4-Add-DropDown-Menu-ASPNET-MVC-HTML5-Template-using-CSS-and-jQuery.aspx">Day 4: Add Drop Down Menu to ASP.NET MVC HTML5 Template using CSS and jQuery</a></li>
<li><a href="/post/2010/11/18/HTML5-Day-5-New-Date-Input-Type.aspx">Day 5: New Date Input Type <input type=date /></a></li>
<li><a href="/post/2010/11/22/HTML5-Day-6-New-Range-Input-Type-3cinput-type3drange-3e.aspx">Day 6: New Range Input Type <input type=range /></a></li>
</ul>
