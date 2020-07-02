---
layout: post
blogengineid: d0028042-516a-49dc-a8eb-3c4a41901bf8
title: "CSS-only Animated Loading Spinner"
date: 2015-04-28 09:00:00 -0500
comments: true
published: true
categories: ["CSS"]
tags: ["CSS"]
redirect_from: 
  - /post/2015/04/28/CSS-only-Animated-Loading-Spinner.aspx
  - /post/2015/04/28/CSS-only-Animated-Loading-Spinner
  - /post/2015/04/28/css-only-animated-loading-spinner
  - /post.aspx?id=d0028042-516a-49dc-a8eb-3c4a41901bf8
---
<!-- more -->

<a href="http://www.w3schools.com/css/css3_animations.asp" target="_blank">CSS Animations</a> are a feature that's been around for a few years, but not many web developers know about it. CSS Animations allow you to define animations and transitions for HTML elements without the need to write JavaScript to do it, or even create an animated GIF file.

<img src="/files/2015/04/CSS-Spinner.gif" alt="" />

Here's a simple Loading Spinner using a simple CSS Animation:
```html
<style>
    @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
    .spinner {
        animation: spin 1s infinite linear;
        width: 1em;
        height: 1em;
    }
    .spinner.stop {
        /* when this class is applied the animation will stop */
        animation: none;
    }
    .circle {
        border: solid 0.05em black;
        width: 1em;
        height: 1em;
        border-radius: 1em;
        border-left: none;
        border-bottom: none;
        border-right: none;
    }
</style>
<div class="spinner">
    <div class="circle"></div>
</div>
```

Download Full Code:

<a href="/FILES/2015/04/CSS-Spinner.zip.axdx">CSS-Spinner.zip (547.00 bytes)</a>
