---
layout: post
blogengineid: 3e3e5d35-10e4-4362-b8e3-fd97dbff3796
title: "A Couple VB.NET Language Tips for C# Developers"
date: 2008-10-31 00:27:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
redirect_from: 
  - /post/2008/10/31/A-Couple-VBNET-Language-Tips-for-CSharp-Developers.aspx
  - /post/2008/10/31/A-Couple-VBNET-Language-Tips-for-CSharp-Developers
  - /post/2008/10/31/a-couple-vbnet-language-tips-for-csharp-developers
  - /post.aspx?id=3e3e5d35-10e4-4362-b8e3-fd97dbff3796
---
<!-- more -->

Originally, I started out as a Visual Basic developer, and have since moved mostly to C#. However, when doing consulting work, I do need to cross back and forth quite often. Here are a couple VB.NET tips that you probably aren't aware of if you're mostly a C# developer. Some VB.NET developers may not even know about then either.
<h3>Null Coalesce</h3>

Null Coalescing is really simple in C#:

```csharp

// If "someValue" is Null then set "i" to 0 (zero)
 // otherwise set it to the value of "someValue"
 int? i = someValue ?? 0;

```

But what about VB.NET?

<code:VB>

Dim i = If(someValue, 0)

</code>

Granted the VB.NET Null Coalesce is a method call, but at least there's still an equivalent available in the language. Also, I believe this is something that was introduced in VB.NET 9.0.
<h3>Ternary Conditional Operator</h3>

This is the ability have a complete If..Else..Then statement on a single line and have it return a value. This is really simple in C#:

```csharp

// This performs the same logical operation as the Null Coalesce example above
 int? i = (someValue == null ? 0 : someValue);

```

How about in VB.NET?

<code:VB>

Dim i = If(someValue = Nothing, 0, someValue)
 
 '' The above can be simplified, since if the first parameter is equal to "Nothing"
 '' then the "true" (second) parameter is return, otherwise the
 '' "false" (third) parameter is returned.
 Dim i = If(someValue, 0, someValue)
 
 '' Also to further simplify, you can just pass in the "false" (second) parameter
 '' and if its equal to "Nothing" then the "false" (second) parameter is returns,
 '' otherwise the value itself is returned.
 Dim i = If(someValue, 0) 

</code>
<h3>Lock Statement</h3>

You may be familiar with the *lock *statement in C#, especially if you're used to worrying about concurrency.

```csharp

lock (expression)
 {
 
     ...Some Code...
 
 }

```

At first it appears to not exist in VB.NET, but they just named it SyncLock instead:

<code:VB>

SyncLock (expression)
 
     ...Some Code...
 
 End SyncLock

</code>

 

Please, excuse the bad syntax highlighting for the VB.NET code, it seems that my instance of BlogEngine.NET doesn't like to highlight too many blocks of code within the same post.
