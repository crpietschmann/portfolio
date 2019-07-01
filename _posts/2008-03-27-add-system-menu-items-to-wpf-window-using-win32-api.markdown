---
layout: post
blogengineid: 10e7b7af-f0d0-44c6-ad55-770c67e357d9
title: "Add System Menu Items to WPF Window using Win32 API"
date: 2008-03-27 16:41:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Win32API"]
redirect_from: 
  - /post/2008/03/27/Add-System-Menu-Items-to-WPF-Window-using-Win32-API
  - /post/2008/03/27/add-system-menu-items-to-wpf-window-using-win32-api
  - /post.aspx?id=10e7b7af-f0d0-44c6-ad55-770c67e357d9
---
<!-- more -->

A couple weeks ago, I blog how to "<a href="/post/2008/03/Add-System-Menu-Items-to-a-Form-using-Windows-API.aspx">Add System Menu Items to a Form using Windows API</a>". Being that WPF has it's differences from Windows Forms, I began to wonder how simple or difficult this would be to do within a WPF application. As it turns out, there are a couple of extra things you need to do, but the code is pretty much the same.

This is something I used to have a code snippet for in VB6, but I haven't needed to do this in a while so I never wrote up an example in .NET. So, here's the simple code necessary to add some custom menu items to your applications System Menu within a WPF application. If you're not familiar, the System Menu is the menu that shows up if you click on the apps icon in the upper left or if you right click the app in the taskbar.

Below is a screenshot of it in action along with the complete source code in C#.

<img src="/images/postsWPF_Add_System_Menu_Items.png" alt="" width="315" height="313" />

[code:c#]

using System;<br />using System.Windows;<br />using System.Runtime.InteropServices;<br />using System.Windows.Interop;

namespace WpfApplication3<br />{<br />    /// &lt;summary&gt;<br />    /// Interaction logic for Window1.xaml<br />    /// &lt;/summary&gt;<br />    public partial class Window1 : Window<br />    {<br />        #region Win32 API Stuff

        // Define the Win32 API methods we are going to use<br />        [DllImport("user32.dll")]<br />        private static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);

        [DllImport("user32.dll")]<br />        private static extern bool InsertMenu(IntPtr hMenu, Int32 wPosition, Int32 wFlags, Int32 wIDNewItem, string lpNewItem);

        /// Define our Constants we will use<br />        public const Int32 WM_SYSCOMMAND = 0x112;<br />        public const Int32 MF_SEPARATOR = 0x800;<br />        public const Int32 MF_BYPOSITION = 0x400;<br />        public const Int32 MF_STRING = 0x0;

        #endregion

        // The constants we'll use to identify our custom system menu items<br />        public const Int32 _SettingsSysMenuID = 1000;<br />        public const Int32 _AboutSysMenuID = 1001;

        /// &lt;summary&gt;<br />        /// This is the Win32 Interop Handle for this Window<br />        /// &lt;/summary&gt;<br />        public IntPtr Handle<br />        {<br />            get<br />            {<br />                return new WindowInteropHelper(this).Handle;<br />            }<br />        }

        public Window1()<br />        {<br />            InitializeComponent();

            this.Loaded += new RoutedEventHandler(Window1_Loaded);<br />        }

        private void Window1_Loaded(object sender, RoutedEventArgs e)<br />        {<br />            /// Get the Handle for the Forms System Menu<br />            IntPtr systemMenuHandle = GetSystemMenu(this.Handle, false);

            /// Create our new System Menu items just before the Close menu item<br />            InsertMenu(systemMenuHandle, 5, MF_BYPOSITION | MF_SEPARATOR, 0, string.Empty); // &lt;-- Add a menu seperator<br />            InsertMenu(systemMenuHandle, 6, MF_BYPOSITION, _SettingsSysMenuID, "Settings...");<br />            InsertMenu(systemMenuHandle, 7, MF_BYPOSITION, _AboutSysMenuID, "About...");

            // Attach our WndProc handler to this Window<br />            HwndSource source = HwndSource.FromHwnd(this.Handle);<br />            source.AddHook(new HwndSourceHook(WndProc));<br />        }

        private static IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)<br />        {<br />            // Check if a System Command has been executed<br />            if (msg == WM_SYSCOMMAND)<br />            {<br />                // Execute the appropriate code for the System Menu item that was clicked<br />                switch (wParam.ToInt32())<br />                {<br />                    case _SettingsSysMenuID:<br />                        MessageBox.Show("\"Settings\" was clicked");<br />                        handled = true;<br />                        break;<br />                    case _AboutSysMenuID:<br />                        MessageBox.Show("\"About\" was clicked");<br />                        handled = true;<br />                        break;<br />                }<br />            }

            return IntPtr.Zero;<br />        }<br />    }<br />}

```
