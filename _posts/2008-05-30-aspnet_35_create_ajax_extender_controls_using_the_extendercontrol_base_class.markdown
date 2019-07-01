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



*The ExtenderControl class enables you to programmatically add AJAX functionality to an ASP.NET server control. The ExtenderControl inherits from the Control class and implements the IExtenderControl interface. The Control class defines the properties, methods, and events that are shared by all ASP.NET server controls. The <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.iextendercontrol.aspx">IExtenderControl</a> interface is an abstract class, which you cannot instantiate directly. Instead, you create a derived type.* 

<h3>Basics of created Extender Controls that Inherit from ExtenderControl</h3>


When first creating your custom extender control you need to inherit from the ExtenderControl base class. The first thing you&#39;ll see is the ExtenderControl requires you to implement to methods: GetScriptDescriptors and GetScriptReferences. The GetScriptDescriptors method is used to get an IEnumerable collection of ScriptDescriptor objects that basically define any of the controls client-side AJAX properties. The GetScriptReferences method is used to get an IEnumerable collection of ECMAScript (JavaScript) files that will be loaded on the client-side once the page loads; this is used to basically define any client-side scripts the control will require to run on the client. 



[code:c#] 



[TargetControlType(typeof(Control))]

public class FocusExtender : System.Web.UI.ExtenderControl

{

    protected override System.Collections.Generic.IEnumerable<ScriptDescriptor> GetScriptDescriptors(Control targetControl)

    {

        throw new NotImplementedException();

    } 



    protected override System.Collections.Generic.IEnumerable<ScriptReference> GetScriptReferences()

    {

        throw new NotImplementedException();

    }

} 



``` 



You may have noticed the TargetControlType attribute applied to the FocusExtender control; this attribute is required, and is used to define the type of control that the extender explicitly works with. In the case of this example, I&#39;m setting it to work with any thing that inherits from the Control class, which is all server controls. 



**Define ScriptReferences** 



In the GetScriptReferences method, return an IEnumerable collection of the ScriptReference objects to include in the page on the client-side. 



Here&#39;s a basic example of setting up a ScriptReference that includes a script resource that is embedded within the assembly that FocusExtender is contained in: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable<ScriptReference> GetScriptReferences()

{

    yield return new ScriptReference(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;CustomExtenderControl&quot;);;

} 



``` 



When inheriting from ExtenderControl you&#39;ll always have at least one ScriptReference, because you need to reference the script that creates the client-side JavaScript representation of your extender control. 



**Define ScriptDescriptors** 



In the GetScriptDescriptors method, return an IEnumerable collection of ScriptDescriptor objects that define what properties will be passed down to the client-side JavaScript representation of your control. 



The only ScriptDescriptor you need to return in the IEnumerable collection is a  ScriptBehaviorDescriptor instance that contains all the descriptors for your extender control. 



Here&#39;s a basic example of returning a ScriptBehaviorDescriptor without any properties being defined: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable<ScriptDescriptor> GetScriptDescriptors(Control targetControl)

{

    ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID) 



    yield return descriptor;

} 



``` 



**What ECMAScript (JavaScript) code is needed?** 



There is a basic block of JavaScript code that you&#39;ll need to include that will define the client-side JavaScript representation of your control. This basic block of code is the same base code that you&#39;ll start with when creating all extender controls. 



Here&#39;s the basic JavaScript that will define the client-side JavaScript representation of the ForucExtender control we&#39;re using in this example. One thing to remember is that the namespaces and object name in the JavaScript file need to be the same as they are in the server-side .NET code. *In case you&#39;re wonderin, there is a way to make the client-side and server-side namespaces different, but that&#39;s beyond the scope of this article.* 



Type.registerNamespace(&quot;CustomExtenderControl&quot;); 



CustomExtenderControl.FocusExtender = function(element) {

    CustomExtenderControl.FocusExtender.initializeBase(this, [element]);

}; 



CustomExtenderControl.FocusExtender.prototype = {

    initialize:function(){

        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);

    },

    dispose:function(){

        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);

    }

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



public string HighlightCssClass { get; set; }

public string NoHighlightCssClass { get; set; } 



``` 



**Add the ScriptDescriptor for the HighlightCssClass and NoHighlightCssClass Properties** 



Just modify the GetScriptDescriptor method above to look like the following: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable<ScriptDescriptor> GetScriptDescriptors(Control targetControl)

{

    ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID) 



    descriptor.AddProperty(&quot;HighlightCssClass&quot;, this.HighlightCssClass);

    descriptor.AddProperty(&quot;NoHighlightCssClass&quot;, this.NoHighlightCssClass); 



    yield return descriptor;

} 



