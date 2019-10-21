---
layout: post
blogengineid: 5ad641db-7f0e-499c-a653-e388b441caf9
title: ".NET 3.5: JSON Serialization using the DataContractJsonSerializer"
date: 2008-02-27 18:15:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/02/27/NET-35-JSON-Serialization-using-the-DataContractJsonSerializer.aspx
  - /post/2008/02/27/NET-35-JSON-Serialization-using-the-DataContractJsonSerializer
  - /post/2008/02/27/net-35-json-serialization-using-the-datacontractjsonserializer
  - /post.aspx?id=5ad641db-7f0e-499c-a653-e388b441caf9
---
<!-- more -->

In ASP.NET AJAX Extensions v1.0 for ASP.NET 2.0 there is the `JavaScriptSerializer` class that provides JSON serialization and deserialization functionality. However, in .NET 3.5 the `JavaScriptSerializer` has been marked obsolete. The new object to use for JSON serialization in .NET 3.5 is the `DataContractJsonSerliaizer` object. I'm still new to the `DataContractJsonSerializer`, but here's a summary of what I've learned so far...

**Object to Serialize**

Here's a simple Person object with First Name and Last Name properties.
```csharp
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
```

Now in order to serialize our object to JSON using the DataContractJsonSerializer we must either mark it with the Serializable attribute or the DataContract attribute. If we mark the class with the DataContract attribute, then we must mark each property we want serialized with the DataMember attribute.

```csharp
/// Marked with the Serializable Attribute
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
}
```

## Serialization Code

Here's the most basic code to serialize our object to JSON:

```csharp
Person myPerson = new Person("Chris", "Pietschmann");

/// Serialize to JSON
System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(myPerson.GetType());
MemoryStream ms = new MemoryStream();
serializer.WriteObject(ms, myPerson);
string json = Encoding.Default.GetString(ms.ToArray());
```

Our resulting JSON looks like this:

```csharp
/// Result of Person class marked as Serializable
{"<FirstName>k__BackingField":"Chris","<LastName>k__BackingField":"Pietschmann"}

/// Result of Person class marked as DataContract with
/// each Property marked as DataMember
{"FirstName":"Chris","LastName":"Pietschmann"}
```

As you can see the first serialization with the class marked with the Serializable attribute isn't quite what we were expecting, but is still JSON. This serialization actually isn't compatible with the client-side JSON Serializer in ASP.NET AJAX.

As you can see the second serialization with the class marked with the DataContract attribute is exactly what we were expecting, and is the same JSON that the old JavaScriptSerializer object would have generated. This is the method of JSON serialization using the DataContractJsonSerializer that you'll need to do if you are going to pass the resulting JSON down to the client to be consumed with ASP.NET AJAX.

## Deserialization Code

Here's the most basic code to deserialize our object from JSON:

```csharp
Person myPerson = new Person();
MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(myPerson.GetType());
myPerson = serializer.ReadObject(ms) as Person;
ms.Close();
```

## Controlling the property names in the resulting JSON

When using the DataContract and DataMember attributes, you can tell the DataMember attribute the specific name you want that property to have within the JSON serialization by setting its "Name" named parameter.

Here's an example that will give the name of "First" to the "FirstName" property within the JSON serialization:

```csharp
[DataMember(Name = "First")]
public string FirstName { get; set; }
```

The resulting JSON looks like this:

```csharp
{"First":"Chris","LastName":"Pietschmann"}
```

## Some Helper Methods

Here's the code for some Helper methods using Generics to do all the dirty work for you:

```csharp
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

public class JSONHelper
{
    public static string Serialize<T>(T obj)
    {
        System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
        MemoryStream ms = new MemoryStream();
        serializer.WriteObject(ms, obj);
        string retVal = Encoding.Default.GetString(ms.ToArray());
        ms.Dispose();
        return retVal;
    }

    public static T Deserialize<T>(string json)
    {
        T obj = Activator.CreateInstance<T>();
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
string json = JSONHelper.Serialize<Person>(myPerson);

// Deserialize
myPerson = JSONHelper.Deserialize<Person>(json);
```

## What Assembly References does my application need for this?

From the namespace that contains DataContractJsonSerializer you can probably tell that you need to add a reference to the **System.Runtime.Serialization** assembly. However, you also need to add a reference to the **System.ServiceModel.Web** assembly.
