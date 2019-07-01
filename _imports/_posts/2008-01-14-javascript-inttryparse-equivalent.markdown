  ---
  layout: post
  title: "JavaScript int.TryParse Equivalent"
  date: 2008-01-14 21:47:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2008/01/14/JavaScript-intTryParse-Equivalent", "/post/2008/01/14/javascript-inttryparse-equivalent"]
  ---
<!-- more -->
<p>One of the most handy methods in .NET is the <em>int.TryParse</em> method. It makes it really convenient when evaluating a string value as an integer. But, JavaScript has no equivalent so you need to do your own evaluation every time.</p>
<p>Here's a simple JavaScript method I wrote that takes the work out of evaluating a string to an integer:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">function TryParseInt(str,defaultValue) {
     var retValue = defaultValue;
     if(str !== null) {
         if(str.length &gt; 0) {
             if (!isNaN(str)) {
                 retValue = parseInt(str);
             }
         }
     }
     return retValue;
}</pre>
<p>The first parameter of the TryParseInt method is the string you want to evaluate, and the second parameter is the default value to return if the string cannot be evaluated to an integer.</p>
<p>Here are some example usages:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">//This will return 5 
var a = TryParseInt("5", 0); 
alert(a); 

//This will return 0 
var b = TryParseInt("5d", 0); 
alert(b); 

//This will return null 
var c = TryParseInt("chris", null); 
alert(c);</pre>
