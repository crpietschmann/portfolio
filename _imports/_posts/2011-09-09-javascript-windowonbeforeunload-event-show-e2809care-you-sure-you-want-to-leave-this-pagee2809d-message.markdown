---
layout: post
title: "JavaScript: window.onbeforeunload Event - Show “Are you sure you want to leave this page?” Message"
date: 2011-09-09 17:03:49 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2011/09/09/JavaScript-windowonbeforeunload-Event-Show-e2809cAre-you-sure-you-want-to-leave-this-pagee2809d-Message
 -  /post/2011/09/09/javascript-windowonbeforeunload-event-show-e2809care-you-sure-you-want-to-leave-this-pagee2809d-message
---
<!-- more -->
<p><a href="/images/postsbrowser_beforeunload_message.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: right; border-top: 0px; border-right: 0px; padding-top: 0px" title="browser_beforeunload_message" border="0" alt="browser_beforeunload_message" align="right" src="/images/postsbrowser_beforeunload_message_thumb.png" width="244" height="169" /></a>All web developers have likely seen how inconvenient it can be for a user to edit some data in an application, then click a link/button to go on to the next task, but only to later realize that all changes made were never saved. This can pose a major problem for users, until they get it down that they need to click the “Save” button before leaving the page. Wouldn’t it be nice for the app to remind them to click the “Save” button?</p>  <p>Everyone has seen the “Are you sure you want to leave this page?” message (as shown to the right.). It is actually rather simple to implement, but has seemingly been a secret most web developers are unaware of. Good for us, it is actually really simple to do through the <a href="https://developer.mozilla.org/En/DOM/Window.onbeforeunload">window.onbeforeunload</a> event.</p>    <h3>Handle window.onbeforeunload event using jQuery</h3>  <pre class="csharpcode">$(window).bind(<span class="str">'beforeunload'</span>, <span class="kwrd">function</span>() {
    <span class="kwrd">return</span> <span class="str">'You have unsaved changes. If you leave the page these changes will be lost.'</span>;
});</pre>
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

<h3>Handle window.onbeforeunload event using straight JavaScript</h3>

<pre class="csharpcode">window.onbeforeunload = <span class="kwrd">function</span>(e) {
    <span class="kwrd">return</span> <span class="str">'You have unsaved changes. If you leave the page these changes will be lost.'</span>;
};</pre>

<h3>Browser Support</h3>

<p>The onbeforeunload event was first introduced with Internet Explorere 4, and has since been implemented by all the other web browsers. So basically, what ever browser your users are using, you will be able to take advantage of this.</p>
