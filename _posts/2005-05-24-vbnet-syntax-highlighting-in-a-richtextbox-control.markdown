---
layout: post
blogengineid: e1906bcf-983b-4bac-ad1e-cc787ceb4fdd
title: "VB.NET: Syntax Highlighting in a RichTextBox control"
date: 2005-05-24 21:18:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["vb.net", "Win32API"]
redirect_from: 
  - /post/2005/05/24/VBNET-Syntax-Highlighting-in-a-RichTextBox-control
  - /post/2005/05/24/vbnet-syntax-highlighting-in-a-richtextbox-control
  - /post.aspx?id=e1906bcf-983b-4bac-ad1e-cc787ceb4fdd
---
<!-- more -->

This last weekend I expirimented a little bit with extending the functionality of the RichTextBox control. Below you'll find an example of a small class that enherits from the RichTextBox control and allows you to implement syntax highlighting (with the use of a couple Win32 API call to smooth over the process of course.) The code pretty much speaks for itself.

 

<span>Public</span><span> </span><span>Class</span><span> SyntaxRTB</span>

<span>   Inherits</span><span> System.Windows.Forms.RichTextBox
 </span><span>
    Private</span><span> </span><span>Declare</span><span> </span><span>Function</span><span> SendMessage </span><span>Lib</span><span> "user32" </span><span>Alias</span><span> "SendMessageA" _
       </span><span>(</span><span>ByVal</span><span> hWnd </span><span>As</span><span> IntPtr, </span><span>ByVal</span><span> wMsg </span><span>As</span><span> </span><span>Integer</span><span>, </span><span>ByVal</span><span> wParam </span><span>As</span><span> </span><span>Integer</span><span>, </span><span>ByVal </span><span>lParam </span><span>As</span><span> </span><span>Integer</span><span>) </span><span>As</span><span> </span><span>Integer</span>

 

 

<span>   Private</span><span> </span><span>Declare</span><span> </span><span>Function</span><span> LockWindowUpdate </span><span>Lib</span><span> "user32" (</span><span>ByVal</span><span> hWnd </span><span>As</span><span> </span><span>Integer</span><span>) </span><span>As</span><span> </span><span>Integer
 
 </span><span>   Private</span><span> _SyntaxHighlight_CaseSensitive </span><span>As</span><span> </span><span>Boolean</span><span> = </span><span>False
 
 </span><span>   Private</span><span> Words </span><span>As</span><span> </span><span>New</span><span> DataTable
 
 </span><span>   'Contains Windows Messages for the SendMessage API call
 </span><span>   Private</span><span> </span><span>Enum</span><span> EditMessages
       LineIndex = 187
       LineFromChar = 201
       GetFirstVisibleLine = 206
       CharFromPos = 215
       PosFromChar = 1062
 </span><span>   End</span><span> </span><span>Enum</span>

 

