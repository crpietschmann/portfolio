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
  - /post/2008/02/28/Simple-JavaScript-Object-Reflection-API-(NET-Style)
  - /post/2008/02/28/simple-javascript-object-reflection-api-(net-style)
  - /post.aspx?id=591b5d4e-b2a6-4b3b-a613-0bcc74f35219
---
<!-- more -->


I was thinking about how JavaScript JSON serializers go about serializing objects. But how does the serializer know about each of the objects properties? I figured JavaScript must have some method of object reflection (similar to .NET Reflection) and it does. 



Here&#39;s a simple Reflection namespace that allows you to more easily reflect through an objects methods and properties: 



```javascript 



if (typeof PietschSoft == &quot;undefined&quot;) var PietschSoft = {};<br />
if (typeof PietschSoft.Reflection == &quot;undefined&quot;) PietschSoft.Reflection = {}; 



PietschSoft.Reflection.GetProperties = function(obj){<br />
    var props = new Array(); 



    for (var s in obj)<br />
    {<br />
        if (typeof(obj[s]) != &quot;function&quot;) {<br />
            props[props.length] = s;<br />
        }<br />
    } 



    return props;<br />
}; 



PietschSoft.Reflection.GetMethods = function(obj){<br />
    var methods = new Array(); 



    for (var s in obj)<br />
    {<br />
        if (typeof(obj[s]) == &quot;function&quot;) {<br />
            methods[methods.length] = s;<br />
        }<br />
    } 



    return methods<br />
}; 



``` 



And, here&#39;s some simple code using the above simple reflection api: 



```javascript 



/// Define our Person Object<br />
Person = function(){<br />
this.FirstName = &quot;&quot;;<br />
this.LastName = &quot;&quot;;<br />
};<br />
Person.prototype.TestFunction = function(){return &quot;Test Function&quot;;};<br />
<br />
// Define our instance of the Person object<br />
var p = new Person();<br />
p.FirstName = &quot;Chris&quot;;<br />
p.LastName = &quot;Pietschmann&quot;;<br />
<br />
/// Loop through the Objects Properties<br />
var props = PietschSoft.Reflection.GetProperties(p);<br />
for (var i in props)<br />
{<br />
    alert(props[i] + &quot; : &quot; + p[props[i]]);<br />
}<br />
<br />
/// Loop through the Objects Methods<br />
var methods = PietschSoft.Reflection.GetMethods(p);<br />
for (var i in methods)<br />
{<br />
    alert(methods[i] + &quot; : &quot; + p[methods[i]]);<br />
} 



``` 

