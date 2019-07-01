---
layout: post
blogengineid: fb118562-11e5-4287-8fd4-214b2ab5b0ca
title: "JavaScript: Null Coalesce using the || Operator"
date: 2008-10-14 09:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/10/14/JavaScript-Gem-Null-Coalescing-using-the-OR-Operator
  - /post/2008/10/14/javascript-gem-null-coalescing-using-the-or-operator
  - /post.aspx?id=fb118562-11e5-4287-8fd4-214b2ab5b0ca
---
<!-- more -->
<p>
I recently purchased <a href="http://www.amazon.com/JavaScript-Good-Parts-Douglas-Crockford/dp/0596517742?&amp;camp=212361&amp;linkCode=wey&amp;tag=pietschsoft-20&amp;creative=380729">&quot;JavaScript: The Good Parts&quot; by Douglas Crockford</a>, and I found this little gem on page 21, although he listed in in the section <em>Objects - Retrieval</em>.
</p>
<p>
<strong>It is possible to use Null Coalescing in JavaScript by using the || operator!</strong>
</p>
<p>
[code:js]
</p>
<p>
// Note: only this code example is quoted from the book<br />
var middle = stooge[&quot;middle-name&quot;] || &quot;(none)&quot;;<br />
var status = flight.status || &quot;unknown&quot;;
</p>
<p>
[/code]
</p>
<p>
Since JavaScript returns a boolean value of <em>true</em> when your looking at a variable that is not set to<em> null</em> or <em>undefined</em>, you can use the || (or) operator to do null coalescing. Basically, as long as the first value is not <em>null</em> or <em>undefined</em> it&#39;s returned, otherwise the second value is returned. This really simplifies the process of getting object property values when you need to use a default value if it&#39;s not set yet, and keeps you from needing to use an if statement.
</p>
<p>
Below is an example of what I used to do Previous to learning this trick: 
</p>
<p>
[code:js]
</p>
<p>
var middle = (stooge[&quot;middle-name&quot;] != null ? stoog[&quot;middle-name&quot;] : &quot;(none)&quot;);<br />
var status = (flight.status != null ? flight.status : &quot;unknown&quot;);
</p>
<p>
[/code]
</p>
<p>
This new trick makes the code much easier to read, and checks for <em>undefined </em>also so I no longer need to worry about the value being equal to <em>undefined</em> in some rare circumstance.
</p>
<p>
&nbsp;
</p>
<p>
<strong>Reference:</strong><br />
JavaScript: The Good Parts by Douglas Crockford. Copyright 2008 Yahoo! inc., 978-0-596-51774-8. 
</p>
