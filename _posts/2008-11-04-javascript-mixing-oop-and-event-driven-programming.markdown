---
layout: post
blogengineid: 349f567f-1615-4913-a702-ad70902933cb
title: "JavaScript: Mixing OOP and Event Driven Programming"
date: 2008-11-04 22:53:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2008/11/04/JavaScript-Mixing-OOP-and-Event-Driven-Programming
  - /post/2008/11/04/javascript-mixing-oop-and-event-driven-programming
  - /post.aspx?id=349f567f-1615-4913-a702-ad70902933cb
---
<!-- more -->


To expand on my previous article on<a href="/post.aspx?id=5c7d6bc1-2926-467d-a47a-5d826dbc467f"> how to create Objects in JavaScript using Prototypal Inheritence</a>, this article will show you how to implement <a href="http://en.wikipedia.org/wiki/Event-driven_programming">Event Driven Programming</a> with those objects. Implementing Event Driven Programming in JavaScript sounds difficult, but it&#39;s actually rather simpel to implement.



To keep with the Prototypal Inheritence theme, we&#39;ll create an &quot;EventObject&quot; class that will have the plumbing necessary for implementing Events, and then we&#39;ll inherit that class with a simple &quot;Person&quot; class that will have an &quot;onnamechanged&quot; event.

<h3>How To Mix OOP and Event Driven Programming in JavaScript<br />
</h3>


Here&#39;s the base EventObject class and Person class with a Name Property (via GetName and SetName property accessors):



```javascript



EventObject = function() {};<br />
EventObject.prototype = {};<br />
<br />
Person = function(name) {<br />
    this._name = name;<br />
};<br />
Person.prototype = new EventObject;<br />
Person.prototype.GetName = function() {<br />
    return this._name;<br />
};<br />
Person.prototype.SetName = function(value) {<br />
    this._name = value;<br />
};



``` 



Now, here&#39;s some basic example code for using the the Person class:



```javascript



// Create an instance of the Person Object<br />
var myPerson = new Person(&quot;John McCain&quot;);<br />
<br />
// Get the Name currently set<br />
alert(myPerson.GetName());<br />
<br />
// Set the Name Property to a different name<br />
myPerson.SetName(&quot;Barack Obama&quot;);<br />
<br />
// Get the Name currently set<br />
alert(myPerson.GetName()); 



``` 



Now, to the meat of the article.



First we&#39;ll create an &quot;internal&quot; Object (that we&#39;ll use a hash table) in the EventObject class that will be used to hold references to all the event handlers:



```javascript



EventObject.prototype = {<br />
    _eventList: {}<br />
}; 



``` 



Next, we&#39;ll create &quot;attachEvent&quot; and &quot;detachEvent&quot; methods that will add out event handler methods to the hash for the Event Name specified. Both these methods will use an &quot;internal&quot; &quot;getEvent&quot; method to get a reference to the hash tables Array of event handlers for the specified event by name. 



```javascript



EventObject.prototype = {<br />
    _getEvent: function(eventName, create){<br />
        // Check if Array of Event Handlers has been created<br />
        if (!this._eventList[eventName]){<br />
<br />
            // Check if the calling method wants to create the Array<br />
            // if not created. This reduces unneeded memory usage.<br />
            if (!create) {<br />
                return null;<br />
            }<br />
<br />
        // Create the Array of Event Handlers<br />
            this._eventList[eventName] = []; // new Array<br />
        }<br />
<br />
        // return the Array of Event Handlers already added<br />
        return this._eventList[eventName];<br />
    },<br />
    attachEvent: function(eventName, handler) {<br />
        // Get the Array of Event Handlers<br />
        var evt = this._getEvent(eventName, true);<br />
<br />
        // Add the new Event Handler to the Array<br />
        evt.push(handler);<br />
    },<br />
    detachEvent: function(eventName, handler) {<br />
        // Get the Array of Event Handlers<br />
        var evt = this._getEvent(eventName);<br />
<br />
        if (!evt) { return; }<br />
<br />
        // Helper Method - an Array.indexOf equivalent<br />
        var getArrayIndex = function(array, item){<br />
            for (var i = array.length; i &lt; array.length; i++) {<br />
                if (array[i] &amp;&amp; array[i] === item) {<br />
                    return i;<br />
                }<br />
            }<br />
            return -1;<br />
        };<br />
<br />
        // Get the Array index of the Event Handler<br />
        var index = getArrayIndex(evt, handler);<br />
<br />
        if (index &gt; -1) {<br />
            // Remove Event Handler from Array<br />
            evt.splice(index, 1);<br />
        }<br />
    }<br />
};



``` 



