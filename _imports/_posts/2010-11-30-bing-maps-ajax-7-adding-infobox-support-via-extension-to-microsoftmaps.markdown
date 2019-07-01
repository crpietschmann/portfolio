---
layout: post
blogengineid: d3b3b88e-6d1f-4f8b-86fd-c74ba908eb5e
title: "Bing Maps Ajax 7: Adding InfoBox Support via Extension to Microsoft.Maps"
date: 2010-11-30 11:54:48 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2010/11/30/Bing-Maps-Ajax-7-Adding-InfoBox-Support-via-Extension-to-MicrosoftMaps
  - /post/2010/11/30/bing-maps-ajax-7-adding-infobox-support-via-extension-to-microsoftmaps
  - /post.aspx?id=d3b3b88e-6d1f-4f8b-86fd-c74ba908eb5e
---
<!-- more -->

The new Bing Maps Ajax v7 control may be faster and smaller, but it is pretty light on features at the moment compared to its older brother; the v6.3 control. One of the features missing is support for showing InfoBox’s. Its simple to handle mouse events and display a &lt;div&gt; next to the pushpin, but I thought I’d take a little time to write a simple InfoBox extension to the new Microsoft.Maps namespace.  
Here’s a screenshot of it in action:  
<a href="/images/postsBingMaps7_InfoBox_Screenshot.png"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="BingMaps7_InfoBox_Screenshot" border="0" alt="BingMaps7_InfoBox_Screenshot" src="/images/postsBingMaps7_InfoBox_Screenshot_thumb.png" width="304" height="276" /></a>  <h3>Usage</h3>  
Let’s start with some sample usage of the InfoBox extension.  <pre class="csharpcode"><span class="rem">// Create Pushpin</span>
<span class="kwrd">var</span> pushpin = <span class="kwrd">new</span> Microsoft.Maps.Pushpin(
    <span class="kwrd">new</span> Microsoft.Maps.Location(0,0)
);

<span class="rem">// Create InfoBox</span>
<span class="kwrd">var</span> infobox = Microsoft.Maps.Ext.InfoBox(
    <span class="str">&quot;Title&quot;</span>, <span class="rem">/* &lt;-- InfoBox Title to display */</span>
    <span class="str">&quot;Description&quot;</span>, <span class="rem">/* &lt;-- InfoBox Description to display */</span>
    map <span class="rem">/* &lt;-- A refernce to the Map where the InfoBox will be displayed */</span>
);

<span class="rem">// Add InfoBox to Pushpin</span>
pushpin.setInfoBox(infobox);

<span class="rem">// Add Pushpin to Map</span>
map.entities.push(pushpin);</pre>
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


Usage of the “Microsoft.Maps.Ext.InfoBox” object is fairly simple. After creating the InfoBox object, you assign it to the Pushpin via the “setInfoBox” method that is also an extension that has been added.

<h3>CSS</h3>


There is a small bit of CSS code needed to style the InfoBox appropriately.


Here’s some sample HTML that is similar to what the InfoBox extension adds to the page for the InfoBox’s:

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">div</span> <span class="attr">class</span><span class="kwrd">=&quot;infobox&quot;</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">h4</span><span class="kwrd">&gt;</span>Title<span class="kwrd">&lt;/</span><span class="html">h4</span><span class="kwrd">&gt;</span>
Description
<span class="kwrd">&lt;/</span><span class="html">div</span><span class="kwrd">&gt;</span></pre>
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


The &lt;div&gt; element is given the CSS class of “infobox”. You use this class name to add CSS to your application to style the InfoBox’s as desired.


Here’s some sample CSS to give the InfoBox a style similar to the Bing Maps v6.x InfoBox’s:

<pre class="csharpcode"><span class="kwrd">&lt;</span><span class="html">style</span><span class="kwrd">&gt;</span>
.infobox
{
    position: absolute;
    z-index: 10000;
    
    width: 150px;
    
    background: #fff;
    border: solid 1px #555;
    padding: 8px;
    color: #555;
}
.infobox h4
{
    color: #000;
    margin: 0;
    font-weight: bold;
}
<span class="kwrd">&lt;/</span><span class="html">style</span><span class="kwrd">&gt;</span></pre>
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

