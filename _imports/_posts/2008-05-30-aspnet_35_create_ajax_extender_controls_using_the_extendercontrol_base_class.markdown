---
layout: post
blogengineid: ba924765-2328-4995-a254-6a88d4e4ac11
title: "ASP.NET 3.5: Create AJAX Extender Controls using the ExtenderControl base class"
date: 2008-05-30 23:22:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/05/30/ASPNET_35_Create_AJAX_Extender_Controls_using_the_ExtenderControl_base_class
  - /post/2008/05/30/aspnet_35_create_ajax_extender_controls_using_the_extendercontrol_base_class
  - /post.aspx?id=ba924765-2328-4995-a254-6a88d4e4ac11
---
<!-- more -->


As a followup to the &quot;Create AJAX Server Controls using the ScriptControl base class&quot; post I wrote a couple weeks ago, I&#39;ve decided to write on how to create ASP.NET AJAX Extender Controls using the ExtenderControl base class in ASP.NET 3.5. There is already an article titled &quot;<a href="http://msdn.microsoft.com/en-us/library/bb386403.aspx">Adding ASP.NET AJAX Client Behaviors to Web Server Controls</a>&quot; in MSDN, but it doesn&#39;t show all the code involved in creating Extender Controls, especially the JavaScript code. 

<h3>What is an Extender Control?</h3>


First what exactly is an Extender Control? An Extender Control is basically a non-visual control that adds some sort of AJAX behavior to another control within the page. The majority of the controls within the AjaxControlToolkit are built as Extender Controls. It is a common misconception that you can only create Extender Controls by using the base classes within the AjaxControlToolkit, but in fact ASP.NET 3.5 contains the required ExtenderControl base class to create Extender Controls. 



The base class I&#39;m referring to in this article is the System.Web.UI.ExtenderControl base class located within the System.Web.Extensions.dll assembly. 



According to <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.extendercontrol.aspx">MSDN the ExtenderControl</a> class is: 



<em>The ExtenderControl class enables you to programmatically add AJAX functionality to an ASP.NET server control. The ExtenderControl inherits from the Control class and implements the IExtenderControl interface. The Control class defines the properties, methods, and events that are shared by all ASP.NET server controls. The <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.iextendercontrol.aspx">IExtenderControl</a> interface is an abstract class, which you cannot instantiate directly. Instead, you create a derived type.</em> 

<h3>Basics of created Extender Controls that Inherit from ExtenderControl</h3>


When first creating your custom extender control you need to inherit from the ExtenderControl base class. The first thing you&#39;ll see is the ExtenderControl requires you to implement to methods: GetScriptDescriptors and GetScriptReferences. The GetScriptDescriptors method is used to get an IEnumerable collection of ScriptDescriptor objects that basically define any of the controls client-side AJAX properties. The GetScriptReferences method is used to get an IEnumerable collection of ECMAScript (JavaScript) files that will be loaded on the client-side once the page loads; this is used to basically define any client-side scripts the control will require to run on the client. 



[code:c#] 



[TargetControlType(typeof(Control))]<br />
public class FocusExtender : System.Web.UI.ExtenderControl<br />
{<br />
    protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
    {<br />
        throw new NotImplementedException();<br />
    } 



    protected override System.Collections.Generic.IEnumerable&lt;ScriptReference&gt; GetScriptReferences()<br />
    {<br />
        throw new NotImplementedException();<br />
    }<br />
} 



``` 



You may have noticed the TargetControlType attribute applied to the FocusExtender control; this attribute is required, and is used to define the type of control that the extender explicitly works with. In the case of this example, I&#39;m setting it to work with any thing that inherits from the Control class, which is all server controls. 



**Define ScriptReferences** 



In the GetScriptReferences method, return an IEnumerable collection of the ScriptReference objects to include in the page on the client-side. 



Here&#39;s a basic example of setting up a ScriptReference that includes a script resource that is embedded within the assembly that FocusExtender is contained in: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable&lt;ScriptReference&gt; GetScriptReferences()<br />
{<br />
    yield return new ScriptReference(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;CustomExtenderControl&quot;);;<br />
} 



``` 



When inheriting from ExtenderControl you&#39;ll always have at least one ScriptReference, because you need to reference the script that creates the client-side JavaScript representation of your extender control. 



**Define ScriptDescriptors** 



In the GetScriptDescriptors method, return an IEnumerable collection of ScriptDescriptor objects that define what properties will be passed down to the client-side JavaScript representation of your control. 



The only ScriptDescriptor you need to return in the IEnumerable collection is a  ScriptBehaviorDescriptor instance that contains all the descriptors for your extender control. 



Here&#39;s a basic example of returning a ScriptBehaviorDescriptor without any properties being defined: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
{<br />
    ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID) 



    yield return descriptor;<br />
} 



