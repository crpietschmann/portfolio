---
layout: post
blogengineid: 004257a6-6fc4-4635-b5e1-a79b87b8cea6
title: "HTML5 Day 4: Add Drop Down Menu to ASP.NET MVC HTML5 Template using CSS and jQuery"
date: 2010-11-17 11:32:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["ASP.NET MVC", "HTML", "JavaScript"]
redirect_from: 
  - /post/2010/11/17/HTML5-Day-4-Add-DropDown-Menu-ASPNET-MVC-HTML5-Template-using-CSS-and-jQuery
  - /post/2010/11/17/html5-day-4-add-dropdown-menu-aspnet-mvc-html5-template-using-css-and-jquery
  - /post.aspx?id=004257a6-6fc4-4635-b5e1-a79b87b8cea6
---
<!-- more -->

Today I was playing around with using jQuery to create a drop down menu. I thought I&rsquo;d share an example of adding a drop down menu to the <a title="HTML5 Day 2: Upgrade ASP.NET MVC 2 Site Template to HTML5" href="/post/2010/11/15/HTML5-Day-2-Upgrade-ASPNET-MVC-2-Site-Template-to-HTML5.aspx">new ASP.NET MVC HTML5 Template that I created on Day 2</a>.

Before we begin, you&rsquo;ll need to create a new site using the code from Day 2. You can either copy/paste the code from the article, or download the full source code. You&rsquo;ll find the download link at the bottom of the post for Day 2.

Here&rsquo;s a screenshot of the finished dropdown menu:

<a href="/files/ASPNETMVCHTML5DropDownMenu_IE8.jpg"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="ASPNETMVCHTML5DropDownMenu_IE8" src="/files/ASPNETMVCHTML5DropDownMenu_IE8_thumb.jpg" alt="ASPNETMVCHTML5DropDownMenu_IE8" width="504" height="323" border="0" /></a>

Here&rsquo;s another screenshot of the menu in Chrome:

<a href="/files/ASPNETMVCHTML5DropDownMenu_Chrome.jpg"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="ASPNETMVCHTML5DropDownMenu_Chrome" src="/files/ASPNETMVCHTML5DropDownMenu_Chrome_thumb.jpg" alt="ASPNETMVCHTML5DropDownMenu_Chrome" width="244" height="156" border="0" /></a>
<h3>Add Sub-Menu Items</h3>

First, modify the <nav> item in the Site.Master file to include sub-menu items as <ul> child elements added to the &ldquo;nav ul&rdquo; element. Below is an example:
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; "><nav>
    <ul>
        <li><%: Html.ActionLink("Home", "Index", "Home")%></li>
        <li>
            <a href="#">Customers</a>
            <ul>
                <li><a href="#">Create New</a></li>
                <li><a href="#">Latest</a></li>
                <li><a href="#">View All</a></li>
            </ul>
        </li>
        <li>
            <a href="#">Orders</a>
            <ul>
                <li><a href="#">Create New</a></li>
                <li><a href="#">Latest: Last 30 Days</a></li>
                <li><a href="#">Search: Date Range</a></li>
                <li><a href="#">Search: Customer</a></li>
                <li><a href="#">View All</a></li>
            </ul>
        </li>
        <li><%: Html.ActionLink("About", "About", "Home")%></li>
    </ul>
</nav></pre>

Of course don&rsquo;t forget to replace the &ldquo;<a href&rdquo; tags with &ldquo;Html.ActionLink&rdquo; calls to wire up the Views in your application. For this article, we&rsquo;ll just leave the code like this.
<h3>Add CSS Styles to the Sub-Menus</h3>

We do not need to modify the styles in the &ldquo;Site.css&rdquo; file for this. We just need to add some CSS to style the sub-menus appropriately.

Here&rsquo;s the minimum styles necessary for the sub-menu to display correctly:
<pre class="brush: css; first-line: 1; tab-size: 4; toolbar: false; ">body nav ul ul {
    display: none;
    position:absolute;
}</pre>

Even though the above style will make the sub-menus display correctly (hide on page load, and absolutely positioned), we still need to style them to match the overall style of the ASP.NET MVC site template.

Here&rsquo;s the full CSS necessary to style the sub-menus in the new ASP.NET MVC HTML5 Template:
<pre class="brush: css; first-line: 1; tab-size: 4; toolbar: false; ">body nav ul ul {
    display: none;
    position:absolute;
    width: 100%;
    
    background: #5C87B2;
    border-top: 5px solid #5C87B2;;
    filter:alpha(opacity=80);
    -moz-opacity:0.8;
    -khtml-opacity: 0.8;
    opacity: 0.8;
}
body nav ul ul li a{
    line-height: 3.1em;
}</pre>

This CSS colors the background of the sub-menu area the same color blue as the page, but it also makes it semi-transparent. So any content behind the sub-menu will show through just a little bit.
<h3>Let&rsquo;s wire things up with jQuery</h3>

Now we just need a little jQuery code to wire up our sub-menus to display when the use hovers the mouse over their parents. The jQuery code I&rsquo;m using for this was inspired by Dan Wellman&rsquo;s &ldquo;<a href="http://net.tutsplus.com/tutorials/html-css-techniques/how-to-create-a-drop-down-nav-menu-with-html5-css3-and-jquery/">How to Create a Drop-down Nav Menu with HTML5, CSS3 and jQuery</a>&rdquo; post.
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$(function () {
    $("body nav li").each(function () {
        if ($(this).find("ul").length > 0) {

            //show subnav on hover  
            $(this).mouseenter(function () {
                $(this).find("ul").stop(true, true).slideDown();
            });

            //hide submenus on exit  
            $(this).mouseleave(function () {
                $(this).find("ul").stop(true, true).slideUp();
            });

            $(this).find("ul").mousemove(function () {
                $(this).stop(true, true).show();
            });
        }
    });
});</pre>

As you can see, with jQuery the javascript code necessary to wire this up is rather short. Oh, and did I mention that the sub-menus slide down into place?
<h3>Conclusion</h3>

I know this post isn&rsquo;t so much HTML5 as it is jQuery and CSS. But, after all, isn&rsquo;t HTML5 really about the same thing as jQuery? RIA.

I know, <a title="HTML5 Day 3: Detecting HTML5 Support via JavaScript" href="/post/2010/11/16/HTML5-Day-3-Detecting-HTML5-Support-via-JavaScript.aspx">yesterday</a>, I said that today I would move on to adding some &ldquo;patch&rdquo; code to add some HTML5 support to older browsers. I decided to take a detour back to the ASP.NET MVC HTML5 template. We shall see, again, where tomorrow takes us.
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:c0edff3b-c8c4-4f8c-9e45-bccf338894f9" class="wlWriterEditableSmartContent" style="margin: 0px; display: inline; float: none; padding: 0px;">
<div>Source Code:<a href="/files/MvcHTML5DropDownMenu_1.zip" target="_self">MvcHTML5DropDownMenu.zip</a></div>
</div>
