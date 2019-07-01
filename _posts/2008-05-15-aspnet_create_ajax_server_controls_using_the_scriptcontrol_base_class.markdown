---
layout: post
id: e78fc882-c172-46bd-ac8c-3a8d5ea56b14
title: "ASP.NET: Create AJAX Server Controls using the ScriptControl base class"
date: 2008-05-15 00:52:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/05/15/ASPNET_Create_AJAX_Server_Controls_using_the_ScriptControl_base_class
  - /post/2008/05/15/aspnet_create_ajax_server_controls_using_the_scriptcontrol_base_class
  - /post.aspx?id=e78fc882-c172-46bd-ac8c-3a8d5ea56b14
---
<!-- more -->
<p>I've been doing a lot with ASP.NET AJAX for almost 2 years now, including my <a href="http://simplovation.com/page/webmapsve.aspx">Web.Maps.VE</a> product. So, I've decided to spread some of my knowledge in this area by writing up some articles on things that I've learned and figured out. </p>  <p>As a note, since .NET 3.5 is the &quot;latest and greatest&quot; version of the framework out at the time of this writing, this article targets .NET 3.5. This article also assumes you have a basic understanding of ASP.NET AJAX and JavaScript. </p>  <h3>What is ScriptControl?</h3>  <p>First, what exactly is ScriptControl? Well, the base class I'm referring to is the System.Web.UI.ScriptControl base class located within the System.Web.Extensions.dll assembly. </p>  <p>The ScriptControl is basically the first building block you want to use to start building out a WebControl (server control) that will have some kind of rich AJAX functionality in the browser. You may have heard of ASP.NET AJAX Control Extenders, especially if you're familiar with the AJAX Control Toolkit, so why would we use ScriptControl instead of creating an ExtenderControl in order to give a control some rich AJAX functionality within the browser? Well, you want to create an ExtenderControl to extend or enhance an existing control with some rich AJAX functionality, and you want to inherit from the ScriptControl class when you are creating a full control that will have some rich AJAX functionality. </p>  <p>According to <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.scriptcontrol.aspx">MSDN the ScriptControl class</a> is: </p>  <p><em>ScriptControl inherits from the WebControl class and implements the <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.iscriptcontrol.aspx">IScriptControl</a> interface. The WebControl class is a base class for ASP.NET Web server controls. The ScriptControl is an abstract class, which you cannot instantiate directly. Instead, you derive a class based on this abstract class.</em> </p>  <p><em>The ScriptControl base class tests the page for a <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.scriptmanager.aspx">ScriptManager</a> control during the PreRender stage of the derived control. The ScriptControl base class also makes sure that the derived control calls methods of the <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.scriptmanager.aspx">ScriptManager</a> control to register script during the Render event. This includes registering <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.scriptdescriptor.aspx">ScriptDescriptor</a> objects for the ScriptControl when the Render method is called. The Render method makes sure that <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.scriptdescriptor.aspx">ScriptDescriptor</a> objects are not rendered unless the ScriptControl itself is rendered. This enables a ScriptControl to work inside a closed WebPart control.</em> </p>  <p><em>You can add as many descriptors and types as necessary to any class that you derive from ScriptControl.</em></p>  <h3>Basics of Creating Server Controls that Inherit from ScriptControl</h3>  <p>When first creating your custom server control you inherit from ScriptControl instead of WebControl like usual. The first thing you'll see is ScriptControl requires you to implement two methods: GetScriptDescriptors and GetScriptReferences. The GetScriptDescriptors method is used to get an enumeration of ScriptDescriptor objects that basically define any of the controls client-side AJAX properties. The GetScriptReferences method is used to get an enumeration of ECMAScript (JavaScript) files that will be loaded on the client-side once the page loads; this is used to basically define any client-side scripts the control will require to run on the client. </p>  <p>Here's a basic stub of a control that inherits from ScriptControl:</p>  <pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> CustomScriptControl : ScriptControl
{
    <span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors()
    {
        <span class="kwrd">throw</span> <span class="kwrd">new</span> NotImplementedException();
    } 

    <span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptReference&gt; GetScriptReferences()
    {
        <span class="kwrd">throw</span> <span class="kwrd">new</span> NotImplementedException();
    }
}</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>

