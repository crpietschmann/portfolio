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

<span>   Inherits</span><span> System.Windows.Forms.RichTextBox<br /> </span><span><br />    Private</span><span> </span><span>Declare</span><span> </span><span>Function</span><span> SendMessage </span><span>Lib</span><span> "user32" </span><span>Alias</span><span> "SendMessageA" _<br />       </span><span>(</span><span>ByVal</span><span> hWnd </span><span>As</span><span> IntPtr, </span><span>ByVal</span><span> wMsg </span><span>As</span><span> </span><span>Integer</span><span>, </span><span>ByVal</span><span> wParam </span><span>As</span><span> </span><span>Integer</span><span>, </span><span>ByVal </span><span>lParam </span><span>As</span><span> </span><span>Integer</span><span>) </span><span>As</span><span> </span><span>Integer</span>

 

 

<span>   Private</span><span> </span><span>Declare</span><span> </span><span>Function</span><span> LockWindowUpdate </span><span>Lib</span><span> "user32" (</span><span>ByVal</span><span> hWnd </span><span>As</span><span> </span><span>Integer</span><span>) </span><span>As</span><span> </span><span>Integer<br /> <br /> </span><span>   Private</span><span> _SyntaxHighlight_CaseSensitive </span><span>As</span><span> </span><span>Boolean</span><span> = </span><span>False<br /> <br /> </span><span>   Private</span><span> Words </span><span>As</span><span> </span><span>New</span><span> DataTable<br /> <br /> </span><span>   'Contains Windows Messages for the SendMessage API call<br /> </span><span>   Private</span><span> </span><span>Enum</span><span> EditMessages<br />       LineIndex = 187<br />       LineFromChar = 201<br />       GetFirstVisibleLine = 206<br />       CharFromPos = 215<br />       PosFromChar = 1062<br /> </span><span>   End</span><span> </span><span>Enum</span>

 

