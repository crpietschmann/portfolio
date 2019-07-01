---
layout: post
title: "C#: Using IProgressDialog to show a “native” Progress Dialog from .NET in Windows"
date: 2009-08-17 20:03:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Win32API"]
redirect_from: 
  - /post/2009/08/17/CSharp-IProgressDialog-Show-Native-Progress-Dialog-from-dotNet-in-Windows
 -  /post/2009/08/17/csharp-iprogressdialog-show-native-progress-dialog-from-dotnet-in-windows
---
<!-- more -->
<p><a href="/images/postsCSharp-IProgressDialog-Native-dotNet-in-Windows.png"><img style="border-bottom: 0px; border-left: 0px; display: inline; margin-left: 0px; border-top: 0px; margin-right: 0px; border-right: 0px" title="CSharp-IProgressDialog-Native-dotNet-in-Windows" src="/images/postsCSharp-IProgressDialog-Native-dotNet-in-Windows_thumb.png" border="0" alt="CSharp-IProgressDialog-Native-dotNet-in-Windows" width="260" height="215" align="right" /></a> A <a href="/post.aspx?id=d76a12f5-9ead-4847-b21a-be221e790681" target="_blank">few months ago I posted some code that I originally wrote back in about 2004</a>&hellip; Well, I was looking through some more of my prototypes that I&rsquo;ve written and I came across the following example of how to use the <a href="http://msdn.microsoft.com/en-us/library/bb775248%28VS.85%29.aspx" target="_blank">IProgressDialog Win32 Interface</a> to harness the power of the Built-in Progress Dialog in Windows within your own .NET applications.</p>
<p>I have test this on WIndows 7, but it should work as expected on Windows XP and Vista. The MSDN Documentation for IProgressDialog says it&rsquo;s minimum supported operating systems are Windows 2000 and Windows XP.</p>
<p>The full source code for this example is listed below. Just copy from this post and paste it within your app to test.</p>
<h3>&ldquo;ProgressDialog&rdquo; Usage Example</h3>
<p>Here&rsquo;s an example of how to use this example &ldquo;ProgressDialog&rdquo; class: This is an example of using it from Windows Forms, however it could be used from within WPF exactly the same way.</p>
<pre class="csharpcode"><span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Windows.Forms;

<span class="kwrd">namespace</span> WindowsProgressDialog
{
    <span class="kwrd">public</span> <span class="kwrd">partial</span> <span class="kwrd">class</span> Form1 : Form
    {
        <span class="kwrd">public</span> Form1()
        {
            InitializeComponent();
        }

        <span class="kwrd">private</span> Pietschsoft.ProgressDialog pd;
        <span class="kwrd">private</span> <span class="kwrd">uint</span> progressPercent;

        <span class="kwrd">private</span> <span class="kwrd">void</span> button1_Click(<span class="kwrd">object</span> sender, EventArgs e)
        {
            pd = <span class="kwrd">new</span> Pietschsoft.ProgressDialog(<span class="kwrd">this</span>.Handle);
            pd.Title = <span class="str">"Performing Operation"</span>;
            pd.CancelMessage = <span class="str">"Please wait while the operation is cancelled"</span>;
            pd.Maximum = 100;
            pd.Value = 0;
            pd.Line1 = <span class="str">"Line One"</span>;
            pd.Line3 = <span class="str">"Calculating Time Remaining..."</span>;
            
            <span class="rem">//pd.ShowDialog(); // Defaults to PROGDLG.Normal</span>
            pd.ShowDialog(Pietschsoft.ProgressDialog.PROGDLG.Modal, Pietschsoft.ProgressDialog.PROGDLG.AutoTime, Pietschsoft.ProgressDialog.PROGDLG.NoMinimize);

            progressPercent = 0;
            timer1.Start();
        }

        <span class="kwrd">private</span> <span class="kwrd">void</span> timer1_Tick(<span class="kwrd">object</span> sender, EventArgs e)
        {
            progressPercent++;

            <span class="kwrd">if</span> (pd.HasUserCancelled)
            {
                timer1.Stop();
                pd.CloseDialog();
            }
            <span class="kwrd">else</span>
            {
                <span class="rem">// Update the progress value</span>
                pd.Value = progressPercent;

                pd.Line2 = <span class="str">"Percent "</span> + progressPercent.ToString() + <span class="str">"%"</span>;

                <span class="kwrd">if</span> (progressPercent &gt;= 100)
                {
                    timer1.Stop();
                    pd.CloseDialog();
                }
            }
        }
    }
}</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<h3>&nbsp;</h3>
<h3>&ldquo;ProgressDialog&rdquo; Class</h3>
<p>And, here&rsquo;s the full code for the &ldquo;ProgressDialog&rdquo; class itself:</p>
<pre class="csharpcode"><span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Runtime.InteropServices;
<span class="kwrd">using</span> System.Text;