<p><strong>Define ScriptReferences</strong></p>

<p>In the GetScriptReferences method, return an enumeration of the <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.scriptreference.aspx">ScriptReference</a> objects to include in the page on the client-side. </p>

<p>Here's a basic example of setting up a ScriptReference that includes a script resource that is embedded within the assembly the CustomScriptControl is contained in:</p>

<pre class="csharpcode"><span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptReference&gt; GetScriptReferences()
{
    List&lt;ScriptReference&gt; references = <span class="kwrd">new</span> List&lt;ScriptReference&gt;();
    references.Add(<span class="kwrd">new</span> ScriptReference(<span class="str">&quot;CustomScriptControl.CustomScriptControl.js&quot;</span>, <span class="str">&quot;CustomScriptControl&quot;</span>));
    <span class="kwrd">return</span> references;
}</pre>

<p>When inheriting from ScriptControl you'll generally always have at least one ScriptReference because you need to reference the script that creates the client-side JavaScript representation of your control. </p>

<p><strong>Define ScriptDescriptors</strong></p>

<p>In the GetScriptDescriptors method, return an enumeration of ScriptDescriptor objects that define what properties will be passed down to the client-side JavaScript representation of your control. </p>

<p>The only ScriptDescriptor you need to return in the enumeration is a ScriptControlDescriptor instance that contains all the descriptors for your control. </p>

<p>Here's a basic example of returning a ScriptControlDescriptor without any properties being defined:</p>

<pre class="csharpcode"><span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors()
{
    ScriptControlDescriptor descriptor = <span class="kwrd">new</span> ScriptControlDescriptor(<span class="kwrd">this</span>.GetType().FullName, <span class="kwrd">this</span>.ClientID);
    <span class="kwrd">return</span> <span class="kwrd">new</span> ScriptDescriptor[] { descriptor };
}</pre>

<p><strong>What ECMAScript (JavaScript) code is needed?</strong></p>

<p>There is a basic block of JavaScript code that you'll need to include in the ScriptReference that's being defined by the GetScriptReferences method that will define the client-side JavaScript representation of your control. This basic block of code that you include in this script file is the same for all ScriptControls that you'll create. </p>

<p>Here's the basic JavaScript that will define the client-side JavaScript representation of the CustomScriptControl we're using in this example. One thing to remember is that the namespaces and object name in the JavaScript file need to be the same as they are in the server-side .NET code.</p>

<pre class="csharpcode">Type.registerNamespace(<span class="str">&quot;CustomScriptControl&quot;</span>);
CustomScriptControl.CustomScriptControl = <span class="kwrd">function</span>(element) {
    CustomScriptControl.CustomScriptControl.initializeBase(<span class="kwrd">this</span>, [element]);
};
CustomScriptControl.CustomScriptControl.prototype = {
    initialize:<span class="kwrd">function</span>() {
        CustomScriptControl.CustomScriptControl.callBaseMethod(<span class="kwrd">this</span>, <span class="str">&quot;initialize&quot;</span>);
    },
    dispose:<span class="kwrd">function</span>() {
        CustomScriptControl.CustomScriptControl.callBaseMethod(<span class="kwrd">this</span>, <span class="str">&quot;dispose&quot;</span>);
    }
};
CustomScriptControl.CustomScriptControl.registerClass(<span class="str">&quot;CustomScriptControl.CustomScriptControl&quot;</span>, Sys.UI.Control);
<span class="kwrd">if</span>(<span class="kwrd">typeof</span>(Sys)!==<span class="str">&quot;undefined&quot;</span>)Sys.Application.notifyScriptLoaded();</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>

