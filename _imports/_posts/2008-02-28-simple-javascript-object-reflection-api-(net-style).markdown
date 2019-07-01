  ---
  layout: post
  title: "Simple JavaScript Object Reflection API (.NET Style)"
  date: 2008-02-28 19:17:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2008/02/28/Simple-JavaScript-Object-Reflection-API-(NET-Style)", "/post/2008/02/28/simple-javascript-object-reflection-api-(net-style)"]
  ---
<!-- more -->
<p>
I was thinking about how JavaScript JSON serializers go about serializing objects. But how does the serializer know about each of the objects properties? I figured JavaScript must have some method of object reflection (similar to .NET Reflection) and it does. 
</p>
<p>
Here&#39;s a simple Reflection namespace that allows you to more easily reflect through an objects methods and properties: 
</p>
<p>
[code:js] 
</p>
<p>
if (typeof PietschSoft == &quot;undefined&quot;) var PietschSoft = {};<br />
if (typeof PietschSoft.Reflection == &quot;undefined&quot;) PietschSoft.Reflection = {}; 
</p>
<p>
PietschSoft.Reflection.GetProperties = function(obj){<br />
&nbsp;&nbsp;&nbsp; var props = new Array(); 
</p>
<p>
&nbsp;&nbsp;&nbsp; for (var s in obj)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (typeof(obj[s]) != &quot;function&quot;) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; props[props.length] = s;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; return props;<br />
}; 
</p>
<p>
PietschSoft.Reflection.GetMethods = function(obj){<br />
&nbsp;&nbsp;&nbsp; var methods = new Array(); 
</p>
<p>
&nbsp;&nbsp;&nbsp; for (var s in obj)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (typeof(obj[s]) == &quot;function&quot;) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; methods[methods.length] = s;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; } 
</p>
<p>
&nbsp;&nbsp;&nbsp; return methods<br />
}; 
</p>
<p>
[/code] 
</p>
<p>
And, here&#39;s some simple code using the above simple reflection api: 
</p>
<p>
[code:js] 
</p>
<p>
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
&nbsp;&nbsp;&nbsp; alert(props[i] + &quot; : &quot; + p[props[i]]);<br />
}<br />
<br />
/// Loop through the Objects Methods<br />
var methods = PietschSoft.Reflection.GetMethods(p);<br />
for (var i in methods)<br />
{<br />
&nbsp;&nbsp;&nbsp; alert(methods[i] + &quot; : &quot; + p[methods[i]]);<br />
} 
</p>
<p>
[/code] 
</p>
