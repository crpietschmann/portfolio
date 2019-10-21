---
layout: post
blogengineid: 591b5d4e-b2a6-4b3b-a613-0bcc74f35219
title: "Simple JavaScript Object Reflection API (.NET Style)"
date: 2008-02-28 19:17:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2008/02/28/Simple-JavaScript-Object-Reflection-API-(NET-Style).aspx
  - /post/2008/02/28/Simple-JavaScript-Object-Reflection-API-(NET-Style)
  - /post/2008/02/28/simple-javascript-object-reflection-api-(net-style)
  - /post.aspx?id=591b5d4e-b2a6-4b3b-a613-0bcc74f35219
---
<!-- more -->
I was thinking about how JavaScript JSON serializers go about serializing objects. But how does the serializer know about each of the objects properties? I figured JavaScript must have some method of object reflection (similar to .NET Reflection) and it does.

Here's a simple Reflection namespace that allows you to more easily reflect through an objects methods and properties:

```javascript
if (typeof PietschSoft == 'undefined') var PietschSoft = {};
if (typeof PietschSoft.Reflection == 'undefined') PietschSoft.Reflection = {};

PietschSoft.Reflection.GetProperties = function(obj){
    var props = new Array();
    for (var s in obj)
    {
        if (typeof(obj[s]) != 'function') {
            props[props.length] = s;
        }
    }
    return props;
};

PietschSoft.Reflection.GetMethods = function(obj) {
    var methods = new Array();
    for (var s in obj)
    {
        if (typeof(obj[s]) == 'function') {

            methods[methods.length] = s;

        }
    }
    return methods
};
```

And, here&#39;s some simple code using the above simple reflection api:

```javascript
/// Define our Person Object

Person = function() {
this.FirstName = '';
this.LastName = '';
};

Person.prototype.TestFunction = function(){return 'Test Function';};

// Define our instance of the Person object
var p = new Person();
p.FirstName = 'Chris';
p.LastName = 'Pietschmann';

/// Loop through the Objects Properties
var props = PietschSoft.Reflection.GetProperties(p);
for (var i in props)
{
    alert(props[i] + ' : ' + p[props[i]]);
}

/// Loop through the Objects Methods
var methods = PietschSoft.Reflection.GetMethods(p);
for (var i in methods)
{
    alert(methods[i] + ' : ' + p[methods[i]]);
}
```