<p>Also, in order for the ScriptControl to correctly load the &quot;CustomScriptControl.CustomScriptControl.js&quot; script reference that we're using in this example, we must not forget to define the assemblies embedded resource as a Web Resource, like so:</p>

<pre class="csharpcode">[assembly: System.Web.UI.WebResource(<span class="str">&quot;CustomScriptControl.CustomScriptControl.js&quot;</span>, <span class="str">&quot;text/javascript&quot;</span>)]</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>

<h3>Let's Add a Little &quot;Rich&quot; AJAX Functionality to the Control</h3>

<p>Now that we have a basic ScriptControl created, we can start to add out &quot;rich&quot; AJAX functionality to it. </p>

<p>In this article, I'm going to keep things extremely simple, and we're going to do the following: </p>

<ol>
  <li>Pass a Name (type string) property to the client by defining it as a ScriptDescriptor, and displaying it to the user via a JavaScript Alert dialog. </li>
</ol>

<p><strong>Add the Name Property to the Control</strong></p>

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }</pre>

<p><strong>Add the ScriptDescriptor for the Name Property</strong></p>

<p>Just modify the GetScriptDescriptors method above to look like the following:</p>

<pre class="csharpcode"><span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors()
{
    ScriptControlDescriptor descriptor = <span class="kwrd">new</span> ScriptControlDescriptor(<span class="kwrd">this</span>.GetType().FullName, <span class="kwrd">this</span>.ClientID); 

    <span class="rem">// Add our Name property to be passed down to the client</span>
    descriptor.AddProperty(<span class="str">&quot;Name&quot;</span>, <span class="kwrd">this</span>.Name); 

    <span class="kwrd">return</span> <span class="kwrd">new</span> ScriptDescriptor[] { descriptor };
}</pre>

<p><strong>Add the Client-Side Name Property that will receive the value</strong></p>

<p>To do this we need to add a &quot;private&quot; like variable to hold the value and property accessor methods to our JavaScript file. </p>

<p>Here's the above JavaScript file with the &quot;private&quot; variable and property accessors added for the Name property:</p>

<pre class="csharpcode">Type.registerNamespace(<span class="str">&quot;CustomScriptControl&quot;</span>);
CustomScriptControl.CustomScriptControl = <span class="kwrd">function</span>(element) {
    CustomScriptControl.CustomScriptControl.initializeBase(<span class="kwrd">this</span>, [element]);
    <span class="rem">// &quot;private&quot; variable to hold the Name properties value</span>
    <span class="kwrd">this</span>._name = <span class="kwrd">null</span>;
};
CustomScriptControl.CustomScriptControl.prototype = {
    initialize:<span class="kwrd">function</span>() {
        CustomScriptControl.CustomScriptControl.callBaseMethod(<span class="kwrd">this</span>, <span class="str">&quot;initialize&quot;</span>);
    },
    dispose:<span class="kwrd">function</span>() {
        CustomScriptControl.CustomScriptControl.callBaseMethod(<span class="kwrd">this</span>, <span class="str">&quot;dispose&quot;</span>);
    },
    <span class="rem">// Name Property Accessors</span>
    get_Name:<span class="kwrd">function</span>() {
        <span class="kwrd">return</span> <span class="kwrd">this</span>._name;
    },
    set_Name:<span class="kwrd">function</span>(value) {
        <span class="kwrd">this</span>._name = value;
    }    
};
CustomScriptControl.CustomScriptControl.registerClass(<span class="str">&quot;CustomScriptControl.CustomScriptControl&quot;</span>, Sys.UI.Control);
<span class="kwrd">if</span>(<span class="kwrd">typeof</span>(Sys)!==<span class="str">&quot;undefined&quot;</span>)Sys.Application.notifyScriptLoaded();</pre>

<p><strong>Display the Name to the User</strong></p>

<p>In this example we're going to display the Name property to the user using a JavaScript Alert within the objects client-side initialize property. </p>

<p>Here's the initialize method modified to include the Alert:</p>