<h3>Custom Pushpin Method Reference</h3>


Here’s some documentation of the 2 methods I added to the Microsoft.Maps.Pushpin object:


**Pushpin.setInfoBox(infobox) 
    <br />**This method is used to set a specific InfoBox to be show for the Pushpin.


**Pushpin.removeInfoBox() 
    <br />**This method is used to remove a previously added InfoBox from the Pushpin.

<h3>InfoBox Method Reference</h3>


Here’s some documentation on the Microsoft.Maps.Ext.InfoBox object:


**Microsoft.Maps.Ext.InfoBox(title, description, map)** 

  <br />This is the constructor of the InfoBox object.

<ol>
  <li>**title** – The HTML to show in the InfoBox title area. </li>

  <li>**description** – The HTML to show in the InfoBox description area. </li>

  <li>**map** – A reference to the Map where the InfoBox’s Pushpin is located, and where it will be displayed. </li>
</ol>


**InfoBox.title(title)** 

  <br />This method gets or sets the Title of the InfoBox. If an argument is passed in, it will set the Title and return the InfoBox object to allow for a fluent interface. If no argument is passed in, it will return the value of the InfoBox Title.


**InfoBox.descirption(description)** 

  <br />This method gets or sets the Description of the InfoBox. If an argument is passed in, it will set the Description and return the InfoBox object to allow for a fluent interface. If no argument is passed in, it will return the value of the InfoBox Description.

<h3>Full InfoBox Extension</h3>


Rather than add the InfoBox object to the root of the “Microsoft.Maps” namespace, I decided to add the “Microsoft.Maps.Ext” namespace where the InfoBox object will live. This will help keep it separated from “core” Microsoft.Maps functionality. Now the only methods added to the “core” namespace are the “setInfoBox” and “removeInfoBox” methods that were necessary to add directly to the Pushpin object.


**Requirements: 
    <br />**This extension requires <a title="jQuery" href="http://jquery.com">jQuery</a> to function.


I could have coded the necessary JavaScript code to manipulate the HTML DOM myself, but it was just easier to use jQuery. Plus, if you’re like me, you will probably be using jQuery in your application anyway so it wont add any additional download.


**Source Code: 
    <br />**Now for the real meat of the post. Here is the full JavaScript code for the InfoBox extension.

