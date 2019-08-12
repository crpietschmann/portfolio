---
layout: post
blogengineid: 9fdde907-6a17-4597-abe1-7e28f8d22238
title: "Why do we need to handle the RowUpdated event of our DataAdapter in order to reflect the ID in a Primary/Foriegn key relationship??"
date: 2004-08-23 17:39:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/08/23/Why-do-we-need-to-handle-the-RowUpdated-event-of-our-DataAdapter-in-order-to-reflect-the-ID-in-a-PrimaryForiegn-key-relationship.aspx
  - /post/2004/08/23/Why-do-we-need-to-handle-the-RowUpdated-event-of-our-DataAdapter-in-order-to-reflect-the-ID-in-a-PrimaryForiegn-key-relationship
  - /post/2004/08/23/why-do-we-need-to-handle-the-rowupdated-event-of-our-dataadapter-in-order-to-reflect-the-id-in-a-primaryforiegn-key-relationship
  - /post.aspx?id=9fdde907-6a17-4597-abe1-7e28f8d22238
---
<!-- more -->

Why do we need to handle the RowUpdated event of our DataAdapter in order to reflect the ID in a Primary/Foreign key relationship?? Well, anyway here is a page that tells you how to do this.

```VB
AddHandler daChargeAttendance.RowUpdated, AddressOf FeeChargeAttendanceRowUpdated

Private Sub FeeChargeRowUpdated(ByVal sender As Object, ByVal e As SqlRowUpdatedEventArgs)
     Dim oCmd As SqlCommand = New SqlCommand("SELECT @@IDENTITY", e.Command.Connection)
     e.Row("ID") = oCmd.ExecuteScalar()
     e.Row.AcceptChanges()
End Sub
```

<A href="http://codeproject.com/cs/database/relationaladonet.asp">http://codeproject.com/cs/database/relationaladonet.asp</A></FONT>
