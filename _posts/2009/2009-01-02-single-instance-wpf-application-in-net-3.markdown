---
layout: post
blogengineid: 8a6c0335-37ea-427f-a599-4249230e9c44
title: "Single Instance WPF Application in .NET 3.x"
date: 2009-01-02 20:12:00 -0600
comments: true
published: true
categories: ["WPF", ".NET"]
tags: ["General"]
redirect_from: 
  - /post/2009/01/02/Single-Instance-WPF-Application-in-NET-3.aspx
  - /post/2009/01/02/Single-Instance-WPF-Application-in-NET-3
  - /post/2009/01/02/single-instance-wpf-application-in-net-3
  - /post.aspx?id=8a6c0335-37ea-427f-a599-4249230e9c44
---
<!-- more -->

If you do a search on implementing a Single Instance application in WPF you'll get quite a few results. From what I've seen there are really only 2 solutions. One is really simplistic and the other offers more functionality; both of which are fairly simple to implement.
<h3>Method 1: Checking Existing Processes By Name</h3>

This is the simplest to implement. All you do is check if there is more than 1 running process with the same name as the current process.

Here's the code:
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        // Get Reference to the current Process
        Process thisProc = Process.GetCurrentProcess();
        // Check how many total processes have the same name as the current one
        if (Process.GetProcessesByName(thisProc.ProcessName).Length > 1)
        {
            // If ther is more than one, than it is already running.
            MessageBox.Show("Application is already running.");
            Application.Current.Shutdown();
            return;
        }

        base.OnStartup(e);
    }
}</pre>

Even though this method is very simplistic, it doesn't offer any extended functionality unless you code it yourself. For instance, What happens if you run another instance of your app and pass in different command-line arguments? Well, with this method it just gets killed. The next example allows you to pass in and handle those new command-line arguments from the exising app instance.
<h3>Method 2: Using the WindowsFormsApplicationBase Class</h3>

The Microsoft.VisualBasic.ApplicationServices.WindowsFormsApplicationBase is a "VB.NET" feature that is built into the .NET Framework, but it can be used from any .NET language, such as C#. You just need to add a reference to the Microsoft.VisualBasic.dll in your application.

This method even allow you to handle the command-line arguments that are passed to the "new" instance in the same manor as MS Word so you can open multiple documents while only having a single instance of your application running.

Here's a link to an example on MSDN for using this method: <a href="http://msdn.microsoft.com/en-us/library/ms771662.aspx">http://msdn.microsoft.com/en-us/library/ms771662.aspx</a>

This method is also mentioned in <a title="&quot;Pro WPF in C# 2008&quot; by Matthew MacDonald" href="http://www.amazon.com/Pro-WPF-2008-Presentation-Professionals/dp/1590599551?&amp;camp=212361&amp;linkCode=wey&amp;tag=pietschsoft-20&amp;creative=380729" target="_blank">"Pro WPF in C# 2008" by Matthew MacDonald</a> from Apress. 

Also, here's the main code for using this method for reference:
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">namespace SingleInstanceDetection
{
    public class EntryPoint
    {
        [STAThread]
        public static void Main(string[] args)
        {
            SingleInstanceManager manager = new SingleInstanceManager();
            manager.Run(args);
        }
    }

    // Using VB bits to detect single instances and process accordingly:
    //  * OnStartup is fired when the first instance loads
    //  * OnStartupNextInstance is fired when the application is re-run again
    //    NOTE: it is redirected to this instance thanks to IsSingleInstance
    public class SingleInstanceManager : WindowsFormsApplicationBase
    {
        SingleInstanceApplication app;

        public SingleInstanceManager()
        {
            this.IsSingleInstance = true;
        }

        protected override bool OnStartup(Microsoft.VisualBasic.ApplicationServices.StartupEventArgs e)
        {
            // First time app is launched
            app = new SingleInstanceApplication();
            app.Run();
            return false;
        }

        protected override void OnStartupNextInstance(StartupNextInstanceEventArgs eventArgs)
        {
            // Subsequent launches
            base.OnStartupNextInstance(eventArgs);
            app.Activate();
        }
    }

    public class SingleInstanceApplication : Application
    {
        protected override void OnStartup(System.Windows.StartupEventArgs e)
        {
            base.OnStartup(e);

            // Create and show the application's main window
            MainWindow window = new MainWindow();
            window.Show();
        }

        public void Activate()
        {
            // Reactivate application's main window
            this.MainWindow.Activate();
        }
    }
}</pre>
<h3>Future Framework Support</h3>

There doesn't seem to be any "Single Instance Application" support built into WPF, and I'm not sure if MS is planning on adding any in the next version. At least these two methods work well, get the job done, and are fairly simple to implement using objects that are already backed into the .NET Framework.