<span>   Protected</span><span> </span><span>Overrides</span><span> </span><span>Sub</span><span> OnTextChanged(</span><span>ByVal</span><span> e </span><span>As</span><span> System.EventArgs)<br />       </span><span>ColorVisibleLines()<br />    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> ColorRtb()<br />       </span><span>Dim</span><span> FirstVisibleChar </span><span>As</span><span> </span><span>Integer<br />       </span><span>Dim</span><span> i </span><span>As</span><span> </span><span>Integer</span><span> = 0<br /> <br />       </span><span>While</span><span> i &lt; </span><span>Me</span><span>.Lines.Length<br />          FirstVisibleChar = GetCharFromLineIndex(i)<br />          ColorLineNumber(i, FirstVisibleChar)<br />          i += 1<br /> </span><span>      End</span><span> </span><span>While<br />    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> ColorVisibleLines()<br />       </span><span>Dim</span><span> FirstLine </span><span>As</span><span> </span><span>Integer</span><span> = FirstVisibleLine()<br /> </span><span>      Dim</span><span> LastLine </span><span>As</span><span> </span><span>Integer</span><span> = LastVisibleLine()<br /> </span><span>      Dim</span><span> FirstVisibleChar </span><span>As</span><span> </span><span>Integer<br /> <br />       </span><span>If</span><span> (FirstLine = 0) </span><span>And</span><span> (LastLine = 0) </span><span>Then<br />          </span><span>'If there is no text it will error, so exit the sub<br />          </span><span>Exit</span><span> </span><span>Sub<br />       </span><span>Else<br /> </span><span>         While</span><span> FirstLine &lt; LastLine<br />             FirstVisibleChar = GetCharFromLineIndex(FirstLine)<br />             ColorLineNumber(FirstLine, FirstVisibleChar)<br />             FirstLine += 1<br />          </span><span>End</span><span> </span><span>While<br />       </span><span>End</span><span> </span><span>If<br /> <br />    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> ColorLineNumber(</span><span>ByVal</span><span> LineIndex </span><span>As</span><span> </span><span>Integer</span><span>, </span><span>ByVal</span><span> lStart </span><span>As</span><span> </span><span>Integer</span><span>)<br />       </span><span>Dim</span><span> i </span><span>As</span><span> </span><span>Integer</span><span> = 0<br />       </span><span>Dim</span><span> Instance </span><span>As</span><span> </span><span>Integer<br />       </span><span>Dim</span><span> LeadingChar, TrailingChar </span><span>As</span><span> </span><span>String<br />       </span><span>Dim</span><span> SelectionAt </span><span>As</span><span> </span><span>Integer</span><span> = </span><span>Me</span><span>.SelectionStart<br />       </span><span>Dim</span><span> MyRow </span><span>As</span><span> DataRow<br />       </span><span>Dim</span><span> Line() </span><span>As</span><span> </span><span>String</span><span>, MyI </span><span>As</span><span> </span><span>Integer</span><span>, MyStr </span><span>As</span><span> </span><span>String<br /> <br />       </span><span>' Lock the update<br />       </span><span>LockWindowUpdate(</span><span>Me</span><span>.Handle.ToInt32)<br /> <br />       MyI = lStart<br /> <br />       </span><span>If</span><span> CaseSensitive </span><span>Then<br />          </span><span>Line = Split(</span><span>Me</span><span>.Lines(LineIndex).ToString, " ")<br />       </span><span>Else<br />          </span><span>Line = Split(</span><span>Me</span><span>.Lines(LineIndex).ToLower, " ")<br />       </span><span>End</span><span> </span><span>If<br /> <br />       </span><span>For</span><span> </span><span>Each</span><span> MyStr </span><span>In</span><span> Line<br />          </span><span>Me</span><span>.SelectionStart = MyI<br /> </span><span>         Me</span><span>.SelectionLength = MyStr.Length<br /> <br />          </span><span>If</span><span> Words.Rows.Contains(MyStr) </span><span>Then<br />             </span><span>MyRow = Words.Rows.Find(MyStr)<br />             </span><span>If</span><span> (</span><span>Not</span><span> CaseSensitive) </span><span>Or</span><span> (CaseSensitive </span><span>And</span><span> MyRow("Word") = MyStr) </span><span>Then<br />                </span><span>Me</span><span>.SelectionColor = Color.FromName(MyRow("Color"))<br />             </span><span>End</span><span> </span><span>If<br /> </span><span>         Else<br />             </span><span>Me</span><span>.SelectionColor = Color.Black<br />          </span><span>End</span><span> </span><span>If<br /> <br />          </span><span>MyI += MyStr.Length + 1<br /> </span><span>      Next<br /> </span><span><br />       ' Restore the selectionstart<br />       </span><span>Me</span><span>.SelectionStart = SelectionAt<br />       </span><span>Me</span><span>.SelectionLength = 0<br />       </span><span>Me</span><span>.SelectionColor = Color.Black<br /> <br />       </span><span>' Unlock the update<br />       </span><span>LockWindowUpdate(0)<br />    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Function</span><span> GetCharFromLineIndex(</span><span>ByVal</span><span> LineIndex </span><span>As</span><span> </span><span>Integer</span><span>) </span><span>As</span><span> </span><span>Integer<br />       </span><span>Return</span><span> SendMessage(</span><span>Me</span><span>.Handle, EditMessages.LineIndex, LineIndex, 0)<br />    </span><span>End</span><span> </span><span>Function</span>

 

<span>   Public</span><span> </span><span>Function</span><span> FirstVisibleLine() </span><span>As</span><span> </span><span>Integer<br />       </span><span>Return</span><span> SendMessage(</span><span>Me</span><span>.Handle, EditMessages.GetFirstVisibleLine, 0, 0)<br />    </span><span>End</span><span> </span><span>Function</span>

 

