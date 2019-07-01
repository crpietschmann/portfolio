---
layout: post
blogengineid: 69d3daaa-0e06-47ea-ad96-c66c11825025
title: "Implementing Namespaces in Ruby using Nested Modules"
date: 2008-11-02 18:48:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Ruby"]
redirect_from: 
  - /post/2008/11/02/Implementing-Namespaces-in-Ruby-using-Nested-Modules
  - /post/2008/11/02/implementing-namespaces-in-ruby-using-nested-modules
  - /post.aspx?id=69d3daaa-0e06-47ea-ad96-c66c11825025
---
<!-- more -->
<p>
Recently, I finally got around to starting to learn Ruby. I am finding it to be rather pleasant to program in. Now, one thing that I am used to using with an Object Oriented language (especially with my .NET background) are Namespaces. The only problem is that you can&#39;t just declare a namespace in Ruby using a &quot;namespace&quot; keyword. However, it&#39;s not difficult to implement Namespaces in Ruby, all you need to do is nest some modules.
</p>
<p>
To demonstrate this, I&#39;ll show you how to create the familiar (for .NET developers) System.Windows.Forms namespace with the MessageBox.Show method:
</p>
<p>
[code:c#]
</p>
<p>
module System<br />
&nbsp; module Windows<br />
&nbsp;&nbsp;&nbsp; module Forms<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module MessageBox<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def MessageBox.Show(title, message)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; api = Win32API.new(&quot;user32&quot;,&quot;MessageBox&quot;,[&quot;L&quot;,&quot;P&quot;,&quot;P&quot;,&quot;L&quot;],&quot;I&quot;)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; api.call(0, message, title, 0)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br />
&nbsp;&nbsp;&nbsp; end<br />
&nbsp; end<br />
end 
</p>
<p>
[/code]
</p>
<p>
Now to use the namespace you can use one of the following methods:
</p>
<p>
[code:c#]
</p>
<p>
System::Windows::Forms::MessageBox.Show(&quot;Some Title&quot;, &quot;This is a test message.&quot;) 
</p>
<p>
[/code] 
</p>
<p>
Or by including the &quot;namespace&quot;:
</p>
<p>
[code:c#]
</p>
<p>
include System::Windows::Forms<br />
<br />
MessageBox.Show(&quot;Some Title&quot;, &quot;This is another test message.&quot;)
</p>
<p>
[/code]
</p>
<p>
As you can see it&#39;s rather simple to create &quot;.NET&quot;-like namespaces in Ruby.
</p>
<p>
Now, I know this technique is basically allowing me to write .NET code in Ruby, but that was pretty much the point of figuring this out. Now, back to learning how to write Ruby code in Ruby.
</p>
<p>
&nbsp;
</p>
<p>
Oh, yeah now only if the syntax highlighter in BlogEngine.NET supported Ruby.... 
</p>