<span class="kwrd">namespace</span> Pietschsoft
{
    <span class="kwrd">public</span> <span class="kwrd">class</span> ProgressDialog
    {
        <span class="kwrd">private</span> IntPtr _parentHandle;

        <span class="kwrd">private</span> Win32IProgressDialog pd = <span class="kwrd">null</span>;

        <span class="kwrd">public</span> ProgressDialog(IntPtr parentHandle)
        {
            <span class="kwrd">this</span>._parentHandle = parentHandle;
        }

        <span class="kwrd">public</span> <span class="kwrd">void</span> ShowDialog(<span class="kwrd">params</span> PROGDLG[] flags)
        {
            <span class="kwrd">if</span> (pd == <span class="kwrd">null</span>)
            {
                pd = (Win32IProgressDialog)<span class="kwrd">new</span> Win32ProgressDialog();
                
                pd.SetTitle(<span class="kwrd">this</span>._Title);
                pd.SetCancelMsg(<span class="kwrd">this</span>._CancelMessage, <span class="kwrd">null</span>);
                pd.SetLine(1, <span class="kwrd">this</span>._Line1, <span class="kwrd">false</span>, IntPtr.Zero);
                pd.SetLine(2, <span class="kwrd">this</span>._Line2, <span class="kwrd">false</span>, IntPtr.Zero);
                pd.SetLine(3, <span class="kwrd">this</span>._Line3, <span class="kwrd">false</span>, IntPtr.Zero);

                PROGDLG dialogFlags = PROGDLG.Normal;
                <span class="kwrd">if</span> (flags.Length != 0)
                {
                    dialogFlags = flags[0];
                    <span class="kwrd">for</span> (var i = 1; i &lt; flags.Length; i++)
                    {
                        dialogFlags = dialogFlags | flags[i];
                    }
                }
                
                pd.StartProgressDialog(<span class="kwrd">this</span>._parentHandle, <span class="kwrd">null</span>, dialogFlags, IntPtr.Zero);
            }
        }

        <span class="kwrd">public</span> <span class="kwrd">void</span> CloseDialog()
        {
            <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
            {
                pd.StopProgressDialog();
                <span class="rem">//Marshal.ReleaseComObject(pd);</span>
                pd = <span class="kwrd">null</span>;
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">string</span> _Title = <span class="kwrd">string</span>.Empty;
        <span class="kwrd">public</span> <span class="kwrd">string</span> Title
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._Title;
            }
            set
            {
                <span class="kwrd">this</span>._Title = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetTitle(<span class="kwrd">this</span>._Title);
                }
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">string</span> _CancelMessage = <span class="kwrd">string</span>.Empty;
        <span class="kwrd">public</span> <span class="kwrd">string</span> CancelMessage
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._CancelMessage;
            }
            set
            {
                <span class="kwrd">this</span>._CancelMessage = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetCancelMsg(<span class="kwrd">this</span>._CancelMessage, <span class="kwrd">null</span>);
                }
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">string</span> _Line1 = <span class="kwrd">string</span>.Empty;
        <span class="kwrd">public</span> <span class="kwrd">string</span> Line1
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._Line1;
            }
            set
            {
                <span class="kwrd">this</span>._Line1 = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetLine(1, <span class="kwrd">this</span>._Line1, <span class="kwrd">false</span>, IntPtr.Zero);
                }
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">string</span> _Line2 = <span class="kwrd">string</span>.Empty;
        <span class="kwrd">public</span> <span class="kwrd">string</span> Line2
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._Line2;
            }
            set
            {
                <span class="kwrd">this</span>._Line2 = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetLine(2, <span class="kwrd">this</span>._Line2, <span class="kwrd">false</span>, IntPtr.Zero);
                }
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">string</span> _Line3 = <span class="kwrd">string</span>.Empty;
        <span class="kwrd">public</span> <span class="kwrd">string</span> Line3
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._Line3;
            }
            set
            {
                <span class="kwrd">this</span>._Line3 = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetLine(3, <span class="kwrd">this</span>._Line3, <span class="kwrd">false</span>, IntPtr.Zero);
                }
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">uint</span> _value = 0;
        <span class="kwrd">public</span> <span class="kwrd">uint</span> Value
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._value;
            }
            set
            {
                <span class="kwrd">this</span>._value = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetProgress(<span class="kwrd">this</span>._value, <span class="kwrd">this</span>._maximum);
                }
            }
        }

        <span class="kwrd">private</span> <span class="kwrd">uint</span> _maximum = 100;
        <span class="kwrd">public</span> <span class="kwrd">uint</span> Maximum
        {
            get
            {
                <span class="kwrd">return</span> <span class="kwrd">this</span>._maximum;
            }
            set
            {
                <span class="kwrd">this</span>._maximum = <span class="kwrd">value</span>;
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    pd.SetProgress(<span class="kwrd">this</span>._value, <span class="kwrd">this</span>._maximum);
                }
            }
        }
        <span class="kwrd">public</span> <span class="kwrd">bool</span> HasUserCancelled
        {
            get
            {
                <span class="kwrd">if</span> (pd != <span class="kwrd">null</span>)
                {
                    <span class="kwrd">return</span> pd.HasUserCancelled();
                }
                <span class="kwrd">else</span>
                    <span class="kwrd">return</span> <span class="kwrd">false</span>;
            }
        }

        <span class="preproc">#region</span> <span class="str">"Win32 Stuff"</span>
        <span class="rem">// The below was copied from: http://pinvoke.net/default.aspx/Interfaces/IProgressDialog.html</span>

        <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">class</span> shlwapi
        {
            [DllImport(<span class="str">"shlwapi.dll"</span>, CharSet = CharSet.Auto)]
            <span class="kwrd">static</span> <span class="kwrd">extern</span> <span class="kwrd">bool</span> PathCompactPath(IntPtr hDC, [In, Out] StringBuilder pszPath, <span class="kwrd">int</span> dx);
        }

        [ComImport]
        [Guid(<span class="str">"EBBC7C04-315E-11d2-B62F-006097DF5BD4"</span>)]
        [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
        <span class="kwrd">public</span> <span class="kwrd">interface</span> Win32IProgressDialog
        {
            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Starts the progress dialog box.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="hwndParent"&gt;A handle to the dialog box's parent window.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="punkEnableModless"&gt;Reserved. Set to null.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="dwFlags"&gt;Flags that control the operation of the progress dialog box. &lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="pvResevered"&gt;Reserved. Set to IntPtr.Zero&lt;/param&gt;</span>
            <span class="kwrd">void</span> StartProgressDialog(
                IntPtr hwndParent, <span class="rem">//HWND</span>
                [MarshalAs(UnmanagedType.IUnknown)]    <span class="kwrd">object</span> punkEnableModless, <span class="rem">//IUnknown</span>
                PROGDLG dwFlags,  <span class="rem">//DWORD</span>
                IntPtr pvResevered <span class="rem">//LPCVOID</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Stops the progress dialog box and removes it from the screen.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="kwrd">void</span> StopProgressDialog();

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Sets the title of the progress dialog box.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="pwzTitle"&gt;A pointer to a null-terminated Unicode string that contains the dialog box title.&lt;/param&gt;</span>
            <span class="kwrd">void</span> SetTitle(
                [MarshalAs(UnmanagedType.LPWStr)] <span class="kwrd">string</span> pwzTitle <span class="rem">//LPCWSTR</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Specifies an Audio-Video Interleaved (AVI) clip that runs in the dialog box. Note: Note  This method is not supported in Windows Vista or later versions.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="hInstAnimation"&gt;An instance handle to the module from which the AVI resource should be loaded.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="idAnimation"&gt;An AVI resource identifier. To create this value, use the MAKEINTRESOURCE macro. The control loads the AVI resource from the module specified by hInstAnimation.&lt;/param&gt;</span>
            <span class="kwrd">void</span> SetAnimation(
                IntPtr hInstAnimation, <span class="rem">//HINSTANCE</span>
                <span class="kwrd">ushort</span> idAnimation <span class="rem">//UINT</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Checks whether the user has canceled the operation.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;returns&gt;TRUE if the user has cancelled the operation; otherwise, FALSE.&lt;/returns&gt;</span>
            <span class="rem">/// &lt;remarks&gt;</span>
            <span class="rem">/// The system does not send a message to the application when the user clicks the Cancel button.</span>
            <span class="rem">/// You must periodically use this function to poll the progress dialog box object to determine</span>
            <span class="rem">/// whether the operation has been canceled.</span>
            <span class="rem">/// &lt;/remarks&gt;</span>
            [PreserveSig]
            [<span class="kwrd">return</span>: MarshalAs(UnmanagedType.Bool)]
            <span class="kwrd">bool</span> HasUserCancelled();

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Updates the progress dialog box with the current state of the operation.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="dwCompleted"&gt;An application-defined value that indicates what proportion of the operation has been completed at the time the method was called.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="dwTotal"&gt;An application-defined value that specifies what value dwCompleted will have when the operation is complete.&lt;/param&gt;</span>
            <span class="kwrd">void</span> SetProgress(
                <span class="kwrd">uint</span> dwCompleted, <span class="rem">//DWORD</span>
                <span class="kwrd">uint</span> dwTotal <span class="rem">//DWORD</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Updates the progress dialog box with the current state of the operation.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="ullCompleted"&gt;An application-defined value that indicates what proportion of the operation has been completed at the time the method was called.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="ullTotal"&gt;An application-defined value that specifies what value ullCompleted will have when the operation is complete.&lt;/param&gt;</span>
            <span class="kwrd">void</span> SetProgress64(
                <span class="kwrd">ulong</span> ullCompleted, <span class="rem">//ULONGLONG</span>
                <span class="kwrd">ulong</span> ullTotal <span class="rem">//ULONGLONG</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Displays a message in the progress dialog.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="dwLineNum"&gt;The line number on which the text is to be displayed. Currently there are three lines&mdash;1, 2, and 3. If the PROGDLG_AUTOTIME flag was included in the dwFlags parameter when IProgressDialog::StartProgressDialog was called, only lines 1 and 2 can be used. The estimated time will be displayed on line 3.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="pwzString"&gt;A null-terminated Unicode string that contains the text.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="fCompactPath"&gt;TRUE to have path strings compacted if they are too large to fit on a line. The paths are compacted with PathCompactPath.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="pvResevered"&gt; Reserved. Set to IntPtr.Zero.&lt;/param&gt;</span>
            <span class="rem">/// &lt;remarks&gt;This function is typically used to display a message such as "Item XXX is now being processed." typically, messages are displayed on lines 1 and 2, with line 3 reserved for the estimated time.&lt;/remarks&gt;</span>
            <span class="kwrd">void</span> SetLine(
                <span class="kwrd">uint</span> dwLineNum, <span class="rem">//DWORD</span>
                [MarshalAs(UnmanagedType.LPWStr)] <span class="kwrd">string</span> pwzString, <span class="rem">//LPCWSTR</span>
                [MarshalAs(UnmanagedType.VariantBool)] <span class="kwrd">bool</span> fCompactPath, <span class="rem">//BOOL</span>
                IntPtr pvResevered <span class="rem">//LPCVOID</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Sets a message to be displayed if the user cancels the operation.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="pwzCancelMsg"&gt;A pointer to a null-terminated Unicode string that contains the message to be displayed.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="pvResevered"&gt;Reserved. Set to NULL.&lt;/param&gt;</span>
            <span class="rem">/// &lt;remarks&gt;Even though the user clicks Cancel, the application cannot immediately call</span>
            <span class="rem">/// IProgressDialog::StopProgressDialog to close the dialog box. The application must wait until the</span>
            <span class="rem">/// next time it calls IProgressDialog::HasUserCancelled to discover that the user has canceled the</span>
            <span class="rem">/// operation. Since this delay might be significant, the progress dialog box provides the user with</span>
            <span class="rem">/// immediate feedback by clearing text lines 1 and 2 and displaying the cancel message on line 3.</span>
            <span class="rem">/// The message is intended to let the user know that the delay is normal and that the progress dialog</span>
            <span class="rem">/// box will be closed shortly.</span>
            <span class="rem">/// It is typically is set to something like "Please wait while ...". &lt;/remarks&gt;</span>
            <span class="kwrd">void</span> SetCancelMsg(
                [MarshalAs(UnmanagedType.LPWStr)] <span class="kwrd">string</span> pwzCancelMsg, <span class="rem">//LPCWSTR</span>
                <span class="kwrd">object</span> pvResevered <span class="rem">//LPCVOID</span>
                );

            <span class="rem">/// &lt;summary&gt;</span>
            <span class="rem">/// Resets the progress dialog box timer to zero.</span>
            <span class="rem">/// &lt;/summary&gt;</span>
            <span class="rem">/// &lt;param name="dwTimerAction"&gt;Flags that indicate the action to be taken by the timer.&lt;/param&gt;</span>
            <span class="rem">/// &lt;param name="pvResevered"&gt;Reserved. Set to NULL.&lt;/param&gt;</span>
            <span class="rem">/// &lt;remarks&gt;</span>
            <span class="rem">/// The timer is used to estimate the remaining time. It is started when your application</span>
            <span class="rem">/// calls IProgressDialog::StartProgressDialog. Unless your application will start immediately,</span>
            <span class="rem">/// it should call Timer just before starting the operation.</span>
            <span class="rem">/// This practice ensures that the time estimates will be as accurate as possible. This method</span>
            <span class="rem">/// should not be called after the first call to IProgressDialog::SetProgress.&lt;/remarks&gt;</span>
            <span class="kwrd">void</span> Timer(
                PDTIMER dwTimerAction, <span class="rem">//DWORD</span>
                <span class="kwrd">object</span> pvResevered <span class="rem">//LPCVOID</span>
                );

        }

        [ComImport]
        [Guid(<span class="str">"F8383852-FCD3-11d1-A6B9-006097DF5BD4"</span>)]
        <span class="kwrd">public</span> <span class="kwrd">class</span> Win32ProgressDialog
        {
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Flags that indicate the action to be taken by the ProgressDialog.SetTime() method.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="kwrd">public</span> <span class="kwrd">enum</span> PDTIMER : <span class="kwrd">uint</span> <span class="rem">//DWORD</span>
        {
            <span class="rem">/// &lt;summary&gt;Resets the timer to zero. Progress will be calculated from the time this method is called.&lt;/summary&gt;</span>
            Reset = (0x01),
            <span class="rem">/// &lt;summary&gt;Progress has been suspended.&lt;/summary&gt;</span>
            Pause = (0x02),
            <span class="rem">/// &lt;summary&gt;Progress has been resumed.&lt;/summary&gt;</span>
            Resume = (0x03)
        }

        [Flags]
        <span class="kwrd">public</span> <span class="kwrd">enum</span> PROGDLG : <span class="kwrd">uint</span> <span class="rem">//DWORD</span>
        {
            <span class="rem">/// &lt;summary&gt;Normal progress dialog box behavior.&lt;/summary&gt;</span>
            Normal = 0x00000000,
            <span class="rem">/// &lt;summary&gt;The progress dialog box will be modal to the window specified by hwndParent. By default, a progress dialog box is modeless.&lt;/summary&gt;</span>
            Modal = 0x00000001,
            <span class="rem">/// &lt;summary&gt;Automatically estimate the remaining time and display the estimate on line 3. &lt;/summary&gt;</span>
            <span class="rem">/// &lt;remarks&gt;If this flag is set, IProgressDialog::SetLine can be used only to display text on lines 1 and 2.&lt;/remarks&gt;</span>
            AutoTime = 0x00000002,
            <span class="rem">/// &lt;summary&gt;Do not show the "time remaining" text.&lt;/summary&gt;</span>
            NoTime = 0x00000004,
            <span class="rem">/// &lt;summary&gt;Do not display a minimize button on the dialog box's caption bar.&lt;/summary&gt;</span>
            NoMinimize = 0x00000008,
            <span class="rem">/// &lt;summary&gt;Do not display a progress bar.&lt;/summary&gt;</span>
            <span class="rem">/// &lt;remarks&gt;Typically, an application can quantitatively determine how much of the operation remains and periodically pass that value to IProgressDialog::SetProgress. The progress dialog box uses this information to update its progress bar. This flag is typically set when the calling application must wait for an operation to finish, but does not have any quantitative information it can use to update the dialog box.&lt;/remarks&gt;</span>
            NoProgressBar = 0x00000010
        }
        <span class="preproc">#endregion</span>
    }
}</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
