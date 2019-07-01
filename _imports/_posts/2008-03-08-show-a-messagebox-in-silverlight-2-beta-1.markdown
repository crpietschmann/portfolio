  ---
  layout: post
  title: "Show a MessageBox in Silverlight 2 Beta 1"
  date: 2008-03-08 18:13:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["Silverlight"]
  alias: ["/post/2008/03/08/Show-a-MessageBox-in-Silverlight-2-Beta-1", "/post/2008/03/08/show-a-messagebox-in-silverlight-2-beta-1"]
  ---
<!-- more -->
<p>
Since Silverlight is just a subset of WPF, there are alot of things missing. One missing thing I found is the System.Windows.MessageBox. I&#39;m a little puzzled as to why they would have left this out, but I imagine MessageBox&#39;s are handled very differently in different Operating Systems. It&#39;s probably a little work to get it working on both Mac and Windows, but I hope it gets into the final release. It&#39;s not a major feature, but one that is used quite often when developing desktop applications, so I can see it being used alot in Silverlight applications. 
</p>
<p>
Anyways, here&#39;s a small implementation I wrote that wraps up the JavaScript Alert to give us a basic MessageBox to use for now: 
</p>
<p>
[code:c#] 
</p>
public static class MessageBox<br />
{<br />
&nbsp;&nbsp;&nbsp; public static void Show(string message)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HtmlPage.Window.Alert(message);<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
<p>
[/code] 
</p>
<p>
<strong>Update 4/2/2008: </strong>I updated the above example to use the &quot;HtmlPage.Window.Alert&quot; method instead of the Invoke method; better to use the method that&#39;s already in the framework.
</p>
<p>
Also, here&#39;s the above code example in VB.NET:
</p>
<p>
Module MessageBox<br />
&nbsp;&nbsp;&nbsp; Public Sub Show(ByVal message As String)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HtmlPage.Window.Alert(message)<br />
&nbsp;&nbsp;&nbsp; End Sub<br />
End Module
</p>
<p>
&nbsp;
</p>
