---
layout: post
blogengineid: bbbd744b-f793-45ce-9036-a6518b5f7db8
title: "C#: Flash Window in Taskbar via Win32 FlashWindowEx"
date: 2009-01-26 23:19:00 -0600
comments: true
published: true
categories: ["C#", "Win32"]
tags: ["Win32API"]
redirect_from: 
  - /post/2009/01/26/CSharp-Flash-Window-in-Taskbar-via-Win32-FlashWindowEx.aspx
  - /post/2009/01/26/CSharp-Flash-Window-in-Taskbar-via-Win32-FlashWindowEx
  - /post/2009/01/26/csharp-flash-window-in-taskbar-via-win32-flashwindowex
  - /post.aspx?id=bbbd744b-f793-45ce-9036-a6518b5f7db8
---
<!-- more -->

The Windows API (Win32) has the FlashWindowEx method within the User32 library; this method allows you (the developer) to Flash a Window, signifying to the user that some major event occurred within the application that requires their attention. The most common use of this is to flash the window until the user returns focus to the application. However, you can also flash the window a specified number of times, or just keep flashing it until you decide when to stop.

The use of the FlashWindowEx method however isn't built into the .NET Framework anywhere. In order to access it you need to use the Platform Invoke (PInvoke) features of .NET to "drop" down to the Windows API (Win32) and call it directly. Also, as with many other functionalities in the Windows API (that aren't directly exposed by .NET) the FlashWindowEx method can be a little tricky to use if you aren't familiar with working with the Windows API from within .NET.

Now rather than go too deep into the specifics of PInvoke or the Win32 FlashWindowEx method, below is a simple static class in C# that allows you to easily utilize this method. There is actually quite a bit of information needed to explain how to use PInvoke to utilize the Windows API (Win32), so maybe I'll cover that in a future article.

Here's some example usage of this static class:

```CSharp
// One this to note with this example usage code, is the "this" keyword is referring to
// the current System.Windows.Forms.Form.

// Flash window until it recieves focus
FlashWindow.Flash(this);

// Flash window 5 times
FlashWindow.Flash(this, 5);

// Start Flashing "Indefinately"
FlashWindow.Start(this);

// Stop the "Indefinate" Flashing
FlashWindow.Stop(this);
```

One thing to note about the FlashWindowEx method is that it requires (and will only work on) Windows 2000 or later.

Here's the code for the static class in C#:

```csharp
public static class FlashWindow
{
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static extern bool FlashWindowEx(ref FLASHWINFO pwfi);

    [StructLayout(LayoutKind.Sequential)]
    private struct FLASHWINFO
    {
        /// <summary>
        /// The size of the structure in bytes.
        /// </summary>
        public uint cbSize;
        /// <summary>
        /// A Handle to the Window to be Flashed. The window can be either opened or minimized.
        /// </summary>
        public IntPtr hwnd;
        /// <summary>
        /// The Flash Status.
        /// </summary>
        public uint dwFlags;
        /// <summary>
        /// The number of times to Flash the window.
        /// </summary>
        public uint uCount;
        /// <summary>
        /// The rate at which the Window is to be flashed, in milliseconds. If Zero, the function uses the default cursor blink rate.
        /// </summary>
        public uint dwTimeout;
    }

    /// <summary>
    /// Stop flashing. The system restores the window to its original stae.
    /// </summary>
    public const uint FLASHW_STOP = 0;
   
    /// <summary>
    /// Flash the window caption.
    /// </summary>
    public const uint FLASHW_CAPTION = 1;
   
    /// <summary>
    /// Flash the taskbar button.
    /// </summary>
    public const uint FLASHW_TRAY = 2;
   
    /// <summary>
    /// Flash both the window caption and taskbar button.
    /// This is equivalent to setting the FLASHW_CAPTION | FLASHW_TRAY flags.
    /// </summary>
    public const uint FLASHW_ALL = 3;

    /// <summary>
    /// Flash continuously, until the FLASHW_STOP flag is set.
    /// </summary>
    public const uint FLASHW_TIMER = 4;

    /// <summary>
    /// Flash continuously until the window comes to the foreground.
    /// </summary>
    public const uint FLASHW_TIMERNOFG = 12;


    /// <summary>
    /// Flash the spacified Window (Form) until it recieves focus.
    /// </summary>
    /// <param name="form">The Form (Window) to Flash.</param>
    /// <returns></returns>
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

    /// <summary>
    /// Flash the specified Window (form) for the specified number of times
    /// </summary>
    /// <param name="form">The Form (Window) to Flash.</param>
    /// <param name="count">The number of times to Flash.</param>
    /// <returns></returns>
    public static bool Flash(System.Windows.Forms.Form form, uint count)
    {
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_ALL, count, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    /// <summary>
    /// Start Flashing the specified Window (form)
    /// </summary>
    /// <param name="form">The Form (Window) to Flash.</param>
    /// <returns></returns>
    public static bool Start(System.Windows.Forms.Form form)
    {
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_ALL, uint.MaxValue, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    /// <summary>
    /// Stop Flashing the specified Window (form)
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public static bool Stop(System.Windows.Forms.Form form)
    {
        if (Win2000OrLater)
        {
            FLASHWINFO fi = Create_FLASHWINFO(form.Handle, FLASHW_STOP, uint.MaxValue, 0);
            return FlashWindowEx(ref fi);
        }
        return false;
    }

    /// <summary>
    /// A boolean value indicating whether the application is running on Windows 2000 or later.
    /// </summary>
    private static bool Win2000OrLater
    {
        get { return System.Environment.OSVersion.Version.Major >= 5; }
    }
}
```
