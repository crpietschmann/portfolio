---
layout: post
title: "Plot ZipCode Boundaries on a Map: Part 1 - Making sense of U.S. Census ZCTA ARC/INFO Ungenerate (ASCII) files"
date: 2008-06-20 16:01:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/06/20/Plot-ZipCode-Boundaries-on-a-Map-Part1-Making-sense-of-US-Census-ZCTA-ARCINFO-Ungenerate-ASCII-files
  - /post/2008/06/20/plot-zipcode-boundaries-on-a-map-part1-making-sense-of-us-census-zcta-arcinfo-ungenerate-ascii-files
---
<!-- more -->
<p>One question that I get fairly oftern is "How do I plot Zip Code boundaries on a map?". Well, the answer isn't simple, well at least it hasn't been. So, I've decided to write a series of articles going through the steps needed to obtain Zip Code boundary data, makes sense of it and plot it on a map. I'm not sure how many parts this series will be, but it'll probably be at least 3.</p>
<h3>Where do I get Zip Cod Boundary Data From?</h3>
<p>There are a number of campanies that sell geocode data that includes Zip Code Boundaries and many more things. But, if all you want are the Zip Code boundaries, it so happens that you can download this data completely free from the U.S. Census Bureau website. Zip Code Boundary data is actually one of the many different data sets available from the U.S. Census Bureau.</p>
<p>The data I'll focus on&nbsp;here is the <a href="http://www.census.gov/geo/www/cob/z52000.html">Census 2000 5-Digit ZIP Code Tabulation Areas (ZCTAs) in ARC/INFO Ungenerate (ASCII) format</a>. Even though these files are in their own "special" format, described <a href="http://www.census.gov/geo/www/cob/ascii_info.html">here</a>, they are still just plain ASCII and easily converted into CSV files to be imported into a database.</p>
<h3>What's this ARC/INFO Ungenerate (ASCII) file format?</h3>
<p>Ok, now that you've downloaded the Zip Code Boundary data in <a href="http://www.census.gov/geo/www/cob/ascii_info.html">ARC/INFO Ungenerate (ASCII) format</a>, it's time to make sense of this "special" file format they are in. Since the file format is in ASCII it is simple to make sense of.</p>
<p>Here's a couple snippets of data from each of the files that each .ZIP file you downloaded contains:</p>
<p>Files ending in "a.dat":&nbsp;</p>
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; "> 1
 "356HH"
 "356HH"
 "Z5"
 "5-Digit ZCTA"
 
 2
 "35677"
 "35677"
 "Z5"
 "5-Digit ZCTA"</pre>
<p>Files ending in ".dat":</p>
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; ">         1      -0.874385997915983E+02       0.347957138950617E+02
      -0.881816728501744E+02       0.350078088730874E+02
      -0.881819180000000E+02       0.349990240000000E+02
      -0.881772430000000E+02       0.349917870000000E+02
      -0.881751840000000E+02       0.349895430000000E+02
      -0.881682580000000E+02       0.349777710000000E+02</pre>
<p>The files that end in "a.dat" contain the zip codes and some other info along with an ID used to reference them in the other file.</p>
<p>The files that end in ".dat" contain all the geocode points for each of the zip codes defined in the other file.</p>
<h3>How do I convert it to CSV?</h3>
<p><img src="/images/postsARCINFOASCIItoCSVConverter_Screenshot.png" alt="" width="660" height="534" align="right" />Well, you could look at the ARC/INFO Generate (ASCII) Metadata Cartographic Boundary File Format definition and write a parser that then saves in in a CSV format.</p>
<p>Or, you could just download and use the one I wrote for this article:</p>
<p>Download Conversion Utility: <a href="/file.axd?file=ARCINFOASCIItoCSVConverter.zip" rel="enclosure">ARCINFOASCIItoCSVConverter.zip (11.90 kb)</a></p>
<p>To use this utility, just unzip the contents of all the Zip files you downloaded from the U.S. Census Bureau website into a single folder, and click the "Convert All Files in Folder" button to select that folder and automatically convert all the files in that folder to a CSV file format.</p>
<p>The resulting CSV files will look like the following examples:</p>
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; ">ZipID,FIPS CODES(S),NAME,LSAD,LSAD TRANSLATION
0, , , ,
1,356HH,356HH,Z5,5-Digit ZCTA
2,35677,35677,Z5,5-Digit ZCTA
3,35677,35677,Z5,5-Digit ZCTA</pre>
<p>And...</p>
<pre class="brush: plain; first-line: 1; tab-size: 4; toolbar: false; ">ZipID,IslandId,LATITUDE,LONGITUDE,SortOrder
1,,-87.4385997915983,34.7957138950617,0
1,,-88.1816728501744,35.0078088730874,1
1,,-88.181918,34.999024,2
1,,-88.177243,34.991787,3
1,,-88.175184,34.989543,4</pre>
<p>Now, you'll be able to able to easily import this data into a database, which brings us to the end of this part.</p>
<h3>Reference Links:</h3>
<p>See the following links for reference in addition to this article:</p>
<p><a href="http://www.census.gov/geo/www/cob/z52000.html">U.S. Census Bureau - Census 2000&nbsp;5-Digit ZIP Code Tabulation Areas (ZCTAs) Cartographic Boundary Files</a>&nbsp;<br /> This is where you can download the U.S. Census Bureau's 5-Digit ZCTA files, specifically the ARC/INFO Ungenerate (ASCII) files used by the utility in this article.</p>
<p><a href="http://www.census.gov/geo/www/cob/ascii_info.html">ARC/INFO Generate (ASCII) Metadata Cartographic Boundary Files</a><br /> This page contains the description of the file format used for the ARC/INFO Generate (ASCII) files.</p>
<p>&nbsp;</p>
<p>Next Part: <a href="/post/2008/06/Plot-ZipCode-Boundaries-on-a-Map-Part-2-Import-Zip-Code-US-Census-ZCTA-Data-Into-A-Database.aspx">Part 2 - Import Zip Code (U.S. Census ZCTA) Data Into A Database</a></p>
