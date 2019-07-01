---
layout: post
blogengineid: c2786425-6a63-4bb0-b0ad-5fcc64b2c557
title: "Software Basics: What are Databases and Data Access Layers, and How do they relate to Web Services?"
date: 2010-03-13 19:23:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2010/03/13/Software-Basics-What-are-Databases-and-Data-Access-Layers-and-How-do-they-relate-to-Web-Services
  - /post/2010/03/13/software-basics-what-are-databases-and-data-access-layers-and-how-do-they-relate-to-web-services
  - /post.aspx?id=c2786425-6a63-4bb0-b0ad-5fcc64b2c557
---
<!-- more -->
<p>In my own personal discussions with other developers and computer users I've seen a fair amount of confusion as to what a <em>database</em> is. Since the purpose of almost all applications is to Create/Read/Update/Delete data, they need to connect to a database, since data persistence storage need to be provided for the application to function as intended. If you want to stick to the simplest definition below, then a file cabinet is technically a database, but now that we're in the information age we don't really think of file cabinets as such since we can't search them very easily without physically looking at every folder or file it contains. Also, the my point in writing this article is to point out what databases are as they relate to software, so I'll keep things below within the digital sense.</p>
<p>Below I will describe what Databases, Software Database Server and Data Access Layers are. Also, I will define how a Web Service is really both a Data Access Layer or a Database.</p>
<h3>What is a Database?</h3>
<p>I would refer to the definition that Wikipedia gives as the simplest, most basic definition:</p>
<p><em>"A database is a collection of data..."</em> from <a rel="nofollow" href="http://en.wikipedia.org/wiki/Database">Wikipedia</a></p>
<p>And, to be a little more specific you can also look at the definition from Wiktionary:</p>
<p><em>"1. A collection of (usually) organized information in a regular structure, usually but not necessarily in a machine-readable format accessible by a computer.</em></p>
<p><em>2.A software program for storing, retrieving and manipulating a database"</em> from <a rel="nofollow" href="http://en.wiktionary.org/wiki/database">Wiktionary</a></p>
<h3>Most Commonly Used Databases</h3>
<p>All software databases boil down to file stored on a hard drive or some other persistent storage, but for all practical purposes of developing software there are really 2 basic types of databases:</p>
<ol>
<li>"Flat" File</li>
<li>Software Database Server</li>
</ol>
<p>&nbsp;</p>
<h3>"Flat" File Databases</h3>
<p>This is the most simplest form of a database used by software, and these are just files stored that contain a "machine-readble" representation of the data stored. Some of the common methods of formating the data within flat files are: <a href="http://en.wikipedia.org/wiki/XML">XML</a>, <a rel="nofollow" href="http://en.wikipedia.org/wiki/JSON">JSON</a>,&nbsp;<a rel="nofollow" href="http://en.wikipedia.org/wiki/Delimiter-separated_values">Delimiter-Separated Values</a> (CSV; commonly Tab or Comma separated) or Binary. All of the previously mentioned data formats are "marchine-readable" and "humarn-readable" (meaning that a person could open the file and read it's contents directly) with the exception of the Binary format. The most common formats used in most applications are probably XML and CSV.</p>
<h3>Software Database Servers</h3>
<p>Software Databases are applications that provide the service of storing data, allowing you to query the data (usually using the <a rel="nofollow" href="http://en.wikipedia.org/wiki/SQL">SQL language</a>), and exposing the data to be consumed/modified by another Software Application. At the core of a Software Database Server all data will end up in some kind of File stored within persistent storage (such as a hard drive) and most software database servers will store that data in Binary ("machin-readable" only) format. A couple of the most widely used Software Database Servers are: <a rel="nofollow" href="http://en.wikipedia.org/wiki/Microsoft_SQL_Server">Microsoft SQL Server</a> and <a rel="nofollow" href="http://en.wikipedia.org/wiki/MySQL">MySQL</a>.</p>
<h3>Can an Software Application/Program Be a Database?</h3>
<p>Yes! The above difinition of a Software Database Server described a Software Application that is also a Database because it provides the "service" of storing/retrieving data to some other Software Application.</p>
<h3>What is a Data Access Layer (DAL)?</h3>
<p>When talking about Software and Databases, you can't leave out Data Access Layers. Below is the definition of <a rel="nofollow" href="http://en.wikipedia.org/wiki/Data_access_layer">Data Access Layer</a> from Wikipedia:</p>
<p><em>"... a layer of a computer program which provides simplified access to data stored in persistent storage of some kind ..."</em></p>
<p>in the simplest form, a Data Access Layer is just the code or part of a software application that connects directly to a Database. If your application stores data within a Flat File in XML format, then the code that Reads/Updates/Saves the XML file is the Data Access Layer. Also, if your application uses a Software Database Server such as Microsoft SQL Server to store data, then the code that communicates with the MS SQL Server is the Data Access Layer. Simply put, the Data Access Layer is the code that bridges the gap between the Application and the Database.</p>
<h3>Is a Web Service a Database or a Data Access Layer?</h3>
<p>Well, actually a Web Service is BOTH a Database and a Data Access Layer. To explain why, first we need to define what a Web Service is.</p>
<p>Below is Wikipedias definition of a <a rel="nofollow" href="http://en.wikipedia.org/wiki/Web_service">Web Service</a>:</p>
<p><em>"Web services are typically application programming (API) or web APIs that can be access over a network, such as the Internet, and executed on a remote system hosting the requested services."</em></p>
<p>Basically a Web Service is a Software Application that provides some kind of remotely accessible service that is consumed by another Software Application. If a Web Service provides the service of storing/retrieving data (as most do), then you loop back around to the exact same definition given above of a Software Database Server. Additionally, for a Web Service to be a database it can store/retrieve the data in either "flat" files directly, or use another separate Software Database Server that it accesses to do the storage/retrieval within persistent storage for it.</p>
<p>Additionally, Web Services are most often used as the code or part of a Software Application that connects directly to a Database and provides that data to the Application; bridging the gap between the Application and Database. And, now we have also looped back around to the exact same definition of a Data Access Layer (DAL).</p>
<p>Following the above definition and descriptions of what a Web Service is; it can be concluded that really a Web Service is BOTH a Database and a Data Access Layer.</p>
<h3>Conclusion</h3>
<p>As you can see, a Web Service can be both a Data Access Layer and a Database. Usually developers only think of a Web Service as a Data Access Layer, but since it provides a collection of data to another application, then it technically is also a Database. Also, the definitions of the terms Data Access Layer and Database as they relate to your Software Application/Program can vary slightly based on your perspective of how they are used. To a Web Developer or Silverlight Developer a Web Service is a Database, but in the perspective of the Software Architect designing the entire solution then the Web Services becomes just a Data Access Layer.</p>
<p>I don't mean to confuse anyone with this article, nor am I saying that a Data Access Layer and Database are the same thing in all cases. The main point of this article is just to point out that the definition of each term is relative to the way that each piece of the application interacts.</p>
