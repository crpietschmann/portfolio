---
layout: post
blogengineid: a1caf97a-cced-40c6-97f7-d639c2840c00
title: ".NET: Why aren't Private Abstract methods allowed?"
date: 2008-02-26 22:08:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
redirect_from: 
  - /post/2008/02/26/NET-Why-arent-Private-Abstract-methods-allowed.aspx
  - /post/2008/02/26/NET-Why-arent-Private-Abstract-methods-allowed
  - /post/2008/02/26/net-why-arent-private-abstract-methods-allowed
  - /post.aspx?id=a1caf97a-cced-40c6-97f7-d639c2840c00
---
<!-- more -->

Sometimes when creating base objects you want to create methods that are overridable by object that inherit the base object, but keep the methods from being public. However, the compiler throws an exceptions when you try to define a method as "Private Abstract".

**Why doesn't the compiler like "Private Abstract" methods?**

The reason for this is Private methods can not be overriden. So, essentially the Abstract is useless if the method is Private.

**How can I create a "Private" method that's able to be overriden?**

Simple, you just declare the method as "Protected Abstract". Protected defines that the method is only accessible from within the class that declared it, and from within any derived class.
