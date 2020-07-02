---
layout: post
blogengineid: 9a32a5cb-01b0-42da-90b6-21747146d03d
title: "HTML5 Day 2: Upgrade ASP.NET MVC 2 Site Template to HTML5"
date: 2010-11-15 03:02:00 -0600
comments: true
published: true
categories: ["ASP.NET", "MVC", "HTML5"]
tags: ["ASP.NET MVC", "HTML"]
redirect_from: 
  - /post/2010/11/15/HTML5-Day-2-Upgrade-ASPNET-MVC-2-Site-Template-to-HTML5.aspx
  - /post/2010/11/15/HTML5-Day-2-Upgrade-ASPNET-MVC-2-Site-Template-to-HTML5
  - /post/2010/11/15/html5-day-2-upgrade-aspnet-mvc-2-site-template-to-html5
  - /post.aspx?id=9a32a5cb-01b0-42da-90b6-21747146d03d
---
<!-- more -->

Since HTML5 can be used in older browsers with some helper scripts, <a title="HTML5 Day 1: New tags work in older browser? Awesome!" href="/post/2010/11/14/HTML5-Day-1-New-tags-work-in-older-browsers-Awesome.aspx">as covered in Day 1</a>, I thought I&rsquo;d use what I&rsquo;ve learned to convert the default ASP.NET MVC 2 site template to HTML5.

## Convert Default ASP.NET MVC Site Template to HTML5

First, add the helper scripts, mentioned in Day 1, to the Site.Master and convert all magical DIVs over to &ldquo;header&rdquo;, &ldquo;section&rdquo;, &ldquo;nav&rdquo; and &ldquo;footer&rdquo; tags.

Don&rsquo;t worry about copy/paste, a download link for the full source code is at the bottom of the post.

Here&rsquo;s the resulting Site.Master pages contents:

```html
<%@ Master Language="C#" Inherits="System.Web.Mvc.ViewMasterPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Include HTML5 fix for older browsers -->
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- CSS to help older browsers render HTML5 - http://html5doctor.com/html-5-reset-stylesheet/ -->
    <link href="http://html5resetcss.googlecode.com/files/html5reset-1.6.1.css" rel="Stylesheet" type="text/css" />

    <title><asp:ContentPlaceHolder ID="TitleContent" runat="server" /></title>
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="logindisplay">
        <% Html.RenderPartial("LogOnUserControl"); %>
    </div>

    <header>
        <h1>My MVC HTML5 Application</h1>
    </header>

    <nav>
        <ul>
            <li><%: Html.ActionLink("Home", "Index", "Home")%></li>
            <li><%: Html.ActionLink("About", "About", "Home")%></li>
        </ul>
    </nav>

    <section>
        <asp:ContentPlaceHolder ID="MainContent" runat="server" />
    </section>

    <footer>
        Copyright &amp;copy; [Your Name Here]
    </footer>
</body>
</html>
```

Now the master page contains main &ldquo;header&rdquo;, &ldquo;section&rdquo;, &ldquo;nav&rdquo; and &ldquo;footer&rdquo; tags for the page.

The ContentPlaceHolder for rendering the Views is placed within a `<section>` tag. The reason for this is that now you only need to add a header and page content for the individual views. This compartmentalizes the page appropriately as per the design of the new elements being used.

Also, you&rsquo;ll notice that I eliminated the `<div class="page">` as the CSS for it can be added to the `<body>` tag and the page will still render appropriately.

Now the hard part, styling the page using CSS. Well, actually this wasn&rsquo;t too hard, since I mostly just changed the hard coded element id&rsquo;s over to reference the new locations. For example: &ldquo;#header&rdquo; became &ldquo;body header&rdquo;

Below are the CSS styles that I changed (not the entire file):

