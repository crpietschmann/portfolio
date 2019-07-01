---
layout: post
blogengineid: ff9ab12f-8a69-4fc7-9bd8-8c5e2ee873c4
title: ".NET 3.5 SP1: DataContractJsonSerializer Bug"
date: 2008-08-27 16:47:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2008/08/27/NET-35-SP1-DataContractJsonSerializer-Bug
  - /post/2008/08/27/net-35-sp1-datacontractjsonserializer-bug
  - /post.aspx?id=ff9ab12f-8a69-4fc7-9bd8-8c5e2ee873c4
---
<!-- more -->

**Update 9/16/2008:** After too long, I finally tried uninstalling SP1 and reinstalling it and that fixed the issue. I'm glad it's fixed now! I haven't seen any other suggestions for fixing this, and I first tried repairing the installation, but only an uninstall and reinstall fixed it. Hope this helps solves anyone elses headache with this issue.

 

A few months ago (back in February actually) I blogged <a href="/post/2008/02/NET-35-JSON-Serialization-using-the-DataContractJsonSerializer.aspx">showing how to use the new DataContractJsonSerializer</a> to serialize your .NET objects to JSON. Everything was fine until .NET 3.5 SP1 was released. It appears that the .NET 3.5 SP1 update breaks the DataContractJsonSerializer. Using the exact <a href="/post/2008/02/NET-35-JSON-Serialization-using-the-DataContractJsonSerializer.aspx">same code from my previous post</a> that worked perfect on .NET 3.5 RTM, breaks with the following exceptions in .NET 3.5 SP1 RTM:
<h3>First Exception</h3>

This exception occurrs when running this code within a Console application:
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; ">System.MissingFieldException was unhandled
  Message="Field not found: 'System.Runtime.Serialization.XmlObjectSerializerContext.serializerKnownDataContracts'."
  Source="System.ServiceModel.Web"
  StackTrace:
       at System.Runtime.Serialization.Json.XmlObjectSerializerWriteContextComplexJson..ctor(DataContractJsonSerializer serializer, DataContract rootTypeDataContract)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.InternalWriteObjectContent(XmlWriterDelegator writer, Object graph)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.InternalWriteObject(XmlWriterDelegator writer, Object graph)
       at System.Runtime.Serialization.XmlObjectSerializer.WriteObjectHandleExceptions(XmlWriterDelegator writer, Object graph)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.WriteObject(XmlDictionaryWriter writer, Object graph)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.WriteObject(Stream stream, Object graph)
       at JsonSerializer_dotNet35SP1_IssueTest.JSONHelper.Serialize[T](T obj) in D:\TEST\JsonSerializer_dotNet35SP1_IssueTest\JsonSerializer_dotNet35SP1_IssueTest\Program.cs:line 56
       at JsonSerializer_dotNet35SP1_IssueTest.Program.Main(String[] args) in D:\TEST\JsonSerializer_dotNet35SP1_IssueTest\JsonSerializer_dotNet35SP1_IssueTest\Program.cs:line 22
       at System.AppDomain._nExecuteAssembly(Assembly assembly, String[] args)
       at Microsoft.VisualStudio.HostingProcess.HostProc.RunUsersAssembly()
       at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state)
       at System.Threading.ThreadHelper.ThreadStart()
  InnerException:</pre>

**Code for Console app: **
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.Serialization;
//using System.ServiceModel.Web;

namespace JsonSerializer_dotNet35SP1_IssueTest
{
    public class Program
    {
        static void Main(string[] args)
        {

            /// Sample code using the above helper methods
            /// to serialize and deserialize the Person object

            Person myPerson = new Person("Chris", "Pietschmann", 26);

            // Serialize
            string json = JSONHelper.Serialize<Person>(myPerson);

            // Deserialize
            myPerson = JSONHelper.Deserialize<Person>(json);
        }
    }

    [DataContract]
    public class Person
    {
        public Person() { }
        public Person(string firstname, string lastname, int age)
        {
            this.FirstName = firstname;
            this.LastName = lastname;
            this.Age = age;
        }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public int Age { get; set; }
    }

