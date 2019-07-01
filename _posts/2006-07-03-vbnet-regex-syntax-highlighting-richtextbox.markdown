---
layout: post
blogengineid: 95da94ec-5c72-4907-8af8-cf6a12c704e1
title: "VB.NET: RegEx Syntax Highlighting RichTextBox"
date: 2006-07-03 17:08:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["vb.net"]
redirect_from: 
  - /post/2006/07/03/VBNET-RegEx-Syntax-Highlighting-RichTextBox
  - /post/2006/07/03/vbnet-regex-syntax-highlighting-richtextbox
  - /post.aspx?id=95da94ec-5c72-4907-8af8-cf6a12c704e1
---
<!-- more -->

<img class="photosmall" src="/download/blog/1311/regexsyntaxhighlighter.png" border="0" alt="RegEx Syntax Highlighter" hspace="0" align="left" />Here is a version of my code for syntax highlighting in a RichTextBox that incorporates regular expressions.

 

<a href="/download/blog/1311/SyntaxRTB.vb.txt">Download RegEx Syntax Highlighting RichTextBox Source Code</a>

Source Code Listed:

<span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Class</span><span style="font-size: x-small;"> SyntaxRTB</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Inherits</span><span style="font-size: x-small;"> System.Windows.Forms.RichTextBox</span>
</span><span style="color: #0000ff; font-size: x-small;">Private</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Declare</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> SendMessage </span><span style="color: #0000ff; font-size: x-small;">Lib</span><span style="font-size: x-small;"> </span><span style="color: #800000; font-size: x-small;">"user32"</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Alias</span><span style="font-size: x-small;"> </span><span style="color: #800000; font-size: x-small;">"SendMessageA"</span><span style="font-size: x-small;"> _</span><span style="font-size: x-small;"> (</span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> hWnd </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> IntPtr, </span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> wMsg </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">, </span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> wParam </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">, _</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> lParam </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">) </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="color: #0000ff; font-size: x-small;">Private</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Declare</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> LockWindowUpdate </span><span style="color: #0000ff; font-size: x-small;">Lib</span><span style="font-size: x-small;"> </span><span style="color: #800000; font-size: x-small;">"user32"</span><span style="font-size: x-small;"> _</span><span style="font-size: x-small;">

(<span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> hWnd </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">) </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Private</span><span style="font-size: x-small;"> _SyntaxHighlight_CaseSensitive </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Boolean</span><span style="font-size: x-small;"> = </span><span style="color: #0000ff; font-size: x-small;">False</span>
</span><span style="color: #0000ff; font-size: x-small;">Friend</span><span style="font-size: x-small;"> Words </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">New</span><span style="font-size: x-small;"> DataTable</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">'Contains Windows Messages for the SendMessage API call</span>
</span><span style="color: #0000ff; font-size: x-small;">Private</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Enum</span><span style="font-size: x-small;"> EditMessages</span><span style="font-size: x-small;">

LineIndex = 187

LineFromChar = 201

GetFirstVisibleLine = 206

CharFromPos = 215

PosFromChar = 1062

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Enum</span>
</span><span style="color: #0000ff; font-size: x-small;">Protected</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Overrides</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span><span style="font-size: x-small;"> OnTextChanged(</span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> e </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> System.EventArgs)</span><span style="color: #0000ff; font-size: x-small;">MyBase</span><span style="font-size: x-small;">.OnTextChanged(e)</span><span style="font-size: x-small;">

ColorVisibleLines()

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span>
</span><span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">New</span><span style="font-size: x-small;">()</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.AcceptsTab = </span><span style="color: #0000ff; font-size: x-small;">True</span>
</span><span style="font-size: x-small;">

AddSQLSyntax()

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span>
</span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> AddSQLSyntax()</span><span style="font-size: x-small;">

ClearSyntaxWords()
AddSyntaxWord(</span><span style="color: #800000; font-size: x-small;">"\b(select|text|ntext|date|datetime|order by|"</span><span style="font-size: x-small;"> &amp; _</span><span style="font-size: x-small;">

<span style="color: #800000; font-size: x-small;">"group by|smalldatetime|cursor|on|as|for|filename|"</span><span style="font-size: x-small;"> &amp; _</span>
</span><span style="color: #800000; font-size: x-small;">"database|drop|function|delete|insert|update|int|"</span><span style="font-size: x-small;"> &amp; _</span><span style="font-size: x-small;">

<span style="color: #800000; font-size: x-small;">"varchar|nvarchar|bit|binary|table|inner|where|from|"</span><span style="font-size: x-small;"> &amp; _</span>
</span><span style="color: #800000; font-size: x-small;">"out|procedure|view|trigger|set)\b"</span><span style="font-size: x-small;">, Color.Blue)</span><span style="font-size: x-small;">

AddSyntaxWord(<span style="color: #800000; font-size: x-small;">"\b@@identity\b"</span><span style="font-size: x-small;">, Color.Pink)AddSyntaxWord(</span>
</span><span style="color: #800000; font-size: x-small;">"\b(in|join|outer|and|or)\b"</span><span style="font-size: x-small;">, Color.Gray)</span><span style="font-size: x-small;"> AddSyntaxWord(</span><span style="color: #800000; font-size: x-small;">"\bsp_refreshview\b"</span><span style="font-size: x-small;">, Color.Red)</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">True</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span>
</span><span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> ClearSyntaxWords()</span><span style="font-size: x-small;"> Words = </span><span style="color: #0000ff; font-size: x-small;">New</span><span style="font-size: x-small;"> DataTable</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">''Load all the keywords and the colors to make them </span>
</span><span style="font-size: x-small;">Words.Columns.Add(</span><span style="color: #800000; font-size: x-small;">"Word"</span><span style="font-size: x-small;">)</span><span style="font-size: x-small;">

Words.PrimaryKey = <span style="color: #0000ff; font-size: x-small;">New</span><span style="font-size: x-small;"> DataColumn() {Words.Columns(0)}Words.Columns.Add(</span>
</span><span style="color: #800000; font-size: x-small;">"Color"</span><span style="font-size: x-small;">)</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">True</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span>
</span><span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> AddSyntaxWord(</span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> strWord </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">String</span><span style="font-size: x-small;">, </span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> clrColor </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> Color)</span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> MyRow </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> DataRow</span><span style="font-size: x-small;">

MyRow = Words.NewRow()

MyRow(<span style="color: #800000; font-size: x-small;">"Word"</span><span style="font-size: x-small;">) = strWordMyRow(</span>
</span><span style="color: #800000; font-size: x-small;">"Color"</span><span style="font-size: x-small;">) = clrColor.Name</span><span style="font-size: x-small;">

Words.Rows.Add(MyRow)

<span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">True</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span>
</span><span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span><span style="font-size: x-small;"> ColorRtb()</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> FirstVisibleChar </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> i </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;"> = 0</span><span style="color: #0000ff; font-size: x-small;">While</span><span style="font-size: x-small;"> i &lt; </span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Lines.Length</span><span style="font-size: x-small;">

FirstVisibleChar = GetCharFromLineIndex(i)

ColorLineNumber(i, FirstVisibleChar)

i += 1

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">While</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span>
</span><span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span><span style="font-size: x-small;"> ColorVisibleLines()</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> FirstLine </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;"> = FirstVisibleLine()</span>
</span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> LastLine </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;"> = LastVisibleLine()</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> FirstVisibleChar </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">If</span><span style="font-size: x-small;"> (FirstLine = 0) </span><span style="color: #0000ff; font-size: x-small;">And</span><span style="font-size: x-small;"> (LastLine = 0) </span><span style="color: #0000ff; font-size: x-small;">Then</span>
</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">'If there is no text it will error, so exit the sub</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Exit</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Else</span>
</span><span style="color: #0000ff; font-size: x-small;">While</span><span style="font-size: x-small;"> FirstLine &lt; LastLine</span><span style="font-size: x-small;">

FirstVisibleChar = GetCharFromLineIndex(FirstLine)

ColorLineNumber(FirstLine, FirstVisibleChar)

FirstLine += 1

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">While</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">If</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span>
</span><span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span><span style="font-size: x-small;"> ColorLineNumber(</span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> LineIndex </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">, </span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> lStart </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">)</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> i </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;"> = 0</span>
</span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> SelectionAt </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;"> = </span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionStart</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> MyRow </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> DataRow</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> MyI </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">' Lock the update</span>
</span><span style="font-size: x-small;">LockWindowUpdate(</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Handle.ToInt32)</span><span style="font-size: x-small;">

MyI = lStart

<span style="color: #008000; font-size: x-small;">''Turn the whole link black before applying RegEx Syntax matching.</span>
</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionStart = MyI</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionLength = Lines(LineIndex).Length</span>
</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionColor = Color.Black</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">''Check for matches in a particular line number</span>
</span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> rm </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> System.Text.RegularExpressions.MatchCollection</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> m </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> System.Text.RegularExpressions.Match</span>
</span><span style="color: #0000ff; font-size: x-small;">For</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Each</span><span style="font-size: x-small;"> MyRow </span><span style="color: #0000ff; font-size: x-small;">In</span><span style="font-size: x-small;"> Words.Rows</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">'"( |^)1.*2( |$)"</span>
</span><span style="font-size: x-small;">rm = System.Text.RegularExpressions.Regex.Matches(</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Text, MyRow(</span><span style="color: #800000; font-size: x-small;">"Word"</span><span style="font-size: x-small;">))</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">For</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Each</span><span style="font-size: x-small;"> m </span><span style="color: #0000ff; font-size: x-small;">In</span><span style="font-size: x-small;"> rm</span>
</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionStart = m.Index</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionLength = m.Length</span>
</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionColor = Color.FromName(MyRow(</span><span style="color: #800000; font-size: x-small;">"color"</span><span style="font-size: x-small;">))</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Next</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Next</span>
</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">' Restore the selectionstart</span>
</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionStart = SelectionAt</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionLength = 0</span>
</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.SelectionColor = Color.Black</span><span style="font-size: x-small;">

<span style="color: #008000; font-size: x-small;">' Unlock the update</span>
</span><span style="font-size: x-small;">

LockWindowUpdate(0)

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Sub</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> GetCharFromLineIndex(</span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> LineIndex </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;">) </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> SendMessage(</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Handle, EditMessages.LineIndex, LineIndex, 0)</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> FirstVisibleLine() </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> SendMessage(</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Handle, EditMessages.GetFirstVisibleLine, 0, 0)</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span><span style="font-size: x-small;"> LastVisibleLine() </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span>
</span><span style="color: #0000ff; font-size: x-small;">Dim</span><span style="font-size: x-small;"> LastLine </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Integer</span><span style="font-size: x-small;"> = FirstVisibleLine() + (</span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Height / </span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Font.Height)</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">If</span><span style="font-size: x-small;"> LastLine &gt; </span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Lines.Length </span><span style="color: #0000ff; font-size: x-small;">Or</span><span style="font-size: x-small;"> LastLine = 0 </span><span style="color: #0000ff; font-size: x-small;">Then</span>
</span><span style="font-size: x-small;">LastLine = </span><span style="color: #0000ff; font-size: x-small;">Me</span><span style="font-size: x-small;">.Lines.Length</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">If</span>
</span><span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> LastLine</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Function</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Property</span><span style="font-size: x-small;"> CaseSensitive() </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Boolean</span>
</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">Get</span>
</span><span style="color: #0000ff; font-size: x-small;">Return</span><span style="font-size: x-small;"> _SyntaxHighlight_CaseSensitive</span><span style="font-size: x-small;">

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Get</span>
</span><span style="color: #0000ff; font-size: x-small;">Set</span><span style="font-size: x-small;">(</span><span style="color: #0000ff; font-size: x-small;">ByVal</span><span style="font-size: x-small;"> Value </span><span style="color: #0000ff; font-size: x-small;">As</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Boolean</span><span style="font-size: x-small;">)</span><span style="font-size: x-small;">

_SyntaxHighlight_CaseSensitive = Value

<span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Set</span>
</span><span style="color: #0000ff; font-size: x-small;">End</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Property</span><span style="color: #0000ff; font-size: x-small;">

End<span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">Class</span>
</span>
