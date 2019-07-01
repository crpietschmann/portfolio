  ---
  layout: post
  title: "JavaScript Basics: How to create a Dictionary with Key/Value pairs"
  date: 2015-09-05 09:15:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2015/09/05/JavaScript-Basics-How-to-create-a-Dictionary-with-KeyValue-pairs", "/post/2015/09/05/javascript-basics-how-to-create-a-dictionary-with-keyvalue-pairs"]
  ---
<!-- more -->
<p>In statically typed programming languages a Dictionary (Key/Value pair collection) object can be very useful at times. While JavaScript doesn't natively include a type called "Dictionary", it does contain a very flexible type called "Object". The JavaScript "Object" type is very versatile since JavaScript is a dynamically typed language. This flexibility allows for the "Object" type to be used in ways that might seem strange when compared to statically typed languages such as C#.</p>
<h3>Creating a Dictionary in JavaScript</h3>
<p>While there's no "Dictionary" type in JavaScript, it's actually really easy to create and use a dictionary object. The following steps show how to go about creating and populating a dictionary with Key/Value pairs:</p>
<p><strong>Step 1: Create a new Object</strong></p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">var dict = new Object();

// or the shorthand way
var dict = {};

</pre>
<p>You can also initialize the Dictionary with Key/Value pairs when creating it if you are using the shorthand method.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">var dict = {
  FirstName: "Chris",
  "one": 1,
  1: "some value"
};</pre>
<p><strong>Step 2: Populate Values on the Object</strong></p>
<p>This can be done by either setting the values using the Object's Indexer property, or just calling it directly as if it were a standard property on the object. As you'll see below the Key values can be any object and are not limited to Strings.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// using the Indexer
dict["one"] = 1;
dict[1] = "one";

// direct property by name
// because it's a dynamic language
dict.FirstName = "Chris";</pre>
<h3>Iterating Key/Value Pairs</h3>
<p>A simple JavaScript "for" loop can be used to iterate through your new dictionary.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">for(var key in dict) {
  var value = dict[key];

  // do something with "key" and "value" variables

}</pre>
<p>By using the "for(var key in dict)" method of iterating on the object you are able to easily access all the key/value pairs in contains. This method will iterate with each "key" value being the Index on the Object that can be used to access the associated Value.</p>
<h3>Access Key/Value Pairs Directly</h3>
<p>The Key/Value pairs can be accessed directly on the dictionary Object either through the indexer or as if it's directly a property on the object.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// using indexer
var name = dict["FirstName"];

// as property
var name = dict.FirstName;</pre>
<h3>Functions can be Key or Value Too!</h3>
<p>Since JavaScript is a functional language, functions are objects too. As a result, Functions can also be used as either Key and/or Value on your dictionary. For the Dictionary Key, this really does make sense since the Dictionary is really just an Object which can have functions/methods on it. However using Functions as the value may not be the most obvious for developers most comfortable with non-functional programming languages.</p>
<p>Here are some examples of using a Function in both Key and Value of a Dictionary:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">var dict = {};

var f = function() {
  // do something
};

// setup Function as Value
dict['method'] = f;

// setup Function as Key
dict[f] = 'some value';

// execute Function from Value
dict['method']();

var method = dict.method;
method();

// get value for Key
var val = dict[f];</pre>
<p>Hopefully this offers some additional clarification and/or insights into how JavaScript works, and how to make it work how you want/need it to. Happy coding!</p>
