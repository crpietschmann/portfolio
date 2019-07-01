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

<h3>How To Mix OOP and Event Driven Programming in JavaScript

</h3>


Here&#39;s the base EventObject class and Person class with a Name Property (via GetName and SetName property accessors):



```javascript



EventObject = function() {};

EventObject.prototype = {};



Person = function(name) {

    this._name = name;

};

Person.prototype = new EventObject;

Person.prototype.GetName = function() {

    return this._name;

};

Person.prototype.SetName = function(value) {

    this._name = value;

};



``` 



Now, here&#39;s some basic example code for using the the Person class:



```javascript



// Create an instance of the Person Object

var myPerson = new Person(&quot;John McCain&quot;);



// Get the Name currently set

alert(myPerson.GetName());



// Set the Name Property to a different name

myPerson.SetName(&quot;Barack Obama&quot;);



// Get the Name currently set

alert(myPerson.GetName()); 



``` 



Now, to the meat of the article.



First we&#39;ll create an &quot;internal&quot; Object (that we&#39;ll use a hash table) in the EventObject class that will be used to hold references to all the event handlers:



```javascript



EventObject.prototype = {

    _eventList: {}

}; 



``` 



Next, we&#39;ll create &quot;attachEvent&quot; and &quot;detachEvent&quot; methods that will add out event handler methods to the hash for the Event Name specified. Both these methods will use an &quot;internal&quot; &quot;getEvent&quot; method to get a reference to the hash tables Array of event handlers for the specified event by name. 



```javascript



EventObject.prototype = {

    _getEvent: function(eventName, create){

        // Check if Array of Event Handlers has been created

        if (!this._eventList[eventName]){



            // Check if the calling method wants to create the Array

            // if not created. This reduces unneeded memory usage.

            if (!create) {

                return null;

            }



        // Create the Array of Event Handlers

            this._eventList[eventName] = []; // new Array

        }



        // return the Array of Event Handlers already added

        return this._eventList[eventName];

    },

    attachEvent: function(eventName, handler) {

        // Get the Array of Event Handlers

        var evt = this._getEvent(eventName, true);



        // Add the new Event Handler to the Array

        evt.push(handler);

    },

    detachEvent: function(eventName, handler) {

        // Get the Array of Event Handlers

        var evt = this._getEvent(eventName);



        if (!evt) { return; }



        // Helper Method - an Array.indexOf equivalent

        var getArrayIndex = function(array, item){

            for (var i = array.length; i < array.length; i++) {

                if (array[i] &amp;&amp; array[i] === item) {

                    return i;

                }

            }

            return -1;

        };



        // Get the Array index of the Event Handler

        var index = getArrayIndex(evt, handler);



        if (index > -1) {

            // Remove Event Handler from Array

            evt.splice(index, 1);

        }

    }

};



``` 



Next, we need to add a &quot;raiseEvent&quot; method that allows us to actually Raise the Events. This &quot;raiseEvent&quot; method will use an &quot;internal&quot; &quot;getEventHandler&quot; method that will return a Function that will call all the Events Handlers internally. 



```javascript



EventObject.prototype = {

    raiseEvent: function(eventName, eventArgs) {

        // Get a function that will call all the Event Handlers internally

        var handler = this._getEventHandler(eventName);

        if (handler) {

            // call the handler function

            // Pass in &quot;sender&quot; and &quot;eventArgs&quot; parameters

            handler(this, eventArgs);

        }

    },

    _getEventHandler: function(eventName) {

        // Get Event Handler Array for this Event

        var evt = this._getEvent(eventName, false);

        if (!evt || evt.length === 0) { return null; }



        // Create the Handler method that will use currying to

        // call all the Events Handlers internally

        var h = function(sender, args) {

            for (var i = 0; i < evt.length; i++) {

                evt[i](sender, args);

            }

        };



        // Return this new Handler method

        return h;

    }

};



``` 



Now that the &quot;EventObject&quot; class has the Event &quot;plumbing&quot; in place, we are all set to add code to the &quot;Person&quot; class to raise an event. This example we&#39;ll raise a &quot;onchangename&quot; event when the &quot;SetName&quot; method is called. And, we&#39;ll send some &quot;event arguments&quot; to the event handlers that will be the old value of the Name property. To do this we need to modify the &quot;Person&quot; classes &quot;SetName&quot; method to the following code: 