<span>   Public</span><span> </span><span>Function</span><span> LastVisibleLine() </span><span>As</span><span> </span><span>Integer<br />       </span><span>Dim</span><span> LastLine </span><span>As</span><span> </span><span>Integer</span><span> = FirstVisibleLine() + (</span><span>Me</span><span>.Height / </span><span>Me</span><span>.Font.Height)<br /> <br />       </span><span>If</span><span> LastLine &gt; </span><span>Me</span><span>.Lines.Length </span><span>Or</span><span> LastLine = 0 </span><span>Then<br />          </span><span>LastLine = </span><span>Me</span><span>.Lines.Length<br /> </span><span>      End</span><span> </span><span>If<br /> <br />       </span><span>Return</span><span> LastLine<br />    </span><span>End</span><span> </span><span>Function</span>

 

<span>   Public</span><span> </span><span>Sub</span><span> </span><span>New</span><span>()<br />       </span><span>Dim</span><span> MyRow </span><span>As</span><span> DataRow<br />       </span><span>Dim</span><span> arrKeyWords() </span><span>As</span><span> </span><span>String</span><span>, strKW </span><span>As</span><span> </span><span>String<br /> <br />       </span><span>Me</span><span>.AcceptsTab = </span><span>True<br /> <br />       </span><span>''Load all the keywords and the colors to make them <br />       </span><span>Words.Columns.Add("Word")<br />       Words.PrimaryKey = </span><span>New</span><span> DataColumn() {Words.Columns(0)}<br />       Words.Columns.Add("Color")<br /> <br />       arrKeyWords = </span><span>New</span><span> </span><span>String</span><span>() {"select", "insert", "delete", _<br />          "truncate", "from", "where", "into", "inner", "update", _<br />          "outer", "on", "is", "declare", "set", "use", "values", "as", _<br />          "order", "by", "drop", "view", "go", "trigger", "cube", _<br />          "binary", "varbinary", "image", "char", "varchar", "text", _<br />          "datetime", "smalldatetime", "decimal", "numeric", "float", _<br />          "real", "bigint", "int", "smallint", "tinyint", "money", _<br />          "smallmoney", "bit", "cursor", "timestamp", "uniqueidentifier", _<br />          "sql_variant", "table", "nchar", "nvarchar", "ntext", "left", _<br />          "right", "like","and","all","in","null","join","not","or"}<br /> <br /> </span><span>      For</span><span> </span><span>Each</span><span> strKW </span><span>In</span><span> arrKeyWords<br />          MyRow = Words.NewRow()<br />          MyRow("Word") = strKW<br />          MyRow("Color") = Color.LightCoral.Name<br />          Words.Rows.Add(MyRow)<br />       </span><span>Next<br /> <br />    </span><span>End</span><span> </span><span>Sub</span>

 

<span>   Public</span><span> </span><span>Property</span><span> CaseSensitive() </span><span>As</span><span> </span><span>Boolean<br />       </span><span>Get<br />          </span><span>Return</span><span> _SyntaxHighlight_CaseSensitive<br />       </span><span>End</span><span> </span><span>Get<br />       </span><span>Set</span><span>(</span><span>ByVal</span><span> Value </span><span>As</span><span> </span><span>Boolean</span><span>)<br />          _SyntaxHighlight_CaseSensitive = Value<br />       </span><span>End</span><span> </span><span>Set<br /> </span><span>   End</span><span> </span><span>Property</span>

 

 

<span>End</span><span> </span><span>Class</span>   

 

**Update July 8th, 2008:** Here's a link that shows a couple tips that may help in writing your own Syntax Highlighting RichTextBox control:

<a href="http://codebetter.com/blogs/patricksmacchia/archive/2008/07/07/some-richtextbox-tricks.aspx">http://codebetter.com/blogs/patricksmacchia/archive/2008/07/07/some-richtextbox-tricks.aspx</a>
