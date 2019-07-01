---
layout: post
id: e33bc9c0-b7d1-42f6-bbf7-15b97d1cce38
title: "Write to the Event Log in .NET (VB.NET and C#.NET)"
date: 2004-08-24 18:03:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "General", "vb.net"]
redirect_from: 
  - /post/2004/08/24/Write-to-the-Event-Log-in-NET-(VBNET-and-CNET)
  - /post/2004/08/24/write-to-the-event-log-in-net-(vbnet-and-cnet)
  - /post.aspx?id=e33bc9c0-b7d1-42f6-bbf7-15b97d1cce38
---
<!-- more -->
<p>
It is as simple as this to write to the Windows Event Log in .NET
</p>
<p>
Declaration:
</p>
<font size="2" color="#0000ff">
<p>
Imports<font size="2"> System.Diagnostics</font>
</p>
</font>
<p>
Code:
</p>
<font size="2" color="#008000"><font size="2" color="#0000ff"><font size="2" color="#0000ff">
<p>
Public<font size="2" color="#000000"> </font><font size="2" color="#0000ff">Function</font><font size="2" color="#000000"> WriteToEventLog(</font><font size="2" color="#0000ff">ByVal</font><font size="2" color="#000000"> Entry </font><font size="2" color="#0000ff">As</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">String</font><font size="2" color="#000000">, _</font><br />
<font size="2" color="#0000ff">Optional</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">ByVal</font><font size="2" color="#000000"> AppName </font><font size="2" color="#0000ff">As</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">String</font><font size="2" color="#000000"> = &quot;APlusFeeCalc&quot;, _</font><br />
<font size="2" color="#0000ff">Optional</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">ByVal</font><font size="2" color="#000000"> EventType </font><font size="2" color="#0000ff">As</font><font size="2" color="#000000"> EventLogEntryType = EventLogEntryType.Information, _</font><br />
<font size="2" color="#0000ff">Optional</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">ByVal</font><font size="2" color="#000000"> LogName </font><font size="2" color="#0000ff">As</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">String</font><font size="2" color="#000000"> = &quot;Application&quot;) </font><font size="2" color="#0000ff">As</font><font size="2" color="#000000"> </font><font size="2" color="#0000ff">Boolean</font><br />
<font size="2"></font><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp; Dim</font><font size="2"> objEventLog </font><font size="2" color="#0000ff">As</font><font size="2"> </font><font size="2" color="#0000ff">New</font><font size="2"> EventLog<br />
</font><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp; Try<br />
</font><font size="2"></font><font size="2" color="#008000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &#39;Register the App as an Event Source<br />
</font><font size="2"></font><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; If</font><font size="2"> </font><font size="2">Not</font><font size="2"> objEventLog.SourceExists(AppName) </font><font size="2">Then<br />
</font><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objEventLog.CreateEventSource(AppName, LogName)<br />
</font><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End</font><font size="2"> </font><font size="2">If<br />
</font><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objEventLog.Source = AppName<br />
</font><font size="2" color="#008000"><font color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;&nbsp; &#39;WriteEntry is overloaded; this is one </font><font size="2" color="#008000">of 10 ways to call it<br />
</font><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objEventLog.WriteEntry(Entry, EventType)<br />
</font><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Return</font><font size="2"> </font><font size="2" color="#0000ff">True<br />
</font><font size="2"></font><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp; Catch</font><font size="2"> Ex </font><font size="2" color="#0000ff">As</font><font size="2"> Exception<br />
</font><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Return</font><font size="2"> </font><font size="2" color="#0000ff">False<br />
</font><font size="2"></font><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp; End</font><font size="2"> </font><font size="2" color="#0000ff">Try<br />
</font><font size="2"></font><font size="2" color="#0000ff">End</font><font size="2"> </font><font size="2" color="#0000ff">Function</font>
</p>
</font></font></font>
