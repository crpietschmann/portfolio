---
layout: post
title: "Some ASP.NET AJAX Tips and Tricks"
date: 2008-04-03 21:56:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/04/03/Some-ASPNET-AJAX-Tips-and-Tricks
 -  /post/2008/04/03/some-aspnet-ajax-tips-and-tricks
---
<!-- more -->
<p>
I&#39;ve been using ASP.NET AJAX alot for a while now, so I thought I&#39;d share some of the Tips and Tricks that I&#39;ve learned though my adventures.&nbsp;Lately, all the&nbsp;buzz has been around Silverlight, but I know there are still a lot of devs out there that can benefit from these tips and tricks. 
</p>
<h3>UpdatePanel Tips</h3>
<p>
<strong>Use UpdateMode=Conditional</strong> 
</p>
<p>
By setting the UpdatePanel&#39;s UpdateMode property to Conditional, it will only update&nbsp;its contents when one of its triggers occurs or a control within the UpdatePanel itself raises a Postback. 
</p>
<p>
To do this just do the following: 
</p>
<p>
{code:html} 
</p>
<p>
&lt;asp:UpdatePanel runat=&quot;server&quot; ID=&quot;UpdatePanel_List&quot; UpdateMode=&quot;Conditional&quot;&gt; 
</p>
<p>
{/code} 
</p>
<p>
<strong>Programmatically Tell&nbsp;the ScriptManager to&nbsp;handle a specific&nbsp;controls postbacks asynchronously</strong> 
</p>
<p>
Programmatically telling the ScriptManager to&nbsp;raise a Postbacks Asynchronously can be usefull in some scenarios; such as when you may want to optionally enable ajax for certain things on the page. 
</p>
<p>
To do this you just use the ScriptManagers RegisterAsyncPostBackControl method and pass it the reference to the control you want to make asynchronous. 
</p>
<p>
Here&#39;s an example page that does this: 
</p>
<p>
Default.aspx 
</p>
<p>
{code:html} 
</p>
<p>
&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot; CodeFile=&quot;Default.aspx.cs&quot; Inherits=&quot;UpdatePanel_01_Default&quot; %&gt;<br />
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head runat=&quot;server&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;title&gt;Untitled Page&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;form id=&quot;form1&quot; runat=&quot;server&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;div&gt;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;&lt;/asp:ScriptManager&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:Button runat=&quot;server&quot; ID=&quot;btnShowTime&quot; Text=&quot;Show Time&quot; OnClick=&quot;btnShowTime_Click&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:UpdatePanel runat=&quot;server&quot; ID=&quot;UpdatePanel1&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;ContentTemplate&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:Label runat=&quot;server&quot; ID=&quot;lblTime&quot;&gt;&lt;/asp:Label&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/ContentTemplate&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/asp:UpdatePanel&gt;<br />
&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; &lt;/div&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/form&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt; 
</p>
<p>
{/code} 
</p>
<p>
Default.aspx.cs 
</p>
<p>
[code:c#] 
</p>
<p>
public partial class UpdatePanel_01_Default : System.Web.UI.Page<br />
{<br />
&nbsp;&nbsp;&nbsp; protected void Page_Load(object sender, EventArgs e)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /// Make btnShowTime postback asynchronously<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.ScriptManager1.RegisterAsyncPostBackControl(btnShowTime);<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; protected void btnShowTime_Click(object sender, EventArgs e)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lblTime.Text = DateTime.Now.ToLongTimeString();<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
[/code] 
</p>
<h3>WebMethods and PageMethods</h3>
<p>
<strong>Using WebMethods</strong> 
</p>
<p>
By attaching the ScriptService and ScriptMethod attributes to your WebServices you can enable them to be accessed from within your pages via JavaScript. 
</p>
<p>
Here&#39;s a sample WebService with the ScriptService and ScriptMethod attributes attached: 
</p>
<p>
{code:c#} 
</p>
<p>
[System.Web.Script.Services.ScriptService]<br />
[WebService(Namespace = &quot;<a href="http://tempuri.org/">http://tempuri.org/</a>&quot;)]<br />
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]<br />
public class WSTime : System.Web.Services.WebService<br />
{<br />
&nbsp;&nbsp;&nbsp; [WebMethod]<br />
&nbsp;&nbsp;&nbsp; [System.Web.Script.Services.ScriptMethod]<br />
&nbsp;&nbsp;&nbsp; public string GetServerTime()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DateTime.Now.ToLongTimeString();<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
} 
</p>
<p>
{/code} 
</p>
<p>
Then to access the WebService from within JavaScript you need to first tell the ScriptManager about the WebService by giving it a ServiceReference. This can be done declaratively within the page, like so: 
</p>
<p>
{code:html} 
</p>
<p>
&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;Services&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;asp:ServiceReference Path=&quot;~/WebMethods/WSTime.asmx&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/Services&gt;<br />
&lt;/asp:ScriptManager&gt; 
</p>
<p>
{/code} 
</p>
<p>
Now to acess the WebServices methods you just use the namespace that ASP.NET Ajax creates in the page for the WebService and access its methods like normal JavaScript methods. The namespace that is created is the same name as the WebService, in this case it&#39;s WSTime. The whole Ajaxiness of calling the server and getting the results back are handled for you, and all you have to worry about is processing the results. Remember, WebMethods can only be called Asynchronously. 
</p>
<p>
Here&#39;s an example of using the WSTime.GetServerTime WebService method from within JavaScript: 
</p>
<p>
{code:js} 
</p>
<p>
function btnGetServerTime_Click()<br />
{<br />
&nbsp;&nbsp;&nbsp; // call the WebMethod and pass it the method<br />
&nbsp;&nbsp;&nbsp; // to call once it gets the response from<br />
&nbsp;&nbsp;&nbsp; // the server.<br />
&nbsp;&nbsp;&nbsp; WSTime.GetServerTime(SucceededCallback);<br />
}<br />
function SucceededCallback(result, eventArgs)<br />
{<br />
&nbsp;&nbsp;&nbsp; alert(result);<br />
} 
</p>
<p>
{/code} 
</p>
<p>
<strong>Using PageMethods</strong> 
</p>
<p>
PageMethods are accessed&nbsp;in the same fashion&nbsp;as WebMethods, except they do not require the creation of a WebService. PageMethods are actually WebMethods that are added to the page itself. Once thing to note is there is No way to embed PageMethods within Custom User Controls or Server Controls, they must be added to the Page; hence the name PageMethods. 
</p>
<p>
Here&#39;s the C# code of&nbsp;an example page with a PageMethod defined: 
</p>
<p>
{code:c#} 
</p>
<p>
public partial class PageMethods_Default : System.Web.UI.Page<br />
{<br />
&nbsp;&nbsp;&nbsp; protected void Page_Load(object sender, EventArgs e)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp; [WebMethod]<br />
&nbsp;&nbsp;&nbsp; public static string GetServerTime()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DateTime.Now.ToLongTimeString();<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
{/code} 
</p>
<p>
To enable the PageMethods you must first set the ScriptManagers EnablePageMethods property to True. 
</p>
<p>
{code:html} 
</p>
<p>
&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot; EnablePageMethods=&quot;true&quot;&gt;&lt;/asp:ScriptManager&gt; 
</p>
<p>
{/code} 
</p>
<p>
Then you can call the PageMethods in the same way as WebMethods, except the namespace you use to access the methods is named PageMethods. 
</p>
<p>
Here&#39;s the example code of calling the above PageMethod from JavaScript: 
</p>
<p>
{code:js} 
</p>
<p>
function btnGetServerTime_Click()<br />
{<br />
&nbsp;&nbsp;&nbsp; PageMethods.GetServerTime(SucceededCallback);<br />
}<br />
function SucceededCallback(result, eventArgs)<br />
{<br />
&nbsp;&nbsp;&nbsp; alert(result);<br />
} 
</p>
<p>
{/code} 
</p>
<h3>Conclusion</h3>
<p>
I hope these couple of tips help in your endeavors with ASP.NET AJAX. When I get time (in between all the other million things) maybe I&#39;ll post some more tips. 
</p>
<p>
Also, if you have your own tips, please post them in the comments. 
</p>