<span>   Protected</span><span> </span><span>Overrides</span><span> </span><span>Sub</span><span> OnTextChanged(</span><span>ByVal</span><span> e </span><span>As</span><span> System.EventArgs)
       </span><span>ColorVisibleLines()
    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> ColorRtb()
       </span><span>Dim</span><span> FirstVisibleChar </span><span>As</span><span> </span><span>Integer
       </span><span>Dim</span><span> i </span><span>As</span><span> </span><span>Integer</span><span> = 0
 
       </span><span>While</span><span> i < </span><span>Me</span><span>.Lines.Length
          FirstVisibleChar = GetCharFromLineIndex(i)
          ColorLineNumber(i, FirstVisibleChar)
          i += 1
 </span><span>      End</span><span> </span><span>While
    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> ColorVisibleLines()
       </span><span>Dim</span><span> FirstLine </span><span>As</span><span> </span><span>Integer</span><span> = FirstVisibleLine()
 </span><span>      Dim</span><span> LastLine </span><span>As</span><span> </span><span>Integer</span><span> = LastVisibleLine()
 </span><span>      Dim</span><span> FirstVisibleChar </span><span>As</span><span> </span><span>Integer
 
       </span><span>If</span><span> (FirstLine = 0) </span><span>And</span><span> (LastLine = 0) </span><span>Then
          </span><span>'If there is no text it will error, so exit the sub
          </span><span>Exit</span><span> </span><span>Sub
       </span><span>Else
 </span><span>         While</span><span> FirstLine < LastLine
             FirstVisibleChar = GetCharFromLineIndex(FirstLine)
             ColorLineNumber(FirstLine, FirstVisibleChar)
             FirstLine += 1
          </span><span>End</span><span> </span><span>While
       </span><span>End</span><span> </span><span>If
 
    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> ColorLineNumber(</span><span>ByVal</span><span> LineIndex </span><span>As</span><span> </span><span>Integer</span><span>, </span><span>ByVal</span><span> lStart </span><span>As</span><span> </span><span>Integer</span><span>)
       </span><span>Dim</span><span> i </span><span>As</span><span> </span><span>Integer</span><span> = 0
       </span><span>Dim</span><span> Instance </span><span>As</span><span> </span><span>Integer
       </span><span>Dim</span><span> LeadingChar, TrailingChar </span><span>As</span><span> </span><span>String
       </span><span>Dim</span><span> SelectionAt </span><span>As</span><span> </span><span>Integer</span><span> = </span><span>Me</span><span>.SelectionStart
       </span><span>Dim</span><span> MyRow </span><span>As</span><span> DataRow
       </span><span>Dim</span><span> Line() </span><span>As</span><span> </span><span>String</span><span>, MyI </span><span>As</span><span> </span><span>Integer</span><span>, MyStr </span><span>As</span><span> </span><span>String
 
       </span><span>' Lock the update
       </span><span>LockWindowUpdate(</span><span>Me</span><span>.Handle.ToInt32)
 
       MyI = lStart
 
       </span><span>If</span><span> CaseSensitive </span><span>Then
          </span><span>Line = Split(</span><span>Me</span><span>.Lines(LineIndex).ToString, " ")
       </span><span>Else
          </span><span>Line = Split(</span><span>Me</span><span>.Lines(LineIndex).ToLower, " ")
       </span><span>End</span><span> </span><span>If
 
       </span><span>For</span><span> </span><span>Each</span><span> MyStr </span><span>In</span><span> Line
          </span><span>Me</span><span>.SelectionStart = MyI
 </span><span>         Me</span><span>.SelectionLength = MyStr.Length
 
          </span><span>If</span><span> Words.Rows.Contains(MyStr) </span><span>Then
             </span><span>MyRow = Words.Rows.Find(MyStr)
             </span><span>If</span><span> (</span><span>Not</span><span> CaseSensitive) </span><span>Or</span><span> (CaseSensitive </span><span>And</span><span> MyRow("Word") = MyStr) </span><span>Then
                </span><span>Me</span><span>.SelectionColor = Color.FromName(MyRow("Color"))
             </span><span>End</span><span> </span><span>If
 </span><span>         Else
             </span><span>Me</span><span>.SelectionColor = Color.Black
          </span><span>End</span><span> </span><span>If
 
          </span><span>MyI += MyStr.Length + 1
 </span><span>      Next
 </span><span>
       ' Restore the selectionstart
       </span><span>Me</span><span>.SelectionStart = SelectionAt
       </span><span>Me</span><span>.SelectionLength = 0
       </span><span>Me</span><span>.SelectionColor = Color.Black
 
       </span><span>' Unlock the update
       </span><span>LockWindowUpdate(0)
    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Function</span><span> GetCharFromLineIndex(</span><span>ByVal</span><span> LineIndex </span><span>As</span><span> </span><span>Integer</span><span>) </span><span>As</span><span> </span><span>Integer
       </span><span>Return</span><span> SendMessage(</span><span>Me</span><span>.Handle, EditMessages.LineIndex, LineIndex, 0)
    </span><span>End</span><span> </span><span>Function</span>

 