    public class JSONHelper
    {
        public static string Serialize<T>(T obj)
        {
            System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
            MemoryStream ms = new MemoryStream();
            serializer.WriteObject(ms, obj);
            string retVal = Encoding.Default.GetString(ms.ToArray());
            return retVal;
        }

        public static T Deserialize<T>(string json)
        {
            T obj = Activator.CreateInstance<T>();
            MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
            obj = (T)serializer.ReadObject(ms);
            ms.Close();
            return obj;
        }
    }
} </pre>
<h3>Second Exception</h3>

This exception occurrs when running this code within an ASP.NET WebPage:
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; ">System.MissingMethodException was unhandled by user code
  Message="Method not found: 'Boolean System.Runtime.Serialization.DataContract.get_IsReference()'."
  Source="System.ServiceModel.Web"
  StackTrace:
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.CheckIfTypeIsReference(DataContract dataContract)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.get_RootContract()
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.InternalWriteObjectContent(XmlWriterDelegator writer, Object graph)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.InternalWriteObject(XmlWriterDelegator writer, Object graph)
       at System.Runtime.Serialization.XmlObjectSerializer.WriteObjectHandleExceptions(XmlWriterDelegator writer, Object graph)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.WriteObject(XmlDictionaryWriter writer, Object graph)
       at System.Runtime.Serialization.Json.DataContractJsonSerializer.WriteObject(Stream stream, Object graph)
       at _Default.JSONHelper.Serialize[T](T obj) in d:\TEST\JsonSerializer_dotNet35SP1_IssueTest_ASPNET\Default.aspx.cs:line 55
       at _Default.Page_Load(Object sender, EventArgs e) in d:\TEST\JsonSerializer_dotNet35SP1_IssueTest_ASPNET\Default.aspx.cs:line 22
       at System.Web.Util.CalliHelper.EventArgFunctionCaller(IntPtr fp, Object o, Object t, EventArgs e)
       at System.Web.Util.CalliEventHandlerDelegateProxy.Callback(Object sender, EventArgs e)
       at System.Web.UI.Control.OnLoad(EventArgs e)
       at System.Web.UI.Control.LoadRecursive()
       at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
  InnerException:</pre>

**Code for ASP.NET app:**
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System;
using System.IO;
using System.Runtime.Serialization;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        /// Sample code using the above helper methods
        /// to serialize and deserialize the Person object

        Person myPerson = new Person("Chris", "Pietschmann", 26);

        // Serialize
        string json = JSONHelper.Serialize<Person>(myPerson);

        // Deserialize
        myPerson = JSONHelper.Deserialize<Person>(json);
    }

    [DataContract]
    public class Person
    {
        public Person() { }
        public Person(string firstname, string lastname, int age)
        {
            this.FirstName = firstname;
            this.LastName = lastname;
            this.Age = age;
        }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public int Age { get; set; }
    }

    public class JSONHelper
    {
        public static string Serialize<T>(T obj)
        {
            System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
            MemoryStream ms = new MemoryStream();
            serializer.WriteObject(ms, obj);
            string retVal = Encoding.Default.GetString(ms.ToArray());
            return retVal;
        }

        public static T Deserialize<T>(string json)
        {
            T obj = Activator.CreateInstance<T>();
            MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(obj.GetType());
            obj = (T)serializer.ReadObject(ms);
            ms.Close();
            return obj;
        }
    }
}</pre>
<h3>WTF??</h3>

I searched for a possible solution, but the only thing I found was this link (<a href="http://forums.msdn.microsoft.com/en-US/csharpgeneral/thread/37558154-88a9-41f0-a9d6-a2cb4052a5ce/">http://forums.msdn.microsoft.com/en-US/csharpgeneral/thread/37558154-88a9-41f0-a9d6-a2cb4052a5ce/</a>) where someone mentions the First Exception above. The suggested solution was to use the KnownType Attribute on the object, but that doesn't help with my above code.

Does anyone know a work around for this that doesn't involve using the older JavaScriptSerializer object?

Well, for now, it looks like I'm almost the only one to experience this issue. <img title="Frown" src="/admin/tiny_mce/plugins/emotions/images/smiley-frown.gif" alt="Frown" border="0" />