Next, we need to add a &quot;raiseEvent&quot; method that allows us to actually Raise the Events. This &quot;raiseEvent&quot; method will use an &quot;internal&quot; &quot;getEventHandler&quot; method that will return a Function that will call all the Events Handlers internally. 



```javascript



EventObject.prototype = {<br />
    raiseEvent: function(eventName, eventArgs) {<br />
        // Get a function that will call all the Event Handlers internally<br />
        var handler = this._getEventHandler(eventName);<br />
        if (handler) {<br />
            // call the handler function<br />
            // Pass in &quot;sender&quot; and &quot;eventArgs&quot; parameters<br />
            handler(this, eventArgs);<br />
        }<br />
    },<br />
    _getEventHandler: function(eventName) {<br />
        // Get Event Handler Array for this Event<br />
        var evt = this._getEvent(eventName, false);<br />
        if (!evt || evt.length === 0) { return null; }<br />
<br />
        // Create the Handler method that will use currying to<br />
        // call all the Events Handlers internally<br />
        var h = function(sender, args) {<br />
            for (var i = 0; i &lt; evt.length; i++) {<br />
                evt[i](sender, args);<br />
            }<br />
        };<br />
<br />
        // Return this new Handler method<br />
        return h;<br />
    }<br />
};



``` 



Now that the &quot;EventObject&quot; class has the Event &quot;plumbing&quot; in place, we are all set to add code to the &quot;Person&quot; class to raise an event. This example we&#39;ll raise a &quot;onchangename&quot; event when the &quot;SetName&quot; method is called. And, we&#39;ll send some &quot;event arguments&quot; to the event handlers that will be the old value of the Name property. To do this we need to modify the &quot;Person&quot; classes &quot;SetName&quot; method to the following code: 



```javascript



Person.prototype.SetName = function(value) {<br />
    // Get old value<br />
    var oldValue = this._name;<br />
<br />
    // Set new value<br />
    this._name = value;<br />
<br />
    // Raise &quot;onchangename&quot; event and pass the old<br />
    // value as the event arguments<br />
    this.raiseEvent(&quot;onchangename&quot;, oldValue);<br />
}; 



```



And, now to actually handle the event, we just need to call the &quot;addHandler&quot; method by passing it the name of the event to be handled and a Function that will handle the event.



```javascript



myPerson.attachEvent(&quot;onchangename&quot;,<br />
    function(sender, eventArgs) {<br />
        // The Person object is passed as the &quot;sender&quot;<br />
        // The Old Name Value is passed as the &quot;eventArgs&quot;<br />
        alert(&quot;Old Value: &quot; + eventArgs);<br />
        alert(&quot;New Value: &quot; + sender.GetName());<br />
    }<br />
); 



``` 

<h3>Complete Source Code Listing</h3>


