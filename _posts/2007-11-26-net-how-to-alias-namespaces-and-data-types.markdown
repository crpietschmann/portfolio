  ---
  layout: post
  title: ".NET: How to Alias Namespaces and Data Types"
  date: 2007-11-26 12:08:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["C#", "vb.net"]
  alias: ["/post/2007/11/26/NET-How-to-Alias-Namespaces-and-Data-Types", "/post/2007/11/26/net-how-to-alias-namespaces-and-data-types"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>One of the little known features of .NET is that you can&nbsp;give complete namespaces and data types alias's that you can reference them with in code.</p>
<h3>Aliasing Data Types</h3>
<p>For this example we'll give a different name to the integer data type:</p>
<p>In VB.NET:</p>
<p>Imports MyInteger = System.Int32;</p>
<p>In C#:</p>
<p>using MyInteger = System.Int32;</p>
<p>Now to use the alias in code:</p>
<p>In VB.NET:</p>
<p>Public myVariable As MyInteger = 4;</p>
<p>In C#:</p>
<p>MyInteger myVariable = 4;</p>
<h3>Aliasing Namespaces</h3>
<p>For this example, lets assume we want to use an alias to rename the System namespace to Sys to its easier to type.</p>
<p>In VB.NET:</p>
<p>Imports Sys = System;</p>
<p>In C#</p>
<p>using Sys = System;</p>
<p>With the above alias in place, you can change this:</p>
<p>System.Int32 myInt = 4;</p>
<p>Into this:</p>
<p>Sys.Int32 myInt = 4;</p>
<h3>Usage Tips</h3>
<p><strong>Usage #1:</strong> A good use of aliasing would be when you are working on a large project and you are dependant on another developer to finish their class or namespace before you can comlete a piece of your code. You can create "dummy" or stub objects and namespaces of your own and them give them an alias that is what the actual name will be when the other developer is finished. Then when they're finished, you can just take out your alias's and include their namespaces and everything will work fine. This trick allows you to still keep coding and successfully compiling without exceptions caused by the namespaces or objects not existing.</p>
<p><strong>Usage #2: </strong>Another good use of aliasing would be if you are using Int32 in your code now, but you want to make it easier to switch to Double or Int64. Using aliasing allows you to change one line of code to change the data type that is being used.</p>
<p><strong>Usage #3:</strong> The last usage tip and probably the best one, is to use aliasing to eliminate the confusion of Ambiguous data types when using multiple namespaces each having objects with the same name. This way you wont have to type out the entire namespace when using the ambiguous objects.</p>
<p><a href="http://www.dotnetkicks.com/kick/?url=http%3a%2f%2fpietschsoft.com%2fBlog%2fPost.aspx%3fPostID%3d1426"><img src="http://www.dotnetkicks.com/Services/Images/KickItImageGenerator.ashx?url=http%3a%2f%2fpietschsoft.com%2fBlog%2fPost.aspx%3fPostID%3d1426&amp;bgcolor=0099FF" border="0" alt="kick it on DotNetKicks.com" /></a></p>