<pre class="csharpcode">initialize:<span class="kwrd">function</span>() {
    CustomScriptControl.CustomScriptControl.callBaseMethod(<span class="kwrd">this</span>, <span class="str">&quot;initialize&quot;</span>); 

    <span class="rem">// Display Name property to user</span>
    alert(<span class="kwrd">this</span>.get_Name()); 
},</pre>

<h3>Tips and Tricks</h3>

<p>One trick that I've learned that proves useful when creating custom ScriptControls, is to create your own base class that inherits from ScriptControl and extends it to use some custom attributes to make adding ScriptReferences and ScriptDescriptors easier. </p>

<p>Here's what the final server-side code of the CustomScriptControl object would look like when using custom attributes to add the ScriptReferences and ScriptDescriptors:</p>

<pre class="csharpcode">[ScriptReference(<span class="str">&quot;CustomScriptControl.CustomScriptControl.js&quot;</span>, <span class="str">&quot;CustomScriptControl&quot;</span>)]
<span class="kwrd">public</span> <span class="kwrd">class</span> CustomScriptControl : ScriptControlBase
{
    [ScriptControlProperty]
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
}</pre>

<p>As you can see, the new code for the CustomScriptControl using this base class with custom attributes is much cleaner and easier to read. </p>

<p>Here's the complete code for the ScriptControlBase, ScriptReferenceAttribute and ScriptControlPropertyAttribute objects:</p>

<pre class="csharpcode"><span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Collections.Generic;
<span class="kwrd">using</span> System.ComponentModel;
<span class="kwrd">using</span> System.Web.UI;

<span class="kwrd">public</span> <span class="kwrd">class</span> ScriptControlBase : ScriptControl
{
    <span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors()
    {
        ScriptControlDescriptor descriptor = <span class="kwrd">new</span> ScriptControlDescriptor(<span class="kwrd">this</span>.GetType().FullName, <span class="kwrd">this</span>.ClientID); 

        <span class="rem">// Add all the ScriptControls Client-Side Object Properties</span>
        PropertyDescriptorCollection props = TypeDescriptor.GetProperties(<span class="kwrd">this</span>);
        <span class="kwrd">foreach</span> (PropertyDescriptor prop <span class="kwrd">in</span> props)
        {
            ScriptControlPropertyAttribute propAttr = prop.Attributes[<span class="kwrd">typeof</span>(ScriptControlPropertyAttribute)] <span class="kwrd">as</span> ScriptControlPropertyAttribute;
            <span class="kwrd">if</span> (propAttr != <span class="kwrd">null</span>)
            {
                <span class="kwrd">object</span> <span class="kwrd">value</span> = prop.GetValue(<span class="kwrd">this</span>);
                <span class="kwrd">string</span> name = (propAttr.Name != <span class="kwrd">null</span>) ? propAttr.Name : prop.Name;
                <span class="kwrd">if</span> (<span class="kwrd">value</span> != <span class="kwrd">null</span>)
                {
                    descriptor.AddProperty(name, <span class="kwrd">value</span>);
                }
            }
        } 

        <span class="kwrd">return</span> <span class="kwrd">new</span> ScriptDescriptor[] { descriptor };
    } 

    <span class="kwrd">protected</span> <span class="kwrd">override</span> IEnumerable&lt;ScriptReference&gt; GetScriptReferences()
    {
        List&lt;ScriptReference&gt; references = <span class="kwrd">new</span> List&lt;ScriptReference&gt;(); 

        <span class="rem">// Add all the ScriptControls Client-Side JavaScript References</span>
        <span class="kwrd">object</span>[] scriptReferences = Attribute.GetCustomAttributes(<span class="kwrd">this</span>.GetType(), <span class="kwrd">typeof</span>(ScriptReferenceAttribute), <span class="kwrd">false</span>);
        <span class="kwrd">foreach</span> (ScriptReferenceAttribute r <span class="kwrd">in</span> scriptReferences)
        {
            references.Add(r.GetScriptReference());
        } 

        <span class="kwrd">return</span> references;
    }
} 

