---
layout: post
title: "C#: Flash Window in Taskbar via Win32 FlashWindowEx"
date: 2009-01-26 23:19:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Win32API"]
redirect_from: 
  - /post/2009/01/26/CSharp-Flash-Window-in-Taskbar-via-Win32-FlashWindowEx
  - /post/2009/01/26/csharp-flash-window-in-taskbar-via-win32-flashwindowex
---
<!-- more -->
<p>The Windows API (Win32) has the FlashWindowEx method within the User32 library; this method allows you (the developer) to Flash a Window, signifying to the user that some major event occurred within the application that requires their attention. The most common use of this is to flash the window until the user returns focus to the application. However, you can also flash the window a specified number of times, or just keep flashing it until you decide when to stop.</p>
<p>The use of the FlashWindowEx method however isn't built into the .NET Framework anywhere. In order to access it you need to use the Platform Invoke (PInvoke) features of .NET to "drop" down to the Windows API (Win32) and call it directly. Also, as with many other functionalities in&nbsp;the Windows API&nbsp;(that aren't directly exposed by .NET) the FlashWindowEx method can be a little tricky to use if you aren't familiar with working with the Windows API from within .NET.</p>
<p>Now rather than go too deep into the specifics of PInvoke or the Win32 FlashWindowEx method, below is a simple static class in C# that allows you to easily utilize this method. There is actually quite a bit of information needed to explain how to use PInvoke to utilize the Windows API (Win32), so maybe I'll cover that in a future article.</p>
<p>Here's some example usage of this static class:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// One this to note with this example usage code, is the "this" keyword is referring to
// the current System.Windows.Forms.Form.

// Flash window until it recieves focus
FlashWindow.Flash(this);

// Flash window 5 times
FlashWindow.Flash(this, 5);

// Start Flashing "Indefinately"
FlashWindow.Start(this);

// Stop the "Indefinate" Flashing
FlashWindow.Stop(this);</pre>
<p>One thing to note about the FlashWindowEx method is that it requires (and will only work on) Windows 2000 or later.</p>
<p>Here's the code for the static class in C#:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public static class FlashWindow
{
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static extern bool FlashWindowEx(ref FLASHWINFO pwfi);

    [StructLayout(LayoutKind.Sequential)]
    private struct FLASHWINFO
    {
        /// &lt;summary&gt;
        /// The size of the structure in bytes.
        /// &lt;/summary&gt;
        public uint cbSize;
        /// &lt;summary&gt;
        /// A Handle to the Window to be Flashed. The window can be either opened or minimized.
        /// &lt;/summary&gt;
        public IntPtr hwnd;
        /// &lt;summary&gt;
        /// The Flash Status.
        /// &lt;/summary&gt;
        public uint dwFlags;
        /// &lt;summary&gt;
        /// The number of times to Flash the window.
        /// &lt;/summary&gt;
        public uint uCount;
        /// &lt;summary&gt;
        /// The rate at which the Window is to be flashed, in milliseconds. If Zero, the function uses the default cursor blink rate.
        /// &lt;/summary&gt;
        public uint dwTimeout;
    }

    /// &lt;summary&gt;
    /// Stop flashing. The system restores the window to its original stae.
    /// &lt;/summary&gt;
    public const uint FLASHW_STOP = 0;
   
    /// &lt;summary&gt;
    /// Flash the window caption.
    /// &lt;/summary&gt;
    public const uint FLASHW_CAPTION = 1;
   
    /// &lt;summary&gt;
    /// Flash the taskbar button.
    /// &lt;/summary&gt;
    public const uint FLASHW_TRAY = 2;
   
    /// &lt;summary&gt;
    /// Flash both the window caption and taskbar button.
    /// This is equivalent to setting the FLASHW_CAPTION | FLASHW_TRAY flags.
    /// &lt;/summary&gt;
    public const uint FLASHW_ALL = 3;

    /// &lt;summary&gt;
    /// Flash continuously, until the FLASHW_STOP flag is set.
    /// &lt;/summary&gt;
    public const uint FLASHW_TIMER = 4;

    /// &lt;summary&gt;
    /// Flash continuously until the window comes to the foreground.
    /// &lt;/summary&gt;
    public const uint FLASHW_TIMERNOFG = 12;


    /// &lt;summary&gt;
    /// Flash the spacified Window (Form) until it recieves focus.
    /// &lt;/summary&gt;
    /// &lt;param name="form"&gt;The Form (Window) to Flash.&lt;/param&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    public static bool Flash(System.Windows.Forms.Form form)
    {
        // Make sure we're running under Windows 2000 or later
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_ALL | FLASHW_TIMERNOFG, uint.MaxValue, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    private static FLASHWINFO Create_FLASHWINFO(IntPtr handle, uint flags, uint count, uint timeout)
    {
        FLASHWINFO fi = new FLASHWINFO();
        fi.cbSize = Convert.ToUInt32(Marshal.SizeOf(fi));
        fi.hwnd = handle;
        fi.dwFlags = flags;
        fi.uCount = count;
        fi.dwTimeout = timeout;
        return fi;
    }

    /// &lt;summary&gt;
    /// Flash the specified Window (form) for the specified number of times
    /// &lt;/summary&gt;
    /// &lt;param name="form"&gt;The Form (Window) to Flash.&lt;/param&gt;
    /// &lt;param name="count"&gt;The number of times to Flash.&lt;/param&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    public static bool Flash(System.Windows.Forms.Form form, uint count)
    {
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_ALL, count, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    /// &lt;summary&gt;
    /// Start Flashing the specified Window (form)
    /// &lt;/summary&gt;
    /// &lt;param name="form"&gt;The Form (Window) to Flash.&lt;/param&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    public static bool Start(System.Windows.Forms.Form form)
    {
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_ALL, uint.MaxValue, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    /// &lt;summary&gt;
    /// Stop Flashing the specified Window (form)
    /// &lt;/summary&gt;
    /// &lt;param name="form"&gt;&lt;/param&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    public static bool Stop(System.Windows.Forms.Form form)
    {
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_STOP, uint.MaxValue, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    /// &lt;summary&gt;
    /// A boolean value indicating whether the application is running on Windows 2000 or later.
    /// &lt;/summary&gt;
    private static bool Win2000OrLater
    {
        get { return System.Environment.OSVersion.Version.Major &gt;= 5; }
    }
}</pre>
