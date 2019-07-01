---
layout: post
id: 03b33b79-bf56-43e1-81d2-a657434fa764
title: "Boolean Expression in .NET: strName IN ("CHRIS","TOM","TYLER")"
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
<P><BR>I think it would be really helpful if we could do boolean expressions with IN sort of like we can in SQL.</P>
<P>For Example:<BR>&nbsp;&nbsp; 'just like SQL<BR>&nbsp;&nbsp; If strName IN ("CHRIS","TOM","TYLER") Then<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'do something<BR>&nbsp;&nbsp; End If</P>
<P>&nbsp;&nbsp; 'using an array for this would be best<BR>&nbsp;&nbsp; Dim arrNames() AS String = New Array{"CHRIS", "TOM", "TYLER"}<BR>&nbsp;&nbsp; If strName IN arrNames Then<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'do something<BR>&nbsp;&nbsp; End If</P>
<P>&nbsp;&nbsp; 'or like this<BR>&nbsp;&nbsp; If strName IN New Array{"CHRIS", "TOM", "TYLER"} Then<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'do something<BR>&nbsp;&nbsp; End If</P>
<P>p.s. You'll have to excuse any bad code grammar, I typed this straight from my head</P>