<pre class="csharpcode">(<span class="kwrd">function</span> ($m) {
    <span class="rem">/* $m == Microsoft.Maps namespace */</span>
    <span class="rem">/* Add &quot;Microsoft.Maps.Ext&quot; namespace if it doesn't exist</span>
<span class="rem">    This is used to hold the custom InfoBox functionality */</span>
    <span class="kwrd">if</span> (!$m.Ext) { $m.Ext = {}; }

    <span class="rem">/* Microsoft.Maps.Ext.InfoBox extension */</span>
    <span class="kwrd">var</span> InfoBox = $m.Ext.InfoBox = <span class="kwrd">function</span> (title, desc, map) {
        <span class="kwrd">return</span> <span class="kwrd">new</span> InfoBox.fn.init(title, desc, map);
    };
    InfoBox.prototype = InfoBox.fn = {
        init: <span class="kwrd">function</span> (title, desc, map) {
            <span class="kwrd">this</span>._element = <span class="kwrd">null</span>;
            <span class="kwrd">this</span>._title = title;
            <span class="kwrd">this</span>._description = desc;
            <span class="kwrd">this</span>._map = map;
        },
        title: <span class="kwrd">function</span> (v) {
            <span class="kwrd">if</span> (v !== undefined) {
                <span class="kwrd">this</span>._title = v;
                <span class="kwrd">return</span> <span class="kwrd">this</span>;
            }
            <span class="kwrd">return</span> <span class="kwrd">this</span>._title;
        },
        description: <span class="kwrd">function</span> (v) {
            <span class="kwrd">if</span> (v !== undefined) {
                <span class="kwrd">this</span>._description = v;
                <span class="kwrd">return</span> <span class="kwrd">this</span>;
            }
            <span class="kwrd">return</span> <span class="kwrd">this</span>._description;
        },
        show: <span class="kwrd">function</span> (e) {
            <span class="rem">/* Get location of Pushpin */</span>
            <span class="kwrd">var</span> loc = <span class="kwrd">this</span>.map().
                tryLocationToPixel(
                    e.target.getLocation(), Microsoft.Maps.PixelReference.page
                );
            <span class="kwrd">if</span> (<span class="kwrd">this</span>._element === <span class="kwrd">null</span>) {
                <span class="rem">/* Create &lt;div&gt; to show as InfoBox */</span>
                <span class="kwrd">this</span>._element = $(<span class="str">'&lt;div&gt;'</span>).
                    addClass(<span class="str">'infobox'</span>).
                    appendTo($(document.body)).
                    html(<span class="str">'&lt;h4&gt;'</span> + <span class="kwrd">this</span>.title() + <span class="str">'&lt;/h4&gt;'</span> + <span class="kwrd">this</span>.description());
            }
            <span class="rem">/* Show InfoBox and set position*/</span>
            <span class="kwrd">this</span>._element.show().css({
                position: <span class="str">'absolute'</span>,
                <span class="rem">/* offset the infobox a little */</span>
                top: loc.y - 10,
                left: loc.x + 10
            });
        },
        hide: <span class="kwrd">function</span> () {
            <span class="rem">/* Hide InfoBox from view */</span>
            <span class="kwrd">if</span> (<span class="kwrd">this</span>._element !== <span class="kwrd">null</span>) {
                <span class="kwrd">this</span>._element.hide();
            }
        },
        map: <span class="kwrd">function</span> (v) {
            <span class="kwrd">if</span> (v) {
                <span class="kwrd">this</span>._map = v;
                <span class="kwrd">return</span> <span class="kwrd">this</span>;
            }
            <span class="kwrd">return</span> <span class="kwrd">this</span>._map;
        }
    };
    InfoBox.fn.init.prototype = InfoBox.fn;

    <span class="rem">/* Microsoft.Maps.Pushpin extensions */</span>
    (<span class="kwrd">function</span> (proto) {
        <span class="kwrd">if</span> (!proto.setInfoBox) {
            proto.setInfoBox = <span class="kwrd">function</span> (infoBox) {
                <span class="kwrd">this</span>.removeInfoBox();
                <span class="kwrd">this</span>.infobox = infoBox;
                <span class="rem">/* attach event handlers */</span>
                <span class="kwrd">this</span>.infoboxMouseOverHandler = $m.Events.addHandler(
                    <span class="kwrd">this</span>,
                    <span class="str">&quot;mouseover&quot;</span>,
                    <span class="kwrd">function</span> (e) {
                        infoBox.show(e);
                    });
                <span class="kwrd">this</span>.infoboxMouseOutHandler = $m.Events.addHandler(
                    <span class="kwrd">this</span>,
                    <span class="str">&quot;mouseout&quot;</span>,
                    <span class="kwrd">function</span> (e) {
                        infoBox.hide(e);
                    });
            };
        }
        <span class="kwrd">if</span> (!proto.removeInfoBox) {
            proto.removeInfoBox = <span class="kwrd">function</span> () {
                <span class="rem">/* detach event handlers */</span>
                $m.Events.removeHandler(<span class="kwrd">this</span>.infoboxMouseOverHandler);
                $m.Events.removeHandler(<span class="kwrd">this</span>.infoboxMouseOutHandler);
                <span class="kwrd">this</span>.infobox = <span class="kwrd">null</span>;
            };
        }
    })($m.Pushpin.prototype);
})(Microsoft.Maps);</pre>
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

<h3>Conclusion</h3>


I didn’t go over the specifics of writing this plugin too much. If you want to see more examples of what’s involved, then I recommend reading the “<a href="http://social.msdn.microsoft.com/Forums/en-US/vemapcontroldev/thread/8eec78d8-e211-4245-b47c-e83289755f2c">Creating Infoboxes in Bing Maps AJAX v7</a>” post on MSDN Social.

<div style="padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: none; padding-top: 0px" id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:a1d0c9d3-fd57-4da7-bf10-24654b5ace8d" class="wlWriterEditableSmartContent">
<div>Full Example:<a href="/file.axd?file=BingMapsAjaxv7InfoBoxExtensionExampleUsage.zip" target="_self">BingMapsAjaxv7InfoBoxExtensionExampleUsage.zip</a></div></div>
