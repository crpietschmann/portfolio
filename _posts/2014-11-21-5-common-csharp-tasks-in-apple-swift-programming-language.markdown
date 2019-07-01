  ---
  layout: post
  title: "5 Common C# tasks in Apple Swift Programming Language"
  date: 2014-11-21 18:19:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["C#", "Swift"]
  alias: ["/post/2014/11/21/5-Common-CSharp-tasks-in-Apple-Swift-Programming-Language", "/post/2014/11/21/5-common-csharp-tasks-in-apple-swift-programming-language"]
  ---
<!-- more -->
<p>There are many simple tasks performed by C# developers over and over. These are common things necessary in all kinds of applications. This post will give an overview of a few of the most common tasks performed by C# developers with examples on how to perform those tasks using the Swift programming language from Apple.</p>
<h3>Type Casting</h3>
<p>There are many reasons you might need to convert a primitive type to another. One of these is to convert an integer to a string for string concatenation or some other reason.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// C#
var i = 1;
string a = Convert.ToString(i);
double b = Convert.ToDouble(i);

string a = i.ToString();

// Swift
var i = 1
var a = String(i)
var b = Double(i)</pre>
<p>Just like C#, Swift provides methods that can be used to convert from one primitive type to another. One difference is that all objects in C# have the ".ToString()" method that returns a string representation of that object. No such method exists directly on all objects in Swift.</p>
<h3>String Interpolation (aka String.Format)</h3>
<p>Abetter more optimized way to form a string from a set of variable values is to use string interpolation rather than straight string concatenation.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// C#
var i = 2;
var str = String.Format("Value: {0}", i);


// Swift
var i = 2
var str = "Value: \(i)"</pre>
<p>Both usages are easy enough to use, but the syntax of Swift is probably a little easier to read.</p>
<p>Note: It is worth nothing that the newly announced C# 6 language will support string interpolation in a manner almost identical to that of Swift.</p>
<h3>Array Initializers</h3>
<p>Arrays in C# aren't generally used very much (with Generic Lists and Dictionaries abound) however they do come in handy in many occasions.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// C#
var emptyArray = new Double[0];

var names = new String[] {
    "Steve",
    "Chris"
};

var indentifiers = new Int[] {
    2644,
    2542
};


// Swift
var emptyArray = Double[]()

var names = [
    "Steve",
    "Chris"
]

var identifiers = [
    2644,
    2542
]</pre>
<h3>Dictionaries (Key/Value Pairs)</h3>
<p>When working with key/value pairs, Dictionaries are the best construct to use.&nbsp;</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// C#
var emptyDictionary = new Dictionary&lt;int, string&gt;();

// Dictionary initializer
var d = new Dictionary&lt;int, string&gt; {
    { 1, "One" },
    { 2, "Two" }
}

// add or set key/value pair
d[3] = "Three";
d.Add(3, "Three");

foreach(var item in d) {
    var id = item.Key;
    // do something
}

// Swift

var emptyDictionary = Dictionary&lt;Int, String&gt;()

var emptyDictionary = [Int:String]()

// Dictionary initializer
var d = [1: "One", 2: "Two"]

// add or set key/value pair
d[3] = "Three"

// iterate over dictionary
for item in d {
    var id = item.0
    // do something
}
</pre>
<p>While there is much more detail that can be explained when working with Dictionaries, I thought I'd just keep it simple in the context of this post.</p>
<h3>Working with Dates</h3>
<p>Unfortunately, Swift doesn't actual contain a primitive type for Dates like the DateTime type provided in C#. However, you can use the "NSDate" in Swift.</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// C#

var localDateTime = DateTime.Now;

var dateString = localDateTime.ToString();

var dateString = localDateTime.ToString("yyyy-MM-dd");

// comparing dates
var isMatch = DateTime.Now == localDateTime;



// Swift

import Foundation

var localDateTime = NSDate()

var dateString = "\(localDateTime)"


var dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
var dateString = dateFormatter.stringFromDate(localDateTime)

// comparing dates
var isMatch = NSDate() == date
</pre>
<h3>Conclusion</h3>
<p>There's definitely much more that could be show within the context of the above examples, but I wanted to keep this post simple. One thing that surprises me a little is that Swift doesn't have it's own DateTime primitive type but rather inherits the NSDate object from Objective-C. It seems this is an area that Swift could improve upon, however there are also some things that C# could learn from Swift in other areas as well.</p>
