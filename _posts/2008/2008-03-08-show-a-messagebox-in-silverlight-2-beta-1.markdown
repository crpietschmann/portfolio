---
layout: post
blogengineid: ae6cc53b-9e51-4355-a682-a6466af963cf
title: "Show a MessageBox in Silverlight 2 Beta 1"
date: 2008-03-08 18:13:00 -0600
comments: true
published: true
categories: ["Silverlight"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/08/Show-a-MessageBox-in-Silverlight-2-Beta-1.aspx
  - /post/2008/03/08/Show-a-MessageBox-in-Silverlight-2-Beta-1
  - /post/2008/03/08/show-a-messagebox-in-silverlight-2-beta-1
  - /post.aspx?id=ae6cc53b-9e51-4355-a682-a6466af963cf
---
<!-- more -->


Since Silverlight is just a subset of WPF, there are alot of things missing. One missing thing I found is the System.Windows.MessageBox. I&#39;m a little puzzled as to why they would have left this out, but I imagine MessageBox&#39;s are handled very differently in different Operating Systems. It&#39;s probably a little work to get it working on both Mac and Windows, but I hope it gets into the final release. It&#39;s not a major feature, but one that is used quite often when developing desktop applications, so I can see it being used alot in Silverlight applications. 



Anyways, here&#39;s a small implementation I wrote that wraps up the JavaScript Alert to give us a basic MessageBox to use for now: 



```csharp 

public static class MessageBox

{

    public static void Show(string message)

    {

        HtmlPage.Window.Alert(message);

    }

} 


``` 



**Update 4/2/2008: **I updated the above example to use the &quot;HtmlPage.Window.Alert&quot; method instead of the Invoke method; better to use the method that&#39;s already in the framework.



Also, here&#39;s the above code example in VB.NET:



Module MessageBox

    Public Sub Show(ByVal message As String)

        HtmlPage.Window.Alert(message)

    End Sub

End Module



 

