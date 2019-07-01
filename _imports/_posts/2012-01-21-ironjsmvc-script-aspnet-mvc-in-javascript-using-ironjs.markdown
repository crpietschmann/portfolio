---
layout: post
title: "IronJSMVC: Script ASP.NET MVC in JavaScript using IronJS"
date: 2012-01-21 18:54:03 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
alias: ["/post/2012/01/21/IronJSMVC-Script-ASPNET-MVC-in-JavaScript-using-IronJS", "/post/2012/01/21/ironjsmvc-script-aspnet-mvc-in-javascript-using-ironjs"]
---
<!-- more -->
<p>Personally, I enjoy writing much of my applications using a statically typed language such as C#. However, I would really prefer to be able to write UI logic and script certain parts of my applications using a dynamic language if I could. I was thinking about this and the following question came to mind:</p>  <p><em>What would it be like to write an ASP.NET MVC application entirely using JavaScript?</em></p>  <p>So I thought I’d work up a prototype using <a href="https://github.com/fholm/IronJS/">IronJS</a> (a javascript implementation for the .NET DLR.)</p>  <p>Download IronJSMVC prototype source code here:    <br /><a title="https://github.com/crpietschmann/IronJSMVC/downloads" href="https://github.com/crpietschmann/IronJSMVC/downloads">https://github.com/crpietschmann/IronJSMVC/downloads</a></p>  <p>Here’s a screenshot of the prototype code running, also showing a sample Controller and View written entirely in JavaScript:</p>  <p><a href="/images/postsIronJSMVC_Preview1_Screenshot.jpg"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="IronJSMVC_Preview1_Screenshot" border="0" alt="IronJSMVC_Preview1_Screenshot" src="/images/postsIronJSMVC_Preview1_Screenshot_thumb.jpg" width="644" height="435" /></a></p>  <p>I was just looking at the source code for IronJSMVC that I posted on github last September and I realized that I never posted about it here.</p>