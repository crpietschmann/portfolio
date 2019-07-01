---
layout: post
title: "ASP.NET AJAX: Create a JavaScript Component with Events"
date: 2008-11-07 21:07:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "JavaScript"]
alias: ["/post/2008/11/07/ASPNET-AJAX-Create-a-JavaScript-Component-with-Events", "/post/2008/11/07/aspnet-ajax-create-a-javascript-component-with-events"]
---
<!-- more -->
<p>
In the spirit of my &quot;<a href="/post.aspx?id=349f567f-1615-4913-a702-ad70902933cb">Mixing OOP and Event Driving Programming</a>&quot; article I posted a couple days ago; this article discusses how to implement the same thing using the <a href="http://www.asp.net/ajax/">ASP.NET AJAX JavaScript Library</a>. Using inheritence (the ASP.NET AJAX way) it is even easier to implement a little Event Driven Model into your client-side, JavaScript classes/components.
</p>
<h3>Event Driven Basics <br />
</h3>
<p>
First we&#39;ll start by creating a Person class that inherits from the Sys.Component class. Now remember, since we are doing things the ASP.NET AJAX way, we aren&#39;t using JavaScript&#39;s Prototypal Inheritence.
</p>
<p>
[code:js]
</p>
<p>
Person = function() {<br />
&nbsp;&nbsp;&nbsp; Person.initializeBase(this);<br />
};<br />
Person.prototype = {<br />
&nbsp;&nbsp;&nbsp; initialize: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Person.callBaseMethod(this, &quot;initialize&quot;);<br />
&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; dispose: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Person.callBaseMethod(this, &quot;dispose&quot;);<br />
&nbsp;&nbsp;&nbsp; }<br />
};<br />
Person.registerClass(&quot;Person&quot;, Sys.Component);
</p>
<p>
[/code]
</p>
<p>
At first glance you may notice that there&#39;s a little more plumbing required to inherit from another object using ASP.NET AJAX. This is true, however it does make implementing Events much easier. The magic of inheritence mostly occurs within the call to the &quot;registerClass&quot; method that actually sets up the class/object to inherit from &quot;Sys.Component.&quot; It also sets up the &quot;initialize&quot; method to be called when the object is instantiated.
</p>
<p>
If you have question (and I&#39;m sure you do if you&#39;re not familiar with ASP.NET AJAX), please go check out the <a href="http://www.asp.net/ajax/documentation/">ASP.NET AJAX Documentation</a>, as further details aren&#39;t within the scope of this article. 
</p>
<p>
Now, the hash table that we implemented in the previous article is already implemented for us within the &quot;Sys.Component&quot; class. We can access it using the &quot;private&quot; &quot;get_events&quot; method. The &quot;get_events&quot; method actually returns an instance of the&quot;Sys.EventHandlerList&quot; class that also implements the &quot;getHandler&quot; method for us. This all makes implementing Events much simpler.
</p>
<p>
First, lets create a &quot;raiseEvent&quot; method, since this isn&#39;t created for us. This method will allow us to actually Raise the Events with only a single method call. 
</p>
<p>
[code:js]
</p>
<p>
Person.prototype = {<br />
&nbsp;&nbsp;&nbsp; raiseEvent: function(eventName, eventArgs) {<br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; var handler = this.get_events().getHandler(eventName);<br />
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eventArgs = Sys.EventArgs.Empty;<br />
&nbsp; &nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler(this, eventArgs);<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp;&nbsp;&nbsp; }<br />
};
</p>
<p>
[/code] 
</p>
<p>
Now lets add the &quot;Name&quot; property (with accessors) to our Person class, and have the &quot;set&quot; accessor Raise the &quot;onchangename&quot; event:
</p>
<p>
[code:js]
</p>
<p>
Person.prototype = {<br />
&nbsp;&nbsp;&nbsp; get_Name: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._name;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; set_Name: function(value) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // get old value<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var oldValue = this._name;<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // set new value<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._name = value;<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Raise the Event and send the old value as the &quot;EventArgs&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.raiseEvent(&quot;onchangename&quot;, oldValue);<br />
&nbsp;&nbsp; }<br />
};
</p>
<p>
[/code] 
</p>
<p>
Here&#39;s an example of using the Person class, and attaching a function to handle the &quot;onchangename&quot; event:
</p>
<p>
[code:js]
</p>
<p>
var p = new Person();<br />
<br />
p.get_events().addHandler(<br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &quot;onchangename&quot;,<br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; function(sender, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;Old Value: &quot; + eventArgs);<br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; );<br />
<br />
p.set_Name(&quot;Charlie&quot;);
</p>
<p>
[/code]
</p>
<p>
As you can see in the example event handler that we added above, the
function gets passed two parameters (sender and eventArgs). The sender
is the Person object that is raising the event, and the eventArgs is this events arguments. So far we are only passing the old Name value as the event arguments, but in the next section of the article we&#39;ll see how to create our own EventArgs object that inherits from &quot;Sys.EventArgs&quot; that can contain anything we want to pass to the event handler. 
</p>
<h3>Go Further With Sys.EventArgs</h3>
<p>
The proper way to raise events in ASP.NET AJAX, is to pass an instance of &quot;Sys.EventArgs&quot; when raising events. This allows you to pass any event arguments to the event handler that you want/need. This also follows suit after the way Events are handled within the .NET Framework.
</p>
<p>
To do this, we&#39;ll first create our own custom EventArgs class that inherits from &quot;Sys.EventArgs&quot;, and we&#39;ll add &quot;OldName&quot; and &quot;NewName&quot; read-only properties to it (to do this we&#39;ll only add &#39;get&#39; accessors). We&#39;ll set the &quot;OldName&quot; and &quot;NewName&quot; properties within the constructor, so we&#39;ll make the constructor accept those as well.
</p>
<p>
[code:js]
</p>
<p>
PersonEventArgs = function(oldNameValue, newNameValue) {<br />
&nbsp;&nbsp;&nbsp; this._oldName = oldNameValue;<br />
&nbsp;&nbsp;&nbsp; this._newName = newNameValue;<br />
};<br />
PersonEventArgs.prototype = {<br />
&nbsp;&nbsp;&nbsp; get_OldName: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._oldName;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; get_NewName: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._newName;<br />
&nbsp;&nbsp;&nbsp; }<br />
};<br />
PersonEventArgs.registerClass(&quot;PersonEventArgs&quot;, Sys.EventArgs);
</p>
<p>
[/code] 
</p>
<p>
Now to make use of this new PersonEventArgs class, we just need to change the line of code within the Person class&#39;s &quot;Name&quot; properties accessor to the following:
</p>
<p>
[code:js]
</p>
<p>
this.raiseEvent(&quot;onchangename&quot;, new PersonEventArgs(oldValue, this._name)); 
</p>
<p>
[/code]
</p>
<p>
Now to access the &quot;OldName&quot; and &quot;NewName&quot; properties of the PersonEventArgs when they are passed to the &quot;onchangename&quot; event handler, just call their property accessors. Like the following:
</p>
<p>
[code:js]
</p>
<p>
var p = new Person();<br />
p.get_events().addHandler(<br />
&nbsp;&nbsp;&nbsp; &quot;onchangename&quot;,<br />
&nbsp;&nbsp;&nbsp; function(sender, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;Old Name: &quot; + eventArgs.get_OldName();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;New Name: &quot; + eventArgs.get_NewName();<br />
&nbsp;&nbsp; });
</p>
<p>
[/code] 
</p>
<h3>Simplify the Adding of Event Handlers</h3>
<p>
Having to call the &quot;get_events&quot; method, the calling the &quot;addHandler&quot; method and passing it the name of the event can be a little cumbersome. You can create &quot;add_{eventName}&quot; methods that accept one argument (the event handler method) that will add the event handler for you with only one method call, and never needing to pass (and type or misstype) the event name. This is actually how the objects within the ASP.NET AJAX JavaScript library handle adding events. They also implement a &quot;remove_eventName&quot; method that does the same, but removes the event handler passed in.
</p>
<p>
[code:js]
</p>
<p>
Person.prototype = {<br />
&nbsp;&nbsp;&nbsp; add_changeName: function(handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.get_events().addHandler(&quot;onchangename&quot;, handler);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; remove_changeName: function(handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.get_events().removeHandler(&quot;onchangename&quot;, handler);<br />
&nbsp;&nbsp;&nbsp; }<br />
};
</p>
<p>
[/code]
</p>
<p>
If you compare the below example of adding an event handler for the &quot;onchangename&quot; event, you&#39;ll see that it is much simpler to call these methods than the example above.
</p>
<p>
[code:js]
</p>
<p>
var p = new Person();<br />
p.add_changeName(function(sender, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;Old Name: &quot; + eventArgs.get_OldName();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;New Name: &quot; + eventArgs.get_NewName();<br />
&nbsp;&nbsp; }); 
</p>
<p>
[/code] 
</p>
<h3>Complete Source Code</h3>
<p>
Heres&#39; the complete code for the Person object created with this article.
</p>
<p>
First, the example usage code:
</p>
<p>
[code:js]
</p>
<p>
var p = new Person();<br />
<br />
p.add_changeName(function(sender, eventArgs) {<br />
&nbsp;&nbsp;&nbsp; alert(&quot;Old Name: &quot; + eventArgs.get_OldName());<br />
&nbsp;&nbsp;&nbsp; //alert(&quot;New Name: &quot; + eventArgs.get_NewName());<br />
});<br />
<br />
p.set_Name(&quot;Charlie&quot;);<br />
<br />
p.set_Name(&quot;Chris&quot;); 
</p>
<p>
[/code]
</p>
<p>
And, now the full Person and PersonEventArgs code:
</p>
<p>
[code:js]
</p>
<p>
Person = function() {<br />
&nbsp;&nbsp;&nbsp; Person.initializeBase(this);<br />
&nbsp;&nbsp;&nbsp; this._name = null;<br />
};<br />
Person.prototype = {<br />
&nbsp;&nbsp;&nbsp; initialize: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Person.callBaseMethod(this, &quot;initialize&quot;);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; dispose: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Person.callBaseMethod(this, &quot;dispose&quot;);<br />
&nbsp;&nbsp;&nbsp; },<br />
<br />
&nbsp;&nbsp;&nbsp; raiseEvent: function(eventName, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var handler = this.get_events().getHandler(eventName);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eventArgs = Sys.EventArgs.Empty;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler(this, eventArgs);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; },<br />
<br />
&nbsp;&nbsp;&nbsp; // Property Accessors<br />
&nbsp;&nbsp;&nbsp; get_Name: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._name;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; set_Name: function(value) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // get old value<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var oldValue = this._name;<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // set new value<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._name = value;<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Raise the Event and send the old value as the &quot;EventArgs&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.raiseEvent(&quot;onchangename&quot;, new PersonEventArgs(oldValue, this._name));<br />
&nbsp;&nbsp;&nbsp; },<br />
<br />
&nbsp;&nbsp;&nbsp; add_changeName: function(handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.get_events().addHandler(&quot;onchangename&quot;, handler);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; remove_changeName: function(handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.get_events().removeHandler(&quot;onchangename&quot;, handler);<br />
&nbsp;&nbsp;&nbsp; }<br />
};<br />
Person.registerClass(&quot;Person&quot;, Sys.Component);<br />
<br />
PersonEventArgs = function(oldNameValue, newNameValue) {<br />
&nbsp;&nbsp;&nbsp; this._oldName = oldNameValue;<br />
&nbsp;&nbsp;&nbsp; this._newName = newNameValue;<br />
};<br />
PersonEventArgs.prototype = {<br />
&nbsp;&nbsp;&nbsp; get_OldName: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._oldName;<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; get_NewName: function() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._newName;<br />
&nbsp;&nbsp;&nbsp; }<br />
};<br />
PersonEventArgs.registerClass(&quot;PersonEventArgs&quot;, Sys.EventArgs); 
</p>
<p>
[/code] 
</p>
<h3>Conclusion</h3>
<p>
As you can see, it&#39;s event easier to add/handle events with your custom classes when you use the ASP.NET AJAX library, rather than implementing it completely yourself. Either way you can use inheritence to greatly simplify things. 
</p>