```javascript



Person.prototype.SetName = function(value) {

    // Get old value

    var oldValue = this._name;



    // Set new value

    this._name = value;



    // Raise &quot;onchangename&quot; event and pass the old

    // value as the event arguments

    this.raiseEvent(&quot;onchangename&quot;, oldValue);

}; 



```



And, now to actually handle the event, we just need to call the &quot;addHandler&quot; method by passing it the name of the event to be handled and a Function that will handle the event.



```javascript



myPerson.attachEvent(&quot;onchangename&quot;,

    function(sender, eventArgs) {

        // The Person object is passed as the &quot;sender&quot;

        // The Old Name Value is passed as the &quot;eventArgs&quot;

        alert(&quot;Old Value: &quot; + eventArgs);

        alert(&quot;New Value: &quot; + sender.GetName());

    }

); 



``` 

<h3>Complete Source Code Listing</h3>


```javascript



EventObject = function() {};

EventObject.prototype = {

    _eventList: {},

    _getEvent: function(eventName, create){

        // Check if Array of Event Handlers has been created

        if (!this._eventList[eventName]){



            // Check if the calling method wants to create the Array

            // if not created. This reduces unneeded memory usage.

            if (!create) {

                return null;

            }



        // Create the Array of Event Handlers

            this._eventList[eventName] = []; // new Array

        }



        // return the Array of Event Handlers already added

        return this._eventList[eventName];

    },

    attachEvent: function(eventName, handler) {

        // Get the Array of Event Handlers

        var evt = this._getEvent(eventName, true);



        // Add the new Event Handler to the Array

        evt.push(handler);

    },

    detachEvent: function(eventName, handler) {

        // Get the Array of Event Handlers

        var evt = this._getEvent(eventName);



        if (!evt) { return; }



        // Helper Method - an Array.indexOf equivalent

        var getArrayIndex = function(array, item){

            for (var i = array.length; i < array.length; i++) {

                if (array[i] &amp;&amp; array[i] === item) {

                    return i;

                }

            }

            return -1;

        };



        // Get the Array index of the Event Handler

        var index = getArrayIndex(evt, handler);



        if (index > -1) {

            // Remove Event Handler from Array

            evt.splice(index, 1);

        }

    },

    raiseEvent: function(eventName, eventArgs) {

        // Get a function that will call all the Event Handlers internally

        var handler = this._getEventHandler(eventName);

        if (handler) {

            // call the handler function

            // Pass in &quot;sender&quot; and &quot;eventArgs&quot; parameters

            handler(this, eventArgs);

        }

    },

    _getEventHandler: function(eventName) {

        // Get Event Handler Array for this Event

        var evt = this._getEvent(eventName, false);

        if (!evt || evt.length === 0) { return null; }



        // Create the Handler method that will use currying to

        // call all the Events Handlers internally

        var h = function(sender, args) {

            for (var i = 0; i < evt.length; i++) {

                evt[i](sender, args);

            }

        };



        // Return this new Handler method

        return h;

    }

};







Person = function(name) {

    this._name = name;

    this._eventList = {};

};

Person.prototype = new EventObject;

Person.prototype.GetName = function() {

    return this._name;

};

Person.prototype.SetName = function(value) {

    // Get old value

    var oldValue = this._name;



    // Set new value

    this._name = value;



    // Raise &quot;onchangename&quot; event and pass the old

    // value as the event arguments

    this.raiseEvent(&quot;onchangename&quot;, oldValue);

};









// Create an instance of the Person Object

var myPerson = new Person(&quot;John McCain&quot;);



// Get the Name currently set

alert(myPerson.GetName());





myPerson.attachEvent(&quot;onchangename&quot;,

    function(sender, eventArgs) {

        // The Person object is passed as the &quot;sender&quot;

        // The Old Name Value is passed as the &quot;eventArgs&quot;

        alert(&quot;Old Value: &quot; + eventArgs);

        alert(&quot;New Value: &quot; + sender.GetName());

    }

);



// Set the Name Property to a different name

myPerson.SetName(&quot;Barack Obama&quot;);





// Get the Name currently set

alert(myPerson.GetName());






``` 

<h3>Conclusion</h3>


As you can see, it&#39;s a little involved to be able to implement Event Driven Programming in you JavaScript Object, but it&#39;s really not that complicated. Also, using OOP through Prototypal Inheritence you can inherit the &quot;EventObject&quot; class (or a derived class) with all your objects to easily add Events and Event Handling to your application or code library.



If you have any questions, please ask. And, if you have any requests for future JavaScript articles, please let me know. 

