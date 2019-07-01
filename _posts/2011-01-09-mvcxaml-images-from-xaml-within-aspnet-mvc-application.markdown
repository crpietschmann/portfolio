---
layout: post
blogengineid: 2ae98273-f10c-46f1-9db1-c07dd646c16b
title: "MvcXaml - Images from XAML within ASP.NET MVC Application"
date: 2011-01-09 09:41:28 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["ASP.NET MVC"]
redirect_from: 
  - /post/2011/01/09/MvcXaml-Images-from-XAML-within-ASPNET-MVC-Application
  - /post/2011/01/09/mvcxaml-images-from-xaml-within-aspnet-mvc-application
  - /post.aspx?id=2ae98273-f10c-46f1-9db1-c07dd646c16b
---
<!-- more -->

It can be cumbersome using GDI+ to dynamically generate images based on data. I recently had to perform some dynamic image generation within an ASP.NET MVC application, and had the idea of using XAML to define what the image will look like. In a relatively short amount of time, including searching the web and looking at <a href="http://amazedsaint.blogspot.com/2010/07/xaml-meets-aspnet-mvc-create-databound.html">Anoop Madhusudanan’s example</a>, I successfully put together a proper ASP.NET MVC ViewEngine to perform this task.  
<a href="http://mvcxaml.codeplex.com">Download MvcXaml with Samples!</a>  
<a href="/images/postsMvcXamlScreenshot.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top: 0px; border-right: 0px; padding-top: 0px" title="MvcXamlScreenshot" border="0" alt="MvcXamlScreenshot" src="/images/postsMvcXamlScreenshot_thumb.png" width="304" height="304" /></a>  <h3>Basics of Usage</h3>  
After you register the MvcXaml.XamlImageViewEngine within the Global.asax of your application, you just add the XAML markup file to the Views folder in the same fashion as any other View and write your Controller’s Action methods as normal.  
Here’s an example Controller method using MvcXaml:  <pre class="csharpcode"><span class="kwrd">public</span> ActionResult Person(<span class="kwrd">int</span>? id)
{
    var model = GetPersonByID(id);

    <span class="kwrd">return</span> View(model);
}</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


As you can see, it’s identical to any other Controller Action. Nothing really different here.


Here’s an example Person.xaml View for this Action:

<pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">xmlns</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml/presentation&quot;</span>
        <span class="attr">xmlns:x</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;</span>
        <span class="attr">xmlns:d</span><span class="kwrd">=&quot;http://schemas.microsoft.com/expression/blend/2008&quot;</span>
        <span class="attr">xmlns:mc</span><span class="kwrd">=&quot;http://schemas.openxmlformats.org/markup-compatibility/2006&quot;</span>
        <span class="attr">Margin</span><span class="kwrd">=&quot;1&quot;</span> <span class="attr">Padding</span><span class="kwrd">=&quot;2&quot;</span> <span class="attr">Width</span><span class="kwrd">=&quot;300&quot;</span> <span class="attr">Height</span><span class="kwrd">=&quot;75&quot;</span>
        <span class="attr">mc:Ignorable</span><span class="kwrd">=&quot;d&quot;</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">Grid</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">Border</span> <span class="attr">BorderBrush</span><span class="kwrd">=&quot;Gray&quot;</span> <span class="attr">BorderThickness</span><span class="kwrd">=&quot;2&quot;</span>
                <span class="attr">CornerRadius</span><span class="kwrd">=&quot;5&quot;</span> <span class="attr">Padding</span><span class="kwrd">=&quot;4&quot;</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">Border.Background</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">LinearGradientBrush</span> <span class="attr">StartPoint</span><span class="kwrd">=&quot;0.5,0&quot;</span> <span class="attr">EndPoint</span><span class="kwrd">=&quot;0.5,1&quot;</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">LinearGradientBrush.GradientStops</span><span class="kwrd">></span>
                        <span class="kwrd"><</span><span class="html">GradientStopCollection</span><span class="kwrd">></span>
                            <span class="kwrd"><</span><span class="html">GradientStop</span> <span class="attr">Color</span><span class="kwrd">=&quot;White&quot;</span><span class="kwrd">></</span><span class="html">GradientStop</span><span class="kwrd">></span>
                            <span class="kwrd"><</span><span class="html">GradientStop</span> <span class="attr">Color</span><span class="kwrd">=&quot;LightGray&quot;</span> <span class="attr">Offset</span><span class="kwrd">=&quot;1&quot;</span><span class="kwrd">></</span><span class="html">GradientStop</span><span class="kwrd">></span>
                        <span class="kwrd"></</span><span class="html">GradientStopCollection</span><span class="kwrd">></span>
                    <span class="kwrd"></</span><span class="html">LinearGradientBrush.GradientStops</span><span class="kwrd">></span>
                <span class="kwrd"></</span><span class="html">LinearGradientBrush</span><span class="kwrd">></span>
            <span class="kwrd"></</span><span class="html">Border.Background</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">StackPanel</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">=&quot;Horizontal&quot;</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">FontWeight</span><span class="kwrd">=&quot;Bold&quot;</span> <span class="attr">FontSize</span><span class="kwrd">=&quot;15&quot;</span> <span class="attr">Text</span><span class="kwrd">=&quot;{Binding LastName}&quot;</span><span class="kwrd">/></span>
                    <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">FontWeight</span><span class="kwrd">=&quot;Bold&quot;</span> <span class="attr">FontSize</span><span class="kwrd">=&quot;15&quot;</span><span class="kwrd">></span>, <span class="kwrd"></</span><span class="html">TextBlock</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">FontWeight</span><span class="kwrd">=&quot;Bold&quot;</span> <span class="attr">FontSize</span><span class="kwrd">=&quot;15&quot;</span> <span class="attr">Text</span><span class="kwrd">=&quot;{Binding FirstName}&quot;</span><span class="kwrd">></</span><span class="html">TextBlock</span><span class="kwrd">></span>
                <span class="kwrd"></</span><span class="html">StackPanel</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">StackPanel</span> <span class="attr">Orientation</span><span class="kwrd">=&quot;Horizontal&quot;</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">TextBlock</span><span class="kwrd">></span>ID:<span class="kwrd"></</span><span class="html">TextBlock</span><span class="kwrd">></span>
                    <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">Text</span><span class="kwrd">=&quot;{Binding ID}&quot;</span><span class="kwrd">></</span><span class="html">TextBlock</span><span class="kwrd">></span>
                <span class="kwrd"></</span><span class="html">StackPanel</span><span class="kwrd">></span>
            <span class="kwrd"></</span><span class="html">StackPanel</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">Border</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">Grid</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


This is just normal XAML markup displaying some TextBlock’s and drawing a gradient background.


When used, this is how this example is rendered:


<a href="/images/postsMvcXamlPersonExample.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top: 0px; border-right: 0px; padding-top: 0px" title="MvcXamlPersonExample" border="0" alt="MvcXamlPersonExample" src="/images/postsMvcXamlPersonExample_thumb.png" width="240" height="60" /></a>

<h3>Conclusion</h3>


I had ease of use in mind for creating MvcXaml. Building it as a custom ViewEngine not only follows the proper pattern for generating different types of View in ASP.NET MVC, but it also allows it to be used just as any other View. The Controller doesn’t know if you are returning an ASP.NET Web Forms View or a XAML Image View, and keeps with proper separation of concerns.
