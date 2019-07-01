---
layout: post
title: "T-SQL: Join Tables by a Field that contains a delimited string"
date: 2005-12-09 18:16:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2005/12/09/T-SQL-Join-Tables-by-a-Field-that-contains-a-delimited-string
  - /post/2005/12/09/t-sql-join-tables-by-a-field-that-contains-a-delimited-string
---
<!-- more -->
<p>This is the first time I ran into a situation where I needed to Join two tables (one with a varchar field and one with a varchar field that contains pipe delimited data) so I decided to post it for other who may not know you can do this.&nbsp;Below is a simplified example with solution of getting all rows of the first table whos values are contained in the pipe delimited field of the second table. This is really simple to do and you don't even have to use any User-Defined Functions or Cursors to do it. And I'm sure that not all of you who may read this know that you can use LIKE in a JOIN.</p>
<p><span style="COLOR: #008080">1</span> <span style="COLOR: #0000ff">SELECT</span><span style="COLOR: #000000"> City<br /></span><span style="COLOR: #008080">2</span> <span style="COLOR: #0000ff">FROM</span><span style="COLOR: #000000"> Table1<br /></span><span style="COLOR: #008080">3</span> <span style="COLOR: #0000ff">JOIN</span><span style="COLOR: #000000"> Table2 </span><span style="COLOR: #0000ff">ON</span><span style="COLOR: #000000"> Table2.CityList </span><span style="COLOR: #808080">LIKE</span><span style="COLOR: #000000"> </span><span style="COLOR: #ff0000">'</span><span style="COLOR: #ff0000">%</span><span style="COLOR: #ff0000">'</span><span style="COLOR: #000000"> </span><span style="COLOR: #808080">+</span><span style="COLOR: #000000"> Table1.City </span><span style="COLOR: #808080">+</span><span style="COLOR: #000000"> </span><span style="COLOR: #ff0000">'</span><span style="COLOR: #ff0000">%</span><span style="COLOR: #ff0000">'</span></p>
<p><br /><strong><span style="text-decoration: underline;">Table1<br /></span></strong>City varchar(30)</p>
<p><strong><span style="text-decoration: underline;">Table1 Sample&nbsp;Data</span></strong><br />West Bend<br />Kewaskum<br />Hartford<br /><br /><strong><span style="text-decoration: underline;">Table2<br /></span></strong>CityList varchar(2000)</p>
<p><strong><span style="text-decoration: underline;">Table2 Sample&nbsp;Data<br /></span></strong>West Bend|Kewaskum<br />Kewaskum<br />Hartford</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