``` 



**Add the Client-Side Name Property that will receive the value** 



To do this we need to add a &quot;private&quot; like variable for each CSS property and property accessor methods for each to our JavaScript. 



Here&#39;s the above JavaScript file with the &quot;private&quot; variables and property accessors added for the CSS properties: 



Type.registerNamespace(&quot;CustomExtenderControl&quot;); 



CustomExtenderControl.FocusExtender = function(element) {

    CustomExtenderControl.FocusExtender.initializeBase(this, [element]);

    this._HighlightCssClass = null;

    this._NoHighlightCssClass = null;

}; 



CustomExtenderControl.FocusExtender.prototype = {

    initialize:function(){

        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);

    },

    dispose:function(){

        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);

    },

    

    get_HighlightCssClass:function() {

        return this._HighlightCssClass;

    },

    set_HighlightCssClass:function(v) {

        this._HighlightCssClass = v;

    },

    get_NoHighlightCssClass:function() {

        return this._NoHighlightCssClass;

    },

    set_NoHighlightCssClass:function(v) {

        this._NoHighlightCssClass = v;

    }

}; 



CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior); 



Sys.Application.notifyScriptLoaded(); 



**Set the TargetControls CSS according to the Focus** 



In this example we&#39;re going to attach event handlers to the TargetControl&#39;s focus and blur events that will change the controls CSS. 



Here&#39;s the above JavaScript code with the event handlers added: 



Type.registerNamespace(&quot;CustomExtenderControl&quot;);

CustomExtenderControl.FocusExtender = function(element) {

    CustomExtenderControl.FocusExtender.initializeBase(this, [element]);

    this._HighlightCssClass = null;

    this._NoHighlightCssClass = null;

    

    this._focusHandler = Function.createDelegate(this, this._onFocus);

    this._blurHandler = Function.createDelegate(this, this._onBlur);

};

CustomExtenderControl.FocusExtender.prototype = {

    initialize:function(){

        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);

        

        var targetElement = this.get_element();

        

        $addHandler(targetElement, &quot;focus&quot;, this._focusHandler);

        $addHandler(targetElement, &quot;blur&quot;, this._blurHandler);        

    },

    dispose:function(){

        var targetElement = this.get_element();

        

        $removeHandler(targetElement, &quot;focus&quot;, this._focusHandler);    

        $removeHandler(targetElement, &quot;blur&quot;, this._blurHandler);

    

        CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);

    },

    

    get_HighlightCssClass:function() {

        return this._HighlightCssClass;

    },

    set_HighlightCssClass:function(v) {

        this._HighlightCssClass = v;

    },

    get_NoHighlightCssClass:function() {

        return this._NoHighlightCssClass;

    },

    set_NoHighlightCssClass:function(v) {

        this._NoHighlightCssClass = v;

    },

    

    //Event Handler Methods

    _onFocus:function(eventArgs) {

        var targetElement = this.get_element();

        if (targetElement != null)

        {

            targetElement.className = this.get_HighlightCssClass();

        }

    },

    _onBlur:function(eventArgs) {

        var targetElement = this.get_element();

        if (targetElement != null)

        {

            targetElement.className = this.get_NoHighlightCssClass();

        }

    }

};

CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior);

Sys.Application.notifyScriptLoaded(); 



 

<h3>Tips and Tricks</h3>
<h4>Tip #1: Simplify Creating ExtenderControls using a custom ExtenderControlBase class</h4>


One trick that I&#39;ve learned, that proves useful when creating custom Extender Controls, is to create your own base class that inherits from ExtenderControl and extends it to use some custom attributes to make adding ScriptReferences and ScriptDescriptors easier. This is the same trick that I learned from creating ScriptControls. 



Here&#39;s what the final server-side code for the FocusExtender object would look like when using custom attributes and our very own ExtenderControl base class to add ScriptReferences and ScriptDescriptors: 



[code:c#] 



[TargetControlType(typeof(Control)),

ScriptReference(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;CustomExtenderControl&quot;)]

public class FocusExtender : ExtenderControlBase

{

    [ExtenderControlProperty]

    public string HighlightCssClass { get; set; } 



    [ExtenderControlProperty]

    public string NoHighlightCssClass { get; set; }

} 



``` 



As you can see, the new code for the FocusExtender using this ExtenderControlBase class with custom attributes is much cleaner and easier to read. 



Here&#39;s the complete code for the ExtenderControlBase, ScriptReferenceAttribute and ExtenderControlPropertyAttribute objects: 



