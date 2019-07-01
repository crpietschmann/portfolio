---
layout: post
blogengineid: a3f36d52-ab47-4082-93d1-4d6cb5999c13
title: "Silverlight: Client-Side Database via LINQ and Isolated Storage"
date: 2008-10-10 18:08:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/10/10/Silverlight-Client-Side-Database-via-LINQ-and-Isolated-Storage
  - /post/2008/10/10/silverlight-client-side-database-via-linq-and-isolated-storage
  - /post.aspx?id=a3f36d52-ab47-4082-93d1-4d6cb5999c13
---
<!-- more -->


When I did a search on &quot;Silverlight Database&quot; there weren&#39;t many results, and none of them actually mentioned a small database that you could embed into your Silverlight application. So, I thought I&#39;d share a solution that I&#39;ve used to store application data on the client using a combination of LINQ and Isolated Storage. This actually gives you a small &quot;SQL&quot;-like database since you can use LINQ to interact with it.



Basically, this technique constist of:

<ol>
	<li>Saving Objects in Isolated Storage as XML</li>
	<li>Keeping a copy of the data in memory to reduce disk access.</li>
	<li>Data is returned as a generic List&lt;&gt; object so you can use LINQ.</li>
</ol>
Also, if you use this in conjunction with web services, it allows you to cache data on the client and persist it across user session to give you a nice performance increase in certain situations.<br />


Here&#39;s some sample code to access a table named &quot;PersonTable&quot; using this method:



[code:c#]



// Load the table from the database<br />
var people = ClientDB.PersonTable.Load();<br />
<br />
// Select only specific data<br />
var newPeople = (from p in people<br />
                        where p.FirstName == &quot;Steve&quot;<br />
                        select p).ToList();<br />
<br />
// Save new data over the old<br />
ClientDB.PersonTable.Save(newPeople);
<br />
<br />
// Here&#39;s an example of basically selecting directly<br />
// from the table<br />
var newPeople = (from p in ClientDB.PersonTable.Load()<br />
                        where p.FirstName == &quot;Steve&quot;<br />
                        select p).ToList();<br />
<br />
// Remove a specific person from the table<br />
ClientDB.PersonTable.Remove(new Guid(&quot;7687ebfc-31e6-464c-a70d-fd3bb9ecbdb4&quot;));



``` 



Here&#39;s the code for the &quot;PersonTable&quot; class used above:



[code:c#]



using System;<br />
using System.Collections.Generic;<br />
using System.IO.IsolatedStorage;<br />
using System.Linq;<br />
using System.Xml;<br />
using System.Xml.Linq;<br />
<br />
// Make sure to add a reference to the following in your project:<br />
// System.Xml.Linq<br />
<br />
namespace SimpleSilverlightDatabaseWithLINQ.Data.ClientDB<br />
{<br />
    public class PersonTable<br />
    {<br />
        private const string _filename = &quot;PersonTable.xml&quot;;<br />
<br />
        private static List&lt;Person&gt; _cache = null;<br />
        private static object _cache_lock = new object();<br />
<br />
        public static List&lt;Person&gt; Load()<br />
        {<br />
            // Check if data has already been loaded from<br />
            // isolated storage, if not, then load it to memory.<br />
            if (PersonTable._cache == null)<br />
            {<br />
                lock (PersonTable._cache_lock)<br />
                {<br />
                    if (PersonTable._cache == null)<br />
                    {<br />
                        var isf = IsolatedStorageFile.GetUserStoreForApplication();<br />
                        if (!isf.FileExists(PersonTable._filename))<br />
                        {<br />
                            // no data has been previously saved, so set the<br />
                            // in memory list to an empty list.<br />
                            PersonTable._cache = new List&lt;Person&gt;();<br />
<br />
                        }<br />
                        else<br />
                        {<br />
                            // Data has bee previously saved, so load it.<br />
                            var isfs = new IsolatedStorageFileStream(PersonTable._filename, System.IO.FileMode.Open, isf);<br />
<br />
                            var reader = XmlReader.Create(isfs);<br />
                            var doc = XDocument.Load(reader);<br />
<br />
                            PersonTable._cache = (from e in doc.Root.Elements(&quot;Person&quot;)<br />
                                                  select new Person<br />
                                                  {<br />
                                                      ID = new Guid(e.Attribute(&quot;ID&quot;).Value),<br />
                                                      FirstName = e.Attribute(&quot;FirstName&quot;).Value,<br />
                                                      LastName = e.Attribute(&quot;LastName&quot;).Value<br />
                                                  }<br />
                                                  ).ToList();<br />
<br />
                            isfs.Close();<br />
                            isfs.Dispose();<br />
                        }<br />
                        isf.Dispose();<br />
                    }<br />
                }<br />
            }<br />
<br />
            // Return the in memory list<br />
            return PersonTable._cache;<br />
        }<br />
<br />
        public static void Save(List&lt;Person&gt; col)<br />
        {<br />
            lock (PersonTable._cache_lock)<br />
            {<br />
                // Overwrite the cache with the new list<br />
                PersonTable._cache = col;<br />
<br />
                // Save the list to Isolated Storage<br />
                XElement xml = new XElement(&quot;People&quot;,<br />
                    from p in col<br />
                    select new XElement(&quot;Person&quot;,<br />
                        new XAttribute(&quot;ID&quot;, p.ID.ToString()),<br />
                        new XAttribute(&quot;FirstName&quot;, p.FirstName),<br />
                        new XAttribute(&quot;LastName&quot;, p.LastName)<br />
                        )<br />
                    );<br />
<br />
                var isf = IsolatedStorageFile.GetUserStoreForApplication();<br />
                var isfs = new IsolatedStorageFileStream(PersonTable._filename, System.IO.FileMode.Create, isf);<br />
                var writer = XmlWriter.Create(isfs);<br />
                xml.Save(writer);<br />
<br />
                writer.Close();<br />
                isfs.Close();<br />
                isfs.Dispose();<br />
                isf.Dispose();<br />
            }<br />
        }<br />
<br />
        public static void Remove(Guid id)<br />
        {<br />
            // Remove a specific Person by ID<br />
            var people = PersonTable.Load();<br />
            people.Remove(<br />
                people.First(m =&gt; m.ID.ToString() == id.ToString())<br />
                );<br />
            PersonTable.Save(people);<br />
        }<br />
    }<br />
} 



``` 



And, here&#39;s the code for the Person class that is used in this example:



[code:c#]



namespace SimpleSilverlightDatabaseWithLINQ.Data<br />
{<br />
    public class Person<br />
    {<br />
        public Person()<br />
        {<br />
            this.ID = Guid.NewGuid();<br />
        }<br />
<br />
        public Guid ID { get; set; }<br />
        public string FirstName { get; set; }<br />
        public string LastName { get; set; }<br />
    }<br />
} 



``` 



**Conclusion**



You can actually store more data using this method than you probably think, before you begin to see performance issues. And, it could probably be optimized fairly easily to store much more data by storing the equivalent of &quot;table index&quot; data in memory only, and then reading from disk to retrieve the necessary records when needed. You&#39;d just have to optimize the caching so it doesn&#39;t eat up too much memory, and you could probably store a couple hundred MB pretty easily. Anyway, &quot;AS IS&quot; it is perfect for storing most data that you&#39;ll need to keep track of on the client. 

