  ---
  layout: post
  title: "JavaScript: Mixing OOP and Event Driven Programming"
  date: 2008-11-04 22:53:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2008/11/04/JavaScript-Mixing-OOP-and-Event-Driven-Programming", "/post/2008/11/04/javascript-mixing-oop-and-event-driven-programming"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>
To expand on my previous article on<a href="/post.aspx?id=5c7d6bc1-2926-467d-a47a-5d826dbc467f"> how to create Objects in JavaScript using Prototypal Inheritence</a>, this article will show you how to implement <a href="http://en.wikipedia.org/wiki/Event-driven_programming">Event Driven Programming</a> with those objects. Implementing Event Driven Programming in JavaScript sounds difficult, but it&#39;s actually rather simpel to implement.
</p>
<p>
To keep with the Prototypal Inheritence theme, we&#39;ll create an &quot;EventObject&quot; class that will have the plumbing necessary for implementing Events, and then we&#39;ll inherit that class with a simple &quot;Person&quot; class that will have an &quot;onnamechanged&quot; event.
</p>
<h3>How To Mix OOP and Event Driven Programming in JavaScript<br />
</h3>
<p>
Here&#39;s the base EventObject class and Person class with a Name Property (via GetName and SetName property accessors):
</p>
<p>
[code:js]
</p>
<p>
EventObject = function() {};<br />
EventObject.prototype = {};<br />
<br />
Person = function(name) {<br />
&nbsp;&nbsp;&nbsp; this._name = name;<br />
};<br />
Person.prototype = new EventObject;<br />
Person.prototype.GetName = function() {<br />
&nbsp;&nbsp;&nbsp; return this._name;<br />
};<br />
Person.prototype.SetName = function(value) {<br />
&nbsp;&nbsp;&nbsp; this._name = value;<br />
};
</p>
<p>
[/code] 
</p>
<p>
Now, here&#39;s some basic example code for using the the Person class:
</p>
<p>
[code:js]
</p>
<p>
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
</p>
<p>
[/code] 
</p>
<p>
Now, to the meat of the article.
</p>
<p>
First we&#39;ll create an &quot;internal&quot; Object (that we&#39;ll use a hash table) in the EventObject class that will be used to hold references to all the event handlers:
</p>
<p>
[code:js]
</p>
<p>
EventObject.prototype = {<br />
&nbsp;&nbsp;&nbsp; _eventList: {}<br />
}; 
</p>
<p>
[/code] 
</p>
<p>
Next, we&#39;ll create &quot;attachEvent&quot; and &quot;detachEvent&quot; methods that will add out event handler methods to the hash for the Event Name specified. Both these methods will use an &quot;internal&quot; &quot;getEvent&quot; method to get a reference to the hash tables Array of event handlers for the specified event by name. 
</p>
<p>
[code:js]
</p>
<p>
EventObject.prototype = {<br />
&nbsp;&nbsp;&nbsp; _getEvent: function(eventName, create){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Check if Array of Event Handlers has been created<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!this._eventList[eventName]){<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Check if the calling method wants to create the Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // if not created. This reduces unneeded memory usage.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!create) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return null;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // Create the Array of Event Handlers<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._eventList[eventName] = []; // new Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // return the Array of Event Handlers already added<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._eventList[eventName];<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; attachEvent: function(eventName, handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get the Array of Event Handlers<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var evt = this._getEvent(eventName, true);<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Add the new Event Handler to the Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evt.push(handler);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; detachEvent: function(eventName, handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get the Array of Event Handlers<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var evt = this._getEvent(eventName);<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!evt) { return; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Helper Method - an Array.indexOf equivalent<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var getArrayIndex = function(array, item){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var i = array.length; i &lt; array.length; i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (array[i] &amp;&amp; array[i] === item) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return i;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get the Array index of the Event Handler<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var index = getArrayIndex(evt, handler);<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (index &gt; -1) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Remove Event Handler from Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evt.splice(index, 1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; }<br />
};
</p>
<p>
[/code] 
</p>
<p>
Next, we need to add a &quot;raiseEvent&quot; method that allows us to actually Raise the Events. This &quot;raiseEvent&quot; method will use an &quot;internal&quot; &quot;getEventHandler&quot; method that will return a Function that will call all the Events Handlers internally. 
</p>
<p>
[code:js]
</p>
<p>
EventObject.prototype = {<br />
&nbsp;&nbsp;&nbsp; raiseEvent: function(eventName, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get a function that will call all the Event Handlers internally<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var handler = this._getEventHandler(eventName);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // call the handler function<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Pass in &quot;sender&quot; and &quot;eventArgs&quot; parameters<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler(this, eventArgs);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; _getEventHandler: function(eventName) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get Event Handler Array for this Event<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var evt = this._getEvent(eventName, false);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!evt || evt.length === 0) { return null; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Create the Handler method that will use currying to<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // call all the Events Handlers internally<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var h = function(sender, args) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var i = 0; i &lt; evt.length; i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evt[i](sender, args);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Return this new Handler method<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return h;<br />
&nbsp;&nbsp;&nbsp; }<br />
};
</p>
<p>
[/code] 
</p>
<p>
Now that the &quot;EventObject&quot; class has the Event &quot;plumbing&quot; in place, we are all set to add code to the &quot;Person&quot; class to raise an event. This example we&#39;ll raise a &quot;onchangename&quot; event when the &quot;SetName&quot; method is called. And, we&#39;ll send some &quot;event arguments&quot; to the event handlers that will be the old value of the Name property. To do this we need to modify the &quot;Person&quot; classes &quot;SetName&quot; method to the following code: 
</p>
<p>
[code:js]
</p>
<p>
Person.prototype.SetName = function(value) {<br />
&nbsp;&nbsp;&nbsp; // Get old value<br />
&nbsp;&nbsp;&nbsp; var oldValue = this._name;<br />
<br />
&nbsp;&nbsp;&nbsp; // Set new value<br />
&nbsp;&nbsp;&nbsp; this._name = value;<br />
<br />
&nbsp;&nbsp;&nbsp; // Raise &quot;onchangename&quot; event and pass the old<br />
&nbsp;&nbsp;&nbsp; // value as the event arguments<br />
&nbsp;&nbsp;&nbsp; this.raiseEvent(&quot;onchangename&quot;, oldValue);<br />
}; 
</p>
<p>
[/code]
</p>
<p>
And, now to actually handle the event, we just need to call the &quot;addHandler&quot; method by passing it the name of the event to be handled and a Function that will handle the event.
</p>
<p>
[code:js]
</p>
<p>
myPerson.attachEvent(&quot;onchangename&quot;,<br />
&nbsp;&nbsp;&nbsp; function(sender, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // The Person object is passed as the &quot;sender&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // The Old Name Value is passed as the &quot;eventArgs&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;Old Value: &quot; + eventArgs);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;New Value: &quot; + sender.GetName());<br />
&nbsp;&nbsp;&nbsp; }<br />
); 
</p>
<p>
[/code] 
</p>
<h3>Complete Source Code Listing</h3>
<p>
[code:js]
</p>
<p>
EventObject = function() {};<br />
EventObject.prototype = {<br />
&nbsp;&nbsp;&nbsp; _eventList: {},<br />
&nbsp;&nbsp;&nbsp; _getEvent: function(eventName, create){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Check if Array of Event Handlers has been created<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!this._eventList[eventName]){<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Check if the calling method wants to create the Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // if not created. This reduces unneeded memory usage.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!create) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return null;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Create the Array of Event Handlers<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this._eventList[eventName] = []; // new Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // return the Array of Event Handlers already added<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this._eventList[eventName];<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; attachEvent: function(eventName, handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get the Array of Event Handlers<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var evt = this._getEvent(eventName, true);<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Add the new Event Handler to the Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evt.push(handler);<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; detachEvent: function(eventName, handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get the Array of Event Handlers<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var evt = this._getEvent(eventName);<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!evt) { return; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Helper Method - an Array.indexOf equivalent<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var getArrayIndex = function(array, item){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var i = array.length; i &lt; array.length; i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (array[i] &amp;&amp; array[i] === item) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return i;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get the Array index of the Event Handler<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var index = getArrayIndex(evt, handler);<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (index &gt; -1) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Remove Event Handler from Array<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evt.splice(index, 1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; raiseEvent: function(eventName, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get a function that will call all the Event Handlers internally<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var handler = this._getEventHandler(eventName);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (handler) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // call the handler function<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Pass in &quot;sender&quot; and &quot;eventArgs&quot; parameters<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler(this, eventArgs);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; },<br />
&nbsp;&nbsp;&nbsp; _getEventHandler: function(eventName) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Get Event Handler Array for this Event<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var evt = this._getEvent(eventName, false);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!evt || evt.length === 0) { return null; }<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Create the Handler method that will use currying to<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // call all the Events Handlers internally<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var h = function(sender, args) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (var i = 0; i &lt; evt.length; i++) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; evt[i](sender, args);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Return this new Handler method<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return h;<br />
&nbsp;&nbsp;&nbsp; }<br />
};<br />
<br />
<br />
<br />
Person = function(name) {<br />
&nbsp;&nbsp;&nbsp; this._name = name;<br />
&nbsp;&nbsp;&nbsp; this._eventList = {};<br />
};<br />
Person.prototype = new EventObject;<br />
Person.prototype.GetName = function() {<br />
&nbsp;&nbsp;&nbsp; return this._name;<br />
};<br />
Person.prototype.SetName = function(value) {<br />
&nbsp;&nbsp;&nbsp; // Get old value<br />
&nbsp;&nbsp;&nbsp; var oldValue = this._name;<br />
<br />
&nbsp;&nbsp;&nbsp; // Set new value<br />
&nbsp;&nbsp;&nbsp; this._name = value;<br />
<br />
&nbsp;&nbsp;&nbsp; // Raise &quot;onchangename&quot; event and pass the old<br />
&nbsp;&nbsp;&nbsp; // value as the event arguments<br />
&nbsp;&nbsp;&nbsp; this.raiseEvent(&quot;onchangename&quot;, oldValue);<br />
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
&nbsp;&nbsp;&nbsp; function(sender, eventArgs) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // The Person object is passed as the &quot;sender&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // The Old Name Value is passed as the &quot;eventArgs&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;Old Value: &quot; + eventArgs);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(&quot;New Value: &quot; + sender.GetName());<br />
&nbsp;&nbsp;&nbsp; }<br />
);<br />
<br />
// Set the Name Property to a different name<br />
myPerson.SetName(&quot;Barack Obama&quot;);<br />
<br />
<br />
// Get the Name currently set<br />
alert(myPerson.GetName());<br />
<br />
</p>
<p>
[/code] 
</p>
<h3>Conclusion</h3>
<p>
As you can see, it&#39;s a little involved to be able to implement Event Driven Programming in you JavaScript Object, but it&#39;s really not that complicated. Also, using OOP through Prototypal Inheritence you can inherit the &quot;EventObject&quot; class (or a derived class) with all your objects to easily add Events and Event Handling to your application or code library.
</p>
<p>
If you have any questions, please ask. And, if you have any requests for future JavaScript articles, please let me know. 
</p>
