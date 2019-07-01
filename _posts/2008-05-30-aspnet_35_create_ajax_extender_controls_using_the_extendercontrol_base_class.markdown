  ---
  layout: post
  title: "ASP.NET 3.5: Create AJAX Extender Controls using the ExtenderControl base class"
  date: 2008-05-30 23:22:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["asp.net"]
  alias: ["/post/2008/05/30/ASPNET_35_Create_AJAX_Extender_Controls_using_the_ExtenderControl_base_class", "/post/2008/05/30/aspnet_35_create_ajax_extender_controls_using_the_extendercontrol_base_class"]
  ---
<!-- more -->
<p>
As a followup to&nbsp;the &quot;Create AJAX Server Controls using the ScriptControl base class&quot; post I wrote a couple weeks ago, I&#39;ve decided to write on how to create ASP.NET AJAX Extender Controls using the ExtenderControl base class in ASP.NET 3.5. There is already an article titled &quot;<a href="http://msdn.microsoft.com/en-us/library/bb386403.aspx">Adding ASP.NET AJAX Client Behaviors to Web Server Controls</a>&quot; in MSDN, but it doesn&#39;t show all the code involved in creating Extender Controls, especially the JavaScript code. 
</p>
<h3>What is an Extender Control?</h3>
<p>
First what exactly is an Extender Control? An Extender Control is basically a non-visual control that adds&nbsp;some sort of AJAX behavior to another control within the page. The majority of the controls within the AjaxControlToolkit are built as Extender Controls.&nbsp;It is a common misconception that you can only create Extender Controls by using the base classes within the AjaxControlToolkit, but in fact ASP.NET 3.5 contains the required ExtenderControl base class to create Extender Controls. 
</p>
<p>
The base class I&#39;m referring to in this article&nbsp;is the System.Web.UI.ExtenderControl base class located within the System.Web.Extensions.dll assembly. 
</p>
<p>
According to <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.extendercontrol.aspx">MSDN the ExtenderControl</a> class is: 
</p>
<p>
<em>The ExtenderControl class enables you to programmatically add AJAX functionality to an ASP.NET server control. The ExtenderControl inherits from the Control class and implements the IExtenderControl interface. The Control class defines the properties, methods, and events that are shared by all ASP.NET server controls. The <a href="http://msdn.microsoft.com/en-us/library/system.web.ui.iextendercontrol.aspx">IExtenderControl</a> interface is an abstract class, which you cannot instantiate directly. Instead, you create a derived type.</em> 
</p>
<h3>Basics of created Extender Controls that Inherit from ExtenderControl</h3>
<p>
When first creating your custom extender control you need to inherit from the ExtenderControl base class. The first thing you&#39;ll see is the ExtenderControl requires you to implement to methods: GetScriptDescriptors and GetScriptReferences. The GetScriptDescriptors method is used to get an IEnumerable collection of ScriptDescriptor objects that basically define any of the controls client-side AJAX properties. The GetScriptReferences method is used to get an IEnumerable collection of ECMAScript (JavaScript) files that will be loaded on the client-side once the page loads; this is used to basically define any client-side scripts the control will require to run on the client. 
</p>
<p>
[code:c#] 
</p>
<p>
[TargetControlType(typeof(Control))]<br />
public class FocusExtender : System.Web.UI.ExtenderControl<br />
{<br />
&nbsp;&nbsp;&nbsp; protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new NotImplementedException();<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; protected override System.Collections.Generic.IEnumerable&lt;ScriptReference&gt; GetScriptReferences()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new NotImplementedException();<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
[/code] 
</p>
<p>
You may have noticed the TargetControlType attribute applied to the FocusExtender control; this attribute is required, and is used to define the&nbsp;type of control that the extender explicitly works with. In the case of this example, I&#39;m setting it to work with any thing that inherits from the Control class, which is all server controls. 
</p>
<p>
<strong>Define ScriptReferences</strong> 
</p>
<p>
In the GetScriptReferences method, return an IEnumerable collection of the ScriptReference objects to include in the page on the client-side. 
</p>
<p>
Here&#39;s a basic example of setting up a ScriptReference that includes a script resource that is embedded within the assembly that FocusExtender is contained in: 
</p>
<p>
[code:c#] 
</p>
<p>
protected override System.Collections.Generic.IEnumerable&lt;ScriptReference&gt; GetScriptReferences()<br />
{<br />
&nbsp;&nbsp;&nbsp; yield return new ScriptReference(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;CustomExtenderControl&quot;);;<br />
} 
</p>
<p>
[/code] 
</p>
<p>
When inheriting from ExtenderControl you&#39;ll always have at least one ScriptReference, because you need to reference the script that creates the client-side JavaScript representation of your extender control. 
</p>
<p>
<strong>Define ScriptDescriptors</strong> 
</p>
<p>
In the GetScriptDescriptors method, return an IEnumerable collection of&nbsp;ScriptDescriptor objects that define what properties will be passed&nbsp;down to the client-side JavaScript representation of your control. 
</p>
<p>
The only&nbsp;ScriptDescriptor you need to return in the IEnumerable collection is a &nbsp;ScriptBehaviorDescriptor instance that contains all the descriptors for your extender control. 
</p>
<p>
Here&#39;s a basic example of returning a ScriptBehaviorDescriptor without any properties being defined: 
</p>
<p>
[code:c#] 
</p>
<p>
protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
{<br />
&nbsp;&nbsp;&nbsp; ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID) 
</p>
<p>
&nbsp;&nbsp;&nbsp; yield return descriptor;<br />
} 
</p>
<p>
[/code] 
</p>
<p>
<strong>What ECMAScript (JavaScript) code is needed?</strong> 
</p>
<p>
There&nbsp;is a basic block of JavaScript code that you&#39;ll need to include&nbsp;that will define the client-side JavaScript representation of your control. This basic block of code is the same base code that you&#39;ll start with when creating all extender controls. 
</p>
<p>
Here&#39;s the basic JavaScript that will define the client-side JavaScript representation of the ForucExtender control we&#39;re using in this example. One thing to remember is that the namespaces and object&nbsp;name in the JavaScript file need to be the same as they are in the server-side .NET code. <em>In case you&#39;re wonderin, there is a way to make the client-side and server-side namespaces different, but that&#39;s beyond the scope of this article.</em> 
</p>
<p>
Type.registerNamespace(&quot;CustomExtenderControl&quot;); 
</p>
<p>
CustomExtenderControl.FocusExtender = function(element) {<br />
&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.initializeBase(this, [element]);<br />
}; 
</p>
<p>
CustomExtenderControl.FocusExtender.prototype = {<br />
&nbsp;&nbsp;&nbsp; initialize:function(){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; dispose:function(){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);<br />
&nbsp;&nbsp;&nbsp; }<br />
}; 
</p>
<p>
CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior); 
</p>
<p>
Sys.Application.notifyScriptLoaded(); 
</p>
<p>
Also, in order for the ExtenderControl to correctly load the &quot;CustomExtenderControl.FocusExtender.js&quot; script reference that we&#39;re using in this example, we must not forget to define the assemblies embedded resource as a Web Resource, like so: 
</p>
<p>
[code:c#] 
</p>
<p>
[assembly: System.Web.UI.WebResource(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;text/javascript&quot;)] 
</p>
<p>
[/code]&nbsp; 
</p>
<h3>Let&#39;s Add a Little &quot;Rich&quot; AJAX Functionality to the Extender Control</h3>
<p>
Now that we have a basic ExtenderControl created, we can start adding out &quot;rich&quot; AJAX functionality that we will use to extend our target server control in the page. 
</p>
<p>
In this article, I&#39;m going to keep things extemely simple, and we&#39;re going to do the following: 
</p>
<ol>
	<li>Pass HighlightCssClass and NoHighlightCssClass properties down to the client, that will determin the CSS class&#39;s used to highlight out server control (in this article a TextBox).</li>
</ol>
<p>
<strong>Add the HighlightCssClass and NoHighlightCssClass Properties</strong> 
</p>
<p>
[code:c#] 
</p>
<p>
public string HighlightCssClass { get; set; }<br />
public string NoHighlightCssClass { get; set; } 
</p>
<p>
[/code] 
</p>
<p>
<strong>Add the ScriptDescriptor for the HighlightCssClass and NoHighlightCssClass Properties</strong> 
</p>
<p>
Just modify the GetScriptDescriptor method above to look like the following: 
</p>
<p>
[code:c#] 
</p>
<p>
protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
{<br />
&nbsp;&nbsp;&nbsp; ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID) 
</p>
<p>
&nbsp;&nbsp;&nbsp; descriptor.AddProperty(&quot;HighlightCssClass&quot;, this.HighlightCssClass);<br />
&nbsp;&nbsp;&nbsp; descriptor.AddProperty(&quot;NoHighlightCssClass&quot;, this.NoHighlightCssClass); 
</p>
<p>
&nbsp;&nbsp;&nbsp; yield return descriptor;<br />
} 
</p>
<p>
[/code] 
</p>
<p>
<strong>Add the Client-Side Name Property that will receive the value</strong> 
</p>
<p>
To do this we need to add a &quot;private&quot; like variable for each CSS property and property accessor methods for each to our JavaScript. 
</p>
<p>
Here&#39;s the above JavaScript file with the &quot;private&quot; variables and property accessors added for the CSS properties: 
</p>
<p>
Type.registerNamespace(&quot;CustomExtenderControl&quot;); 
</p>
<p>
CustomExtenderControl.FocusExtender = function(element) {<br />
&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.initializeBase(this, [element]);<br />
&nbsp;&nbsp;&nbsp; this._HighlightCssClass = null;<br />
&nbsp;&nbsp;&nbsp; this._NoHighlightCssClass = null;<br />
}; 
</p>
<p>
CustomExtenderControl.FocusExtender.prototype = {<br />
&nbsp;&nbsp;&nbsp; initialize:function(){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; dispose:function(){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; get_HighlightCssClass:function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._HighlightCssClass;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; set_HighlightCssClass:function(v) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._HighlightCssClass = v;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; get_NoHighlightCssClass:function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._NoHighlightCssClass;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; set_NoHighlightCssClass:function(v) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._NoHighlightCssClass = v;<br />
&nbsp;&nbsp;&nbsp; }<br />
}; 
</p>
<p>
CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior); 
</p>
<p>
Sys.Application.notifyScriptLoaded(); 
</p>
<p>
<strong>Set the TargetControls CSS according to the Focus</strong> 
</p>
<p>
In this example we&#39;re going to attach&nbsp;event handlers to the TargetControl&#39;s focus and blur events that will change the controls CSS. 
</p>
<p>
Here&#39;s the above JavaScript code with the event handlers added: 
</p>
<p>
Type.registerNamespace(&quot;CustomExtenderControl&quot;);<br />
CustomExtenderControl.FocusExtender = function(element) {<br />
&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.initializeBase(this, [element]);<br />
&nbsp;&nbsp;&nbsp; this._HighlightCssClass = null;<br />
&nbsp;&nbsp;&nbsp; this._NoHighlightCssClass = null;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; this._focusHandler = Function.createDelegate(this, this._onFocus);<br />
&nbsp;&nbsp;&nbsp; this._blurHandler = Function.createDelegate(this, this._onBlur);<br />
};<br />
CustomExtenderControl.FocusExtender.prototype = {<br />
&nbsp;&nbsp;&nbsp; initialize:function(){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;initialize&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var targetElement = this.get_element();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $addHandler(targetElement, &quot;focus&quot;, this._focusHandler);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $addHandler(targetElement, &quot;blur&quot;, this._blurHandler);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; dispose:function(){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var targetElement = this.get_element();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $removeHandler(targetElement, &quot;focus&quot;, this._focusHandler);&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $removeHandler(targetElement, &quot;blur&quot;, this._blurHandler);<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CustomExtenderControl.FocusExtender.callBaseMethod(this, &quot;dispose&quot;);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; get_HighlightCssClass:function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._HighlightCssClass;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; set_HighlightCssClass:function(v) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._HighlightCssClass = v;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; get_NoHighlightCssClass:function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._NoHighlightCssClass;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; set_NoHighlightCssClass:function(v) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._NoHighlightCssClass = v;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; //Event Handler Methods<br />
&nbsp;&nbsp;&nbsp; _onFocus:function(eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var targetElement = this.get_element();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (targetElement != null)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targetElement.className = this.get_HighlightCssClass();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; _onBlur:function(eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var targetElement = this.get_element();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (targetElement != null)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targetElement.className = this.get_NoHighlightCssClass();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }<br />
};<br />
CustomExtenderControl.FocusExtender.registerClass(&quot;CustomExtenderControl.FocusExtender&quot;, Sys.UI.Behavior);<br />
Sys.Application.notifyScriptLoaded(); 
</p>
<p>
&nbsp;
</p>
<h3>Tips and Tricks</h3>
<h4>Tip #1: Simplify Creating ExtenderControls using a custom ExtenderControlBase class</h4>
<p>
One trick that I&#39;ve learned, that proves useful when creating custom Extender Controls, is to create your own base class that inherits from ExtenderControl and extends it to use some custom attributes to make adding ScriptReferences and ScriptDescriptors easier. This is the same trick that I learned from creating ScriptControls. 
</p>
<p>
Here&#39;s what the final server-side code for the FocusExtender object would look like when using custom attributes and our very own ExtenderControl base class to add ScriptReferences and ScriptDescriptors: 
</p>
<p>
[code:c#] 
</p>
<p>
[TargetControlType(typeof(Control)),<br />
ScriptReference(&quot;CustomExtenderControl.FocusExtender.js&quot;, &quot;CustomExtenderControl&quot;)]<br />
public class FocusExtender : ExtenderControlBase<br />
{<br />
&nbsp;&nbsp;&nbsp; [ExtenderControlProperty]<br />
&nbsp;&nbsp;&nbsp; public string HighlightCssClass { get; set; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; [ExtenderControlProperty]<br />
&nbsp;&nbsp;&nbsp; public string NoHighlightCssClass { get; set; }<br />
} 
</p>
<p>
[/code] 
</p>
<p>
As you can see, the new code for the FocusExtender using this ExtenderControlBase class with custom attributes is much cleaner and easier to read. 
</p>
<p>
Here&#39;s the complete code for the ExtenderControlBase, ScriptReferenceAttribute and ExtenderControlPropertyAttribute objects: 
</p>
<p>
[code:c#] 
</p>
<p>
using System;<br />
using System.Collections.Generic;<br />
using System.ComponentModel;<br />
using System.Web.UI; 
</p>
<p>
public class ExtenderControlBase : ExtenderControl<br />
{<br />
&nbsp;&nbsp;&nbsp; protected override IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ScriptControlDescriptor descriptor = new ScriptControlDescriptor(this.GetType().FullName, targetControl.ClientID); 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Add all the ExtenderControls Client-Side Object Properties<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PropertyDescriptorCollection props = TypeDescriptor.GetProperties(this);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach (PropertyDescriptor prop in props)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ExtenderControlPropertyAttribute propAttr = prop.Attributes[typeof(ExtenderControlPropertyAttribute)] as ExtenderControlPropertyAttribute;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (propAttr != null)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object value = prop.GetValue(this);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string name = (propAttr.Name != null) ? propAttr.Name : prop.Name;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (value != null)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; descriptor.AddProperty(name, value);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yield return descriptor;<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; protected override IEnumerable&lt;ScriptReference&gt; GetScriptReferences()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Add all the ExtenderControls Client-Side JavaScript References<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object[] scriptReferences = Attribute.GetCustomAttributes(this.GetType(), typeof(ScriptReferenceAttribute), false);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach (ScriptReferenceAttribute r in scriptReferences)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yield return r.GetScriptReference();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
[AttributeUsage(AttributeTargets.Property, AllowMultiple = false)]<br />
public class ExtenderControlPropertyAttribute : Attribute<br />
{<br />
&nbsp;&nbsp;&nbsp; public ExtenderControlPropertyAttribute() { } 
</p>
<p>
&nbsp;&nbsp;&nbsp; public ExtenderControlPropertyAttribute(string name)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.Name = name;<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; public string Name { get; set; }<br />
} 
</p>
<p>
[AttributeUsage(AttributeTargets.Class, AllowMultiple = true)]<br />
public class ScriptReferenceAttribute : Attribute<br />
{<br />
&nbsp;&nbsp;&nbsp; public ScriptReferenceAttribute(string path)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.Path = path;<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; public ScriptReferenceAttribute(string name, string assembly)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.Name = name;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.Assembly = assembly;<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; private string _path = null;<br />
&nbsp;&nbsp;&nbsp; public string Path<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get { return _path; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set { _path = value; }<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; private string _name = null;<br />
&nbsp;&nbsp;&nbsp; public string Name<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get { return _name; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set { _name = value; }<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; private string _assembly = null;<br />
&nbsp;&nbsp;&nbsp; public string Assembly<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get { return _assembly; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set { _assembly = value; }<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; public ScriptReference GetScriptReference()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ScriptReference r = null; 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (this.Path == null)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = new ScriptReference(this.Name, this.Assembly);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = new ScriptReference(this.Path);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br />
&nbsp;&nbsp;&nbsp; }<br />
} 
</p>
<p>
[/code] 
</p>
<h4>Tip #2: Access ExtenderControl via JavaScript</h4>
<p>
Another trick that I figured out allows you to be able to reference the custom extender control from within JavaScript. The issue this solves is the fact that the ExtenderControl base class doesn&#39;t send the control ID down to the client, so there is no way to get a reference to it for manipulation via JavaScript. 
</p>
<p>
To do this all we need to do is add a property named &quot;id&quot;&nbsp;to the ScriptBehaviorDescriptor within the GetScriptDescriptor method. Here&#39;s an example of doing this: 
</p>
<p>
[code:c#] 
</p>
<p>
protected override System.Collections.Generic.IEnumerable&lt;ScriptDescriptor&gt; GetScriptDescriptors(Control targetControl)<br />
{<br />
&nbsp;&nbsp;&nbsp; ScriptBehaviorDescriptor descriptor = new ScriptBehaviorDescriptor(this.GetType().FullName, targetControl.ClientID); 
</p>
<p>
&nbsp;&nbsp;&nbsp; descriptor.AddProperty(&quot;id&quot;, this.ClientID); 
</p>
<p>
&nbsp;&nbsp;&nbsp; descriptor.AddProperty(&quot;HighlightCssClass&quot;, this.HighlightCssClass);<br />
&nbsp;&nbsp;&nbsp; descriptor.AddProperty(&quot;NoHighlightCssClass&quot;, this.NoHighlightCssClass); 
</p>
<p>
&nbsp;&nbsp;&nbsp; yield return descriptor;<br />
} 
</p>
<p>
[/code] 
</p>
<p>
Now with the following FocusExtender control in the page: 
</p>
<p>
[code:html] 
</p>
<p>
&lt;cec:FocusExtender runat=&quot;server&quot; id=&quot;FocusExtender1&quot;<br />
&nbsp;&nbsp;&nbsp; TargetControlID=&quot;TextBox1&quot;<br />
&nbsp;&nbsp;&nbsp; HighlightCssClass=&quot;Highlight&quot; NoHighlightCssClass=&quot;NoHightlight&quot;&gt;<br />
&lt;/cec:FocusExtender&gt; 
</p>
<p>
[/code] 
</p>
<p>
We can access it from JavaScript like so: 
</p>
<p>
[code:html] 
</p>
<p>
&lt;input type=&quot;button&quot; value=&quot;Show HighlightCssClass&quot; onclick=&quot;ShowHighlightCssClass();&quot; /&gt;<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
&nbsp;&nbsp;&nbsp; function ShowHighlightCssClass()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var focusExtender = $find(&quot;&lt;%=FocusExtender1.ClientID%&gt;&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(focusExtender.get_HighlightCssClass());<br />
&nbsp;&nbsp;&nbsp; }<br />
&lt;/script&gt; 
</p>
<p>
[/code] 
</p>
<p>
It&#39;s kind of strange that the ExtenderControl base class doesn&#39;t automatically link it up to be able to access it from within JavaScript, but at least it&#39;s pretty simple to add. 
</p>
<h3>Conclusion</h3>
<p>
As you can see it&#39;s fairly simple to get started creating your own custom extender controls that inherit from the ExtenderControl base class, especially if you use the above ExtenderControlBase class along with it&#39;s ExtenderControlPropertyAttribute and ScriptReferenceAttribute attributes. It&#39;s also very simple to enable the ability to access the ExtenderControl from within JavaScript to enable much richer AJAX functionality to be built. 
</p>
<p>
Download Full Source Code: <a rel="enclosure" href="/file.axd?file=CreateAJAXExtenderControlUsingExtenderControlBaseClass.zip">CreateAJAXExtenderControlUsingExtenderControlBaseClass.zip (21.36 kb)</a>
</p>