[AttributeUsage(AttributeTargets.Property, AllowMultiple = <span class="kwrd">false</span>)]
<span class="kwrd">public</span> <span class="kwrd">class</span> ScriptControlPropertyAttribute : Attribute
{
    <span class="kwrd">public</span> ScriptControlPropertyAttribute() { } 

    <span class="kwrd">public</span> ScriptControlPropertyAttribute(<span class="kwrd">string</span> name)
    {
        <span class="kwrd">this</span>.Name = name;
    } 

    <span class="kwrd">public</span> <span class="kwrd">string</span> Name { get; set; }
} 

[AttributeUsage(AttributeTargets.Class, AllowMultiple = <span class="kwrd">true</span>)]
<span class="kwrd">public</span> <span class="kwrd">class</span> ScriptReferenceAttribute : Attribute
{
    <span class="kwrd">public</span> ScriptReferenceAttribute(<span class="kwrd">string</span> path)
    {
        <span class="kwrd">this</span>.Path = path;
    } 

    <span class="kwrd">public</span> ScriptReferenceAttribute(<span class="kwrd">string</span> name, <span class="kwrd">string</span> assembly)
    {
        <span class="kwrd">this</span>.Name = name;
        <span class="kwrd">this</span>.Assembly = assembly;
    } 

    <span class="kwrd">private</span> <span class="kwrd">string</span> _path = <span class="kwrd">null</span>;
    <span class="kwrd">public</span> <span class="kwrd">string</span> Path
    {
        get { <span class="kwrd">return</span> _path; }
        set { _path = <span class="kwrd">value</span>; }
    } 

    <span class="kwrd">private</span> <span class="kwrd">string</span> _name = <span class="kwrd">null</span>;
    <span class="kwrd">public</span> <span class="kwrd">string</span> Name
    {
        get { <span class="kwrd">return</span> _name; }
        set { _name = <span class="kwrd">value</span>; }
    } 

    <span class="kwrd">private</span> <span class="kwrd">string</span> _assembly = <span class="kwrd">null</span>;
    <span class="kwrd">public</span> <span class="kwrd">string</span> Assembly
    {
        get { <span class="kwrd">return</span> _assembly; }
        set { _assembly = <span class="kwrd">value</span>; }
    } 

    <span class="kwrd">public</span> ScriptReference GetScriptReference()
    {
        ScriptReference r = <span class="kwrd">null</span>; 

        <span class="kwrd">if</span> (<span class="kwrd">this</span>.Path == <span class="kwrd">null</span>)
        {
            r = <span class="kwrd">new</span> ScriptReference(<span class="kwrd">this</span>.Name, <span class="kwrd">this</span>.Assembly);
        }
        <span class="kwrd">else</span>
        {
            r = <span class="kwrd">new</span> ScriptReference(<span class="kwrd">this</span>.Path);
        } 

        <span class="kwrd">return</span> r;
    }
}</pre>

<h3>Conclusion</h3>

<p>As you can see it's fairly simple to get started creating your own custom server controls that inherit from ScriptControl, especially if you use the above ScriptControlBase class along with its ScriptControlPropertyAttribute and ScriptReferenceAttribute attributes. </p>

<p>Download Full Source Code: <a href="/file.axd?file=CreateAJAXServerControlUsingScriptControlBaseClass.zip" rel="enclosure">CreateAJAXServerControlUsingScriptControlBaseClass.zip (33.31 kb)</a> </p>

<p><strong>Update 5/31/2008:</strong> I recently posted an article titled &quot;<a href="/post/2008/05/ASPNET_35_Create_AJAX_Extender_Controls_using_the_ExtenderControl_base_class.aspx">Create AJAX Extender Controls using the ExtenderControl base class</a>&quot; on how to create Extender Controls in ASP.NET using the System.Web.UI.ExtenderControl base class. </p>