```javascript



EventObject = function() {};<br />
EventObject.prototype = {<br />
    _eventList: {},<br />
    _getEvent: function(eventName, create){<br />
        // Check if Array of Event Handlers has been created<br />
        if (!this._eventList[eventName]){<br />
<br />
            // Check if the calling method wants to create the Array<br />
            // if not created. This reduces unneeded memory usage.<br />
            if (!create) {<br />
                return null;<br />
            }<br />
<br />
        // Create the Array of Event Handlers<br />
            this._eventList[eventName] = []; // new Array<br />
        }<br />
<br />
        // return the Array of Event Handlers already added<br />
        return this._eventList[eventName];<br />
    },<br />
    attachEvent: function(eventName, handler) {<br />
        // Get the Array of Event Handlers<br />
        var evt = this._getEvent(eventName, true);<br />
<br />
        // Add the new Event Handler to the Array<br />
        evt.push(handler);<br />
    },<br />
    detachEvent: function(eventName, handler) {<br />
        // Get the Array of Event Handlers<br />
        var evt = this._getEvent(eventName);<br />
<br />
        if (!evt) { return; }<br />
<br />
        // Helper Method - an Array.indexOf equivalent<br />
        var getArrayIndex = function(array, item){<br />
            for (var i = array.length; i &lt; array.length; i++) {<br />
                if (array[i] &amp;&amp; array[i] === item) {<br />
                    return i;<br />
                }<br />
            }<br />
            return -1;<br />
        };<br />
<br />
        // Get the Array index of the Event Handler<br />
        var index = getArrayIndex(evt, handler);<br />
<br />
        if (index &gt; -1) {<br />
            // Remove Event Handler from Array<br />
            evt.splice(index, 1);<br />
        }<br />
    },<br />
    raiseEvent: function(eventName, eventArgs) {<br />
        // Get a function that will call all the Event Handlers internally<br />
        var handler = this._getEventHandler(eventName);<br />
        if (handler) {<br />
            // call the handler function<br />
            // Pass in &quot;sender&quot; and &quot;eventArgs&quot; parameters<br />
            handler(this, eventArgs);<br />
        }<br />
    },<br />
    _getEventHandler: function(eventName) {<br />
        // Get Event Handler Array for this Event<br />
        var evt = this._getEvent(eventName, false);<br />
        if (!evt || evt.length === 0) { return null; }<br />
<br />
        // Create the Handler method that will use currying to<br />
        // call all the Events Handlers internally<br />
        var h = function(sender, args) {<br />
            for (var i = 0; i &lt; evt.length; i++) {<br />
                evt[i](sender, args);<br />
            }<br />
        };<br />
<br />
        // Return this new Handler method<br />
        return h;<br />
    }<br />
};<br />
<br />
<br />
<br />
Person = function(name) {<br />
    this._name = name;<br />
    this._eventList = {};<br />
};<br />
Person.prototype = new EventObject;<br />
Person.prototype.GetName = function() {<br />
    return this._name;<br />
};<br />
Person.prototype.SetName = function(value) {<br />
    // Get old value<br />
    var oldValue = this._name;<br />
<br />
    // Set new value<br />
    this._name = value;<br />
<br />
    // Raise &quot;onchangename&quot; event and pass the old<br />
    // value as the event arguments<br />
    this.raiseEvent(&quot;onchangename&quot;, oldValue);<br />
};<br />
<br />
<br />
<br />
<br />
// Create an instance of the Person Object<br />
var myPerson = new Person(&quot;John McCain&quot;);<br />
<br />
// Get the Name currently set<br />
alert(myPerson.GetName());<br />
<br />
<br />
myPerson.attachEvent(&quot;onchangename&quot;,<br />
    function(sender, eventArgs) {<br />
        // The Person object is passed as the &quot;sender&quot;<br />
        // The Old Name Value is passed as the &quot;eventArgs&quot;<br />
        alert(&quot;Old Value: &quot; + eventArgs);<br />
        alert(&quot;New Value: &quot; + sender.GetName());<br />
    }<br />
);<br />
<br />
// Set the Name Property to a different name<br />
myPerson.SetName(&quot;Barack Obama&quot;);<br />
<br />
<br />
// Get the Name currently set<br />
alert(myPerson.GetName());<br />
<br />



``` 

<h3>Conclusion</h3>


As you can see, it&#39;s a little involved to be able to implement Event Driven Programming in you JavaScript Object, but it&#39;s really not that complicated. Also, using OOP through Prototypal Inheritence you can inherit the &quot;EventObject&quot; class (or a derived class) with all your objects to easily add Events and Event Handling to your application or code library.



If you have any questions, please ask. And, if you have any requests for future JavaScript articles, please let me know. 

