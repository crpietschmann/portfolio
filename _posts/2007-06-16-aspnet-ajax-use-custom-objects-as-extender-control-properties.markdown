---
layout: post
id: 5487e70e-a4e7-4d2e-b1aa-42a93211179d
title: "ASP.NET AJAX: Use "custom" objects as Extender Control Properties"
date: 2007-06-16 14:53:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "General"]
redirect_from: 
  - /post/2007/06/16/ASPNET-AJAX-Use-custom-objects-as-Extender-Control-Properties
  - /post/2007/06/16/aspnet-ajax-use-custom-objects-as-extender-control-properties
  - /post.aspx?id=5487e70e-a4e7-4d2e-b1aa-42a93211179d
---
<!-- more -->
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri">I&rsquo;ve been working with the ASP.NET AJAX Extensions a lot lately, and have been learning a few trick on how to get stuff done. One of the things I&rsquo;ve learned is how to create a Generic TypeConverter for ASP.NET Ajax to use when serializing my server-side objects to JSON when passing them down to the client-side.</font> 
</p>
<strong><font face="Calibri"><font size="4">Introduction</font></font></strong> 
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri">When <a href="http://ajax.asp.net/ajaxtoolkit/Walkthrough/CreatingNewExtender.aspx">creating an ASP.NET Extender Control</a> (using ASP.NET AJAX and the AJAX Toolkit) you can add custom properties to your Extender (using the ExtenderControlProperty attribute) that get passed down to the client. Well, this is really cool and all, but you are restricted to using the &ldquo;standard&rdquo; variable types (string, int, bool, etc.); unless of course you want to create your own custom <a href="http://ajax.asp.net/docs/mref/N_System_Web_Script_Serialization.aspx">TypeConverter to convert your custom objects to JSON</a></font><font face="Calibri">.</font> 
</p>
<strong><font face="Calibri"><font size="4">How do I create and use a JSON TypeConverter?</font></font></strong> 
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri">and, do I need to create a separate one for each of my &ldquo;custom&rdquo; objects? First off, it&rsquo;s pretty simple, and secondly, you can create &ldquo;generic&rdquo; TypeConverter that will work with virtually all your objects.</font> 
</p>
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri"><strong>Step 1: </strong>Create a new Extender Control (</font><a href="http://ajax.asp.net/ajaxtoolkit/Walkthrough/CreatingNewExtender.aspx"><font face="Calibri">http://ajax.asp.net/ajaxtoolkit/Walkthrough/CreatingNewExtender.aspx</font></a><font face="Calibri">)</font> 
</p>
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri"><strong>Step 2: </strong>Create out &ldquo;generic&rdquo; TypeConverter to use with our object. Yes, this is really all the code necessary to create the &ldquo;generic&rdquo; TypeConverter; all the serialization is actually done for us by the System.Web.Script.Serialization.JavaScriptSerializer object.</font> 
</p>
<p>
[code:c#]
</p>
<p>
public class GenericTypeConverter : TypeConverter<br />
{<br />
&nbsp;&nbsp;&nbsp; public override object ConvertTo(ITypeDescriptorContext context,&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.Globalization.CultureInfo culture,<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object value, Type destinationType)&nbsp;<br />
&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JavaScriptSerializer jss = new JavaScriptSerializer();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string s = jss.Serialize(value);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return s;<br />
&nbsp;&nbsp;&nbsp; } <br />
}
</p>
<p>
[/code]
</p>
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri"><strong>Step 3: </strong>Create your &ldquo;custom&rdquo; object that we want serialized and passed down to the client, and set the TypeConverter attribute to point to our GenericTypeConverter. In this example I&rsquo;m using a Person object to keep things simple.</font> 
</p>
<p>
[code:c#]
</p>
<p>
[TypeConverter(typeof(GenericTypeConverter))]<br />
public class Person{<br />
&nbsp;&nbsp;&nbsp; private string _FirstName;<br />
&nbsp;&nbsp;&nbsp; public string FirstName<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get { return _FirstName; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set { _FirstName = value; }<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp; private string _LastName;<br />
&nbsp;&nbsp;&nbsp; public string LastName<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get { return _LastName; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set { _LastName = value; }<br />
&nbsp;&nbsp;&nbsp; }<br />
}
</p>
<p>
[/code]
</p>
<p>
<strong>Step 4:</strong> Add our Person property to the ExtenderControl
</p>
<p>
<strong>Step 5:</strong> Add the code that deserializes our object on the client. Add the following line of code to the &ldquo;initialize&rdquo; method of your ExtenderControl&rsquo;s behavior javascript file:
</p>
<p>
[code:c#]&nbsp;
</p>
<p>
if(this._myPersonValue!=null){<br />
this._myPersonValue=Sys.Serialization.JavaScriptSerializer.deserialize(this._myPersonValue);<br />
}
</p>
<p>
[/code]
</p>
<p>
<strong>Step 6:</strong> Acces our Person object properties on the client
</p>
<p>
[code:js]&nbsp;
</p>
<p>
alert(&quot;The full name of my person is:\n&quot;&nbsp;&nbsp;&nbsp; + this._myPersonValue.FirstName + &quot; &quot; + this._myPersonValue.LastName); 
</p>
<p>
[/code]
</p>
<p>
<strong><font face="Calibri"><font size="4">Conclusion</font></font></strong> 
</p>
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri">Even though this ends up being a very simple thing to do, it took me a lot of time (a few months ago) to figure out since there aren&rsquo;t very many articles out there on how to do stuff with ASP.NET AJAX.</font> 
</p>
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<font face="Calibri">I also kept this article pretty simplistic, since I&rsquo;m offering the complete solution for download and code always speaks for itself.</font> 
</p>
<p style="margin: 0in 0in 10pt" class="MsoNormal">
<strong><font face="Calibri"><font size="4">Download Sample Code: </font></font></strong><font face="Calibri"><a href="/download/blog/1377/CustomJSONTypeConverter.zip">CustomJSONTypeConverter.zip</a></font> 
</p>
