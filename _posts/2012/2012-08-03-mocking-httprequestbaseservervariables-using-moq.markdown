---
layout: post
blogengineid: 828d1198-8b0c-4b95-835c-f5e3abec4b8d
title: "Mocking HttpRequestBase.ServerVariables using Moq"
date: 2012-08-03 21:12:58 -0500
comments: true
published: true
categories: ["TDD", "Moq", "ASP.NET", "C#"]
tags: ["C#", "ASP.NET MVC", "TDD"]
redirect_from: 
  - /post/2012/08/03/Mocking-HttpRequestBaseServerVariables-using-Moq.aspx
  - /post/2012/08/03/Mocking-HttpRequestBaseServerVariables-using-Moq
  - /post/2012/08/03/mocking-httprequestbaseservervariables-using-moq
  - /post.aspx?id=828d1198-8b0c-4b95-835c-f5e3abec4b8d
---
<!-- more -->

Mocking is a very handy tool for unit testing code, especially when it comes to mocking the HttpContext for web application code. However, it’s not as straight forward as you might think to mock the HttpRequestBase.ServerVariables, however once you know what to do it really is pretty simple.  
Here’s a code example (using <a href="http://code.google.com/p/moq/">moq</a>) that shows how to create a mock HttpContextBase that contains a mock HttpRequestBase with a mock ServerVariables property:  <pre class="csharpcode"><span class="kwrd">public</span> HttpContextBase CreateMockHttpContext()
{
    var serverVariables = <span class="kwrd">new</span> NameValueCollection {
        { <span class="str">&quot;SomeServerIPAddress&quot;</span>, <span class="str">&quot;127.0.0.1&quot;</span> },
        { <span class="str">&quot;AnotherAppVariable&quot;</span>, <span class="str">&quot;Unit Test Value&quot;</span> }
    };
 
    var httpRequest = <span class="kwrd">new</span> Moq.Mock<HttpRequestBase>();
    httpRequest.Setup(x => x.ServerVariables.Get(It.IsAny<<span class="kwrd">string</span>>()))
        .Returns<<span class="kwrd">string</span>>(x =>
        {
            <span class="kwrd">return</span> serverVariables[x];
        });
 
    var httpContext = (<span class="kwrd">new</span> Moq.Mock<HttpContextBase>());
    httpContext.Setup(x => x.Request).Returns(httpRequest.Object);
 
    <span class="kwrd">return</span> httpContext.Object;
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


Hopefully this points someone in the direction they are looking to be able to write more unit tests for code that contains dependencies on the HttpContext.
