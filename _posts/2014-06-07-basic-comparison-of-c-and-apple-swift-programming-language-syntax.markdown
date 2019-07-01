---
layout: post
blogengineid: 8dc47db8-15c9-438a-b5d0-51df42fb01ef
title: "Basic Comparison of C# and Apple Swift Programming Language Syntax"
date: 2014-06-07 05:33:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "Swift"]
redirect_from: 
  - /post/2014/06/07/Basic-Comparison-of-C-and-Apple-Swift-Programming-Language-Syntax
  - /post/2014/06/07/basic-comparison-of-c-and-apple-swift-programming-language-syntax
  - /post.aspx?id=8dc47db8-15c9-438a-b5d0-51df42fb01ef
---
<!-- more -->

Recently, Apple announced and released a beta version of the new <a href="https://developer.apple.com/swift/">Swift programming language</a> for building iOS and OSX applications. Swift is a modern language with the power of Objective-C without the "baggage of C." While we can't argue that Objective-C has it's difficulties being tied closely to C, but the real question is... How does Swift compare to a modern language like C#?

Please, keep in mind that this post is not supposed to be an Apple vs Microsoft post. There are a lot of developers that use C# every day and the purpose of this post is to help them understand what Swift offers at a language level compared to C#. And, before you start the "apples and oranges" arguments, it's worth pointing out that using <a href="http://xamarin.com/">Xamarin </a>you can develop iOS and OSX apps using C#.

Now let the code mostly speak for itself...
<h3>Code Comments</h3>

Both languages support the same syntax for code comments; the familiar C-style comments.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// code comment

/* multi line
code comment */</pre>
<h3>Declaring Constants and Variables</h3>

Swift, like C#, is a type safe language. It also supports type inference so you don't have to specify the type when declaring the variables as the compiler can infer (or detect) the type by evaluating the assignment of the variable. While C# is slightly more verbose when declaring constants; both languages are just as elegant at declaring variables using type inference.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Declare Constant
// C#
const int legalAge = 18;

// Swift
let legalAge = 18

// Declare Variable
// C#
var legalAge = 18;

// Swift
var legalAge = 18</pre>

While type inference is nice, but when you don't immediately assign a value to the variable you may need to explicitly specify the type of the variable.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Type Annotation
//C#
string firstName;

// Swift
var firstName: String</pre>

You may notice the lack of the semi-colon in Swift. Yes, Swift is a mostly C-style syntax without requiring semi-colons. Swift does support and require the use of semi-colons if you want to have multiple code statements on the same line.
<h3>Variable Names and Unicode</h3>

Both languages support the use of Unicode characters as variable names. Basically, you could use Emoticons or other non-ASCII characters as variable names if you want, but who does that anyway?
<h3>Integer Bounds</h3>

Both languages have static constants for accessing the minimum and maximum bounds for the different Integer types.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Integer Bounds
// C#
var a = Int32.MinValue;
var b = Int32.MaxValue;

// Swift
var a = Int32.min
var b = Int32.max</pre>
<h3>Type Inference</h3>

Both languages, as mentioned above, support type inference where the compiler is able to detect what type the declared variable is from it's immediate assignment.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Type Inference
// C#
var a = 3; // integer
var b = 0.14 // double
var c = a + b; // double

// Swift
var a = 3 // integer
var b = 0.14 // double
var c = a + b // double</pre>

Also in the above type inference example you'll notice that when you declare a variable and immediately assign a value that is the result of 2 other variables it will still infer the type.
<h3>String Comparison</h3>

Both have similar methods of comparing strings.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// String Comparison
// C#
var a = "One";
var b = "One";
if (a == b) {
    // both variables are considered equal
}

// Swift
var a = "One"
var b = "One"
if a == b {
    // both variables are considered equal
}</pre>

The both also have similar methods of detecting if the beginning or ending of the string match's a specified string.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// C#
var s = "Some Value";
if (s.StartsWith("Some")) {
    // the string starts with the value
}
if (s.EndsWith("Value")) {
    // the string ends with the value
}

// Swift
var s = "Some Value"
if s.hasPrefix("Some") {
    // the string starts with the value
}
if s.hasSuffix("Value") {
    // the string ends with the value
}</pre>

You may notice from the above example that parenthesis are not required with IF statements in Swift.
<h3>String Upper or Lower Case</h3>

Both languages support similar methods of converting strings to Upper or Lower Case.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// String Upper and Lower Case
// C#
var s = "some Value";
var upperS = s.ToUpper();
var lowerS = s.ToLower();

// Swift
var s = "some Value"
var upperS = s.uppercaseString
var lowerS = s.lowercaseString</pre>
<h3>Declaring Arrays</h3>

Both languages support declaring and assigning Arrays using a single line of code.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Declare Arrays on single line

// String Array
// C#
var arr = new string[] { "One", "Two" };

// Swift
var arr = ["One", "Two"]

// Integer Array
// C#
var arr = new int[] { 1, 2 };

// Swift
var arr = [1, 2];</pre>
<h3>Working with Arrays</h3>

Working with Arrays have slight differences between the languages.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Iterating Over Array
// C#
foreach (var item in arr) {
    // do something
}

// Swift
for item in arr {
    // do something
}


// Get Item at Index
// C#
var item = arr[0];
// Swift
var item = arr[0]


// Set Item at Index
// C#
arr[0] = "Value";

// Swift
arr[0] = "Value"


