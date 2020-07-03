---
layout: post
blogengineid: 153234aa-4896-47f3-8bb3-83663c56b7ee
title: "ASP.NET: Extend BoundField Control - Add MultiLine support"
date: 2006-09-20 00:18:00 -0500
comments: true
published: true
categories: ["ASP.NET"]
tags: ["asp.net"]
redirect_from: 
  - /post/2006/09/20/ASPNET-Extend-BoundField-Control-Add-MultiLine-support.aspx
  - /post/2006/09/20/ASPNET-Extend-BoundField-Control-Add-MultiLine-support
  - /post/2006/09/20/aspnet-extend-boundfield-control-add-multiline-support
  - /post.aspx?id=153234aa-4896-47f3-8bb3-83663c56b7ee
---
<!-- more -->

I've been working with the data controls and it's somewhat cumbersome to use a TemplateField control everytime you want to just have a MultiLine TextBox. So, I decided to extend upon the BoundField control to add MultiLine support. It is actually rather simple to do.

Using the BoundTextBoxField control in the page:

<span style="font-size: x-small;"> </span>

<span style="font-size: x-small;"><%</span><span style="color: #0000ff; font-size: x-small;">@</span><span style="font-size: x-small;"> </span><span style="color: #800000; font-size: x-small;">Register</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Namespace</span><span style="color: #0000ff; font-size: x-small;">="CustomBoundField"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">TagPrefix</span><span style="color: #0000ff; font-size: x-small;">="custom"</span><span style="font-size: x-small;"> %></span>

<span style="color: #0000ff; font-size: x-small;"> </span>

<span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #800000; font-size: x-small;">asp</span><span style="color: #0000ff; font-size: x-small;">:</span><span style="color: #800000; font-size: x-small;">GridView</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">ID</span><span style="color: #0000ff; font-size: x-small;">="GridView1"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">runat</span><span style="color: #0000ff; font-size: x-small;">="server">
</span><span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #800000; font-size: x-small;">Columns</span><span style="color: #0000ff; font-size: x-small;">>
</span><span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #800000; font-size: x-small;">custom</span><span style="color: #0000ff; font-size: x-small;">:</span><span style="color: #800000; font-size: x-small;">BoundTextBoxField</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">DataField</span><span style="color: #0000ff; font-size: x-small;">="Text"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">HeaderText</span><span style="color: #0000ff; font-size: x-small;">="MultiLine Text"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">SortExpression</span><span style="color: #0000ff; font-size: x-small;">="Text"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">TextMode</span><span style="color: #0000ff; font-size: x-small;">="MultiLine"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Rows</span><span style="color: #0000ff; font-size: x-small;">="5"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Columns</span><span style="color: #0000ff; font-size: x-small;">="25"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Wrap</span><span style="color: #0000ff; font-size: x-small;">="True"</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">/>
</span><span style="color: #0000ff; font-size: x-small;"></</span><span style="color: #800000; font-size: x-small;">Columns</span><span style="color: #0000ff; font-size: x-small;">>
</span><span style="color: #0000ff; font-size: x-small;"></</span><span style="color: #800000; font-size: x-small;">asp</span><span style="color: #0000ff; font-size: x-small;">:</span><span style="color: #800000; font-size: x-small;">GridView</span><span style="color: #0000ff; font-size: x-small;">></span>

 

Code for the BoundTextBoxField control (~/App_Code/BoundTextBoxField.cs):

<span style="color: #0000ff; font-size: x-small;"> </span>

<span style="color: #0000ff; font-size: x-small;">using</span><span style="font-size: x-small;"> System;
</span><span style="color: #0000ff; font-size: x-small;">using</span><span style="font-size: x-small;"> System.Web;
</span><span style="color: #0000ff; font-size: x-small;">using</span><span style="font-size: x-small;"> System.Web.UI;
</span><span style="color: #0000ff; font-size: x-small;">using</span><span style="font-size: x-small;"> System.Web.UI.WebControls;</span>

<span style="color: #0000ff; font-size: x-small;"> </span>

<span style="color: #0000ff; font-size: x-small;">namespace</span><span style="font-size: x-small;"> CustomBoundField
{</span>

<span style="color: #808080; font-size: x-small;">///</span><span style="color: #008000; font-size: x-small;"> </span><span style="color: #808080; font-size: x-small;"><summary>
</span><span style="color: #808080; font-size: x-small;">///</span><span style="color: #008000; font-size: x-small;"> Summary description for BoundTextBoxField
</span><span style="color: #808080; font-size: x-small;">///</span><span style="color: #008000; font-size: x-small;"> </span><span style="color: #808080; font-size: x-small;"></summary>
</span><span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">class</span><span style="font-size: x-small;"> </span><span style="color: #008080; font-size: x-small;">BoundTextBoxField</span><span style="font-size: x-small;"> : System.Web.UI.WebControls.</span><span style="color: #008080; font-size: x-small;">BoundField
</span><span style="font-size: x-small;">{</span>

<span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #008080; font-size: x-small;">TextBoxMode</span><span style="font-size: x-small;"> TextMode
{
</span><span style="color: #0000ff; font-size: x-small;">   get
</span><span style="font-size: x-small;">   {
</span><span style="color: #008080; font-size: x-small;">      TextBoxMode</span><span style="font-size: x-small;"> _tm = </span><span style="color: #008080; font-size: x-small;">TextBoxMode</span><span style="font-size: x-small;">.SingleLine;
</span><span style="color: #0000ff; font-size: x-small;">      if</span><span style="font-size: x-small;"> (</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"TextMode"</span><span style="font-size: x-small;">] != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
         _tm = (</span><span style="color: #008080; font-size: x-small;">TextBoxMode</span><span style="font-size: x-small;">)</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"TextMode"</span><span style="font-size: x-small;">];
</span><span style="color: #0000ff; font-size: x-small;">      return</span><span style="font-size: x-small;"> _tm;
   }
</span><span style="color: #0000ff; font-size: x-small;">   set</span><span style="font-size: x-small;"> { </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"TextMode"</span><span style="font-size: x-small;">] = </span><span style="color: #0000ff; font-size: x-small;">value</span><span style="font-size: x-small;">; }
}</span>

