---
layout: post
title: "Measuring the Performance of troubled code in your VB6 Application"
date: 2001-06-01 19:54:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /programming/articles/MeasuringPerformanceVB6.htm
---

Writing code the first time usually does get the job done, but it may not be the best, or fastest way to do it.  Sometimes you want to make it run faster, but you don't have a way of seeing actually how fast that code runs.  Or if it even runs faster after the changes you make, like you want it to.  Well, heres an example of how to time parts of your code.

Insert this before the code that your unsure about:

```vb
Dim dblStart as Double

Dim dblEnd as Double

Dim i as Long

dblStart = Timer    'Get the start time.
```

Then put your code that you want to test the speed of.

Then put this code after:

```vb
dblEnd = Timer                     'Get the end time.

Debug.Print dblEnd - dblStart                            'Display the elapsed time
```

And that is how to test the performance of your code.

This example uses the default property of VB's Timer class to time the execution of the routine within the loop.  By placing your code inside you can quickly compare the performance of that code before and after you make those changes that are supposed to speed it up a little.

Make sure you run each version of your changes a few times to get an average time.

This should work with any version of Visual Basic.