// Is Array Empty?
// C#
if (arr.Length == 0) {
    // array is empty
}

// Swift
if arr.isEmpty {
    // array is empty
}


// Add Item to Array
// C#
Array.Resize(ref arr, arr.Length + 1);
arr[arr.Length - 1] = "Three";

// Swift
arr.append("Three")
// or
arr += "Three"


// Remove Item at Index
// C#
var list = arr.ToList();
list.RemoveAt(0);
var newArr = list.ToArray();

// Swift
var newArr = arr.removeAtIndex(0)</pre>
<h3>Declaring Dictionaries</h3>

Both languages support similar methods of declaring dictionaries.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Declaring Dictionaries
// C#
var dict = new Dictionary<string, string>();
var dict2 = new Dictionary<string, string>
{
    { "TYO", "Tokyo" },
    { "DUB", "Dublin" }
};

// Swift
var dict = Dictionary<String, String>()
var dict2 = ["TYO": "Tokyo", "DUB": "Dublin"]</pre>
<h3>Working with Dictionaries</h3>

Working with Dictionaries have slight differences between the languages.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Iterate over Dictionary
// C#
foreach(var item in dict) {
    var key = item.Key;
    var value = item.Value;
}

// Swift
for (key, value) in dict {
    // key variable contains key of item
    // value variable contains value of item
}

// Get Item in Dictionary by Key
// C#
var item = dict["TYO"];

// Swift
var item = dict["TYO"]


// Set Item in Dictionary by key
// or add if key doesn't exist
// C#
dict["LHR"] = "London";

// Swift
dict["LHR"] = "London"


// Remove Item in Dictionary by key
// C#
dict.Remove("LHR");

// Swift
dict.removeValueForKey("DUB")</pre>
<h3>For Loops</h3>

The above examples for Arrays and Dictionaries already showed examples of using a For-In loop to iterate through the items in those collections. Here are some additional methods of iterating using a For Loop.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Iterate from 1 through 5
// C#
// using increment
for(var i = 1; i <= 5; i++) {
    // do something with i
}

// Swift
// using range
for i in 1...5 {
    // do something with i
}
// using increment
for var i = 0; i <= 5; ++i {
    // do something with i
}</pre>

The range example of Swift is rather interesting in the method of shorthand it uses for it's definition.
<h3>Conditional Statements</h3>

Both languages support If...Then conditional statements. Swift is a little different that it doesn't require parenthesis around the match conditions.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// If Then Else Conditional Statement
// C#
if (i > 6) {
    // do something
} else if (i > 3 &amp;&amp; i <= 6) {
    // do something
} else {
    // do something
}

// Swift
if i > 6 {
    // do something
} else if i > 3 &amp;&amp; i <= 6 {
    // do something
} else {
    // do something
}</pre>
<h3>Switch Statement</h3>

Both languages support Switch statements.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Switch statement
// C#
var word = "A";
switch(word) {
    case "A":
        // do something
        break;
    case "B":
        // do something
        break;
    default:
        // do something
        break;
}

// Swift
var word = "A"
switch word {
    case "A":
        // do something
    case "B":
        // do something
    default:
        // do something
}</pre>

Switch statements are rather similar in both languages except that in Swift case statements don't automatically pass on to the next like in C#. As a result C# requires the use of the break keywords to exit the Switch statement, unless you want to fall through to the next case. While in Swift you must use the "fallthrough" keyword to tell it to pass on through to the next case statement. More information on this can be found in the Swift documentation.

An additional feature that Swift supports with Switch statements is ranges within the Case statements. This is something that C# does not support.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Switch Case Ranges
// C#
switch (i) {
    case 1:
    case 2:
    case 3:
        // do something
        break;
    case 4:
        // do something
        break;
    default:
        // do something
        break;
}

// Swift
switch i {
    case 1...3:
        // do something
    case 4:
        // do something
    default:
        // do something
}</pre>
<h3>Functions</h3>

While <a href="/post/2014/06/07/Basic-Comparison-of-Functions-in-C-and-Apple-Swift-Programming-Language">Functions are a much bigger comparison</a> to be made, here's a basic example:
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Function with Parameter and Return Value
// C#
string sayHello(string name) {
    // do something
}

// Swift
func sayHello(name: String) -> String {
    // do something
}</pre>

The post <a href="/post/2014/06/07/Basic-Comparison-of-Functions-in-C-and-Apple-Swift-Programming-Language">Basic Comparison of Functions in C# and Swift</a> goes into much more depth on Functions; as that is a much bigger comparison that could fit into this post.
<h3>Conclusion</h3>

This concludes my basic comparison of C# and Apple Swift programming languages. The two languages are rather similar in many respects; at least in what I've compared thus far. More language feature comparisons will have to wait for future posts.

One of the bigger differences that's worth pointing out explicitly is the difference in how each language handles Array's. Arrays in Swift are extremely similar to the List<> class in C#; which is what most developers use today in C# instead of arrays anyway (unless performance requires it.)

You can find more information about the Swift programming language on Apple's site at the following links:

<a href="https://developer.apple.com/swift/">https://developer.apple.com/swift/</a>

<a href="https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/">https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/</a>

**Next Post in this Series: <a href="/post/2014/06/07/Basic-Comparison-of-Functions-in-C-and-Apple-Swift-Programming-Language">Basic Comparison of Functions in C# and Swift</a>**
