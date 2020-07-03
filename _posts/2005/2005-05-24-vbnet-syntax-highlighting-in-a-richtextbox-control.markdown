---
layout: post
blogengineid: e1906bcf-983b-4bac-ad1e-cc787ceb4fdd
title: "VB.NET: Syntax Highlighting in a RichTextBox control"
date: 2005-05-24 21:18:00 -0500
comments: true
published: true
categories: ["VB.NET", "Win32"]
tags: ["vb.net", "Win32API"]
redirect_from: 
  - /post/2005/05/24/VBNET-Syntax-Highlighting-in-a-RichTextBox-control.aspx
  - /post/2005/05/24/VBNET-Syntax-Highlighting-in-a-RichTextBox-control
  - /post/2005/05/24/vbnet-syntax-highlighting-in-a-richtextbox-control
  - /post.aspx?id=e1906bcf-983b-4bac-ad1e-cc787ceb4fdd
---

This last weekend I expirimented a little bit with extending the functionality of the RichTextBox control. Below you'll find an example of a small class that enherits from the RichTextBox control and allows you to implement syntax highlighting (with the use of a couple Win32 API call to smooth over the process of course.) The code pretty much speaks for itself.

```VB
Public Class SyntaxRTB

   Inherits System.Windows.Forms.RichTextBox

   Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
      (ByVal hWnd As IntPtr, ByVal wMsg As Integer, ByVal wParam As Integer, ByVal lParam As Integer) As Integer

 

 

   Private Declare Function LockWindowUpdate Lib "user32" (ByVal hWnd As Integer) As Integer

   Private _SyntaxHighlight_CaseSensitive As Boolean = False

   Private Words As New DataTable

   'Contains Windows Messages for the SendMessage API call
   Private Enum EditMessages
      LineIndex = 187
      LineFromChar = 201
      GetFirstVisibleLine = 206
      CharFromPos = 215
      PosFromChar = 1062
   End Enum

 

   Protected Overrides Sub OnTextChanged(ByVal e As System.EventArgs)
      ColorVisibleLines()
   End Sub

 

   Public Sub ColorRtb()
      Dim FirstVisibleChar As Integer
      Dim i As Integer = 0

      While i < Me.Lines.Length
         FirstVisibleChar = GetCharFromLineIndex(i)
         ColorLineNumber(i, FirstVisibleChar)
         i += 1
      End While
   End Sub

 

   Public Sub ColorVisibleLines()
      Dim FirstLine As Integer = FirstVisibleLine()
      Dim LastLine As Integer = LastVisibleLine()
      Dim FirstVisibleChar As Integer

      If (FirstLine = 0) And (LastLine = 0) Then
         'If there is no text it will error, so exit the sub
         Exit Sub
      Else
         While FirstLine < LastLine
            FirstVisibleChar = GetCharFromLineIndex(FirstLine)
            ColorLineNumber(FirstLine, FirstVisibleChar)
            FirstLine += 1
         End While
      End If

   End Sub

 

   Public Sub ColorLineNumber(ByVal LineIndex As Integer, ByVal lStart As Integer)
      Dim i As Integer = 0
      Dim Instance As Integer
      Dim LeadingChar, TrailingChar As String
      Dim SelectionAt As Integer = Me.SelectionStart
      Dim MyRow As DataRow
      Dim Line() As String, MyI As Integer, MyStr As String

      ' Lock the update
      LockWindowUpdate(Me.Handle.ToInt32)

      MyI = lStart

      If CaseSensitive Then
         Line = Split(Me.Lines(LineIndex).ToString, " ")
      Else
         Line = Split(Me.Lines(LineIndex).ToLower, " ")
      End If

      For Each MyStr In Line
         Me.SelectionStart = MyI
         Me.SelectionLength = MyStr.Length

         If Words.Rows.Contains(MyStr) Then
            MyRow = Words.Rows.Find(MyStr)
            If (Not CaseSensitive) Or (CaseSensitive And MyRow("Word") = MyStr) Then
               Me.SelectionColor = Color.FromName(MyRow("Color"))
            End If
         Else
            Me.SelectionColor = Color.Black
         End If

         MyI += MyStr.Length + 1
      Next

      ' Restore the selectionstart
      Me.SelectionStart = SelectionAt
      Me.SelectionLength = 0
      Me.SelectionColor = Color.Black

      ' Unlock the update
      LockWindowUpdate(0)
   End Sub

 

   Public Function GetCharFromLineIndex(ByVal LineIndex As Integer) As Integer
      Return SendMessage(Me.Handle, EditMessages.LineIndex, LineIndex, 0)
   End Function

 

   Public Function FirstVisibleLine() As Integer
      Return SendMessage(Me.Handle, EditMessages.GetFirstVisibleLine, 0, 0)
   End Function

 

   Public Function LastVisibleLine() As Integer
      Dim LastLine As Integer = FirstVisibleLine() + (Me.Height / Me.Font.Height)

      If LastLine > Me.Lines.Length Or LastLine = 0 Then
         LastLine = Me.Lines.Length
      End If

      Return LastLine
   End Function

 

   Public Sub New()
      Dim MyRow As DataRow
      Dim arrKeyWords() As String, strKW As String

      Me.AcceptsTab = True

      ''Load all the keywords and the colors to make them 
      Words.Columns.Add("Word")
      Words.PrimaryKey = New DataColumn() {Words.Columns(0)}
      Words.Columns.Add("Color")

      arrKeyWords = New String() {"select", "insert", "delete", _
         "truncate", "from", "where", "into", "inner", "update", _
         "outer", "on", "is", "declare", "set", "use", "values", "as", _
         "order", "by", "drop", "view", "go", "trigger", "cube", _
         "binary", "varbinary", "image", "char", "varchar", "text", _
         "datetime", "smalldatetime", "decimal", "numeric", "float", _
         "real", "bigint", "int", "smallint", "tinyint", "money", _
         "smallmoney", "bit", "cursor", "timestamp", "uniqueidentifier", _
         "sql_variant", "table", "nchar", "nvarchar", "ntext", "left", _
         "right", "like","and","all","in","null","join","not","or"}

      For Each strKW In arrKeyWords
         MyRow = Words.NewRow()
         MyRow("Word") = strKW
         MyRow("Color") = Color.LightCoral.Name
         Words.Rows.Add(MyRow)
      Next

   End Sub

 

   Public Property CaseSensitive() As Boolean
      Get
         Return _SyntaxHighlight_CaseSensitive
      End Get
      Set(ByVal Value As Boolean)
         _SyntaxHighlight_CaseSensitive = Value
      End Set
   End Property

 

 

End Class   
```

> **Update July 8th, 2008:** Here's a link that shows a couple tips that may help in writing your own Syntax Highlighting RichTextBox control:

<http://codebetter.com/blogs/patricksmacchia/archive/2008/07/07/some-richtextbox-tricks.aspx>