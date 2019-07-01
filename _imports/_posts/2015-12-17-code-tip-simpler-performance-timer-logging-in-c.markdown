  ---
  layout: post
  title: "Code Tip: Simpler Performance Timer Logging in C#"
  date: 2015-12-17 18:02:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["C#"]
  alias: ["/post/2015/12/17/Code-Tip-Simpler-Performance-Timer-Logging-in-C", "/post/2015/12/17/code-tip-simpler-performance-timer-logging-in-c"]
  ---
<!-- more -->
<p>At this point application logging is pretty trivial as there are tons of logging libraries available for use. However, logging of performance timing is a bit ambiguous. There are many ways to do it, and one of the most common is to use the <em>System.Diagnostics.Stopwatch</em> class. Rather, than just embed the&nbsp;<em>Stopwatch</em> class code within and mixed with your application code; in this post I'll cover a more graceful approach to using a simple class along with the C#&nbsp;<em>using&nbsp;</em>keyword. If you're familiar with the MiniProfiler project, then you'll already be familiar with this type of class / usage.</p>
<p>Here's a quick example of gathering simple performance timing using the&nbsp;<em>Stopwatch</em> class:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System.Diagnostics;

var timer = new Stopwatch();
timer.Start();

// do something you want to profile

timer.Stop();
var ms = timer.ElapsedMilliseconds;

// write timing to logs</pre>
<p><em>&nbsp;</em></p>
<p>While&nbsp;the above example is fairly simple, your code can start to get messy. So, lets make it better by encapsulating it into a special class to make it as easy to use as possible.<em><br /></em></p>
<p>First, here's the usage example of the performance timing logging class that will be listed below:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using (new PerfTimerLogger("name of code being profiled"))
{
    // do something you want to profile
}</pre>
<p>Now, as you can see the above code is MUCH simpler to implement within your code and not very intrusive. Basically, 2 lines of code, instead of 4; and not extra variables to keep track of.</p>
<p>Here's an implementation of the PerfTimerLogger class that allows it to be used as the above example demonstrates:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System.Diagnostics;

public class PerfTimerLogger : IDisposable
{
    public PerfTimerLogger(string message)
    {
        this._message = message;
        this._timer = new Stopwatch();
        this._timer.Start();
    }

    string _message;
    Stopwatch _timer;

    public void Dispose()
    {
        this._timer.Stop();
        var ms = this._timer.ElapsedMilliseconds;

        // log the performance timing with the Logging library of your choice
        // Example:
        // Logger.Write(
        //     string.Format("{0} - Elapsed Milliseconds: {1}", this._message, ms)
        // );
    }
}</pre>
<p>The way this class works the way it does is coupled with how the&nbsp;<em>using</em> keyword and&nbsp;<em>Disposable</em> work together under the covers in the .NET CLI. In order to use the&nbsp;<em>using</em> keyword the class needs to implement I<em>Disposable.</em>&nbsp;When the code exits the scope of the block of code within the&nbsp;<em>using&nbsp;</em>statement, the CLI and Garbage Collector immediately calls the&nbsp;<em>Dispose</em> method on the object and cleans up the memory usage of that object. Because the&nbsp;<em>using&nbsp;</em>statement functions this way allows for any class, such as PerfTimerLogger, to be able to "know" when it's exactly instantiated as well as finished being used; disposed.</p>
<p>Hope this simple tips either helps you implement better logging infrastructure within your applications, or just gives you a better understanding of how the insides of the .NET Framework function.</p>
