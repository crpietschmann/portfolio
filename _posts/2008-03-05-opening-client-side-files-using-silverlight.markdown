---
layout: post
title: "Opening Client-Side Files using Silverlight"
date: 2008-03-05 23:09:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/05/Opening-Client-Side-Files-using-Silverlight
 -  /post/2008/03/05/opening-client-side-files-using-silverlight
---
<!-- more -->
<p>Silverlight does not have direct access to the local file system for security reasons. However, you can still prompt the user to select a specific file to open using the OpenFileDialog similarly to how you do in .NET. Here's some basic code that demonstrates opening&nbsp;a user specified file using Silverlight 2 Beta 1.</p>
<p>This basic example opens up a user specified file, and displays its contents within a textbox.</p>
<p><strong>Page.xaml file</strong></p>
<p>&lt;UserControl x:Class="SilverlightFileSystemInfo.Page"<br /> &nbsp;&nbsp;&nbsp; xmlns="http://schemas.microsoft.com/client/2007" <br /> &nbsp;&nbsp;&nbsp; xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" <br /> &nbsp;&nbsp;&nbsp; Width="480"&gt;<br /> &nbsp;&nbsp;&nbsp; &lt;Grid x:Name="LayoutRoot" Background="White"&gt;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Grid HorizontalAlignment="Left"&gt;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TextBox x:Name="txtFile" Width="400" Height="250" AcceptsReturn="True" /&gt;&nbsp;&nbsp;&nbsp; <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/Grid&gt;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Grid HorizontalAlignment="Right" VerticalAlignment="Top"&gt;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Button x:Name="btnSelectFile" Content="Add File" Width="75" Height="30" Click="btnSelectFile_Click"&gt;&lt;/Button&gt;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/Grid&gt;<br /> &nbsp;&nbsp;&nbsp; &lt;/Grid&gt;<br /> &lt;/UserControl&gt;</p>
<p><strong>Page.xaml.cs file</strong>&nbsp;</p>
<p>[code:c#]</p>
<p>using System.Windows;<br /> using System.Windows.Controls;<br /> using System.IO;</p>
<p>namespace SilverlightOpenFileTest<br /> {<br /> &nbsp;&nbsp;&nbsp; public partial class Page : UserControl<br /> &nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public Page()<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InitializeComponent();<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; private void btnSelectFile_Click(object sender, RoutedEventArgs e)<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OpenFileDialog fileDialog = new OpenFileDialog();</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Show the Open File Dialog<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DialogResult result = fileDialog.ShowDialog();</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Open the file if OK was clicked in the dialog<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (result == DialogResult.OK)<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FileDialogFileInfo fi = fileDialog.SelectedFile;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stream s = fi.OpenRead();<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; StreamReader reader = new StreamReader(s);<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; txtFile.Text = reader.ReadToEnd();<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /> &nbsp;&nbsp;&nbsp; }<br /> }</p>
<p>[/code]</p>
<p>Now isn't that simple? I wonder if they'll ever add the SaveFileDialog...</p>
