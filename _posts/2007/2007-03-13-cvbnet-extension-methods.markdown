---
layout: post
blogengineid: 58f0ea08-ecce-4a63-9b4b-258d9fa9e030
title: "C#/VB.NET: Extension Methods"
date: 2007-03-13 20:42:00 -0500
comments: true
published: true
categories: ["C#", "VB.NET", ".NET"]
tags: ["General", "vb.net", "C#"]
redirect_from: 
  - /post/2007/03/13/CVBNET-Extension-Methods.aspx
  - /post/2007/03/13/CVBNET-Extension-Methods
  - /post/2007/03/13/cvbnet-extension-methods
  - /post.aspx?id=58f0ea08-ecce-4a63-9b4b-258d9fa9e030
---
<!-- more -->


Over a year ago I posted a question about doing a <a href="/Blog/Post.aspx?PostID=601">SQL-like IN operation in .NET</a>. Here&#39;s the examples I posted of how it could work:



*Dim arrNames() AS String = New Array{&quot;CHRIS&quot;, &quot;TOM&quot;, &quot;TYLER&quot;}

If strName IN arrNames Then

   &#39;do something

End If*



Now, this would be a powerful feature since you wouldn&#39;t be required to write code that loops through the array or collection. Well, I saw some good news today posted by Scott Guthrie.



Scott posted about a new feature in .NET &quot;Orcas&quot; (I believe it&#39;s going to be v3.5 but I&#39;m note sure.), it&#39;s called Extension Methods.



Extension Methods allow you (the developer) to add new functionality to existing .NET object type. And, you can do it without inheritance or recomiling the original type. This means you can add your own custom fuctionality to any third party object or framework object you want. This sounds really neat!



I saw this, and I thought to myself, Sweet you will now be able to do something similar to a SQL IN operation just as easily as it&#39;s done in SQL. In fact, Scott even posted an example of how to do it. (however, he didn&#39;t compare it to SQL IN like I am.)



The code for the IN method goes like this:



*namespace SqlInMethodExtension

{

    public static class SqlInMethodExtension

    {

        public static bool IN(this object o, IEnumerable c)

        {

            foreach (object i in c)

            {

                 if (i.Equals(o)) return true;

            }

            return false;

        }

    }

}*



Now using the method is as simple as this:



*using SqlInMethodExtension;

public class Test

{

    void Test(string myValue)

    {

        string [] values = {&quot;Chris&quot;,&quot;John&quot;,&quot;Sam&quot;};

        if (myValue.IN(values))

        {

            // Do something here

        }

    }

}*



Isn&#39;t that cool!?



You&#39;ve probably read about the new LINQ features that are also coming in .NET &quot;Orcas&quot;. According to ScottGu LINQ uses Extension Methods pretty heavily. So, if you ever wonder why this feature is being added, just think about the coolness of LINQ.



To read more about Extension Methods:

<a href="http://weblogs.asp.net/scottgu/archive/2007/03/13/new-orcas-language-feature-extension-methods.aspx">New &quot;Orcas&quot; Language Feature: Extension Methods</a>


