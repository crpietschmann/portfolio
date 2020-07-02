---
layout: post
blogengineid: ccc4c389-058d-40d5-ac71-46819daeef7c
title: "HTML5 IE9 Bug: SELECT box is Un-Selected using Mouse if CSS modifies position on hover"
date: 2012-01-21 10:43:41 -0600
comments: true
published: true
categories: ["HTML5", "CSS"]
tags: ["HTML", "JavaScript"]
redirect_from: 
  - /post/2012/01/21/HTML5-IE9-Bug-SELECT-box-is-Un-Selected-using-Mouse-if-CSS-modifies-position-on-hover.aspx
  - /post/2012/01/21/HTML5-IE9-Bug-SELECT-box-is-Un-Selected-using-Mouse-if-CSS-modifies-position-on-hover
  - /post/2012/01/21/html5-ie9-bug-select-box-is-un-selected-using-mouse-if-css-modifies-position-on-hover
  - /post.aspx?id=ccc4c389-058d-40d5-ac71-46819daeef7c
---
<!-- more -->

I recently encountered this rather strange bug that only shows up in Internet Explorer 9 (haven’t tried 10, but likely there too,) but works just fine in IE8, Firefox, Safari and Chrome. Generally the HTML/CSS markup for an individual page within a normal web application can get pretty complex, so this bug took me a while to figure out what it was.  
Apperently, if you have a <SELECT> box contianed within a <TABLE> (which is done fairly often with data entry interfaces,) and you have CSS that styles the table row to highlight on the mouse “HOVER” event in a way that effects the positioning of the <SELECT>, then it will be IMPOSSIBLE for the user to select a dropdown value using the mouse.  
It seems that when the mouse moves out of the bounds of the table row, then the style of it changes back to the “non-Hover” state; thus changing the rendered position of the drop down box. The drop down is automatically hidden when the position of the drop down box changes causing it to be IMPOSSIBLE for the user to select a value using the mouse.  
Another note on duplicating this: It seems that you need to include the HTML5 style doctype in the page, otherwise it will work correctly; even in IE9.  
Don’t worry if this description is somewhat confusing, I have included a full code sample below that exhibits this bug at its most basic level.  <pre class="csharpcode"><span class="kwrd"><!</span><span class="html">doctype</span> <span class="attr">html</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">html</span> <span class="attr">lang</span><span class="kwrd">=&quot;en&quot;</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">head</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">meta</span> <span class="attr">charset</span><span class="kwrd">=&quot;utf-8&quot;</span> <span class="kwrd">/></span>
<span class="kwrd"><</span><span class="html">style</span><span class="kwrd">></span>
table tr:hover 
{
    font-weight:bold;
    /*
    -- AND/OR --
    font-size:larger;
    */
}
<span class="kwrd"></</span><span class="html">style</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">head</span><span class="kwrd">></span>
<span class="kwrd"><</span><span class="html">body</span><span class="kwrd">></span>
  <span class="kwrd"><</span><span class="html">table</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">tr</span><span class="kwrd">></span>
      <span class="kwrd"><</span><span class="html">td</span><span class="kwrd">></span>Select Value:<span class="kwrd"></</span><span class="html">td</span><span class="kwrd">></span>
      <span class="kwrd"><</span><span class="html">td</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">select</span><span class="kwrd">></span>
          <span class="kwrd"><</span><span class="html">option</span><span class="kwrd">></</span><span class="html">option</span><span class="kwrd">></span>
          <span class="kwrd"><</span><span class="html">option</span><span class="kwrd">></span>One<span class="kwrd"></</span><span class="html">option</span><span class="kwrd">></span>
          <span class="kwrd"><</span><span class="html">option</span><span class="kwrd">></span>Two<span class="kwrd"></</span><span class="html">option</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">select</span><span class="kwrd">></span>
      <span class="kwrd"></</span><span class="html">td</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">tr</span><span class="kwrd">></span>
  <span class="kwrd"></</span><span class="html">table</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">body</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">html</span><span class="kwrd">></span></pre>
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