[code:c#] 



using System;

using System.Collections.Generic;

using System.ComponentModel;

using System.Web.UI; 



public class ExtenderControlBase : ExtenderControl

{

    protected override IEnumerable<ScriptDescriptor> GetScriptDescriptors(Control targetControl)

    {

        ScriptControlDescriptor descriptor = new ScriptControlDescriptor(this.GetType().FullName, targetControl.ClientID); 



        // Add all the ExtenderControls Client-Side Object Properties

        PropertyDescriptorCollection props = TypeDescriptor.GetProperties(this);

        foreach (PropertyDescriptor prop in props)

        {

            ExtenderControlPropertyAttribute propAttr = prop.Attributes[typeof(ExtenderControlPropertyAttribute)] as ExtenderControlPropertyAttribute;

            if (propAttr != null)

            {

                object value = prop.GetValue(this);

                string name = (propAttr.Name != null) ? propAttr.Name : prop.Name;

                if (value != null)

                {

                    descriptor.AddProperty(name, value);

                }

            }

        } 



        yield return descriptor;

    } 



    protected override IEnumerable<ScriptReference> GetScriptReferences()

    {

        // Add all the ExtenderControls Client-Side JavaScript References

        object[] scriptReferences = Attribute.GetCustomAttributes(this.GetType(), typeof(ScriptReferenceAttribute), false);

        foreach (ScriptReferenceAttribute r in scriptReferences)

        {

            yield return r.GetScriptReference();

        }

    }

} 



[AttributeUsage(AttributeTargets.Property, AllowMultiple = false)]

public class ExtenderControlPropertyAttribute : Attribute

{

    public ExtenderControlPropertyAttribute() { } 



    public ExtenderControlPropertyAttribute(string name)

    {

        this.Name = name;

    } 



    public string Name { get; set; }

} 



[AttributeUsage(AttributeTargets.Class, AllowMultiple = true)]

public class ScriptReferenceAttribute : Attribute

{

    public ScriptReferenceAttribute(string path)

    {

        this.Path = path;

    } 



    public ScriptReferenceAttribute(string name, string assembly)

    {

        this.Name = name;

        this.Assembly = assembly;

    } 



    private string _path = null;

    public string Path

    {

        get { return _path; }

        set { _path = value; }

    } 



    private string _name = null;

    public string Name

    {

        get { return _name; }

        set { _name = value; }

    } 



    private string _assembly = null;

    public string Assembly

    {

        get { return _assembly; }

        set { _assembly = value; }

    } 



    public ScriptReference GetScriptReference()

    {

        ScriptReference r = null; 



        if (this.Path == null)

        {

            r = new ScriptReference(this.Name, this.Assembly);

        }

        else

        {

            r = new ScriptReference(this.Path);

        } 



        return r;

    }

} 



``` 

<h4>Tip #2: Access ExtenderControl via JavaScript</h4>


Another trick that I figured out allows you to be able to reference the custom extender control from within JavaScript. The issue this solves is the fact that the ExtenderControl base class doesn&#39;t send the control ID down to the client, so there is no way to get a reference to it for manipulation via JavaScript. 



To do this all we need to do is add a property named &quot;id&quot; to the ScriptBehaviorDescriptor within the GetScriptDescriptor method. Here&#39;s an example of doing this: 



[code:c#] 



protected override System.Collections.Generic.IEnumerable<ScriptDescriptor> GetScriptDescriptors(Control targetControl)

{

    ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID); 



    descriptor.AddProperty(&quot;id&quot;, this.ClientID); 



    descriptor.AddProperty(&quot;HighlightCssClass&quot;, this.HighlightCssClass);

    descriptor.AddProperty(&quot;NoHighlightCssClass&quot;, this.NoHighlightCssClass); 



    yield return descriptor;

} 



``` 



Now with the following FocusExtender control in the page: 



[code:html] 



<cec:FocusExtender runat=&quot;server&quot; id=&quot;FocusExtender1&quot;

    TargetControlID=&quot;TextBox1&quot;

    HighlightCssClass=&quot;Highlight&quot; NoHighlightCssClass=&quot;NoHightlight&quot;>

</cec:FocusExtender> 



``` 



We can access it from JavaScript like so: 



[code:html] 



<input type=&quot;button&quot; value=&quot;Show HighlightCssClass&quot; onclick=&quot;ShowHighlightCssClass();&quot; />

<script type=&quot;text/javascript&quot;>

    function ShowHighlightCssClass()

    {

        var focusExtender = $find(&quot;<%=FocusExtender1.ClientID%>&quot;);

        alert(focusExtender.get_HighlightCssClass());

    }

</script> 



``` 



It&#39;s kind of strange that the ExtenderControl base class doesn&#39;t automatically link it up to be able to access it from within JavaScript, but at least it&#39;s pretty simple to add. 

<h3>Conclusion</h3>


As you can see it&#39;s fairly simple to get started creating your own custom extender controls that inherit from the ExtenderControl base class, especially if you use the above ExtenderControlBase class along with it&#39;s ExtenderControlPropertyAttribute and ScriptReferenceAttribute attributes. It&#39;s also very simple to enable the ability to access the ExtenderControl from within JavaScript to enable much richer AJAX functionality to be built. 



Download Full Source Code: <a rel="enclosure" href="/files/CreateAJAXExtenderControlUsingExtenderControlBaseClass.zip">CreateAJAXExtenderControlUsingExtenderControlBaseClass.zip (21.36 kb)</a>

