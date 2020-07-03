---
layout: post
blogengineid: a3f36d52-ab47-4082-93d1-4d6cb5999c13
title: "Silverlight: Client-Side Database via LINQ and Isolated Storage"
date: 2008-10-10 18:08:00 -0500
comments: true
published: true
categories: ["Silverlight", "LINQ"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/10/10/Silverlight-Client-Side-Database-via-LINQ-and-Isolated-Storage.aspx
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
	<li>Data is returned as a generic List<> object so you can use LINQ.</li>
</ol>
Also, if you use this in conjunction with web services, it allows you to cache data on the client and persist it across user session to give you a nice performance increase in certain situations.



Here&#39;s some sample code to access a table named &quot;PersonTable&quot; using this method:



```csharp



// Load the table from the database

var people = ClientDB.PersonTable.Load();



// Select only specific data

var newPeople = (from p in people

                        where p.FirstName == &quot;Steve&quot;

                        select p).ToList();



// Save new data over the old

ClientDB.PersonTable.Save(newPeople);




// Here&#39;s an example of basically selecting directly

// from the table

var newPeople = (from p in ClientDB.PersonTable.Load()

                        where p.FirstName == &quot;Steve&quot;

                        select p).ToList();



// Remove a specific person from the table

ClientDB.PersonTable.Remove(new Guid(&quot;7687ebfc-31e6-464c-a70d-fd3bb9ecbdb4&quot;));



``` 



Here&#39;s the code for the &quot;PersonTable&quot; class used above:



```csharp



using System;

using System.Collections.Generic;

using System.IO.IsolatedStorage;

using System.Linq;

using System.Xml;

using System.Xml.Linq;



// Make sure to add a reference to the following in your project:

// System.Xml.Linq



namespace SimpleSilverlightDatabaseWithLINQ.Data.ClientDB

{

    public class PersonTable

    {

        private const string _filename = &quot;PersonTable.xml&quot;;



        private static List<Person> _cache = null;

        private static object _cache_lock = new object();



        public static List<Person> Load()

        {

            // Check if data has already been loaded from

            // isolated storage, if not, then load it to memory.

            if (PersonTable._cache == null)

            {

                lock (PersonTable._cache_lock)

                {

                    if (PersonTable._cache == null)

                    {

                        var isf = IsolatedStorageFile.GetUserStoreForApplication();

                        if (!isf.FileExists(PersonTable._filename))

                        {

                            // no data has been previously saved, so set the

                            // in memory list to an empty list.

                            PersonTable._cache = new List<Person>();



                        }

                        else

                        {

                            // Data has bee previously saved, so load it.

                            var isfs = new IsolatedStorageFileStream(PersonTable._filename, System.IO.FileMode.Open, isf);



                            var reader = XmlReader.Create(isfs);

                            var doc = XDocument.Load(reader);



                            PersonTable._cache = (from e in doc.Root.Elements(&quot;Person&quot;)

                                                  select new Person

                                                  {

                                                      ID = new Guid(e.Attribute(&quot;ID&quot;).Value),

                                                      FirstName = e.Attribute(&quot;FirstName&quot;).Value,

                                                      LastName = e.Attribute(&quot;LastName&quot;).Value

                                                  }

                                                  ).ToList();



                            isfs.Close();

                            isfs.Dispose();

                        }

                        isf.Dispose();

                    }

                }

            }



            // Return the in memory list

            return PersonTable._cache;

        }



        public static void Save(List<Person> col)

        {

            lock (PersonTable._cache_lock)

            {

                // Overwrite the cache with the new list

                PersonTable._cache = col;



                // Save the list to Isolated Storage

                XElement xml = new XElement(&quot;People&quot;,

                    from p in col

                    select new XElement(&quot;Person&quot;,

                        new XAttribute(&quot;ID&quot;, p.ID.ToString()),

                        new XAttribute(&quot;FirstName&quot;, p.FirstName),

                        new XAttribute(&quot;LastName&quot;, p.LastName)

                        )

                    );



                var isf = IsolatedStorageFile.GetUserStoreForApplication();

                var isfs = new IsolatedStorageFileStream(PersonTable._filename, System.IO.FileMode.Create, isf);

                var writer = XmlWriter.Create(isfs);

                xml.Save(writer);



                writer.Close();

                isfs.Close();

                isfs.Dispose();

                isf.Dispose();

            }

        }



        public static void Remove(Guid id)

        {

            // Remove a specific Person by ID

            var people = PersonTable.Load();

            people.Remove(

                people.First(m => m.ID.ToString() == id.ToString())

                );

            PersonTable.Save(people);

        }

    }

} 



``` 



And, here&#39;s the code for the Person class that is used in this example:



```csharp



namespace SimpleSilverlightDatabaseWithLINQ.Data

{

    public class Person

    {

        public Person()

        {

            this.ID = Guid.NewGuid();

        }



        public Guid ID { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

    }

} 



``` 



**Conclusion**



You can actually store more data using this method than you probably think, before you begin to see performance issues. And, it could probably be optimized fairly easily to store much more data by storing the equivalent of &quot;table index&quot; data in memory only, and then reading from disk to retrieve the necessary records when needed. You&#39;d just have to optimize the caching so it doesn&#39;t eat up too much memory, and you could probably store a couple hundred MB pretty easily. Anyway, &quot;AS IS&quot; it is perfect for storing most data that you&#39;ll need to keep track of on the client. 

