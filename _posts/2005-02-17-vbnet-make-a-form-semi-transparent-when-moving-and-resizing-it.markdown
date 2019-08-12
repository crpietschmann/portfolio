---
layout: post
blogengineid: 8f7a6806-5632-454b-a510-d2c47b19bc58
title: "VB.NET: Make a Form semi-transparent when moving and resizing it"
date: 2005-02-17 00:10:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General", "vb.net"]
redirect_from: 
  - /post/2005/02/17/VBNET-Make-a-Form-semi-transparent-when-moving-and-resizing-it.aspx
  - /post/2005/02/17/VBNET-Make-a-Form-semi-transparent-when-moving-and-resizing-it
  - /post/2005/02/17/vbnet-make-a-form-semi-transparent-when-moving-and-resizing-it
  - /post.aspx?id=8f7a6806-5632-454b-a510-d2c47b19bc58
---

Here's a little VB.NET code snippet that I wrote to make a Form semi-transparent when moving and resizing it. I think this is a neat little effect to add to an application.

```VB
Public Class frmTransparentMoveResize
Inherits System.Windows.Forms.Form

Private _OpacityResize As Double = 0.5 Private _OpacityMove As Double = 0.5
Private _OpacityOriginal As Double

Private Const WM_NCLBUTTONDOWN As Long = &HA1
Private Const WM_NCLBUTTONUP As Long = &HA0

Private Const WM_MOVING As Long = &H216
Private Const WM_SIZE As Long = &H5

Protected Overrides Sub DefWndProc(ByRef m As System.Windows.Forms.Message)
Static LButtonDown As Boolean

'Check the state of the Left Mouse Button

If CLng(m.Msg) = WM_NCLBUTTONDOWN Then

'set LButtonDown to True is Left Mouse Button is down

LButtonDown = True

ElseIf CLng(m.Msg) = WM_NCLBUTTONUP Then

'set LButtonDown to False is Left Mouse Button is not down

LButtonDown = False

End If

If LButtonDown Then

If CLng(m.Msg) = WM_MOVING Then

'Set the forms opacity to 50% if user is draging the window

If Me.Opacity <> _OpacityMove Then

_OpacityOriginal = Me.Opacity Me.Opacity = _OpacityMove
End If

ElseIf CLng(m.Msg) = WM_SIZE Then

'Set the forms opacity to 50% if user is resizing the window

If Me.Opacity <> _OpacityResize Then

_OpacityOriginal = Me.Opacity Me.Opacity = _OpacityResize
End If

End If

ElseIf Not LButtonDown Then

If Me.Opacity <> _OpacityOriginal Then Me.Opacity = _OpacityOriginal
End If

MyBase.DefWndProc(m)
End Sub

Public Property OpacityMove() As Double

Get

Return _OpacityMove
End Get

Set(ByVal Value As Double)
_OpacityMove = Value

End Set

End Property

Public Property OpacityResize() As Double

Get

Return _OpacityResize
End Get

Set(ByVal Value As Double)
_OpacityResize = Value

End Set

End Property
End Class
```