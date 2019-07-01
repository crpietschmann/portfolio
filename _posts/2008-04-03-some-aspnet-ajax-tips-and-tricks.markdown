---
layout: post
blogengineid: 0b0d94ba-c184-48ce-b29a-38da320dbc7e
title: "Some ASP.NET AJAX Tips and Tricks"
date: 2008-04-03 21:56:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/04/03/Some-ASPNET-AJAX-Tips-and-Tricks
  - /post/2008/04/03/some-aspnet-ajax-tips-and-tricks
  - /post.aspx?id=0b0d94ba-c184-48ce-b29a-38da320dbc7e
---
<!-- more -->


I&#39;ve been using ASP.NET AJAX alot for a while now, so I thought I&#39;d share some of the Tips and Tricks that I&#39;ve learned though my adventures. Lately, all the buzz has been around Silverlight, but I know there are still a lot of devs out there that can benefit from these tips and tricks. 

<h3>UpdatePanel Tips</h3>


**Use UpdateMode=Conditional** 



By setting the UpdatePanel&#39;s UpdateMode property to Conditional, it will only update its contents when one of its triggers occurs or a control within the UpdatePanel itself raises a Postback. 



To do this just do the following: 



{code:html} 



&lt;asp:UpdatePanel runat=&quot;server&quot; ID=&quot;UpdatePanel_List&quot; UpdateMode=&quot;Conditional&quot;&gt; 



{/code} 



**Programmatically Tell the ScriptManager to handle a specific controls postbacks asynchronously** 



Programmatically telling the ScriptManager to raise a Postbacks Asynchronously can be usefull in some scenarios; such as when you may want to optionally enable ajax for certain things on the page. 



To do this you just use the ScriptManagers RegisterAsyncPostBackControl method and pass it the reference to the control you want to make asynchronous. 



Here&#39;s an example page that does this: 



Default.aspx 



{code:html} 



&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot; CodeFile=&quot;Default.aspx.cs&quot; Inherits=&quot;UpdatePanel_01_Default&quot; %&gt;<br />
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head runat=&quot;server&quot;&gt;<br />
    &lt;title&gt;Untitled Page&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
    &lt;form id=&quot;form1&quot; runat=&quot;server&quot;&gt;<br />
    &lt;div&gt;<br />
    <br />
        &lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;&lt;/asp:ScriptManager&gt;<br />
        &lt;asp:Button runat=&quot;server&quot; ID=&quot;btnShowTime&quot; Text=&quot;Show Time&quot; OnClick=&quot;btnShowTime_Click&quot; /&gt;<br />
        &lt;br /&gt;<br />
        &lt;asp:UpdatePanel runat=&quot;server&quot; ID=&quot;UpdatePanel1&quot;&gt;<br />
            &lt;ContentTemplate&gt;<br />
                &lt;asp:Label runat=&quot;server&quot; ID=&quot;lblTime&quot;&gt;&lt;/asp:Label&gt;<br />
            &lt;/ContentTemplate&gt;<br />
        &lt;/asp:UpdatePanel&gt;<br />
   <br />
    &lt;/div&gt;<br />
    &lt;/form&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt; 



{/code} 



Default.aspx.cs 



[code:c#] 



public partial class UpdatePanel_01_Default : System.Web.UI.Page<br />
{<br />
    protected void Page_Load(object sender, EventArgs e)<br />
    {<br />
        /// Make btnShowTime postback asynchronously<br />
        this.ScriptManager1.RegisterAsyncPostBackControl(btnShowTime);<br />
    } 



    protected void btnShowTime_Click(object sender, EventArgs e)<br />
    {<br />
        lblTime.Text = DateTime.Now.ToLongTimeString();<br />
    }<br />
} 



``` 

<h3>WebMethods and PageMethods</h3>


**Using WebMethods** 



By attaching the ScriptService and ScriptMethod attributes to your WebServices you can enable them to be accessed from within your pages via JavaScript. 



Here&#39;s a sample WebService with the ScriptService and ScriptMethod attributes attached: 



{code:c#} 



[System.Web.Script.Services.ScriptService]<br />
[WebService(Namespace = &quot;<a href="http://tempuri.org/">http://tempuri.org/</a>&quot;)]<br />
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]<br />
public class WSTime : System.Web.Services.WebService<br />
{<br />
    [WebMethod]<br />
    [System.Web.Script.Services.ScriptMethod]<br />
    public string GetServerTime()<br />
    {<br />
        return DateTime.Now.ToLongTimeString();<br />
    } 



} 



{/code} 



Then to access the WebService from within JavaScript you need to first tell the ScriptManager about the WebService by giving it a ServiceReference. This can be done declaratively within the page, like so: 



{code:html} 



&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot;&gt;<br />
    &lt;Services&gt;<br />
        &lt;asp:ServiceReference Path=&quot;~/WebMethods/WSTime.asmx&quot; /&gt;<br />
    &lt;/Services&gt;<br />
&lt;/asp:ScriptManager&gt; 



{/code} 



Now to acess the WebServices methods you just use the namespace that ASP.NET Ajax creates in the page for the WebService and access its methods like normal JavaScript methods. The namespace that is created is the same name as the WebService, in this case it&#39;s WSTime. The whole Ajaxiness of calling the server and getting the results back are handled for you, and all you have to worry about is processing the results. Remember, WebMethods can only be called Asynchronously. 



Here&#39;s an example of using the WSTime.GetServerTime WebService method from within JavaScript: 



{code:js} 



function btnGetServerTime_Click()<br />
{<br />
    // call the WebMethod and pass it the method<br />
    // to call once it gets the response from<br />
    // the server.<br />
    WSTime.GetServerTime(SucceededCallback);<br />
}<br />
function SucceededCallback(result, eventArgs)<br />
{<br />
    alert(result);<br />
} 



{/code} 



**Using PageMethods** 



PageMethods are accessed in the same fashion as WebMethods, except they do not require the creation of a WebService. PageMethods are actually WebMethods that are added to the page itself. Once thing to note is there is No way to embed PageMethods within Custom User Controls or Server Controls, they must be added to the Page; hence the name PageMethods. 



Here&#39;s the C# code of an example page with a PageMethod defined: 



{code:c#} 



public partial class PageMethods_Default : System.Web.UI.Page<br />
{<br />
    protected void Page_Load(object sender, EventArgs e)<br />
    {<br />
    }<br />
<br />
    [WebMethod]<br />
    public static string GetServerTime()<br />
    {<br />
        return DateTime.Now.ToLongTimeString();<br />
    }<br />
} 



{/code} 



To enable the PageMethods you must first set the ScriptManagers EnablePageMethods property to True. 



{code:html} 



&lt;asp:ScriptManager runat=&quot;server&quot; ID=&quot;ScriptManager1&quot; EnablePageMethods=&quot;true&quot;&gt;&lt;/asp:ScriptManager&gt; 



{/code} 



Then you can call the PageMethods in the same way as WebMethods, except the namespace you use to access the methods is named PageMethods. 



Here&#39;s the example code of calling the above PageMethod from JavaScript: 



{code:js} 



function btnGetServerTime_Click()<br />
{<br />
    PageMethods.GetServerTime(SucceededCallback);<br />
}<br />
function SucceededCallback(result, eventArgs)<br />
{<br />
    alert(result);<br />
} 



{/code} 

<h3>Conclusion</h3>


I hope these couple of tips help in your endeavors with ASP.NET AJAX. When I get time (in between all the other million things) maybe I&#39;ll post some more tips. 



Also, if you have your own tips, please post them in the comments. 

