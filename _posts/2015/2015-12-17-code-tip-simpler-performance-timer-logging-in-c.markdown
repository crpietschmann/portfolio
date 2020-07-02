---
layout: post
blogengineid: 1222502c-69d2-476d-ba6f-9bf22a8946e1
title: "Code Tip: Simpler Performance Timer Logging in C#"
date: 2015-12-17 18:02:00 -0600
comments: true
published: true
categories: ["C#", "Visual Studio", ".NET"]
tags: ["C#"]
redirect_from: 
  - /post/2015/12/17/Code-Tip-Simpler-Performance-Timer-Logging-in-C.aspx
  - /post/2015/12/17/Code-Tip-Simpler-Performance-Timer-Logging-in-C
  - /post/2015/12/17/code-tip-simpler-performance-timer-logging-in-c
  - /post.aspx?id=1222502c-69d2-476d-ba6f-9bf22a8946e1
---
<!-- more -->

At this point application logging is pretty trivial as there are tons of logging libraries available for use. However, logging of performance timing is a bit ambiguous. There are many ways to do it, and one of the most common is to use the *System.Diagnostics.Stopwatch* class. Rather, than just embed the *Stopwatch* class code within and mixed with your application code; in this post I'll cover a more graceful approach to using a simple class along with the C# *using *keyword. If you're familiar with the MiniProfiler project, then you'll already be familiar with this type of class / usage.

Here's a quick example of gathering simple performance timing using the *Stopwatch* class:

```csharp
using System.Diagnostics;

var timer = new Stopwatch();
timer.Start();

// do something you want to profile

timer.Stop();
var ms = timer.ElapsedMilliseconds;

// write timing to logs
```

While the above example is fairly simple, your code can start to get messy. So, lets make it better by encapsulating it into a special class to make it as easy to use as possible.*

First, here's the usage example of the performance timing logging class that will be listed below:

```csharp
using (new PerfTimerLogger("name of code being profiled"))
{
    // do something you want to profile
}
```

Now, as you can see the above code is MUCH simpler to implement within your code and not very intrusive. Basically, 2 lines of code, instead of 4; and not extra variables to keep track of.

Here's an implementation of the PerfTimerLogger class that allows it to be used as the above example demonstrates:

```csharp
using System.Diagnostics;

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
}
```

The way this class works the way it does is coupled with how the *using* keyword and *Disposable* work together under the covers in the .NET CLI. In order to use the *using* keyword the class needs to implement I*Disposable.* When the code exits the scope of the block of code within the *using *statement, the CLI and Garbage Collector immediately calls the *Dispose* method on the object and cleans up the memory usage of that object. Because the *using *statement functions this way allows for any class, such as PerfTimerLogger, to be able to "know" when it's exactly instantiated as well as finished being used; disposed.

Hope this simple tips either helps you implement better logging infrastructure within your applications, or just gives you a better understanding of how the insides of the .NET Framework function.
