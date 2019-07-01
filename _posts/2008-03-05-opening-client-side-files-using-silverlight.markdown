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

<UserControl x:Class="SilverlightFileSystemInfo.Page"
     xmlns="http://schemas.microsoft.com/client/2007" 
     xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" 
     Width="480">
     <Grid x:Name="LayoutRoot" Background="White">
         <Grid HorizontalAlignment="Left">
             <TextBox x:Name="txtFile" Width="400" Height="250" AcceptsReturn="True" />    
         </Grid>
         <Grid HorizontalAlignment="Right" VerticalAlignment="Top">
             <Button x:Name="btnSelectFile" Content="Add File" Width="75" Height="30" Click="btnSelectFile_Click"></Button>
         </Grid>
     </Grid>
 </UserControl>

**Page.xaml.cs file** 

[code:c#]

using System.Windows;
 using System.Windows.Controls;
 using System.IO;

namespace SilverlightOpenFileTest
 {
     public partial class Page : UserControl
     {
         public Page()
         {
             InitializeComponent();
         }

        private void btnSelectFile_Click(object sender, RoutedEventArgs e)
         {
             OpenFileDialog fileDialog = new OpenFileDialog();

            // Show the Open File Dialog
             DialogResult result = fileDialog.ShowDialog();

            // Open the file if OK was clicked in the dialog
             if (result == DialogResult.OK)
             {
                 FileDialogFileInfo fi = fileDialog.SelectedFile;
                 Stream s = fi.OpenRead();
                 StreamReader reader = new StreamReader(s);
                 txtFile.Text = reader.ReadToEnd();
             }
         }
     }
 }

```

Now isn't that simple? I wonder if they'll ever add the SaveFileDialog...
