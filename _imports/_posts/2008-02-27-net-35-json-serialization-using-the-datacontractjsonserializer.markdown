---
layout: post
title: ".NET 3.5: JSON Serialization using the DataContractJsonSerializer"
date: 2008-02-27 18:15:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/02/27/NET-35-JSON-Serialization-using-the-DataContractJsonSerializer
  - /post/2008/02/27/net-35-json-serialization-using-the-datacontractjsonserializer
---
<!-- more -->
<p>In ASP.NET AJAX Extensions v1.0 for ASP.NET 2.0 there is the JavaScriptSerializer class that provides JSON serialization and deserialization functionality. However, in .NET 3.5 the JavaScriptSerializer has been marked obsolete. The new object to use for JSON serialization in .NET 3.5 is the DataContractJsonSerliaizer object. I'm still new to the DataContractJsonSerializer, but here's a summary of what I've learned so far...</p>
<p><strong>Object to Serialize</strong></p>
<p>Here's a simple Person object with First Name and Last Name properties.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public class Person
{
    public Person() { }
    public Person(string firstname, string lastname)
    {
        this.FirstName = firstname;
        this.LastName = lastname;
    }
    public string FirstName { get; set; }
    public string LastName { get; set; }
}</pre>
<p>Now in order to serialize our object to JSON using the DataContractJsonSerializer we must either mark it with the Serializable attribute or the DataContract attribute. If we mark the class with the DataContract attribute, then we must mark each property we want serialized with the DataMember attribute.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">/// Marked with the Serializable Attribute
[Serializable]
public class Person
{
    public Person() { }
    public Person(string firstname, string lastname)
    {
        this.FirstName = firstname;
        this.LastName = lastname;
    }
    public string FirstName { get; set; }
    public string LastName { get; set; }

}

/// Marked with the DataContact Attribute
[DataContract]
public class Person
{
    public Person() { }
    public Person(string firstname, string lastname)
    {
        this.FirstName = firstname;
        this.LastName = lastname;
    }

    [DataMember]
    public string FirstName { get; set; }

    [DataMember]
    public string LastName { get; set; }
}</pre>
<p><strong>Serialization Code</strong></p>
<p>Here's the most basic code to serialize our object to JSON:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">Person myPerson = new Person("Chris", "Pietschmann");

/// Serialize to JSON
System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(myPerson.GetType());
MemoryStream ms = new MemoryStream();
serializer.WriteObject(ms, myPerson);
string json = Encoding.Default.GetString(ms.ToArray());</pre>
<p>Our resulting JSON looks like this:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">/// Result of Person class marked as Serializable
{"&lt;FirstName&gt;k__BackingField":"Chris","&lt;LastName&gt;k__BackingField":"Pietschmann"}

/// Result of Person class marked as DataContract with
/// each Property marked as DataMember
{"FirstName":"Chris","LastName":"Pietschmann"}</pre>
<p>As you can see the first serialization with the class marked with the Serializable attribute isn't quite what we were expecting, but is still JSON. This serialization actually isn't compatible with the client-side JSON Serializer in ASP.NET AJAX.</p>
<p>As you can see the second serialization with the class marked with the DataContract attribute is exactly what we were expecting, and is the same JSON that the old JavaScriptSerializer object would have generated. This is the method of JSON serialization using the DataContractJsonSerializer that you'll need to do if you are going to pass the resulting JSON down to the client to be consumed with ASP.NET AJAX.</p>
<p><strong>Deserialization Code</strong></p>
<p>Here's the most basic code to deserialize our object from JSON:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">Person myPerson = new Person();
MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(myPerson.GetType());
myPerson = serializer.ReadObject(ms) as Person;
ms.Close();</pre>
<p><strong>Controlling the property names in the resulting JSON</strong></p>
<p>When using the DataContract and DataMember attributes, you can tell the DataMember attribute the specific name you want that property to have within the JSON serialization by setting its "Name" named parameter.</p>
<p>Here's an example that will give the name of "First" to the "FirstName" property within the JSON serialization:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">[DataMember(Name = "First")]
public string FirstName { get; set; }</pre>
<p>The resulting JSON looks like this:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">{"First":"Chris","LastName":"Pietschmann"}</pre>
<p><strong>Here's the code for some Helper methods using Generics to do all the dirty work for you</strong></p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

public class JSONHelper
{
    public static string Serialize&lt;T&gt;(T obj)
    {
        System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
        MemoryStream ms = new MemoryStream();
        serializer.WriteObject(ms, obj);
        string retVal = Encoding.Default.GetString(ms.ToArray());
        ms.Dispose();
        return retVal;
    }

    public static T Deserialize&lt;T&gt;(string json)
    {
        T obj = Activator.CreateInstance&lt;T&gt;();
        MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
        System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
        obj = (T)serializer.ReadObject(ms);
        ms.Close();
        ms.Dispose();
        return obj;
    }
}

/// Our Person object to Serialize/Deserialize to JSON
[DataContract]
public class Person
{
    public Person() { }
    public Person(string firstname, string lastname)
    {
        this.FirstName = firstname;
        this.LastName = lastname;
    }

    [DataMember]
    public string FirstName { get; set; }

    [DataMember]
    public string LastName { get; set; }
}


/// Sample code using the above helper methods
/// to serialize and deserialize the Person object

Person myPerson = new Person("Chris", "Pietschmann");

// Serialize
string json = JSONHelper.Serialize&lt;Person&gt;(myPerson);

// Deserialize
myPerson = JSONHelper.Deserialize&lt;Person&gt;(json);</pre>
<p><strong>What Assembly References does my application need for this?</strong></p>
<p>From the namespace that contains DataContractJsonSerializer you can probably tell that you need to add a reference to the <strong>System.Runtime.Serialization</strong> assembly. However, you also need to add a reference to the <strong>System.ServiceModel.Web</strong> assembly.</p>