```css
/* PRIMARY LAYOUT ELEMENTS
----------------------------------------------------------*/

/* you can specify a greater or lesser percentage for the
page width. Or, you can specify an exact pixel width. */

body /* .page */
{
    width: 90%;
    margin-left: auto;
    margin-right: auto;
}

body header /* #header */
{
    position: relative;
    margin-bottom: 0px;
    color: #000;
    padding: 0;
    overflow: auto;
    float: left;
}

body header h1 /* #header h1 */
{
    font-weight: bold;
    padding: 5px 0;
    margin: 0;
    color: #fff;
    border: none;
    line-height: 2em;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 32px !important;
}

body section
{
    padding: 30px 30px 10px 30px;
    background-color: #fff;
    _height: 1px; /* only IE6 applies CSS properties starting with an underscore */
}

body footer /* #footer */
{
    color: #999;
    padding: 10px 0 25px 0;
    text-align: center;
    line-height: normal;
    margin: 0 0 30px 0;
    font-size: .9em;
    background-color: #fff;
}

/* TAB MENU
----------------------------------------------------------*/
body nav ul /* ul#menu */
{
    border-bottom: 1px #5C87B2 solid;
    padding: 0 0 2px;
    position: relative;
    margin: 0;
    text-align: right;
}

body nav ul li
{
    display: inline;
    list-style: none;
}

body nav ul li#greeting
{
    padding: 10px 20px;
    font-weight: bold;
    text-decoration: none;
    line-height: 2.8em;
    color: #fff;
}

body nav ul li a
{
    padding: 10px 20px;
    font-weight: bold;
    text-decoration: none;
    line-height: 2.8em;
    background-color: #e8eef4;
    color: #034af3;
}

body nav ul li a:hover
{
    background-color: #fff;
    text-decoration: none;
}

body nav ul li a:active
{
    background-color: #a6e2a6;
    text-decoration: none;
}

body nav ul li.selected a
{
    background-color: #fff;
    color: #000;
}

/* MISC  
----------------------------------------------------------*/
body nav /* #menucontainer */
{
    clear: both;
    width: 100%;
}
```

## Is HTML5 Fully Supported in ASP.NET MVC using this?

The short answer, &ldquo;No.&rdquo;

Using the above code, the page will render in older browsers. That is display correctly in most respects. If you want to use new HTML5 functionality, such as the new Input tags and validation, then you&rsquo;ll need to do a bit of patch work using additional JavaScript and matching CSS.

What I like is that I have a target spec to shoot for (HTML5) with the patch work of JavaScript (including jQuery plugins) and CSS. As long as I program the patches to fit the standard HTML5 spec, then I can just remove the associated JavaScript and CSS in a couple years and the app will still function as expected. At least that would be the case in an ideal world.

## MVC HTML5 Toolkit

The &ldquo;<a href="http://mvchtml5.codeplex.com/">MVC HTML5 Toolkit</a>&rdquo; project looks interesting, as its purpose is to bring HTML5 support to ASP.NET MVC.

Here&rsquo;s a <a href="http://www.deanhume.com/Home/BlogPost/asp-net-mvc-html5-toolkit/29">Getting Started Tutorial for the MVC HTML5 Toolkit</a> where you can learn more about it.
<h3>Conclusion</h3>

I started building my own extension methods for ASP.NET MVC to add support for the new HTML5 tags in an effort to familiarize myself with them. It usually doesn&rsquo;t make too much sense to duplicate effort, so I may submit some patches to the MVC HTML5 Toolkit in the future. That is of course if my &ldquo;HTML5 + ASP.NET MVC&rdquo; endeavors bring me to the point where I need/want more that the project has to offer.

However, I&rsquo;ll probably spend more play time looking at (and working with/on) jQuery plugins that will help add the functional aspects of HTML5 tags to older browsers. *(It feels somewhat odd calling the current generation of browsers &ldquo;older browsers,&rdquo; but after all they don&rsquo;t fully support HTML5.)*

Source Code: <a href="/files/MvcHTML5.zip" target="_self">MvcHTML5.zip</a>
