---
layout: post
title: "Plot ZipCode Boundaries on a Map: Part 2 - Import Zip Code (U.S. Census ZCTA) Data Into A Database"
date: 2008-06-24 16:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/06/24/Plot-ZipCode-Boundaries-on-a-Map-Part-2-Import-Zip-Code-US-Census-ZCTA-Data-Into-A-Database
 -  /post/2008/06/24/plot-zipcode-boundaries-on-a-map-part-2-import-zip-code-us-census-zcta-data-into-a-database
---
<!-- more -->
<p>Now that we've <a href="/post/2008/06/Plot-ZipCode-Boundaries-on-a-Map-Part1-Making-sense-of-US-Census-ZCTA-ARCINFO-Ungenerate-ASCII-files.aspx">Made Sense of the U.S. Census ZCTA ARC/INFO Ungenerate (ASCII) files in Part 1</a> of this series, we are ready to import the U.S Census ZCTA Zip Code data into a database. In Part 2, we'll create database tables and import the Zip Code Boundary data into those tables in a MS SQL 2005 database.</p>
<h3>Create SQL 2005/2008 Database Tables</h3>
<p>First lets create a couple database tables to hold all the Zip Code boundary data. One table will hold the ZipCodes, the other will hold all the Boundary Points for each Zip Code.</p>
<p>The table scheme is as follows:</p>
<p><strong>ZipCode</strong><br /> ID - uniqueidentifier<br /> ZipCode - char(5)</p>
<p><strong>ZipCodeBoundary</strong> <br /> ID - uniqueidentifier<br /> ZipCodeID - uniqueidentifier<br /> IslandID - int<br /> Latitude - float<br /> Longitude - float<br /> SortOrder - int</p>
<p>Here's a couple things to not about the ZipCodeBoundary talble:</p>
<ol>
<li>The <em>IslandID</em> field numbers each "island" or "zone" for that spefic zipcode's boundary. An island is an area within the zipcode that is omitted from the zipcode, or an island of land that is to be included within the zipcode that doens't physically thouch the main part of the boundary. The main boundary is going to have an IslandID value of 0 (zero).</li>
<li>The <em>SortOrder </em>field numbers each boundary row in the order they appeared in the ARC/INFO Ungenerate (ASCII) file.</li>
</ol>
<p>Here's the SQL code for creating these tables. For this article, I created these tables in a database named <em>ZipCodeBoundaries</em>.</p>
<pre class="brush: sql; first-line: 1; tab-size: 4; toolbar: false; ">USE [ZipCodeBoundaries]
GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 06/24/2008 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZipCode](
    [ID] [uniqueidentifier] NOT NULL,
    [ZipCode] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ZipCode] PRIMARY KEY CLUSTERED
(
    [ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ZipCodeBoundary]    Script Date: 06/24/2008 15:40:43 ******/
CREATE TABLE [dbo].[ZipCodeBoundary](
    [ID] [uniqueidentifier] NOT NULL,
    [ZipCodeID] [uniqueidentifier] NOT NULL,
    [IslandID] [int] NULL,
    [Latitude] [float] NULL,
    [Longitude] [float] NULL,
    [SortOrder] [int] NULL,
 CONSTRAINT [PK_ZipCodeBoundary] PRIMARY KEY CLUSTERED
(
    [ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]</pre>
<h3>Import Data Into Database Tables</h3>
<p><img src="/images/postsImportARCINFOASCIIToSql05Database_Screenshot.png" alt="" align="right" />To make things easier, I wrote a small utility that reads in the "a.dat.csv" and ".dat.csv" files generated in Part 1 of this series and imports the data into the table defined above. One thing to note when importing the data from these file (and the original ARC/INFO Ungenerate (ASCII) files) is that each set of files starts numbering the ZipCodes at 1. So when importing into the database we much give each Zip Code a unique ID (in this article I'm using GUID's for this) and setting that ID correctly for each of the Zip Code Boundary Points.</p>
<p>Download the Import Utility: <a href="/file.axd?file=ImportARCINFOASCIIToSql05Database.zip" rel="enclosure">ImportARCINFOASCIIToSql05Database.zip (15.18 kb)</a></p>
<p>Remember, that when running this utility, it can take awhile to import ALL the ZipCode Boundary data for the entire country.</p>
<p>Note, this example utility has the connection string hard coded in the Form1.cs code file. Don't forget to change it to point to your database, unless you create your database on the local SQL Express instance and name it "ZipCodeBoundaries" like I do in this article.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Prev Part: <a href="/post/2008/06/Plot-ZipCode-Boundaries-on-a-Map-Part1-Making-sense-of-US-Census-ZCTA-ARCINFO-Ungenerate-ASCII-files.aspx">Part 1 - Making sense of U.S. Census ZCTA ARC/INFO Ungenerate (ASCII) files</a>&nbsp;</p>
<p>&nbsp;</p>
