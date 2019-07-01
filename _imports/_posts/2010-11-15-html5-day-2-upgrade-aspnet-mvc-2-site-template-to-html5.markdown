  ---
  layout: post
  title: "HTML5 Day 2: Upgrade ASP.NET MVC 2 Site Template to HTML5"
  date: 2010-11-15 03:02:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["ASP.NET MVC", "HTML"]
  alias: ["/post/2010/11/15/HTML5-Day-2-Upgrade-ASPNET-MVC-2-Site-Template-to-HTML5", "/post/2010/11/15/html5-day-2-upgrade-aspnet-mvc-2-site-template-to-html5"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>Since HTML5 can be used in older browsers with some helper scripts, <a title="HTML5 Day 1: New tags work in older browser? Awesome!" href="http://pietschsoft.com/post/2010/11/14/HTML5-Day-1-New-tags-work-in-older-browsers-Awesome.aspx">as covered in Day 1</a>, I thought I&rsquo;d use what I&rsquo;ve learned to convert the default ASP.NET MVC 2 site template to HTML5.</p>
<h3>Convert Default ASP.NET MVC Site Template to HTML5</h3>
<p>First, add the helper scripts, mentioned in Day 1, to the Site.Master and convert all magical DIVs over to &ldquo;header&rdquo;, &ldquo;section&rdquo;, &ldquo;nav&rdquo; and &ldquo;footer&rdquo; tags.</p>
<p>Don&rsquo;t worry about copy/paste, a download link for the full source code is at the bottom of the post.</p>
<p>Here&rsquo;s the resulting Site.Master pages contents:</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;%@ Master Language="C#" Inherits="System.Web.Mvc.ViewMasterPage" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head runat="server"&gt;
    &lt;!-- Include HTML5 fix for older browsers --&gt;
    &lt;!--[if lt IE 9]&gt;
    &lt;script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"&gt;&lt;/script&gt;
    &lt;![endif]--&gt;
    &lt;!-- CSS to help older browsers render HTML5 - http://html5doctor.com/html-5-reset-stylesheet/ --&gt;
    &lt;link href="http://html5resetcss.googlecode.com/files/html5reset-1.6.1.css" rel="Stylesheet" type="text/css" /&gt;

    &lt;title&gt;&lt;asp:ContentPlaceHolder ID="TitleContent" runat="server" /&gt;&lt;/title&gt;
    &lt;link href="../../Content/Site.css" rel="stylesheet" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div id="logindisplay"&gt;
        &lt;% Html.RenderPartial("LogOnUserControl"); %&gt;
    &lt;/div&gt;

    &lt;header&gt;
        &lt;h1&gt;My MVC HTML5 Application&lt;/h1&gt;
    &lt;/header&gt;

    &lt;nav&gt;
        &lt;ul&gt;              
            &lt;li&gt;&lt;%: Html.ActionLink("Home", "Index", "Home")%&gt;&lt;/li&gt;
            &lt;li&gt;&lt;%: Html.ActionLink("About", "About", "Home")%&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/nav&gt;

    &lt;section&gt;
        &lt;asp:ContentPlaceHolder ID="MainContent" runat="server" /&gt;
    &lt;/section&gt;

    &lt;footer&gt;
        Copyright &amp;copy; [Your Name Here]
    &lt;/footer&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
<p>Now the master page contains main &ldquo;header&rdquo;, &ldquo;section&rdquo;, &ldquo;nav&rdquo; and &ldquo;footer&rdquo; tags for the page.</p>
<p>The ContentPlaceHolder for rendering the Views is placed within a &ldquo;&lt;section&gt;&rdquo; tag. The reason for this is that now you only need to add a header and page content for the individual views. This compartmentalizes the page appropriately as per the design of the new elements being used.</p>
<p>Also, you&rsquo;ll notice that I eliminated the &lt;div class=&rdquo;page&rdquo;&gt; as the CSS for it can be added to the &lt;body&gt; tag and the page will still render appropriately.</p>
<p>Now the hard part, styling the page using CSS. Well, actually this wasn&rsquo;t too hard, since I mostly just changed the hard coded element id&rsquo;s over to reference the new locations. For example: &ldquo;#header&rdquo; became &ldquo;body header&rdquo;</p>
<p>Below are the CSS styles that I changed (not the entire file):</p>
<pre class="brush: css; first-line: 1; tab-size: 4; toolbar: false; ">/* PRIMARY LAYOUT ELEMENTS   
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
}</pre>
<h3>Is HTML5 Fully Supported in ASP.NET MVC using this?</h3>
<p>The short answer, &ldquo;No.&rdquo;</p>
<p>Using the above code, the page will render in older browsers. That is display correctly in most respects. If you want to use new HTML5 functionality, such as the new Input tags and validation, then you&rsquo;ll need to do a bit of patch work using additional JavaScript and matching CSS.</p>
<p>What I like is that I have a target spec to shoot for (HTML5) with the patch work of JavaScript (including jQuery plugins) and CSS. As long as I program the patches to fit the standard HTML5 spec, then I can just remove the associated JavaScript and CSS in a couple years and the app will still function as expected. At least that would be the case in an ideal world.</p>
<h3>MVC HTML5 Toolkit</h3>
<p>The &ldquo;<a href="http://mvchtml5.codeplex.com/">MVC HTML5 Toolkit</a>&rdquo; project looks interesting, as its purpose is to bring HTML5 support to ASP.NET MVC.</p>
<p>Here&rsquo;s a <a href="http://www.deanhume.com/Home/BlogPost/asp-net-mvc-html5-toolkit/29">Getting Started Tutorial for the MVC HTML5 Toolkit</a> where you can learn more about it.</p>
<h3>Conclusion</h3>
<p>I started building my own extension methods for ASP.NET MVC to add support for the new HTML5 tags in an effort to familiarize myself with them. It usually doesn&rsquo;t make too much sense to duplicate effort, so I may submit some patches to the MVC HTML5 Toolkit in the future. That is of course if my &ldquo;HTML5 + ASP.NET MVC&rdquo; endeavors bring me to the point where I need/want more that the project has to offer.</p>
<p>However, I&rsquo;ll probably spend more play time looking at (and working with/on) jQuery plugins that will help add the functional aspects of HTML5 tags to older browsers. <em>(It feels somewhat odd calling the current generation of browsers &ldquo;older browsers,&rdquo; but after all they don&rsquo;t fully support HTML5.)</em></p>
<div id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:ff548906-7d70-4179-8b99-397af3ebb620" class="wlWriterEditableSmartContent" style="margin: 0px; display: inline; float: none; padding: 0px;">
<div>Source Code:<a href="http://pietschsoft.com/file.axd?file=MvcHTML5.zip" target="_self">MvcHTML5.zip</a></div>
</div>
