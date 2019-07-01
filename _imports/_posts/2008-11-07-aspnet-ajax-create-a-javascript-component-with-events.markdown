---
layout: post
blogengineid: 56ebc041-58e4-48cb-a301-65c3df2601a7
title: "ASP.NET AJAX: Create a JavaScript Component with Events"
date: 2008-11-07 21:07:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net", "JavaScript"]
redirect_from: 
  - /post/2008/11/07/ASPNET-AJAX-Create-a-JavaScript-Component-with-Events
  - /post/2008/11/07/aspnet-ajax-create-a-javascript-component-with-events
  - /post.aspx?id=56ebc041-58e4-48cb-a301-65c3df2601a7
---
<!-- more -->


In the spirit of my &quot;<a href="/post.aspx?id=349f567f-1615-4913-a702-ad70902933cb">Mixing OOP and Event Driving Programming</a>&quot; article I posted a couple days ago; this article discusses how to implement the same thing using the <a href="http://www.asp.net/ajax/">ASP.NET AJAX JavaScript Library</a>. Using inheritence (the ASP.NET AJAX way) it is even easier to implement a little Event Driven Model into your client-side, JavaScript classes/components.

<h3>Event Driven Basics <br />
</h3>


First we&#39;ll start by creating a Person class that inherits from the Sys.Component class. Now remember, since we are doing things the ASP.NET AJAX way, we aren&#39;t using JavaScript&#39;s Prototypal Inheritence.



```javascript



Person = function() {<br />
    Person.initializeBase(this);<br />
};<br />
Person.prototype = {<br />
    initialize: function() {<br />
        Person.callBaseMethod(this, &quot;initialize&quot;);<br />
   },<br />
    dispose: function() {<br />
        Person.callBaseMethod(this, &quot;dispose&quot;);<br />
    }<br />
};<br />
Person.registerClass(&quot;Person&quot;, Sys.Component);



```



At first glance you may notice that there&#39;s a little more plumbing required to inherit from another object using ASP.NET AJAX. This is true, however it does make implementing Events much easier. The magic of inheritence mostly occurs within the call to the &quot;registerClass&quot; method that actually sets up the class/object to inherit from &quot;Sys.Component.&quot; It also sets up the &quot;initialize&quot; method to be called when the object is instantiated.



