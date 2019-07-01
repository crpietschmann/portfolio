---
layout: post
blogengineid: 482989d9-32d1-4bd1-9692-c0718e4044c1
title: "Add System Menu Items to a Form using Windows API"
date: 2008-03-04 19:34:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Win32API"]
redirect_from: 
  - /post/2008/03/04/Add-System-Menu-Items-to-a-Form-using-Windows-API
  - /post/2008/03/04/add-system-menu-items-to-a-form-using-windows-api
  - /post.aspx?id=482989d9-32d1-4bd1-9692-c0718e4044c1
---
<!-- more -->

This is something I used to have a code snippet for in VB6, but I haven't needed to do this in a while so I never wrote up an example in .NET. So, here's the simple code necessary to add some custom menu items to your applications System Menu. If you're not familiar, the System Menu is the menu that shows up if you click on the apps icon in the upper left or if you right click the app in the taskbar.

Below is a screenshot of it in action along with the complete source code in C#.

<img src="/images/postsWin32API_AddSystemMenuItem.png" alt="" width="301" height="299" />

[code:c#]

using System;<br /> using System.Windows.Forms;<br /> using System.Runtime.InteropServices;

namespace WinFormsSystemMenuTest<br /> {<br />     public partial class Form1 : Form<br />     {<br />         #region Win32 API Stuff

        // Define the Win32 API methods we are going to use<br />         [DllImport("user32.dll")]<br />         private static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);

        [DllImport("user32.dll")]<br />         private static extern bool InsertMenu(IntPtr hMenu, Int32 wPosition, Int32 wFlags, Int32 wIDNewItem, string lpNewItem);

        /// Define our Constants we will use<br />         public const Int32 WM_SYSCOMMAND = 0x112;<br />         public const Int32 MF_SEPARATOR = 0x800;<br />         public const Int32 MF_BYPOSITION = 0x400;<br />         public const Int32 MF_STRING = 0x0;<br />         <br />         #endregion<br />         <br />         // The constants we'll use to identify our custom system menu items<br />         public const Int32 _SettingsSysMenuID = 1000;<br />         public const Int32 _AboutSysMenuID = 1001;

        public Form1()<br />         {<br />             InitializeComponent();<br />         }

        private void Form1_Load(object sender, EventArgs e)<br />         {<br />             /// Get the Handle for the Forms System Menu<br />             IntPtr systemMenuHandle = GetSystemMenu(this.Handle, false);

            /// Create our new System Menu items just before the Close menu item<br />             InsertMenu(systemMenuHandle, 5, MF_BYPOSITION | MF_SEPARATOR, 0, string.Empty); // <-- Add a menu seperator<br />             InsertMenu(systemMenuHandle, 6, MF_BYPOSITION, _SettingsSysMenuID, "Settings...");<br />             InsertMenu(systemMenuHandle, 7, MF_BYPOSITION, _AboutSysMenuID, "About...");<br />         }

        protected override void WndProc(ref Message m)<br />         {<br />             // Check if a System Command has been executed<br />             if (m.Msg == WM_SYSCOMMAND)<br />             {<br />                 // Execute the appropriate code for the System Menu item that was clicked<br />                 switch (m.WParam.ToInt32())<br />                 {<br />                     case _SettingsSysMenuID:<br />                         MessageBox.Show("\"Settings\" was clicked");<br />                         break;<br />                     case _AboutSysMenuID:<br />                         MessageBox.Show("\"About\" was clicked");<br />                         break;<br />                 }<br />             }<br />             <br />             base.WndProc(ref m);<br />         }<br />     }<br /> }

```

Here's a link on how to "<a href="/post/2008/03/Add-System-Menu-Items-to-WPF-Window-using-Win32-API.aspx">Add System Menu Items to WPF Window using Win32 API</a>"
