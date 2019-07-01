  ---
  layout: post
  title: "A Couple VB.NET Language Tips for C# Developers"
  date: 2008-10-31 00:27:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["C#", "vb.net"]
  alias: ["/post/2008/10/31/A-Couple-VBNET-Language-Tips-for-CSharp-Developers", "/post/2008/10/31/a-couple-vbnet-language-tips-for-csharp-developers"]
  ---
<!-- more -->
<p>Originally, I started out as a Visual Basic developer, and have since moved mostly to C#. However, when doing consulting work, I do need to cross back and forth quite often. Here are a couple VB.NET tips that you probably aren't aware of if you're mostly a C# developer. Some VB.NET developers may not even know about then either.</p>
<h3>Null Coalesce</h3>
<p>Null Coalescing is really simple in C#:</p>
<p>[code:c#]</p>
<p>// If "someValue" is Null then set "i" to 0 (zero)<br /> // otherwise set it to the value of "someValue"<br /> int? i = someValue ?? 0;</p>
<p>[/code]</p>
<p>But what about VB.NET?</p>
<p>&lt;code:VB&gt;</p>
<p>Dim i = If(someValue, 0)</p>
<p>&lt;/code&gt;</p>
<p>Granted the VB.NET Null Coalesce is a method call, but at least there's still an equivalent available in the language. Also, I believe this is something that was introduced in VB.NET 9.0.</p>
<h3>Ternary Conditional Operator</h3>
<p>This is the ability have a complete If..Else..Then statement on a single line and have it return a value. This is really simple in C#:</p>
<p>[code:c#]</p>
<p>// This performs the same logical operation as the Null Coalesce example above<br /> int? i = (someValue == null ? 0 : someValue);</p>
<p>[/code]</p>
<p>How about in VB.NET?</p>
<p>&lt;code:VB&gt;</p>
<p>Dim i = If(someValue = Nothing, 0, someValue)<br /> <br /> '' The above can be simplified, since if the first parameter is equal to "Nothing"<br /> '' then the "true" (second) parameter is return, otherwise the<br /> '' "false" (third) parameter is returned.<br /> Dim i = If(someValue, 0, someValue)<br /> <br /> '' Also to further simplify, you can just pass in the "false" (second) parameter<br /> '' and if its equal to "Nothing" then the "false" (second) parameter is returns,<br /> '' otherwise the value itself is returned.<br /> Dim i = If(someValue, 0)&nbsp;</p>
<p>&lt;/code&gt;</p>
<h3>Lock Statement</h3>
<p>You may be familiar with the <em>lock </em>statement in C#, especially if you're used to worrying about concurrency.</p>
<p>[code:c#]</p>
<p>lock (expression)<br /> {<br /> <br /> &nbsp;&nbsp;&nbsp; ...Some Code...<br /> <br /> }</p>
<p>[/code]</p>
<p>At first it appears to not exist in VB.NET, but they just named it SyncLock instead:</p>
<p>&lt;code:VB&gt;</p>
<p>SyncLock (expression)<br /> <br /> &nbsp;&nbsp;&nbsp; ...Some Code...<br /> <br /> End SyncLock</p>
<p>&lt;/code&gt;</p>
<p>&nbsp;</p>
<p>Please, excuse the bad syntax highlighting for the VB.NET code, it seems that my instance of BlogEngine.NET doesn't like to highlight too many blocks of code within the same post.</p>