If you have question (and I&#39;m sure you do if you&#39;re not familiar with ASP.NET AJAX), please go check out the <a href="http://www.asp.net/ajax/documentation/">ASP.NET AJAX Documentation</a>, as further details aren&#39;t within the scope of this article. 



Now, the hash table that we implemented in the previous article is already implemented for us within the &quot;Sys.Component&quot; class. We can access it using the &quot;private&quot; &quot;get_events&quot; method. The &quot;get_events&quot; method actually returns an instance of the&quot;Sys.EventHandlerList&quot; class that also implements the &quot;getHandler&quot; method for us. This all makes implementing Events much simpler.



First, lets create a &quot;raiseEvent&quot; method, since this isn&#39;t created for us. This method will allow us to actually Raise the Events with only a single method call. 



```javascript



Person.prototype = {<br />
    raiseEvent: function(eventName, eventArgs) {<br />
        var handler = this.get_events().getHandler(eventName);<br />
        if (handler) {<br />
            if (!eventArgs) {<br />
                eventArgs = Sys.EventArgs.Empty;<br />
    
        }<br />
            handler(this, eventArgs);<br />
        }<br />
    }<br />
};



``` 



Now lets add the &quot;Name&quot; property (with accessors) to our Person class, and have the &quot;set&quot; accessor Raise the &quot;onchangename&quot; event:



```javascript



Person.prototype = {<br />
    get_Name: function() {<br />
        return this._name;<br />
    },<br />
    set_Name: function(value) {<br />
        // get old value<br />
        var oldValue = this._name;<br />
<br />
        // set new value<br />
        this._name = value;<br />
<br />
        // Raise the Event and send the old value as the &quot;EventArgs&quot;<br />
       this.raiseEvent(&quot;onchangename&quot;, oldValue);<br />
   }<br />
};



``` 



Here&#39;s an example of using the Person class, and attaching a function to handle the &quot;onchangename&quot; event:



```javascript



var p = new Person();<br />
<br />
p.get_events().addHandler(<br />
        &quot;onchangename&quot;,<br />
        function(sender, eventArgs) {<br />
            alert(&quot;Old Value: &quot; + eventArgs);<br />
        }<br />
    );<br />
<br />
p.set_Name(&quot;Charlie&quot;);



```



As you can see in the example event handler that we added above, the
function gets passed two parameters (sender and eventArgs). The sender
is the Person object that is raising the event, and the eventArgs is this events arguments. So far we are only passing the old Name value as the event arguments, but in the next section of the article we&#39;ll see how to create our own EventArgs object that inherits from &quot;Sys.EventArgs&quot; that can contain anything we want to pass to the event handler. 

<h3>Go Further With Sys.EventArgs</h3>


The proper way to raise events in ASP.NET AJAX, is to pass an instance of &quot;Sys.EventArgs&quot; when raising events. This allows you to pass any event arguments to the event handler that you want/need. This also follows suit after the way Events are handled within the .NET Framework.



To do this, we&#39;ll first create our own custom EventArgs class that inherits from &quot;Sys.EventArgs&quot;, and we&#39;ll add &quot;OldName&quot; and &quot;NewName&quot; read-only properties to it (to do this we&#39;ll only add &#39;get&#39; accessors). We&#39;ll set the &quot;OldName&quot; and &quot;NewName&quot; properties within the constructor, so we&#39;ll make the constructor accept those as well.



```javascript



PersonEventArgs = function(oldNameValue, newNameValue) {<br />
    this._oldName = oldNameValue;<br />
    this._newName = newNameValue;<br />
};<br />
PersonEventArgs.prototype = {<br />
    get_OldName: function() {<br />
        return this._oldName;<br />
    },<br />
    get_NewName: function() {<br />
        return this._newName;<br />
    }<br />
};<br />
PersonEventArgs.registerClass(&quot;PersonEventArgs&quot;, Sys.EventArgs);



``` 



Now to make use of this new PersonEventArgs class, we just need to change the line of code within the Person class&#39;s &quot;Name&quot; properties accessor to the following:



```javascript



this.raiseEvent(&quot;onchangename&quot;, new PersonEventArgs(oldValue, this._name)); 



```



Now to access the &quot;OldName&quot; and &quot;NewName&quot; properties of the PersonEventArgs when they are passed to the &quot;onchangename&quot; event handler, just call their property accessors. Like the following:



```javascript



var p = new Person();<br />
p.get_events().addHandler(<br />
    &quot;onchangename&quot;,<br />
    function(sender, eventArgs) {<br />
        alert(&quot;Old Name: &quot; + eventArgs.get_OldName();<br />
        alert(&quot;New Name: &quot; + eventArgs.get_NewName();<br />
   });



``` 

<h3>Simplify the Adding of Event Handlers</h3>


Having to call the &quot;get_events&quot; method, the calling the &quot;addHandler&quot; method and passing it the name of the event can be a little cumbersome. You can create &quot;add_{eventName}&quot; methods that accept one argument (the event handler method) that will add the event handler for you with only one method call, and never needing to pass (and type or misstype) the event name. This is actually how the objects within the ASP.NET AJAX JavaScript library handle adding events. They also implement a &quot;remove_eventName&quot; method that does the same, but removes the event handler passed in.



```javascript



Person.prototype = {<br />
    add_changeName: function(handler) {<br />
        this.get_events().addHandler(&quot;onchangename&quot;, handler);<br />
    },<br />
    remove_changeName: function(handler) {<br />
        this.get_events().removeHandler(&quot;onchangename&quot;, handler);<br />
    }<br />
};



```



If you compare the below example of adding an event handler for the &quot;onchangename&quot; event, you&#39;ll see that it is much simpler to call these methods than the example above.



```javascript



var p = new Person();<br />
p.add_changeName(function(sender, eventArgs) {<br />
        alert(&quot;Old Name: &quot; + eventArgs.get_OldName();<br />
        alert(&quot;New Name: &quot; + eventArgs.get_NewName();<br />
   }); 



``` 

<h3>Complete Source Code</h3>


Heres&#39; the complete code for the Person object created with this article.



First, the example usage code:



```javascript



var p = new Person();<br />
<br />
p.add_changeName(function(sender, eventArgs) {<br />
    alert(&quot;Old Name: &quot; + eventArgs.get_OldName());<br />
    //alert(&quot;New Name: &quot; + eventArgs.get_NewName());<br />
});<br />
<br />
p.set_Name(&quot;Charlie&quot;);<br />
<br />
p.set_Name(&quot;Chris&quot;); 



```



And, now the full Person and PersonEventArgs code:



```javascript



Person = function() {<br />
    Person.initializeBase(this);<br />
    this._name = null;<br />
};<br />
Person.prototype = {<br />
    initialize: function() {<br />
        Person.callBaseMethod(this, &quot;initialize&quot;);<br />
    },<br />
    dispose: function() {<br />
        Person.callBaseMethod(this, &quot;dispose&quot;);<br />
    },<br />
<br />
    raiseEvent: function(eventName, eventArgs) {<br />
        var handler = this.get_events().getHandler(eventName);<br />
        if (handler) {<br />
            if (!eventArgs) {<br />
                eventArgs = Sys.EventArgs.Empty;<br />
            }<br />
            handler(this, eventArgs);<br />
        }<br />
    },<br />
<br />
    // Property Accessors<br />
    get_Name: function() {<br />
        return this._name;<br />
    },<br />
    set_Name: function(value) {<br />
        // get old value<br />
        var oldValue = this._name;<br />
<br />
        // set new value<br />
        this._name = value;<br />
<br />
        // Raise the Event and send the old value as the &quot;EventArgs&quot;<br />
        this.raiseEvent(&quot;onchangename&quot;, new PersonEventArgs(oldValue, this._name));<br />
    },<br />
<br />
    add_changeName: function(handler) {<br />
        this.get_events().addHandler(&quot;onchangename&quot;, handler);<br />
    },<br />
    remove_changeName: function(handler) {<br />
        this.get_events().removeHandler(&quot;onchangename&quot;, handler);<br />
    }<br />
};<br />
Person.registerClass(&quot;Person&quot;, Sys.Component);<br />
<br />
PersonEventArgs = function(oldNameValue, newNameValue) {<br />
    this._oldName = oldNameValue;<br />
    this._newName = newNameValue;<br />
};<br />
PersonEventArgs.prototype = {<br />
    get_OldName: function() {<br />
        return this._oldName;<br />
    },<br />
    get_NewName: function() {<br />
        return this._newName;<br />
    }<br />
};<br />
PersonEventArgs.registerClass(&quot;PersonEventArgs&quot;, Sys.EventArgs); 



``` 

<h3>Conclusion</h3>


As you can see, it&#39;s event easier to add/handle events with your custom classes when you use the ASP.NET AJAX library, rather than implementing it completely yourself. Either way you can use inheritence to greatly simplify things. 

