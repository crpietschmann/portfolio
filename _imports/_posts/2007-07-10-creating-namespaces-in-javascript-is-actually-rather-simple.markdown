---
layout: post
blogengineid: 52c4845b-11a5-4522-8ff1-22a7dccc52c9
title: "Creating Namespaces in JavaScript is actually rather simple..."
date: 2007-07-10 19:31:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2007/07/10/Creating-Namespaces-in-JavaScript-is-actually-rather-simple
  - /post/2007/07/10/creating-namespaces-in-javascript-is-actually-rather-simple
  - /post.aspx?id=52c4845b-11a5-4522-8ff1-22a7dccc52c9
---
<!-- more -->
<p>
Creating Namespaces in JavaScript is rather simple due to the fact that JavaScript is a&nbsp;very flexible language. As far as I know all the popular Ajax frameworks do this (including the&nbsp;ASP.NET AJAX Extensions). Being a .NET programmer (I&#39;m assuming Java programmers would feel the same way), having classes devided up into&nbsp;namespaces makes code alot easier to manage.
</p>
<p>
<strong>Here&#39;s some code that wraps up the ability to add namespaces into&nbsp;a namespace of it&#39;s own:</strong>
</p>
<p>
[code:js] 
</p>
<p>
/// Create the Namespace Manager that we&#39;ll use to<br />
/// make creating namespaces a little easier.
</p>
<p>
if (typeof Namespace == &#39;undefined&#39;) var Namespace = {};<br />
if (!Namespace.Manager) Namespace.Manager = {};
</p>
<p>
Namespace.Manager = {<br />
&nbsp;Register:function(namespace){<br />
&nbsp;&nbsp;namespace = namespace.split(&#39;.&#39;);
</p>
<p>
&nbsp;&nbsp;if(!window[namespace[0]]) window[namespace[0]] = {};<br />
&nbsp;&nbsp;<br />
&nbsp;&nbsp;var strFullNamespace = namespace[0];<br />
&nbsp;&nbsp;for(var i = 1; i &lt; namespace.length; i++)<br />
&nbsp;&nbsp;{<br />
&nbsp;&nbsp;&nbsp;strFullNamespace += &quot;.&quot; + namespace[i];<br />
&nbsp;&nbsp;&nbsp;eval(&quot;if(!window.&quot; + strFullNamespace + &quot;)window.&quot; + strFullNamespace + &quot;={};&quot;);<br />
&nbsp;&nbsp;}<br />
&nbsp;}<br />
};
</p>
<p>
[/code] 
</p>
<p>
<strong>Here&#39;s&nbsp;a sample usage of the above code to create and use an object that&#39;s placed inside a namespace:</strong>
</p>
<p>
[code:js] 
</p>
<p>
// Register our Namespace<br />
Namespace.Manager.Register(&quot;PietschSoft.Utility.Class&quot;);
</p>
<p>
// Add the Triplet class to the namespace created above<br />
PietschSoft.Utility.Class.Triplet = function(one, two, three)<br />
{<br />
&nbsp;this.First = one;<br />
&nbsp;this.Second = two;<br />
&nbsp;this.Third = three;<br />
}
</p>
<p>
// Create an instance of our Triplet class<br />
var myTriplet = new PietschSoft.Utility.Class.Triplet(&quot;1&quot;, &quot;2&quot;, &quot;3&quot;);
</p>
<p>
// Read the values out of the properties of you Triplet class<br />
alert(myTriplet.First + &quot;\n&quot; + myTriplet.Second + &quot;\n&quot; + myTriplet.Third);
</p>
<p>
[/code]
</p>
<p>
&nbsp;
</p>
<p>
<strong>Why would I want this snippet?</strong>
</p>
<p>
Well, you really don&#39;t if you use any of the popular Ajax frameworks that implement their own namespace management. But at least this gives you an idea of how it&#39;s done. Plus, using this snippet will allow you to utilize namespaces if you are hand coding everything in your app and not using an Ajax framework.
</p>
