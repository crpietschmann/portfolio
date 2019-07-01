---
layout: post
blogengineid: 03b33b79-bf56-43e1-81d2-a657434fa764
title: "Boolean Expression in .NET: strName IN ('CHRIS','TOM','TYLER')"
date: 2005-06-24 12:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/06/24/Boolean-Expression-in-NET-strName-IN-(CHRISTOMTYLER)
  - /post/2005/06/24/boolean-expression-in-net-strname-in-(christomtyler)
  - /post.aspx?id=03b33b79-bf56-43e1-81d2-a657434fa764
---
<!-- more -->

<BR>I think it would be really helpful if we could do boolean expressions with IN sort of like we can in SQL.

For Example:<BR>   'just like SQL<BR>   If strName IN ("CHRIS","TOM","TYLER") Then<BR>      'do something<BR>   End If

   'using an array for this would be best<BR>   Dim arrNames() AS String = New Array{"CHRIS", "TOM", "TYLER"}<BR>   If strName IN arrNames Then<BR>      'do something<BR>   End If

   'or like this<BR>   If strName IN New Array{"CHRIS", "TOM", "TYLER"} Then<BR>      'do something<BR>   End If

p.s. You'll have to excuse any bad code grammar, I typed this straight from my head
