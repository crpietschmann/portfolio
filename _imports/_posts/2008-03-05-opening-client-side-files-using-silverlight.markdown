---
layout: post
blogengineid: f823d977-be23-4989-a881-cdabdafc2910
title: "Opening Client-Side Files using Silverlight"
date: 2008-03-05 23:09:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/05/Opening-Client-Side-Files-using-Silverlight
  - /post/2008/03/05/opening-client-side-files-using-silverlight
  - /post.aspx?id=f823d977-be23-4989-a881-cdabdafc2910
---
<!-- more -->

Silverlight does not have direct access to the local file system for security reasons. However, you can still prompt the user to select a specific file to open using the OpenFileDialog similarly to how you do in .NET. Here's some basic code that demonstrates opening a user specified file using Silverlight 2 Beta 1.

This basic example opens up a user specified file, and displays its contents within a textbox.

**Page.xaml file**

&lt;UserControl x:Class="SilverlightFileSystemInfo.Page"<br />     xmlns="http://schemas.microsoft.com/client/2007" <br />     xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" <br />     Width="480"&gt;<br />     &lt;Grid x:Name="LayoutRoot" Background="White"&gt;<br />         &lt;Grid HorizontalAlignment="Left"&gt;<br />             &lt;TextBox x:Name="txtFile" Width="400" Height="250" AcceptsReturn="True" /&gt;    <br />         &lt;/Grid&gt;<br />         &lt;Grid HorizontalAlignment="Right" VerticalAlignment="Top"&gt;<br />             &lt;Button x:Name="btnSelectFile" Content="Add File" Width="75" Height="30" Click="btnSelectFile_Click"&gt;&lt;/Button&gt;<br />         &lt;/Grid&gt;<br />     &lt;/Grid&gt;<br /> &lt;/UserControl&gt;

**Page.xaml.cs file** 

[code:c#]

using System.Windows;<br /> using System.Windows.Controls;<br /> using System.IO;

namespace SilverlightOpenFileTest<br /> {<br />     public partial class Page : UserControl<br />     {<br />         public Page()<br />         {<br />             InitializeComponent();<br />         }

        private void btnSelectFile_Click(object sender, RoutedEventArgs e)<br />         {<br />             OpenFileDialog fileDialog = new OpenFileDialog();

            // Show the Open File Dialog<br />             DialogResult result = fileDialog.ShowDialog();

            // Open the file if OK was clicked in the dialog<br />             if (result == DialogResult.OK)<br />             {<br />                 FileDialogFileInfo fi = fileDialog.SelectedFile;<br />                 Stream s = fi.OpenRead();<br />                 StreamReader reader = new StreamReader(s);<br />                 txtFile.Text = reader.ReadToEnd();<br />             }<br />         }<br />     }<br /> }

```

Now isn't that simple? I wonder if they'll ever add the SaveFileDialog...