``` 



**What ECMAScript (JavaScript) code is needed?** 



There is a basic block of JavaScript code that you&#39;ll need to include that will define the client-side JavaScript representation of your control. This basic block of code is the same base code that you&#39;ll start with when creating all extender controls. 



Here&#39;s the basic JavaScript that will define the client-side JavaScript representation of the ForucExtender control we&#39;re using in this example. One thing to remember is that the namespaces and object name in the JavaScript file need to be the same as they are in the server-side .NET code. <em>In case you&#39;re wonderin, there is a way to make the client-side and server-side namespaces different, but that&#39;s beyond the scope of this article.</em> 



Type.registerNamespace(&quot;CustomExtenderControl&quot;); 



CustomExtenderControl.FocusExtender = function(element) {<br />
    CustomExtenderControl.FocusExtender.initializeBase(this, [element]);<br />
}; 



CustomExtenderControl.FocusExtender.prototype = {<br />
    initialize:function(){<br />
        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);<br />
    },<br />
    dispose:function(){<br />
        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);<br />
    }<br />
}; 



CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior); 



Sys.Application.notifyScriptLoaded(); 



Also, in order for the ExtenderControl to correctly load the &quot;CustomExtenderControl.FocusExtender.js&quot; script reference that we&#39;re using in this example, we must not forget to define the assemblies embedded resource as a Web Resource, like so: 



[code:c#] 



[assembly: System.Web.UI.WebResource(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;text/javascript&quot;)] 



```  

<h3>Let&#39;s Add a Little &quot;Rich&quot; AJAX Functionality to the Extender Control</h3>


Now that we have a basic ExtenderControl created, we can start adding out &quot;rich&quot; AJAX functionality that we will use to extend our target server control in the page. 



In this article, I&#39;m going to keep things extemely simple, and we&#39;re going to do the following: 

<ol>
	<li>Pass HighlightCssClass and NoHighlightCssClass properties down to the client, that will determin the CSS class&#39;s used to highlight out server control (in this article a TextBox).</li>
</ol>


**Add the HighlightCssClass and NoHighlightCssClass Properties** 



[code:c#] 



public string HighlightCssClass { get; set; }<br />
public string NoHighlightCssClass { get; set; } 



``` 



**Add the ScriptDescriptor for the HighlightCssClass and NoHighlightCssClass Properties** 



Just modify the GetScriptDescriptor method above to look like the following: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
{<br />
    ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID) 



    descriptor.AddProperty(&quot;HighlightCssClass&quot;, this.HighlightCssClass);<br />
    descriptor.AddProperty(&quot;NoHighlightCssClass&quot;, this.NoHighlightCssClass); 



    yield return descriptor;<br />
} 



``` 



**Add the Client-Side Name Property that will receive the value** 



To do this we need to add a &quot;private&quot; like variable for each CSS property and property accessor methods for each to our JavaScript. 



Here&#39;s the above JavaScript file with the &quot;private&quot; variables and property accessors added for the CSS properties: 



Type.registerNamespace(&quot;CustomExtenderControl&quot;); 



CustomExtenderControl.FocusExtender = function(element) {<br />
    CustomExtenderControl.FocusExtender.initializeBase(this, [element]);<br />
    this._HighlightCssClass = null;<br />
    this._NoHighlightCssClass = null;<br />
}; 



CustomExtenderControl.FocusExtender.prototype = {<br />
    initialize:function(){<br />
        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);<br />
    },<br />
    dispose:function(){<br />
        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);<br />
    },<br />
    <br />
    get_HighlightCssClass:function() {<br />
        return this._HighlightCssClass;<br />
    },<br />
    set_HighlightCssClass:function(v) {<br />
        this._HighlightCssClass = v;<br />
    },<br />
    get_NoHighlightCssClass:function() {<br />
        return this._NoHighlightCssClass;<br />
    },<br />
    set_NoHighlightCssClass:function(v) {<br />
        this._NoHighlightCssClass = v;<br />
    }<br />
}; 



CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior); 



Sys.Application.notifyScriptLoaded(); 



**Set the TargetControls CSS according to the Focus** 



In this example we&#39;re going to attach event handlers to the TargetControl&#39;s focus and blur events that will change the controls CSS. 



Here&#39;s the above JavaScript code with the event handlers added: 