<span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">int</span><span style="font-size: x-small;"> Columns
{
</span><span style="color: #0000ff; font-size: x-small;">   get
</span><span style="font-size: x-small;">   {
</span><span style="color: #0000ff; font-size: x-small;">      int</span><span style="font-size: x-small;"> i = 0;
</span><span style="color: #0000ff; font-size: x-small;">      if</span><span style="font-size: x-small;"> (</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Columns"</span><span style="font-size: x-small;">] != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
         i = (</span><span style="color: #0000ff; font-size: x-small;">int</span><span style="font-size: x-small;">)</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Columns"</span><span style="font-size: x-small;">];
</span><span style="color: #0000ff; font-size: x-small;">      return</span><span style="font-size: x-small;"> i;
   }
</span><span style="color: #0000ff; font-size: x-small;">   set</span><span style="font-size: x-small;"> { </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Columns"</span><span style="font-size: x-small;">] = </span><span style="color: #0000ff; font-size: x-small;">value</span><span style="font-size: x-small;">; }
}</span>

<span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">int</span><span style="font-size: x-small;"> Rows
{
</span><span style="color: #0000ff; font-size: x-small;">   get
</span><span style="font-size: x-small;">   {
</span><span style="color: #0000ff; font-size: x-small;">      int</span><span style="font-size: x-small;"> i = 0;
</span><span style="color: #0000ff; font-size: x-small;">      if</span><span style="font-size: x-small;"> (</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Rows"</span><span style="font-size: x-small;">] != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
         i = (</span><span style="color: #0000ff; font-size: x-small;">int</span><span style="font-size: x-small;">)</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Rows"</span><span style="font-size: x-small;">];
</span><span style="color: #0000ff; font-size: x-small;">      return</span><span style="font-size: x-small;"> i;
   }
</span><span style="color: #0000ff; font-size: x-small;">   set</span><span style="font-size: x-small;"> { </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Rows"</span><span style="font-size: x-small;">] = </span><span style="color: #0000ff; font-size: x-small;">value</span><span style="font-size: x-small;">; }
}</span>

<span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">bool</span><span style="font-size: x-small;"> Wrap
{
</span><span style="color: #0000ff; font-size: x-small;">   get
</span><span style="font-size: x-small;">   {
</span><span style="color: #0000ff; font-size: x-small;">      bool</span><span style="font-size: x-small;"> b = </span><span style="color: #0000ff; font-size: x-small;">true</span><span style="font-size: x-small;">;
</span><span style="color: #0000ff; font-size: x-small;">      if</span><span style="font-size: x-small;"> (</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Wrap"</span><span style="font-size: x-small;">] != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
         b = (</span><span style="color: #0000ff; font-size: x-small;">bool</span><span style="font-size: x-small;">)</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Wrap"</span><span style="font-size: x-small;">];
</span><span style="color: #0000ff; font-size: x-small;">      return</span><span style="font-size: x-small;"> b;
   }
</span><span style="color: #0000ff; font-size: x-small;">   set</span><span style="font-size: x-small;"> { </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.ViewState[</span><span style="color: #800000; font-size: x-small;">"Wrap"</span><span style="font-size: x-small;">] = </span><span style="color: #0000ff; font-size: x-small;">value</span><span style="font-size: x-small;">; }
}</span>

<span style="color: #0000ff; font-size: x-small;">protected</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">override</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">void</span><span style="font-size: x-small;"> OnDataBindField(</span><span style="color: #0000ff; font-size: x-small;">object</span><span style="font-size: x-small;"> sender, </span><span style="color: #008080; font-size: x-small;">EventArgs</span><span style="font-size: x-small;"> e)
{
</span><span style="color: #0000ff; font-size: x-small;">   base</span><span style="font-size: x-small;">.OnDataBindField(sender, e);
</span><span style="color: #008080; font-size: x-small;">   Control</span><span style="font-size: x-small;"> c = (</span><span style="color: #008080; font-size: x-small;">Control</span><span style="font-size: x-small;">)sender;
</span><span style="color: #0000ff; font-size: x-small;">   if</span><span style="font-size: x-small;"> (c </span><span style="color: #0000ff; font-size: x-small;">is</span><span style="font-size: x-small;"> </span><span style="color: #008080; font-size: x-small;">TextBox</span><span style="font-size: x-small;">)
   {
</span><span style="color: #008080; font-size: x-small;">      TextBox</span><span style="font-size: x-small;"> txt = (</span><span style="color: #008080; font-size: x-small;">TextBox</span><span style="font-size: x-small;">)c;
      txt.TextMode = </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.TextMode;
      txt.Columns = </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.Columns;
      txt.Rows = </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.Rows;
      txt.Wrap = </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.Wrap;
   }
}</span>

<span style="font-size: x-small;">}</span>

<span style="font-size: x-small;">}</span>

 