<span>   Public</span><span> </span><span>Function</span><span> FirstVisibleLine() </span><span>As</span><span> </span><span>Integer
       </span><span>Return</span><span> SendMessage(</span><span>Me</span><span>.Handle, EditMessages.GetFirstVisibleLine, 0, 0)
    </span><span>End</span><span> </span><span>Function</span>

 

<span>   Public</span><span> </span><span>Function</span><span> LastVisibleLine() </span><span>As</span><span> </span><span>Integer
       </span><span>Dim</span><span> LastLine </span><span>As</span><span> </span><span>Integer</span><span> = FirstVisibleLine() + (</span><span>Me</span><span>.Height / </span><span>Me</span><span>.Font.Height)
 
       </span><span>If</span><span> LastLine > </span><span>Me</span><span>.Lines.Length </span><span>Or</span><span> LastLine = 0 </span><span>Then
          </span><span>LastLine = </span><span>Me</span><span>.Lines.Length
 </span><span>      End</span><span> </span><span>If
 
       </span><span>Return</span><span> LastLine
    </span><span>End</span><span> </span><span>Function</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> </span><span>New</span><span>()
       </span><span>Dim</span><span> MyRow </span><span>As</span><span> DataRow
       </span><span>Dim</span><span> arrKeyWords() </span><span>As</span><span> </span><span>String</span><span>, strKW </span><span>As</span><span> </span><span>String
 
       </span><span>Me</span><span>.AcceptsTab = </span><span>True
 
       </span><span>''Load all the keywords and the colors to make them 
       </span><span>Words.Columns.Add("Word")
       Words.PrimaryKey = </span><span>New</span><span> DataColumn() {Words.Columns(0)}
       Words.Columns.Add("Color")
 
       arrKeyWords = </span><span>New</span><span> </span><span>String</span><span>() {"select", "insert", "delete", _
          "truncate", "from", "where", "into", "inner", "update", _
          "outer", "on", "is", "declare", "set", "use", "values", "as", _
          "order", "by", "drop", "view", "go", "trigger", "cube", _
          "binary", "varbinary", "image", "char", "varchar", "text", _
          "datetime", "smalldatetime", "decimal", "numeric", "float", _
          "real", "bigint", "int", "smallint", "tinyint", "money", _
          "smallmoney", "bit", "cursor", "timestamp", "uniqueidentifier", _
          "sql_variant", "table", "nchar", "nvarchar", "ntext", "left", _
          "right", "like","and","all","in","null","join","not","or"}
 
 </span><span>      For</span><span> </span><span>Each</span><span> strKW </span><span>In</span><span> arrKeyWords
          MyRow = Words.NewRow()
          MyRow("Word") = strKW
          MyRow("Color") = Color.LightCoral.Name
          Words.Rows.Add(MyRow)
       </span><span>Next
 
    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Property</span><span> CaseSensitive() </span><span>As</span><span> </span><span>Boolean
       </span><span>Get
          </span><span>Return</span><span> _SyntaxHighlight_CaseSensitive
       </span><span>End</span><span> </span><span>Get
       </span><span>Set</span><span>(</span><span>ByVal</span><span> Value </span><span>As</span><span> </span><span>Boolean</span><span>)
          _SyntaxHighlight_CaseSensitive = Value
       </span><span>End</span><span> </span><span>Set
 </span><span>   End</span><span> </span><span>Property</span>

 

 

<span>End</span><span> </span><span>Class</span>   

 

**Update July 8th, 2008:** Here's a link that shows a couple tips that may help in writing your own Syntax Highlighting RichTextBox control:

<a href="http://codebetter.com/blogs/patricksmacchia/archive/2008/07/07/some-richtextbox-tricks.aspx">http://codebetter.com/blogs/patricksmacchia/archive/2008/07/07/some-richtextbox-tricks.aspx</a>