Type.registerNamespace(&quot;CustomExtenderControl&quot;);<br />
CustomExtenderControl.FocusExtender = function(element) {<br />
    CustomExtenderControl.FocusExtender.initializeBase(this, [element]);<br />
    this._HighlightCssClass = null;<br />
    this._NoHighlightCssClass = null;<br />
    <br />
    this._focusHandler = Function.createDelegate(this, this._onFocus);<br />
    this._blurHandler = Function.createDelegate(this, this._onBlur);<br />
};<br />
CustomExtenderControl.FocusExtender.prototype = {<br />
    initialize:function(){<br />
        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);<br />
        <br />
        var targetElement = this.get_element();<br />
        <br />
        $addHandler(targetElement, &quot;focus&quot;, this._focusHandler);<br />
        $addHandler(targetElement, &quot;blur&quot;, this._blurHandler);        <br />
    },<br />
    dispose:function(){<br />
        var targetElement = this.get_element();<br />
        <br />
        $removeHandler(targetElement, &quot;focus&quot;, this._focusHandler);    <br />
        $removeHandler(targetElement, &quot;blur&quot;, this._blurHandler);<br />
    <br />
        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);<br />
    },<br />
    <br />
    get_HighlightCssClass:function() {<br />
        return this._HighlightCssClass;<br />
    },<br />
    set_HighlightCssClass:function(v) {<br />
        this._HighlightCssClass = v;<br />
    },<br />
    get_NoHighlightCssClass:function() {<br />
        return this._NoHighlightCssClass;<br />
    },<br />
    set_NoHighlightCssClass:function(v) {<br />
        this._NoHighlightCssClass = v;<br />
    },<br />
    <br />
    //Event Handler Methods<br />
    _onFocus:function(eventArgs) {<br />
        var targetElement = this.get_element();<br />
        if (targetElement != null)<br />
        {<br />
            targetElement.className = this.get_HighlightCssClass();<br />
        }<br />
    },<br />
    _onBlur:function(eventArgs) {<br />
        var targetElement = this.get_element();<br />
        if (targetElement != null)<br />
        {<br />
            targetElement.className = this.get_NoHighlightCssClass();<br />
        }<br />
    }<br />
};<br />
CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior);<br />
Sys.Application.notifyScriptLoaded(); 



 

<h3>Tips and Tricks</h3>
<h4>Tip #1: Simplify Creating ExtenderControls using a custom ExtenderControlBase class</h4>


One trick that I&#39;ve learned, that proves useful when creating custom Extender Controls, is to create your own base class that inherits from ExtenderControl and extends it to use some custom attributes to make adding ScriptReferences and ScriptDescriptors easier. This is the same trick that I learned from creating ScriptControls. 



Here&#39;s what the final server-side code for the FocusExtender object would look like when using custom attributes and our very own ExtenderControl base class to add ScriptReferences and ScriptDescriptors: 



[code:c#] 



[TargetControlType(typeof(Control)),<br />
ScriptReference(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;CustomExtenderControl&quot;)]<br />
public class FocusExtender : ExtenderControlBase<br />
{<br />
    [ExtenderControlProperty]<br />
    public string HighlightCssClass { get; set; } 



    [ExtenderControlProperty]<br />
    public string NoHighlightCssClass { get; set; }<br />
} 



``` 



As you can see, the new code for the FocusExtender using this ExtenderControlBase class with custom attributes is much cleaner and easier to read. 



Here&#39;s the complete code for the ExtenderControlBase, ScriptReferenceAttribute and ExtenderControlPropertyAttribute objects: 



[code:c#] 



using System;<br />
using System.Collections.Generic;<br />
using System.ComponentModel;<br />
using System.Web.UI; 



public class ExtenderControlBase : ExtenderControl<br />
{<br />
    protected override IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
    {<br />
        ScriptControlDescriptor descriptor = new ScriptControlDescriptor(this.GetType().FullName, targetControl.ClientID); 



        // Add all the ExtenderControls Client-Side Object Properties<br />
        PropertyDescriptorCollection props = TypeDescriptor.GetProperties(this);<br />
        foreach (PropertyDescriptor prop in props)<br />
        {<br />
            ExtenderControlPropertyAttribute propAttr = prop.Attributes[typeof(ExtenderControlPropertyAttribute)] as ExtenderControlPropertyAttribute;<br />
            if (propAttr != null)<br />
            {<br />
                object value = prop.GetValue(this);<br />
                string name = (propAttr.Name != null) ? propAttr.Name : prop.Name;<br />
                if (value != null)<br />
                {<br />
                    descriptor.AddProperty(name, value);<br />
                }<br />
            }<br />
        } 



        yield return descriptor;<br />
    } 



    protected override IEnumerable&lt;ScriptReference&gt; GetScriptReferences()<br />
    {<br />
        // Add all the ExtenderControls Client-Side JavaScript References<br />
        object[] scriptReferences = Attribute.GetCustomAttributes(this.GetType(), typeof(ScriptReferenceAttribute), false);<br />
        foreach (ScriptReferenceAttribute r in scriptReferences)<br />
        {<br />
            yield return r.GetScriptReference();<br />
        }<br />
    }<br />
} 



[AttributeUsage(AttributeTargets.Property, AllowMultiple = false)]<br />
public class ExtenderControlPropertyAttribute : Attribute<br />
{<br />
    public ExtenderControlPropertyAttribute() { } 



    public ExtenderControlPropertyAttribute(string name)<br />
    {<br />
        this.Name = name;<br />
    } 



    public string Name { get; set; }<br />
} 



[AttributeUsage(AttributeTargets.Class, AllowMultiple = true)]<br />
public class ScriptReferenceAttribute : Attribute<br />
{<br />
    public ScriptReferenceAttribute(string path)<br />
    {<br />
        this.Path = path;<br />
    } 



    public ScriptReferenceAttribute(string name, string assembly)<br />
    {<br />
        this.Name = name;<br />
        this.Assembly = assembly;<br />
    } 



    private string _path = null;<br />
    public string Path<br />
    {<br />
        get { return _path; }<br />
        set { _path = value; }<br />
    } 



    private string _name = null;<br />
    public string Name<br />
    {<br />
        get { return _name; }<br />
        set { _name = value; }<br />
    } 



    private string _assembly = null;<br />
    public string Assembly<br />
    {<br />
        get { return _assembly; }<br />
        set { _assembly = value; }<br />
    } 



    public ScriptReference GetScriptReference()<br />
    {<br />
        ScriptReference r = null; 



        if (this.Path == null)<br />
        {<br />
            r = new ScriptReference(this.Name, this.Assembly);<br />
        }<br />
        else<br />
        {<br />
            r = new ScriptReference(this.Path);<br />
        } 



        return r;<br />
    }<br />
} 



``` 

<h4>Tip #2: Access ExtenderControl via JavaScript</h4>


Another trick that I figured out allows you to be able to reference the custom extender control from within JavaScript. The issue this solves is the fact that the ExtenderControl base class doesn&#39;t send the control ID down to the client, so there is no way to get a reference to it for manipulation via JavaScript. 



To do this all we need to do is add a property named &quot;id&quot; to the ScriptBehaviorDescriptor within the GetScriptDescriptor method. Here&#39;s an example of doing this: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
{<br />
    ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID); 



    descriptor.AddProperty(&quot;id&quot;, this.ClientID); 



    descriptor.AddProperty(&quot;HighlightCssClass&quot;, this.HighlightCssClass);<br />
    descriptor.AddProperty(&quot;NoHighlightCssClass&quot;, this.NoHighlightCssClass); 



    yield return descriptor;<br />
} 



``` 



Now with the following FocusExtender control in the page: 



[code:html] 



&lt;cec:FocusExtender runat=&quot;server&quot; id=&quot;FocusExtender1&quot;<br />
    TargetControlID=&quot;TextBox1&quot;<br />
    HighlightCssClass=&quot;Highlight&quot; NoHighlightCssClass=&quot;NoHightlight&quot;&gt;<br />
&lt;/cec:FocusExtender&gt; 



``` 



We can access it from JavaScript like so: 



[code:html] 



&lt;input type=&quot;button&quot; value=&quot;Show HighlightCssClass&quot; onclick=&quot;ShowHighlightCssClass();&quot; /&gt;<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
    function ShowHighlightCssClass()<br />
    {<br />
        var focusExtender = $find(&quot;&lt;%=FocusExtender1.ClientID%&gt;&quot;);<br />
        alert(focusExtender.get_HighlightCssClass());<br />
    }<br />
&lt;/script&gt; 



``` 



It&#39;s kind of strange that the ExtenderControl base class doesn&#39;t automatically link it up to be able to access it from within JavaScript, but at least it&#39;s pretty simple to add. 

<h3>Conclusion</h3>


As you can see it&#39;s fairly simple to get started creating your own custom extender controls that inherit from the ExtenderControl base class, especially if you use the above ExtenderControlBase class along with it&#39;s ExtenderControlPropertyAttribute and ScriptReferenceAttribute attributes. It&#39;s also very simple to enable the ability to access the ExtenderControl from within JavaScript to enable much richer AJAX functionality to be built. 



Download Full Source Code: <a rel="enclosure" href="/file.axd?file=CreateAJAXExtenderControlUsingExtenderControlBaseClass.zip">CreateAJAXExtenderControlUsingExtenderControlBaseClass.zip (21.36 kb)</a>

