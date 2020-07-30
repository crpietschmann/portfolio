<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Chris Pietschmann</title>
    <description>I have 20 years of experience in the Software Development industry that includes working as a Consultant and Trainer in a wide array of different industries. Welcome to my resume and work history portfolio website!
</description>
    <link>http://pietschsoft.com//</link>
    <atom:link href="http://pietschsoft.com//feed.xml" rel="self" type="application/rss+xml" />
    <pubDate>Wed, 29 Jul 2020 22:43:27 -0500</pubDate>
    <lastBuildDate>Wed, 29 Jul 2020 22:43:27 -0500</lastBuildDate>
    <generator>Jekyll v4.1.0</generator>
    
      <item>
        <title>Loop through JavaScript Arrays using for, forEach, and map functions</title>
        <description>&lt;p&gt;All JavaScript apps from server-side Node.js to client-side code, there are many time when you need to work with JavaScript Arrays. Arrays are useful to store multiple values within a single variale. You can build them directly within your code, pass them to another function, or even receive them as part of a JSON payload from a REST API response. Arrays are a very useful construct in any programming language; certainly including JavaScript. This article takes a look at a few of the top tips and methods for working with and looping through JavaScript arrays.&lt;/p&gt;

&lt;p&gt;For reference, here’s a simple JavaScript array that will be referenced in the following code tips:&lt;/p&gt;

&lt;div class=&quot;language-js highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;[&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;one&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;two&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;three&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;];&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;use-foreach-to-loop-through-array&quot;&gt;Use &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; to loop through Array&lt;/h2&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Array&lt;/code&gt; prototype (aka “object”) in JavaScript contains the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach()&lt;/code&gt; function on it. You can use this to execute specific code on each element in the array. It works by passing in a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;function&lt;/code&gt; (or &lt;em&gt;Callback&lt;/em&gt;) that will be called for each element in the Array, with the first argument being the value from the Array.&lt;/p&gt;

&lt;p&gt;Here’s a simple example of using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Array.prototype.forEach()&lt;/code&gt; method to loop through an Array:&lt;/p&gt;

&lt;div class=&quot;language-js highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;forEach&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;item&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;){&lt;/span&gt;
  &lt;span class=&quot;c1&quot;&gt;// do something with item from the array&lt;/span&gt;
  &lt;span class=&quot;c1&quot;&gt;// `item` will contain the value from the Array&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;});&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; methods &lt;strong&gt;Callback&lt;/strong&gt; also supports a couple additional arguments that can be passed in to give you a little more power in it’s usage. The first argument is the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;currentValue&lt;/code&gt; that will be the actual value from the Array. Here’s a list of the additional arguments supported by the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; function:&lt;/p&gt;

&lt;div class=&quot;language-plaintext highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;Array.prototype.forEach(
  callback(currentValue, index, array), thisArg
)
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;When passing a &lt;em&gt;Callback&lt;/em&gt; function to the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; function, the minimum required argument is the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;currentValue&lt;/code&gt;, and you can optionally specify the rest as needed. Here’s the definitions of what all the arguments are:&lt;/p&gt;

&lt;ul&gt;
  &lt;li&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;currentValue&lt;/code&gt;: The current element being processed in the array.&lt;/li&gt;
  &lt;li&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;index&lt;/code&gt;: The index of the current element being processed in the array. &lt;em&gt;(optional)&lt;/em&gt;&lt;/li&gt;
  &lt;li&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;array&lt;/code&gt;: The array the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; was called on, so you can reference the original array the element being processed is from as necessary. &lt;em&gt;(optional)&lt;/em&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;When calling the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; functions and passing in a &lt;em&gt;Callback&lt;/em&gt; function, you can also pass in a second argument to the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; function itself. You can pass in a value for the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;thisArg&lt;/code&gt; argument. The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;thisArg&lt;/code&gt; argument is used as the value of what &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; will be set to when the &lt;em&gt;Callback&lt;/em&gt; is executed as &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; iterates through each element in the Array. Normally, you probably wont use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;thisArg&lt;/code&gt; argument, but it’s there in case you need to curry a specific value for &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt;; as can be necessary at times.&lt;/p&gt;

&lt;!-- ad --&gt;

&lt;h2 id=&quot;process-array-elements-using-map-function&quot;&gt;Process Array elements using &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; function&lt;/h2&gt;

&lt;p&gt;The Array prototype (aka “Object”) in JavaScript also supports the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; method. If you’re familiar with Functional programming languages, then you may be familiar with the idea of a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; function. In JavaScript, you can also use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; function as an alternative to the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; functions. The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; function accepts a &lt;em&gt;Callback&lt;/em&gt; function to use for processing each element in the Array, as well as a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;thisArg&lt;/code&gt; argument that can be used to assign a desired value to &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; when executing the &lt;em&gt;Callback&lt;/em&gt; function.&lt;/p&gt;

&lt;p&gt;Basically, the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; function works identically to the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;forEach&lt;/code&gt; function with the same argument support for &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;currentValue&lt;/code&gt;, &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;index&lt;/code&gt;, and &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;array&lt;/code&gt; arguments on the &lt;em&gt;Callback&lt;/em&gt; function. Here’s a similar example of using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;map&lt;/code&gt; function to loop through and handle all the lements of an Array:&lt;/p&gt;

&lt;div class=&quot;language-js highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;map&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;item&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;index&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;arr&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
  &lt;span class=&quot;c1&quot;&gt;// do something with item from the array&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;});&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;loop-sequentially-using-for&quot;&gt;Loop Sequentially using &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt;&lt;/h2&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; keyword can be used to loop through an array sequentially. It will help you loop through each of the elements in the array, one at a time, from the beginning of the array (or zero index) to the last elemnt in the array.&lt;/p&gt;

&lt;p&gt;Before you use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; keyboard to create a “for loop”, you need to know how long, or how many items are in the array. You can do this with the following code:&lt;/p&gt;

&lt;div class=&quot;language-js highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;len&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;length&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Once you have the length of the array, you can create a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; loop to iterate through the array:&lt;/p&gt;

&lt;div class=&quot;language-js highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;k&quot;&gt;for&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;i&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;0&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;i&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;&amp;lt;&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;len&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;i&lt;/span&gt;&lt;span class=&quot;o&quot;&gt;++&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
  &lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;item&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;[&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;i&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;];&lt;/span&gt;
  &lt;span class=&quot;c1&quot;&gt;// do something with item from the array&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; loop, in the example above, the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;i&lt;/code&gt; variable will contain the Index of the item in the Array. You can use the Index property of the array to retreive that specific element of the Array by it’s &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;i&lt;/code&gt; Index. Then you can execute your code to do something with that element / value of the Array.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;&lt;strong&gt;Tip:&lt;/strong&gt; The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; loop works in any environment JavaScript code runs. This includes the web browser, client-side, server-side, IoT, and other runtimes!&lt;/p&gt;
&lt;/blockquote&gt;

&lt;h2 id=&quot;for--in-loop-through-elements-in-array&quot;&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for ... in&lt;/code&gt; loop through Elements in Array&lt;/h2&gt;

&lt;p&gt;Rather than inspecting the Array and identifying the length of how many elements exist, you can also use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for ... in&lt;/code&gt; loop to just loop through all element indexes in the Array for you. This enables you to skip the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;.length&lt;/code&gt; call, and even skip incrementing an index counter (such as &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;i++&lt;/code&gt; as in the previous &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; example).&lt;/p&gt;

&lt;p&gt;Here’s an example of looping through the Array using a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; loop without the use of an incrementor:&lt;/p&gt;

&lt;div class=&quot;language-js highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;k&quot;&gt;for&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;index&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;in&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
  &lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;item&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;myArray&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;[&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;index&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;];&lt;/span&gt;
  &lt;span class=&quot;c1&quot;&gt;// do something with item from the array&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;As you can see, this example is relatively similar to the previous &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;for&lt;/code&gt; loop example. The difference is that the JavaScript runtime will increment an indexer value for you, and go through all the element indexes within the array. This enables you to more easily loop through an array without the need to care about how many items are in the array.&lt;/p&gt;

&lt;p&gt;Happy coding!&lt;/p&gt;
</description>
        <pubDate>Wed, 01 Jul 2020 08:36:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2020/07/01/loop-through-javascript-arrays-using-for-forEach-map-functions</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2020/07/01/loop-through-javascript-arrays-using-for-forEach-map-functions</guid>
        
        <category>Tips</category>
        
        <category>JavaScript</category>
        
        <category>js</category>
        
        <category>array</category>
        
        
        <category>JavaScript</category>
        
      </item>
    
      <item>
        <title>JavaScript: Convert String to Number</title>
        <description>&lt;p&gt;There are time when you need to convert a String to a Number in JavaScript. This can be very helpful in many situations, including when taking input from a user and passing that on to a function or object property. This article shows you how to use a short hand with the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;+&lt;/code&gt; operator (the quick and easy way), as well as using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseInt()&lt;/code&gt;, &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseFloat()&lt;/code&gt;, and &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Number()&lt;/code&gt; method for parsing string values into a number. This article also explains how each of these methods of conversion works so you have a better understanding of when the appropriate time is to use each within your own application code.&lt;/p&gt;

&lt;h2 id=&quot;use-the--operator&quot;&gt;Use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;+&lt;/code&gt; operator&lt;/h2&gt;

&lt;p&gt;There exists a short hand in JavaScript for converting string values to numbers. You can use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;+&lt;/code&gt; (plus) operator to do this. Now, let’s walk through a journey of numbers, strings, and finally the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;+&lt;/code&gt; operator of converting strings to numbers in JavaScript!&lt;/p&gt;

&lt;p&gt;The following expression will set a variable equal to the value of 1:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;1&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Now let’s add a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;+&lt;/code&gt; in front of the 1. What do you think will happen?&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt;&lt;span class=&quot;mi&quot;&gt;1&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// sets val1 to 1 as a Number&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Since the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;+&lt;/code&gt; operator is a mathematical operator in JavaScirpt, it will attempt to add what ever is on the left and the right side of the operator. Since, in this case, nothing is to the left, it will add 0 (zero) to what’s on the right of the operator; in this case ‘1’.&lt;/p&gt;

&lt;p&gt;This will result in a Number of the value &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;1&lt;/code&gt;; This works because when you try to add a Number to a String in JavaScript, it will automatically try to parse out the strin g into a number.&lt;/p&gt;

&lt;p&gt;As a result this also works:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;4&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;1&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 5 (Number)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;However, what about when the string is not a number? Well, in this case instead of a parsed number being returned, JavaScript will return a value of &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt; or not a number.&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// return NaN&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;When you are returned a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt; (not a number) result in your variable, if you attempt to add another number to it the result will always be &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt;. So, you’ll always want to check if the result is &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt; before doing something with it.&lt;/p&gt;

&lt;p&gt;To do this, you can use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;isNaN&lt;/code&gt; function in JavaScript to double check the string to number parsing worked successfully:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;k&quot;&gt;if&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nb&quot;&gt;isNaN&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;))&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;0&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 0 (Number)&lt;/span&gt;

&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val2&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;42&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;k&quot;&gt;if&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nb&quot;&gt;isNaN&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;val2&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;))&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;nx&quot;&gt;val2&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;0&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 42 (Number)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;parseint-function&quot;&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseInt()&lt;/code&gt; function&lt;/h2&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseInt()&lt;/code&gt; function in JavaScript can be used to parse a string argument and return an integer of the specified radix (the base in mathematical numeral systems).&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// Parse a simple integer (default of base 10)&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;23&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 23 (Number)&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// Parse a integer in base 16 format&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val2&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;0xF&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;16&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// return 15 (Number)&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// Parse a string that's not a number&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val3&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns NaN&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;What if you don’t want to get a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt; result if the parsing of the integer failed? Well, you can easily check the result with the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;isNaN&lt;/code&gt; function and then handle it accordingly.&lt;/p&gt;

&lt;p&gt;Here’s a sample of how to check if the result returned from the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseInt&lt;/code&gt; function is not a number (NaN):&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;test&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;

&lt;span class=&quot;k&quot;&gt;if&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nb&quot;&gt;isNaN&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;))&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;c1&quot;&gt;// do something here&lt;/span&gt;
    &lt;span class=&quot;c1&quot;&gt;// like set it to 0 instead&lt;/span&gt;
    &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;0&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// returns 0 (Number)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Now what if you want this &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;isNaN&lt;/code&gt; check to be automatic and built into the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseInt&lt;/code&gt; function? Well, you can’t modify the built-in &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseInt&lt;/code&gt; function, but you can write your own function that includes the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;isNaN&lt;/code&gt; check inside it.&lt;/p&gt;

&lt;p&gt;Here’s a helpful method that wraps this up with an &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;isNaN&lt;/code&gt; (is not a number) check:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;parseCleanInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;x&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;base&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;kd&quot;&gt;const&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;parsed&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;x&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;base&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;if&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nb&quot;&gt;isNaN&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;parsed&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;))&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;0&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;parsed&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// Parse a simple integer (default of base 10)&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;parseCleanInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;23&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 23 (Number)&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// Parse a simple integer of base 10&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val2&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;parseCleanInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;23&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;10&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 23 (Number)&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// Parse a integer in base 16 format&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val3&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;parseCleanInt&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;0xF&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;16&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 15 (Number)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;parsefloat-function&quot;&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseFloat()&lt;/code&gt; function&lt;/h2&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;parseFloat()&lt;/code&gt; function can be used to parse a string argument and return a floating point number.&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseFloat&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;3.14&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 3.14 (Floating point number)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;You can even pass in a string that contains non-numeric characters, as long as the string starts with the number you wish to parse:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;parseFloat&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;3.14test&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 3.14 (Floating point number)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Also, like previous methods shown, be sure to use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;isNaN&lt;/code&gt; method to double check the parse compeleted successfully and you didn’t get a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt; (not a number) result.&lt;/p&gt;

&lt;h2 id=&quot;number-constructor&quot;&gt;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Number()&lt;/code&gt; constructor&lt;/h2&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Number()&lt;/code&gt; constructor can be used to parse a string into a number too. This function will determine, based on the string parsed, whether to return an integer or floating point number. Plus, an invalid parse will also return &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;NaN&lt;/code&gt; too.&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val1&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;Number&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;42&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns 42 (Number)&lt;/span&gt;

&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val2&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;Number&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;3.14&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// return 3.14 (Floating point number)&lt;/span&gt;

&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;val3&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nb&quot;&gt;Number&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;3.14test&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// returns NaN&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Number()&lt;/code&gt; constructor is a little different than the other methods shown above. This is a constructor of the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Number&lt;/code&gt; object type in JavaScript, and you’re calling it directly htis way to creat a new object of type Number, and passing the constructor of that object the value to parse.&lt;/p&gt;
</description>
        <pubDate>Mon, 06 Apr 2020 21:00:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2020/04/06/javascript-convert-string-to-number</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2020/04/06/javascript-convert-string-to-number</guid>
        
        <category>JavaScript</category>
        
        <category>String</category>
        
        <category>Number</category>
        
        <category>Convert</category>
        
        
        <category>JavaScript</category>
        
      </item>
    
      <item>
        <title>Encryption and Code are Greater Than Guns and Bombs</title>
        <description>&lt;p&gt;There is a never ending argument in politics around the meaning of the 2nd Amendment to the United States Constitution. This amendment centers around the “Right to bear arms”. The common interpretation is that it grants citizens of the United States of America the right to keep and own weapons that could be used to protect themselves. This comes from an antiquated time of the American Revolution when the original thirteen colonies revolted from and won their independence from Great Britain.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;“A well regulated militia being necessary to the security of a free state, the right of the people to keep and bear arms shall not be infringed.” - &lt;a href=&quot;https://en.wikipedia.org/wiki/Second_Amendment_to_the_United_States_Constitution&quot;&gt;2nd Amendment of the U.S. Constitution&lt;/a&gt;&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;While I agree that “we” as citizens don’t just have the right, but also the responsibility to protect ourselves from an overbearing and unjust government. However, I disagree with the argument that Guns and Bombs are the only way to do so.&lt;/p&gt;

&lt;p&gt;Ever since the invention of the Personal Computer, the Internet, Encryption, and Coding, there has been an increasing democratization of power across the globe, and especially within the United States. These advances in technology have lead a greater change to society than even the invention of the printing press all those years ago.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;“Digital technology has lead to a democratization of power, like the world and human society has never seen before.” - &lt;a href=&quot;https://pietschsoft.com&quot;&gt;Chris Pietschmann&lt;/a&gt;&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;It’s difficult for many to shake the feeling that a physical weapon like guns / firearms are the best weapon to defend themselves. However, we are progressively finding ourselves in a time where these violent weapons will no longer be relavent and as impactful as they once were. Guns may make you feel safe, but that safety is largely an illusion when it come to protecting ourselves in a truly digital age.&lt;/p&gt;

&lt;p&gt;In todays society, we can easly disseminate information (both true and “fake news”) to millions of people with ease. This is true for almost anyone on the planet with access to a computer and the Internet. The need to be able to communicate across the Internet with these technologies is becoming as important a right as the printing press has made books and reading.&lt;/p&gt;

&lt;p&gt;There is a phrase that says “The pen is mightier than the sword”. This is a profound statement in the modern age of our society. It has been true for the last few hundred years, however, with the advancement of digital technology in recent times this statements reference to the “pen” has a broader interpretation  referring to any technology that enables one person to communicate broadly to many other individuals.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;“The pen is mightier than the sword.” - &lt;a href=&quot;https://en.wikipedia.org/wiki/The_pen_is_mightier_than_the_sword&quot;&gt;Edward Bulwer-Lytton in 1839&lt;/a&gt;&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;We find ourselves living in a time when political groups, both foreign and domestic, are able to use the Internet and digital technology to manipulate mass groups of people and impact change without firing a single shot or exploding a single bomb. This has been seen in the affect Russia alegedly had in the 2016 Presidental election the resulted in Donald Trump becoming the President of the United States. And, we will see this type of manipulation and affect become increasingly more common in the future.&lt;/p&gt;

&lt;p&gt;The modern “Right to bear arms” is more about digital technology like Encryption and Code. It’s been important to learn how to read for hundred of years so you can learn and stop being ignorant to the world around you. Learning to use digital technology, and even how to code, is becoming just as important as learning how to read.&lt;/p&gt;

&lt;p&gt;If we let our government take away our right to technology like Encryption, the Internet, and coding, we will be surrendering our modern “right to bear arms”. Without these technologies, we will no longer have the ability to control the news we hear, the things we learn, and ultimately our ability to protect ourselves from those who would like to enslave us for their own personal benefit and agenda.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;“If we let our government take away our right to technology like Encryption, the Internet, and coding, we will be surrendering our modern ‘right to bear arms’.” - Chris Pietschmann&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;I don’t mean that you should sell your guns. If you feel those will help protect you, and you have a right to them, then please be safe and responsible gun owner.&lt;/p&gt;

&lt;p&gt;What I am saying, is we all need to learn how to use these technologies, and learn how to identify ads and other communications that are from those working to manipulate us. And, we MUST always fight against any legislation that might be written to take away our right to encryption, computers, the Internet, our right to communicate, and our right to privacy in a digital-first age.&lt;/p&gt;

&lt;p&gt;You may not understand what Encryption is, or how to code, but you should learn. These technologies empower us just as the printing press did previous generations before us. These technologies protect our rights for the information feed to us, our ability to learn, and our ability to stay safe in a world that is increasingly using cyber-warfare to conquer and enslave us.&lt;/p&gt;

&lt;p&gt;These technologies protect your bank account, your identity, your car, your house, and ultimately your lives and the lives of your family. Be safe, and embrace technology as your “right to bear arms” in this increasingly digital age.&lt;/p&gt;
</description>
        <pubDate>Wed, 11 Mar 2020 10:51:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2020/03/11/encryption-code-greater-than-guns-bombs</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2020/03/11/encryption-code-greater-than-guns-bombs</guid>
        
        <category>Inspiration</category>
        
        <category>future</category>
        
        
        <category>Politics</category>
        
        <category>Life</category>
        
      </item>
    
      <item>
        <title>macOS: Monitor CPU Usage and Frequency Info</title>
        <description>&lt;p&gt;I was recently looking for some tools to be able to view the Intel CPU utilization, frequency, and other information on macOS. In particular, my new Macbook Pro 16” is performing great with it’s Intel Core i9 CPU with 8 cores (and 16 threads), but I’d like to see how well it’s doing for myself. This article includes a listing and summary of the tools I found to do this with.&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;#activity&quot;&gt;Activity Monitor&lt;/a&gt; / &lt;a href=&quot;maccpuid&quot;&gt;Intel MacCPUID&lt;/a&gt; / &lt;a href=&quot;#power&quot;&gt;Intel Power Gadget&lt;/a&gt; / &lt;a href=&quot;#cpusetter&quot;&gt;CPU Setter&lt;/a&gt; / &lt;a href=&quot;#turbo&quot;&gt;Turbo Boost Switcher&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;a id=&quot;activity&quot;&gt;&lt;/a&gt;&lt;/p&gt;
&lt;h2 id=&quot;macos-activity-monitor&quot;&gt;macOS Activity Monitor&lt;/h2&gt;

&lt;p&gt;The &lt;strong&gt;Activity Monitor&lt;/strong&gt; application is built into macOS, and it is pretty much equivalent to the &lt;em&gt;“Performance}”&lt;/em&gt; tab of the &lt;em&gt;“Task Manager”&lt;/em&gt; on Windows. In short it lets you see all the processes running on your machine, the CPU utilization, memory utilization, and a couple other things. With this app, there’s nothing to install and is available on all macOS machines.&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/macos-activity-monitor.jpg&quot; alt=&quot;macOS Activity Monitor screenshot&quot; title=&quot;macOS Activity Monitor screenshot&quot; /&gt;&lt;/p&gt;

&lt;p&gt;You can also click on the &lt;strong&gt;Window&lt;/strong&gt; menu and select options to view the CPU Usage, CPU History, and GPU History in separate windows. This will help give you insights into you current overall CPU utilization.&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/macos-activity-monitor-cpu-gpu-history.jpg&quot; alt=&quot;macOS Activity Monitor CPU &amp;amp; GPU usage screenshot&quot; title=&quot;macOS Activity Monitor CPU &amp;amp; GPU usage screenshot&quot; /&gt;&lt;/p&gt;

&lt;p&gt;&lt;em&gt;The above screenshot shows these 3 windows tiled. You can toggle their view individually and position them where you want.&lt;/em&gt;&lt;/p&gt;

&lt;!-- ad --&gt;

&lt;p&gt;&lt;a id=&quot;maccpuid&quot;&gt;&lt;/a&gt;&lt;/p&gt;
&lt;h2 id=&quot;intel-maccpuid&quot;&gt;Intel MacCPUID&lt;/h2&gt;

&lt;p&gt;MacCPUID is a developer tool used for displaying information collected from the microprocessor via the CPUID instruction. The CPUID instruction returns information in the general purpose registers such as manufacturer identification, a processor’s family, model, and stepping numbers, supported features (e.g. SSE, SSE2), cache information, and many others.&lt;/p&gt;

&lt;p&gt;You can download it from here: &lt;a href=&quot;https://software.intel.com/en-us/download/download-maccpuid&quot;&gt;https://software.intel.com/en-us/download/download-maccpuid&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/intel-maccpuid-macos.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;

&lt;p&gt;In the above screenshot, you can see the &lt;em&gt;CPU Model&lt;/em&gt; of my Macbook Pro 16” as a &lt;em&gt;Intel Core i9-9880H CPU @ 2.30Ghz&lt;/em&gt;. It’s also showing the &lt;em&gt;AMD Radeon Pro 5500M&lt;/em&gt; GPU. Something interesting, is that even though this is an Intel made utility, it can’t determine the CPU Architecture for some reason. While not perfoect (I guess…) this utilizy does help show what CPU and GPU is currently in any macOS machine on the Intel hardware.&lt;/p&gt;

&lt;p&gt;&lt;a id=&quot;power&quot;&gt;&lt;/a&gt;&lt;/p&gt;
&lt;h2 id=&quot;intel-power-gadget&quot;&gt;Intel Power Gadget&lt;/h2&gt;

&lt;p&gt;Intel® Power Gadget is a software-based power usage monitoring tool enabled for Intel® Core™ processors (from 2nd Generation up to 10th Generation Intel® Core™ processors). Intel® Atom™ processors are not supported. It is supported on Windows* and macOS* and includes an application, driver, and libraries to monitor and estimate real-time processor package power information in watts using the energy counters in the processor. With this release, we are providing functionality to evaluate power information on various platforms including notebooks, desktops and servers. Windows 7* and 32-bit versions of the Intel® Power Gadget for Windows* has ceased development from 3.0.7. Starting with version 3.5 and going forward, only the 64-bit version and Windows 8* will be supported.&lt;/p&gt;

&lt;p&gt;You can download it from here: &lt;a href=&quot;https://software.intel.com/en-us/articles/intel-power-gadget&quot;&gt;https://software.intel.com/en-us/articles/intel-power-gadget&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/intel-power-gadget-macos.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;

&lt;p&gt;You can see this utility shows us the Power usage, Clock Frequency, Temperature, and Core Utilization information for the machine. You can also use the &lt;strong&gt;Test&lt;/strong&gt; menu to run tests of hitting the CPU and/or GPU to 100% utilization which is pretty nice to have.&lt;/p&gt;

&lt;p&gt;&lt;a id=&quot;cpusetter&quot;&gt;&lt;/a&gt;&lt;/p&gt;
&lt;h2 id=&quot;cpu-setter&quot;&gt;CPU Setter&lt;/h2&gt;

&lt;p&gt;CPUSetter adjusts the number of active cores in your cpu(s). It can also enable/disable hyperthreading on supported cpus.&lt;/p&gt;

&lt;p&gt;To do this requires administrator access to the machine and a small privileged helper program is installed when you first execute CPUSetter.
A convenient link to the system Activity Monitor is provided so you can observe the impact of changes.
Authentication with your administrator credentials is required to make changes to your system.&lt;/p&gt;

&lt;p&gt;The Processes window allows you to change the priority (nice value) of your processes, and to also limit the maximum CPU usage of any of your processes. You cannot adjust processes that do not belong to you.&lt;/p&gt;

&lt;p&gt;You can download CPU Setter here: &lt;a href=&quot;https://www.whatroute.net/cpusetter.html#download&quot;&gt;https://www.whatroute.net/cpusetter.html#download&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;While the CPU Setter utility is meant to help you control the Intel Hyperthreading feature of the CPU, it also has a really great view of &lt;strong&gt;System Stats&lt;/strong&gt;. This utility that let’s you view additional information about the system that includes: Disk I/O, Wifi, Power usage, and more.&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/cpu-setter.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;

&lt;p&gt;&lt;a id=&quot;turbo&quot;&gt;&lt;/a&gt;&lt;/p&gt;
&lt;h2 id=&quot;turbo-boost-switcher&quot;&gt;Turbo Boost Switcher&lt;/h2&gt;

&lt;p&gt;Turbo Boost Switcher is a utility that let’s you see the CPU tempeture, utilization percentage, and fan speed of you macOS machine. It’s main purpose is to let you disable the &lt;em&gt;Turbo Boost&lt;/em&gt; feature of the Intel CPU in the machine. Disabling this basically prevents the CPU from increasing the clock speed above it’s base under high load, thus resulting in lower power usage and lower fan speed and noise. This can have an affect of increasing battery life with a little compromise in overall performance that is likely generally acceptable. It’s a nice utility to know about.&lt;/p&gt;

&lt;p&gt;You can download Turbo Boost Switcher here: &lt;a href=&quot;http://tbswitcher.rugarciap.com/&quot;&gt;http://tbswitcher.rugarciap.com/&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/turbo-boost-switcher.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;

&lt;p&gt;&lt;em&gt;P.S. At the time of writing this I couldn’t get Turbo Boos Switcher to work on my machine… Dont’ know if it’s a compatibility issue with the app and the Macbook Pro 16” or something else. Could also be an app permissions issue. However, it’s still a neat idea and a utility I recommend you check out.&lt;/em&gt;&lt;/p&gt;

&lt;h2 id=&quot;wrap-up&quot;&gt;Wrap Up&lt;/h2&gt;

&lt;p&gt;To close things off, let’s take a fun look at the Intel Core i9 CPU in this Apple Macbook Pro 16” maxed out to 100% CPU and 100% Integrated GPU. You can see all 16 thread are at 100% utilization, and the Intel Graphics 630 GPU is at 100% utilization as well.&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;/images/posts/2020-02-15-macos-monitor-cpu-usage-info/macbook-pro-16-2019-i9-max-load-cpu-gpu.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;

&lt;p&gt;There are other reviews available online on the overall performance of the Macbook Pro 16”. This wasn’t the purpose of this article, so I’m not discussing the specs and data shown in the screenshots.&lt;/p&gt;

&lt;p&gt;This article is short and to the point. I wanted to show what tools you can use, and a brief look at what they offer. Mostly this is a list for my own reference so I can refer back to it in a year when I forget what tools I used. You can benefit from this being posted here, so it’s discoverable my anyone else, and hopefully somebody else finds this information useful too.&lt;/p&gt;

&lt;p&gt;Thanks!&lt;/p&gt;
</description>
        <pubDate>Sat, 15 Feb 2020 17:00:00 -0600</pubDate>
        <link>http://pietschsoft.com//post/2020/02/15/macos-monitor-cpu-usage-info</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2020/02/15/macos-monitor-cpu-usage-info</guid>
        
        <category>cpu</category>
        
        <category>intel</category>
        
        <category>core i9</category>
        
        
        <category>macOS</category>
        
        <category>Apple</category>
        
      </item>
    
      <item>
        <title>Basics of JavaScript Class Inheritance</title>
        <description>&lt;p&gt;The ECMAScript 2015 definition brought with it the introduction of &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; syntax within the JavaScript language. Previously the only way to do this was with TypeScript or some other language that would transpile down to JavaScript code. With ECMAScript 2015, you can now declare and use classes directly in the JavaScript language itself. Plus, this is a feature that is supported by all the modern web browsers too!&lt;/p&gt;

&lt;p&gt;Previously the way to do Object Oriented Programming (OOP) in JavaScript was to use Prototypal Inheritance. This made use of the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;object.prototype&lt;/code&gt; property to do inheritance in a way that’s different than most other object oriented languages; such as C# or Java. With the addition of being able to define and use Classes in JavaScript, you can now do object oriented programming in JavaScript using the method we’ve all become accustomed to with other OOP languages.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;&lt;strong&gt;Browser Support&lt;/strong&gt;: JavaScript &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; inheritance is supported by all modern web browsers; like Chrome, FireFox, and Safari. However, be aware that older browser versions, and Internet Explorer do not support this.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;h2 id=&quot;define-a-class-in-javascript&quot;&gt;Define a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; in JavaScript&lt;/h2&gt;

&lt;p&gt;A &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; definition in JavaScript is used to define a class with its &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt;, as well as it’s properties and methods. This is done in JavaScript very similarly to how it’s done in other OOP languages; like C# and Java.&lt;/p&gt;

&lt;p&gt;Here is a simple example definition of a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Person&lt;/code&gt; Class:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;class&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Person&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;kd&quot;&gt;constructor&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;firstName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;lastName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

    &lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;firstName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt; &lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;lastName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; keyword is used to define the Class in JavaScript. Then within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Person&lt;/code&gt; class there is a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt; method defines, as well as any other features of the class.&lt;/p&gt;

&lt;p&gt;Notice the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt; method within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; definition. This is a Constructor method that will be executed every time an instance of the class in instantiated. The Constructor can also be defined to accept anywhere from zero to many parameters so that the class can be passed initial state upon instantiation.&lt;/p&gt;

&lt;p&gt;Notice the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;getFullName()&lt;/code&gt; method declaration within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; definition. This is showing an example of how to define a function on the class. This function will later be able to be called on any objects created from the class.&lt;/p&gt;

&lt;p&gt;Within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt; there are two properties on the class being set; the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;firstName&lt;/code&gt; and &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;lastName&lt;/code&gt; properties. Notice these properties have no property definition within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; as would be done in other languages; like C# or Java. The reason there is no property definition is because JavaScript is a Dynamic language. This means that setting a property on the object will in turn create it if it doesn’t exist. You are likely very familiar with this as it’s a core piece of how the JavaScript language works, and you’ve likely seen / done this many times already.&lt;/p&gt;

&lt;h2 id=&quot;instantiate-an-object-from-a-class&quot;&gt;Instantiate an Object from a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt;&lt;/h2&gt;

&lt;p&gt;Now that you have a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; defined within JavaScript, you can use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;new&lt;/code&gt; keyword to easily create a new instance of it.&lt;/p&gt;

&lt;p&gt;Here’s an example of doing this:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;p&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;new&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Person&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Pietschmann&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Notice we are passing in values for the parameters defined on the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt; method of the class.&lt;/p&gt;

&lt;p&gt;After the object has been instantiated from the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt;, you can work with it in the normal fashion you are familiar with other objects and libraries you’ve used in JavaScript:&lt;/p&gt;

&lt;p&gt;Here’s an example of setting a property and calling a method on the object instance:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// set property&lt;/span&gt;
&lt;span class=&quot;nx&quot;&gt;p&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;firstName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Christopher&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// call method&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;fullName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;p&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;();&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;class-inheritance-in-javascript&quot;&gt;Class Inheritance in JavaScript&lt;/h2&gt;

&lt;p&gt;Once you have a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; in JavaScript, you can easily create other classes that inherit from this class. Defining these ‘subclasses’ is done by using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;extends&lt;/code&gt; keyword to tell JavaScript your new &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; is to inherit from a particular base class.&lt;/p&gt;

&lt;p&gt;Here’s an example of a &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; subclass that inherits from &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Person&lt;/code&gt;:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;class&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Teacher&lt;/span&gt; &lt;span class=&quot;kd&quot;&gt;extends&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Person&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;kd&quot;&gt;constructor&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;c1&quot;&gt;// call the base class constructor&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;super&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;

        &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;As you can see, the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;extends&lt;/code&gt; keyword is used to tell JavaScript that the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; class is to inherit from the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Person&lt;/code&gt; class. This means that the constructor, properties and method of the “super” base class are available to the subclass.&lt;/p&gt;

&lt;p&gt;Notice that the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; class implements its own &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt; method. This is so you can instantiate an instance of this class and pass it any necessary parameters / state to start with. Within the subclass Constructor, it first calls the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super()&lt;/code&gt; method. The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super()&lt;/code&gt; method is going to refer to the base class &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt; method. When instantiating a subclass, you need to call the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super()&lt;/code&gt; method and pass it any necessary parameters the base class is expected. This will not only instantiate the object as you’re expecting, but the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super()&lt;/code&gt; method also must be used to properly initialize the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword for the newly-allocated object. By calling &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super()&lt;/code&gt; within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt;, the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword will be setup as a reference to the newly created object. This is not something that is automatically initialized for the class by using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;extends&lt;/code&gt; keyword.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;&lt;strong&gt;Tip&lt;/strong&gt;: By calling &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super()&lt;/code&gt; within the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;constructor&lt;/code&gt;, the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword will be setup as a reference to the newly created object. This is not something that is automatically initialized for the class by using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;extends&lt;/code&gt; keyword.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;This &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; class example is extending the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Person&lt;/code&gt; base class with an additional &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;grade&lt;/code&gt; property. You can call this property, or any other defined methods on the subclass, just as you would properties or methods of the base class.&lt;/p&gt;

&lt;p&gt;Here’s an example of instantiating the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; class and calling its properties and methods:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// instantiate the object&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;t&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;new&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Teacher&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Pietschmann&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Third Grade&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// set properties&lt;/span&gt;
&lt;span class=&quot;nx&quot;&gt;t&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;firstName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Christopher&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;nx&quot;&gt;t&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;Fourth Grade&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// call method from base class&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;fullName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;t&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;();&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;override-base-class-methods-within-subclass&quot;&gt;Override Base Class Methods within Subclass&lt;/h2&gt;

&lt;p&gt;With Object Oriented Programming (OOP) there are times when you need to override the functionality of a base class. You may need to extend, or even replace, the base class functionality. The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; inheritance of JavaScript as defined by ECMAScript 2015 allows this to be done easily, and similarly to how it’s done in other OOP languages; like C# or Java.&lt;/p&gt;

&lt;p&gt;Here’s an example of the above &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; subclass that overrides the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;getFullName&lt;/code&gt; method of the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Person&lt;/code&gt; base class:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;class&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Teacher&lt;/span&gt; &lt;span class=&quot;kd&quot;&gt;extends&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Person&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;kd&quot;&gt;constructor&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;c1&quot;&gt;// call the base class constructor&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;super&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;

        &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

    &lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;firstName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt; &lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;lastName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt; (&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;)&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;As you can see, this override example of the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;getFullName&lt;/code&gt; method, is completely replacing it with a new method definition. When the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;getFullName&lt;/code&gt; method is called on the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;Teacher&lt;/code&gt; objects, this definition will be executed, and the base class definition will no longer be executed.&lt;/p&gt;

&lt;h2 id=&quot;extend-base-class-methods-within-subclass&quot;&gt;Extend Base Class Methods within Subclass&lt;/h2&gt;

&lt;p&gt;There are times when the base class method provide functionality that’s close to what you need in the base class, or maybe it provides a useful function for the base class. At these times, it’s useful to be able to call the base class method from the subclass while still overriding / replacing the base class method with the same name.&lt;/p&gt;

&lt;p&gt;To do this you can call the base class method using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super&lt;/code&gt; keyword within the subclass method. Here’s an example, similar to the previous one, that overrides the base class &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;getFullName&lt;/code&gt; method while calling the base class method as well:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;class&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Teacher&lt;/span&gt; &lt;span class=&quot;kd&quot;&gt;extends&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;Person&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;kd&quot;&gt;constructor&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;c1&quot;&gt;// call the base class constructor&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;super&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;first&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;last&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;

        &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

    &lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;super&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt; (&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;grade&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;s1&quot;&gt;)&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;'&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;As you can see, by calling the base class method as made available through the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;super&lt;/code&gt; keyword within the subclass method, you can both override the base class method and utilize its functionality at the same time.&lt;/p&gt;

&lt;h2 id=&quot;wrap-up&quot;&gt;Wrap Up&lt;/h2&gt;

&lt;p&gt;The Prototypal Inheritance of JavaScript was a little complex to get used to when coming from a greater familiarity with the Class Inheritance used in other popular Object Oriented Programming (OOP) languages; like C# or Java. The addition of Class Inheritance (via the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; and &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;extends&lt;/code&gt; keywords) in JavaScript brings with it a more familiar approach to instantiating objects and setting up subclass inheritance. Also, with this feature being supported by all of the modern browsers, there’s no reason you couldn’t start using &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; inheritance today within your JavaScript projects. Although, keep in mind that existing code bases likely will still use &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;prototype&lt;/code&gt; inheritance for some time, so having a basic familiarity with Prototypal Inheritance may still be useful.&lt;/p&gt;

&lt;p&gt;&lt;em&gt;P.S. The basics of JavaScript class inheritance outlined in this article should get you going with these features nicely. But, keep in mind there are also additional features of JavaScript classes like Getters and Setters that can be used with &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;class&lt;/code&gt; inheritance too.&lt;/em&gt;&lt;/p&gt;
</description>
        <pubDate>Thu, 02 Jan 2020 16:18:00 -0600</pubDate>
        <link>http://pietschsoft.com//post/2020/01/02/basics-javascript-class-inheritance</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2020/01/02/basics-javascript-class-inheritance</guid>
        
        <category>js</category>
        
        <category>JavaScript</category>
        
        <category>Tips</category>
        
        <category>object</category>
        
        <category>inheritance</category>
        
        <category>class</category>
        
        
        <category>JavaScript</category>
        
      </item>
    
      <item>
        <title>The Technology is NOT Important</title>
        <description>&lt;p&gt;The technology used to build a product or service offering really is not that important. Earlier in my entrepreneur journey I didn’t really understand this. It’s far too easy to get wrapped up in the latest, coolest, hottest technologies. The keys to business and successful products really have almost nothing to do with the technology. The true keys to success are the results the product or service offerings provide. I’m talking about the benefits to the people that use it, and their customers they serve.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;The technology used to build a product or service offering really is not that important.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;I’ve discussed how &lt;a href=&quot;https://pietschsoft.com/post/2016/09/09/software-is-written-for-people&quot;&gt;Software is written FOR PEOPLE&lt;/a&gt;. You need to keep this in mind. Without people, there would be no software; no technology. When building a product or service you need to look past the technologies you’re using and focus on the value you are providing your customers.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;When building a product or service you need to look past the technologies you’re using and focus on the value you are providing your customers.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;h2 id=&quot;carto-llc-crm--gis-saas-service-startup-example&quot;&gt;Carto LLC (CRM + GIS SaaS Service) Startup Example&lt;/h2&gt;

&lt;p&gt;Back in 2009, I found a startup, Carto LLC, building a Software-as-a-Service (SaaS) product offering that was a CRM (Customer Relationship Manager) with heavy GIS, Location, and Map integration. First, I built the solution with technologies I know; which were ASP.NET, C#, JavaScript, and Windows Server with IIS.&lt;/p&gt;

&lt;p&gt;I also immediately started gravitating towards shiny, new technologies because they were cool. One technology that I should not have invested in was Silverlight. I built some amazing CRM + GIS visualizations with Silverlight that never ended up being released. There were issues of getting client machines to have Silverlight installed with our Enterprise customer base, and then the issue of Microsoft eventually killing Silverlight altogether. This waste of time would have been much better spent just adding more value to the service for our customers; rather than playing with the new shiny thing.&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;This waste of time would have been much better spent just adding more value to the service for our customers; rather than playing with the new shiny thing.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;Another technology I started gravitating towards was Microsoft Windows Azure (now called Microsoft Azure). This was a new, shiny technology that wasn’t a mistake to spend time on. We actually got immediate benefit by using Microsoft Azure as our hosting platform. The benefits were cheaper and more reliable hosting. Which did add tons of business value to our service that was experienced directly by out customers.&lt;/p&gt;

&lt;h2 id=&quot;build5ninescom-hosting-example&quot;&gt;Build5Nines.com Hosting Example&lt;/h2&gt;

&lt;p&gt;More recently, when I started &lt;a href=&quot;https://build5nines.com&quot;&gt;Build5Nines.com&lt;/a&gt; (formerly BuildAzure.com) back in 2015, I decided to use Wordpress.com for hosting. Sure, Wordpress isn’t that cool from a technology perspective. However, Wordpress is reliable, with a huge developer ecosystem of plugins and themes. Plus, with Wordpress.com you don’t need to host or manage anything yourself. You pay Wordpress.com a monthly fee to host your website, and it just works. This leaves you more time to write content and work on your business; rather than investing in server / hosting management. Even though I blog all about Microsoft and related Enterprise technologies, the use of Wordpress.com hosting has allowed me to provide more value to my readers than if I hosted it myself using Microsoft Azure virtual machines or some other method.&lt;/p&gt;

&lt;h2 id=&quot;wrap-up&quot;&gt;Wrap up&lt;/h2&gt;

&lt;p&gt;I have a few other examples of how I could have focused on business value instead of shiny, new technology for my business ventures over the years.&lt;/p&gt;

&lt;p&gt;I’ve been in the industry long enough to have learned that the technology is not important. You can use almost any technology to build a product or service offering. The most important factor is the business value you provide to your customers, and the impact that resonates to help your business and their’s be more productive and profitable.&lt;/p&gt;

&lt;p&gt;Also, if you pay attention to most of the latest trends in technology, they are just regurgitating the same ideas from 10 years, 20 years, or more ago. The new technologies / tools just give things a fresh face, but they provide the same things in many cases.&lt;/p&gt;

&lt;p&gt;If you build a web application with Angular or jQuery, it doesn’t matter. If the server-side code is Ruby on Rails, ASP.NET, or Node.js; guess what? It doesn’t matter! The only thing that matters is the business impact and value you provide. You could even have certain task be a manual process at first, so long as it provides enough business value for you to focus on adding value to your customers (although please automate that too if possible and when it provides you business value to do so).&lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;&lt;a href=&quot;https://pietschsoft.com/post/2013/07/27/work-smart-not-hard&quot;&gt;Work Smart, Not Hard&lt;/a&gt;, to make the choices that will maximize business value for you, and your customers, instead of wasting time and money on shiny things just because they are shiny.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;Don’t be discouraged! Create a product. Build a service. Go start a business! &lt;a href=&quot;https://pietschsoft.com/post/2013/07/27/work-smart-not-hard&quot;&gt;Work Smart, Not Hard&lt;/a&gt;, to make the choices that will maximize business value for you, and your customers, instead of wasting time and money on shiny things just because they are shiny. Pick the technologies that will benefit you and your customers first, and leave the rest that don’t offer you the same value add.&lt;/p&gt;
</description>
        <pubDate>Tue, 12 Nov 2019 09:51:00 -0600</pubDate>
        <link>http://pietschsoft.com//post/2019/11/12/the-technology-is-not-important</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2019/11/12/the-technology-is-not-important</guid>
        
        <category>Inspiration</category>
        
        
        <category>Technology</category>
        
        <category>Entrepreneur</category>
        
      </item>
    
      <item>
        <title>Call Functions in JavaScript</title>
        <description>&lt;p&gt;One of the fundamental tasks with JavaScript is how to write and call functions in your code. This may seem like a simple thing, and it essentially is, however there are a few tips and tricks you can use to help making your use of JavaScript Functions easier and more intuitive. This article takes you through the basics of calling functions in your code, and some more advanced tips and tricks to writing better JavaScript functions that can help take your JavaScript coding to the next level.&lt;/p&gt;

&lt;h2 id=&quot;how-to-call-a-function-in-javascript&quot;&gt;How to call a function in JavaScript&lt;/h2&gt;

&lt;p&gt;Calling a function (aka method) in JavaScript is similar to any other programming language that uses a C-like syntax. Simply call the function by name, then pass in any required parameters in a comma delimited list enclosed in parenthesis.&lt;/p&gt;

&lt;p&gt;To put this in a great example that can be easily visualized, let’s take the following &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;sayHello&lt;/code&gt; function that accepts a parameter named &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;name&lt;/code&gt; of type string:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;sayHello&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;name&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;c1&quot;&gt;// implementation code here&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;To call this function, you simply call it directly by name, then pass in the parameter value:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;nx&quot;&gt;sayHello&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Now, if you have a function you need to call that doesn’t have any parameters, you can call it similarly. A function without any parameters can be called by omitting any parameters, and call it the same way:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;nx&quot;&gt;sayHello&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;();&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;If the function accepts multiple parameters, then you can call it similarly with all the parameter values as a comma delimited list:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;nx&quot;&gt;sayHello&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Pietschmann&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;42&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;This previous example accepts three parameters. The first two are string values, while the third parameter accepts a number.&lt;/p&gt;

&lt;!-- ad --&gt;

&lt;h2 id=&quot;call-a-javascript-function-with-return-value&quot;&gt;Call a JavaScript function with return value&lt;/h2&gt;

&lt;p&gt;While parameters are used to pass one or more values into a JavaScript function, you can use a return value to pass a value out of the function as well. The function can use the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;return&lt;/code&gt; statement to exit and pass some value back to the caller when it’s completed execution.&lt;/p&gt;

&lt;p&gt;Here’s an example of a JavaScript function with a return value:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;a&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;b&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;c1&quot;&gt;// simple example that multiplies two numbers&lt;/span&gt;
    &lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;c&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;a&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;*&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;b&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;c&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;This function can be called using the same method as any other function. By just calling it the same way, you will simply ignore the return value, and move on.&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// call function and ignore return value&lt;/span&gt;
&lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;mi&quot;&gt;6&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;7&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;If you need to capture the return value from the function, then you can assign it’s result to a variable. The variable will then contain the value returned from the function after execution.&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;c&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;mi&quot;&gt;6&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;7&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Once the return value has been captured into a variable, that variable can then be used like any other variable. You can consume it’s value directly in this code for something, or even pass it as a parameter to another function.&lt;/p&gt;

&lt;p&gt;If the return value of a function is only going to be used as an input parameter of another function, you can pass the return value directly to the function parameter. This is done by putting the function call in the parameters list of the other function call, just like you would a variable.&lt;/p&gt;

&lt;p&gt;Here’s an example of passing a variable as a parameter to a function call, and another that passes the return value of a function directly to the parameters of another function:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// pass return value as parameter to another function call&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;c&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;mi&quot;&gt;6&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;7&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;d&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;c&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;8&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// pass return value directly as parameter to another function call&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;d&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;mi&quot;&gt;6&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;7&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;),&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;8&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// here's the same broken out to multiple lines for readability&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;d&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;
    &lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;mi&quot;&gt;6&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;7&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;),&lt;/span&gt;
    &lt;span class=&quot;mi&quot;&gt;9&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;passing-functions-as-parameters&quot;&gt;Passing Functions as Parameters&lt;/h2&gt;

&lt;p&gt;JavaScript is a functional programming language. This means that functions are variables too. As a result, you can pass functions around as parameters to other functions too. This offers some great flexibility benefits for code reuse, recursion, and other functional programming benefits.&lt;/p&gt;

&lt;p&gt;Here’s an example of passing a function as a parameter to another function that builds on the above &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;multiply(a,b)&lt;/code&gt; function examples:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// function that accepts a function as an input parameter&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;doMath&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;operation&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;a&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;b&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;c1&quot;&gt;// call the parameter function&lt;/span&gt;
    &lt;span class=&quot;c1&quot;&gt;// and return the result&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;operation&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;a&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;b&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// let's call this function&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;c&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;doMath&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;multiply&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;6&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;7&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;javascript-object-methods&quot;&gt;JavaScript Object Methods&lt;/h2&gt;

&lt;p&gt;Getting a little more object oriented (full JavaScript OOP is discussion for another article), you can have a JavaScript object with it’s own properties and methods. These methods are functions too. The reside on the object, and when called directly have access to the object using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword. The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword can be used to reference the object and it’s properties.&lt;/p&gt;

&lt;p&gt;Here’s an example of defining a JavaScript object that has some properties and methods:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;c1&quot;&gt;// object definition&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;author&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;na&quot;&gt;firstName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;:&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt;
    &lt;span class=&quot;na&quot;&gt;lastName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;:&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Pietschmann&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt;
    &lt;span class=&quot;na&quot;&gt;favoriteNumber&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;:&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;2063&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt;

    &lt;span class=&quot;na&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;:&lt;/span&gt; &lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;firstName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt; &lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;lastName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;};&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// call the getFullName method on the object&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;fullName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;author&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;();&lt;/span&gt;
&lt;span class=&quot;c1&quot;&gt;// return value is &quot;Chris Pietschmann&quot;&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;invoke-javascript-functions-using-the-call-method&quot;&gt;Invoke JavaScript Functions using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;call()&lt;/code&gt; method&lt;/h2&gt;

&lt;p&gt;If you have a JavaScript object that has it’s own properties and methods, you can call also call those methods using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;call()&lt;/code&gt; method. The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;call()&lt;/code&gt; method enables you to call a function by passing in the context for the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword within the function, and any required parameters. This enables you to scope the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword for the method to reference the object.&lt;/p&gt;

&lt;p&gt;Here’s an example of using the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;call()&lt;/code&gt; method to call the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;getFullName&lt;/code&gt; method of the above &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;author&lt;/code&gt; object:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;fullName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;author&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;call&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;author&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Here’s an example of defining a new function that doesn’t exist as a method of the object, then calling it with the context of the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; keyword to the object.&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;doubleFavoriteNumber&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;favoriteNumber&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;*&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;2&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;a&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;doubleFavoriteNumber&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;call&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;author&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;The &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;call()&lt;/code&gt; method accepts the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;this&lt;/code&gt; context to call the method with, in addition to any parameters needed for that function. You can pass these parameters to the function by appending these parameter values to the parameters list sent to the &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;call()&lt;/code&gt; method.&lt;/p&gt;

&lt;p&gt;Here’s another example that accepts a parameter value:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;doubleFavoriteNumber&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;n&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;k&quot;&gt;this&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;favoriteNumber&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;*&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;n&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;a&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;doubleFavoriteNumber&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;.&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;call&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;author&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;mi&quot;&gt;2&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;function-as-return-value-of-function&quot;&gt;Function as Return Value of Function&lt;/h2&gt;

&lt;p&gt;This may sound confusing at first. A JavaScript function can be passed as a return value from another function. This can lead to some more advanced scenarios, and is useful to know is possible. Especially if you’re consuming a JavaScript library or NPM package that has methods / functions that return functions as a result to be consumed later.&lt;/p&gt;

&lt;p&gt;Here’s an example of a function definition that returns a function as the return value from the function itself:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;nx&quot;&gt;fName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;lName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;)&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
    &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;kd&quot;&gt;function&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;()&lt;/span&gt; &lt;span class=&quot;p&quot;&gt;{&lt;/span&gt;
        &lt;span class=&quot;k&quot;&gt;return&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;fName&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt; &lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;+&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;lName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;;&lt;/span&gt;
    &lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;
&lt;span class=&quot;p&quot;&gt;}&lt;/span&gt;

&lt;span class=&quot;c1&quot;&gt;// call the function&lt;/span&gt;
&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;func&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;getFullName&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;(&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Chris&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;,&lt;/span&gt; &lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;s2&quot;&gt;Pietschmann&lt;/span&gt;&lt;span class=&quot;dl&quot;&gt;&quot;&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;);&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;p&gt;Now calling this function will return a function, not any other type of value. The previous example doesn’t return &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;&quot;Chris Pietschmann&quot;&lt;/code&gt;, but rather a function can when called will return that. You can then call this function when needed to generate that value;&lt;/p&gt;

&lt;p&gt;Now, let’s call the function that was returned from the other function to get the final result returned:&lt;/p&gt;

&lt;div class=&quot;language-javascript highlighter-rouge&quot;&gt;&lt;div class=&quot;highlight&quot;&gt;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&lt;span class=&quot;kd&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;fullname&lt;/span&gt; &lt;span class=&quot;o&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;nx&quot;&gt;func&lt;/span&gt;&lt;span class=&quot;p&quot;&gt;();&lt;/span&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;&lt;/div&gt;

&lt;h2 id=&quot;conclusion&quot;&gt;Conclusion&lt;/h2&gt;

&lt;p&gt;Calling JavaScript functions is simple at first, but you can see there are a number of functional programming techniques that can be used. When you better understand that a JavaScript Function is an object, similar to strings and numbers, then you have the knowledge to write better JavaScript code.&lt;/p&gt;

&lt;p&gt;Obviously these techniques help if you’re writing a new JavaScript libarary, framework, or NPM package. However, knowing these techniques will also help you to better consume other libraries, frameworks, and NPM packages in your own code.&lt;/p&gt;

&lt;p&gt;Happy scripting!&lt;/p&gt;
</description>
        <pubDate>Wed, 24 Jul 2019 10:21:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2019/07/24/call-functions-in-javascript</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2019/07/24/call-functions-in-javascript</guid>
        
        <category>Tips</category>
        
        <category>JavaScript</category>
        
        <category>js</category>
        
        <category>functions</category>
        
        
        <category>JavaScript</category>
        
      </item>
    
      <item>
        <title>Top 13 Blogging Tips for a Successful Website</title>
        <description>&lt;p&gt;I’ve been blogging for about 15 years or so now, and I have a few tips and tricks that can help craft great articles, grow your blog, and get tons of traffic. Back in 2006 &lt;a href=&quot;/post/2006/09/22/building-a-successful-blog&quot;&gt;I shared a few tips for building a ‘successful’ blog&lt;/a&gt;. That was just 2 years into my journey of blogging, and I’ve learned a bit more during that time.&lt;/p&gt;

&lt;p&gt;Keep in mind that these tips and tricks are not in any particular order. Some may be more valuable than others, but I definitely recommend that you follow all of them if you are to build a successful blog / website.&lt;/p&gt;

&lt;h2 id=&quot;1-keep-on-writing&quot;&gt;1) Keep on writing&lt;/h2&gt;

&lt;p&gt;The most important thing when first starting a blog is to write, and keep on writing. After all, a blog with no articles is a glorified &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;404 Not Found&lt;/code&gt; page. Even after the blog is established, if you don’t keep writing the traffic flow will eventually slow down and possibly die off. You need to keep writing content to keep the site flourishing and growing.&lt;/p&gt;

&lt;h2 id=&quot;2-its-ok-to-edit-older-posts&quot;&gt;2) It’s OK to edit older posts&lt;/h2&gt;

&lt;p&gt;Blogs will tag a post with the date it was first published. This can often make people afraid to edit their posts, as if it’s frozen in time and something that’s not allowed. Don’t worry about this! It’s OK, to edit older posts, and I would often encourage it.&lt;/p&gt;

&lt;p&gt;Just imagine you have an older post that has become slightly outdated, or isn’t getting the amount of traffic (page views and visitors) that it used to. If you go back and edit the post to update it, and optimize the title or other content to better suite the topic and modern audiences needs, you can give some life back to older posts.&lt;/p&gt;

&lt;p&gt;&lt;em&gt;“Keep on writing”&lt;/em&gt; doesn’t have to mean only writing new blog posts. It can be editing older ones to make them better too.&lt;/p&gt;

&lt;h2 id=&quot;3-use-a-custom-domain-name&quot;&gt;3) Use a Custom Domain Name&lt;/h2&gt;

&lt;p&gt;It’s important that you go buy a Domain Name for your blog. You don’t want to host your website on a subdomain (such as mysite.wordpress.com). Do so will give the hosting provider full control over the future of your website. What if you want to change hosting providers? What if the hosting provider goes out of business? These things will happen eventually, given enough time.&lt;/p&gt;

&lt;p&gt;A custom domain name will help you give a domain name to your blog that adds value and tells visitors what the blog is about. Take &lt;a href=&quot;https://BuildAzure.com&quot;&gt;https://BuildAzure.com&lt;/a&gt; for example. “BuildAzure.com” conveys an important message that the blog is about “Azure” and “building”. If it were “buildazure.wordpress.com” then an added message of “it’s another wordpress site” would be added to the mix. This would detract away from the overall branding message conveyed to visitors, and may hurt the website.&lt;/p&gt;

&lt;p&gt;There are also SEO (Search Engine Optimization) benefits of a custom domain as well. All pages at a domain (including it’s subdomains) will contribute to the Page Rank of that site in Google and other search engines. With it hosted at *.wordpress.com it loses some of this. With a custom domain you are funneling all your SEO of your posts together in a more targeted way.&lt;/p&gt;

&lt;div data-type=&quot;ad&quot; data-publisher=&quot;lqm.pietschsoft.site&quot; data-format=&quot;300x250&quot; data-zone=&quot;ros&quot;&gt;&lt;/div&gt;

&lt;h2 id=&quot;4-dont-waste-time-designing-the-perfect-theme-at-first&quot;&gt;4) Don’t waste time designing the perfect theme; at first&lt;/h2&gt;

&lt;p&gt;It can be easy to be swept up in choosing the best Wordpress theme, customizing the CSS styles, and installing all the greatest Wordpress plugins. Do not let yourself get all wrapped up in this. Sure, it’s important to have a nice looking website, but try to be a minimalist with this (especially at first) so you can spend more time writing the content that will get visitors and page views. Be sure to spend your time on things that will add value to your blog.&lt;/p&gt;

&lt;h2 id=&quot;5-dont-monetize-with-banner-ads-ala-adsense-until-traffic-is-flowing&quot;&gt;5) Don’t monetize with banner ads (ala Adsense) until traffic is flowing&lt;/h2&gt;

&lt;p&gt;When getting started, or even after some time, you may not get very much traffic (page views and visitors). Every blog starts out at zero and slowly grows over time. Do not let this discourage you from keeping on writing, as the visitors will eventually come. Also, don’t let the dream of making tons of money from your blog blind you to what really matters. Visitors are there to read your content, so keep on writing and giving it to them. You don’t need to add banner ads to your site until your getting roughly 50,000+ page views per month. Before that time you don’t have enough traffic to really make any money, and the banners will detract away from the appeal of your content to your visitors.&lt;/p&gt;

&lt;p&gt;FYI, evan at 50,000+ page views per month you may only make about $100 - $200 per month from Google Adsense, Wordpress Ads, other types of banner ads on your website. Sure it’ll be nice to pay for your hosting costs and possibly a lunch or two, but you won’t be making tons of money yet.&lt;/p&gt;

&lt;h2 id=&quot;6-keep-post-titles-relatively-short-and-include-keywords&quot;&gt;6) Keep post titles relatively short and include keywords&lt;/h2&gt;

&lt;p&gt;You don’t want the titles of our posts to be too long. Generally, it’s best practice to keep your post titles shorter than 70 characters. It’s also important to include the search keywords that are most relevant to the article within the title as well. This will help SEO (Search Engine Optimization) of you blog to get your posts ranking higher and showing up closer to the top of search engine results. There’s no guarantee to be the number 1 search result, but hopefully you can get within the top 2 or 3 pages and this will help increase your traffic.&lt;/p&gt;

&lt;p&gt;Remember it’s ok to go back and edit the posts title over time to better optimize it. Just be sure not to break the URL for the post in the process.&lt;/p&gt;

&lt;h2 id=&quot;7-monetization-through-affiliate-links&quot;&gt;7) Monetization through Affiliate links&lt;/h2&gt;

&lt;p&gt;Sure, banner ads can help make money on your blog, but the amount of money will be limited. At the same time the banner ads are monetizing your blog, you can also place Affiliate links in your content. I don’t mean making your own banner ads that link to affiliate offers; although you could do this. What I mean is making text links within your content where it’s relevant to affiliate offers.&lt;/p&gt;

&lt;p&gt;An easy affiliate program to get into is the Amazon Affiliates program. This enables you to place links within your content that link to Amazon products or pages with your affiliate code in the URL. The affiliate code is then saved as a cookie on the visitors machine and if they purchase anything from Amazon with that cookie in place you will get a referral bonus. It’s not much, but it can help add another $10 - $20 or more on top of your banner ad revenue with your 50,000+ page view per month blog.&lt;/p&gt;

&lt;h2 id=&quot;8-use-post-name-urls-without-the-date&quot;&gt;8) Use &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;/post-name&lt;/code&gt; URLs without the date&lt;/h2&gt;

&lt;p&gt;When blogging it’s common practice to have the URL of a post be in a format that includes the date the post was published. Here’s an example of a common URL format: &lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;/2019/07/07/top-wordpress-blogging-tips&lt;/code&gt;. However, this really stamps the post with the date. If you remove the date from the post URL it makes the content a little more versatile and longer lived.&lt;/p&gt;

&lt;p&gt;When people go to a website to read an article, they will see the date it was published. If it was published what they consider to be a &lt;em&gt;“long”&lt;/em&gt; time ago, they may not read it and close the browser.&lt;/p&gt;

&lt;p&gt;Also, if you remove the date from the post URL, you are then free to edit that post pretty much anyway you want over time. You can even change the publish date of the post, in affect republishing the content as new again; just be sure to no change the URL as any links to that post will be broken if you do. This can help freshen up old, stale content to get new views again. Although be sure to update the post with current and relevant information before republishing.&lt;/p&gt;

&lt;h2 id=&quot;9-post-at-a-regular-schedule&quot;&gt;9) Post at a regular schedule&lt;/h2&gt;

&lt;p&gt;It’s ok if you keep writing content and have spurts where you write 3 posts in a weekend. Just be sure to schedule those posts out to be published on the blog over the next few days or even weeks. More content is always great, but consistency of posting is important. It will be more desirable for subscribers to the blog to get notified of new content every few days or weeks, rather than a single notification once a month or so.&lt;/p&gt;

&lt;p&gt;Also, when new visitors are looking at your blog, they’ll be encouraged to subscribe or follow your blog if you have a post archive that shows evidence that you publish new posts on a regular basis. This let’s them know what to expect. If they see 3 posts or more published on a single day, they may think “Whoah this person posts way too often for me to read!” And, if they see only 1 post every 6 months, they may be disinterested due to the lack of recent and new content.&lt;/p&gt;

&lt;h2 id=&quot;10-find-a-niche-and-stick-to-it&quot;&gt;10) Find a niche and stick to it&lt;/h2&gt;

&lt;p&gt;It’s important that you find a niche, or topic area to blog about. Also, you’ll want to stick to writing posts in that niche. People don’t really want to subscribe to a blog that posts on random, unrelated topics. Also, it can help SEO when multiple articles are related as Google will get an idea what your site is about as your building up trust and expertise in your specific niche.&lt;/p&gt;

&lt;h2 id=&quot;11-add-links-between-your-posts&quot;&gt;11) Add links between your posts&lt;/h2&gt;

&lt;p&gt;As you write content, be sure to add links where relevant to other posts on your blog. This helps you add value to a post by connecting it with other content on the blog. It can also help increase your page view count by keeping visitors on your site for longer periods of time. This also helps give the search engines a view into what other content on your site is related to a specific article and help spread page rank points around your site making all the posts rank higher in search engines.&lt;/p&gt;

&lt;p&gt;As an example of this is what I did at the top of this post where I linked to a post I wrote in 2006 listing &lt;a href=&quot;/post/2006/09/22/building-a-successful-blog&quot;&gt;a few tips for building a ‘successful blog&lt;/a&gt;.&lt;/p&gt;

&lt;h2 id=&quot;12-share-share-share&quot;&gt;12) Share! Share! Share!&lt;/h2&gt;

&lt;p&gt;Don’t be afraid to share you posts with others in your circle on influence. This means posting links to your blog on Twitter, LinkedIn, Facebook, or any other social network you use. It’s perfectly acceptable to promote your own content by telling people what you wrote. Also, be sure to add hashtags to your social media posts so they are easily discoverable by others outside your circle when they are viewing related postings on those hashtags.&lt;/p&gt;

&lt;p&gt;It’s ok to promote yourself and share your content. If you don’t do it, not many will, especially when you’re first starting your blog. Plus, it can help jump start your blog traffic (page views and visitors) to get people reading your content and possibly sharing links to it themselves.&lt;/p&gt;

&lt;p&gt;Something I do myself, is I use a social media sharing service called Buffer to schedule out Tweets and other social shares. This let’s me build up a tweet queue that will automatically post on a schedule without requireing me to constantly be tweeting directly.&lt;/p&gt;

&lt;h2 id=&quot;13-technology-doesnt-matter&quot;&gt;13) Technology doesn’t matter&lt;/h2&gt;

&lt;p&gt;It can be easy to get swept up in the details and cool-ness of hosting your blog with the latest software or platform everyone else is talking about. However, you should pick the technology and platform that will give you the most efficient path towards writing and posting content. Don’t worry about hosting it yourself, managing servers, or other tasks that may give you “tech street cred” to your friends. If your site isn’t running then you’re spending time managing it rather than writing and posting content. The most important things with a blog is that it’s able to server your content to your visitors and allows you to easily publish new content.&lt;/p&gt;

&lt;p&gt;As a technology professional myself, I know what’s it’s like to get wrapped up in the latest trend of hosting your blog. In the early days of Pietschsoft.com I built my own blog software (which may have made sense in the early days of blogging in 2004…), then I used the “cool” BlogEngine.NET with a hosting provider to host my blog for a long time. Today, Pietschsoft.com is hosted using Jekyll and GitHub Pages because of it’s simplicity.&lt;/p&gt;

&lt;p&gt;Currently, I host BuildAzure.com using Wordpress.com. Yes, I’m a technology professional. Yes, I work with and blog alot about Microsoft Azure. However, if I were to host my blog myself using Microsoft Azure virtual machines or some other service, then I wouldn’t have as much time to write and publish content. I choose to use Wordpress.com because it’s a service I can “just use” and not have to worry about or spend time managing.&lt;/p&gt;

&lt;p&gt;It’s really the “build vs buy” debate with technology. It’s ok to purchase a solution that provides you with the value your looking for. Building and managing things yourself can be costly, and you need to choose what is more valuable to you. Is it build / managing the blog software, or is it actually blogging?&lt;/p&gt;
</description>
        <pubDate>Sun, 07 Jul 2019 11:28:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2019/07/07/top-13-blogging-tips-for-sucessful-website</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2019/07/07/top-13-blogging-tips-for-sucessful-website</guid>
        
        <category>Wordpress</category>
        
        <category>Blog</category>
        
        <category>Tips</category>
        
        
        <category>Entrepreneur</category>
        
        <category>Blogging</category>
        
      </item>
    
      <item>
        <title>Chris Pietschmann Awarded 2019 Microsoft MVP Award</title>
        <description>&lt;p&gt;Hi! I don’t blog on this site much anymore, but I though I’d post about getting awarded the Microsoft MVP award this year. This marks the 8th time I’ve been awarded Microsoft MVP in the last 12 years. It’s always humbling and exciting to be recognized by Microsoft for everything I do in the community. My contributions include activities in both online and offline outlets.&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;https://i0.wp.com/buildazure.com/wp-content/uploads/2015/06/mvp_logo_horizontal_preferred_cyan300_rgb_300ppi.png?zoom=2&amp;amp;resize=125%2C50&amp;amp;ssl=1&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;

&lt;p&gt;My online contributions mostly consist of activities surrounding &lt;a href=&quot;https://buildazure.com&quot;&gt;BuildAzure.com&lt;/a&gt;. I’ve been blogging over there almost exclusively for the last 4 years now, and I’ve built up a pretty large list of content around Microsoft Azure and related technologies over there. I recommend you click on over and check it out. Additionally, I do participate in online forums, StackOverflow, Twitter, and other ways online as well.&lt;/p&gt;

&lt;p&gt;My offline contributions include both user group and conference presenting. I was a founder of the &lt;a href=&quot;http://mkeazure.com&quot;&gt;Milwaukee Azure&lt;/a&gt; meetup group back in 2016, organized two Global Azure Bootcamp events in Milwaukee, Wisconsin over the years, and helped out staffing multiple events throughout the years. I’ve also presented at a few meetup groups and conferences as well. One I’d like to call out in particular is &lt;a href=&quot;http://thatconference.com&quot;&gt;That Conference&lt;/a&gt;. I really enjoy both attending and presenting at That Conference, and will be presenting this year again.&lt;/p&gt;

&lt;p&gt;If you’d like to read more about what the Microsoft MVP program is, and how someone gets awarded Microsoft MVP, then I recommend you check out my article “&lt;a href=&quot;https://buildazure.com/2018/02/20/how-to-become-a-microsoft-mvp/&quot;&gt;How to become a Microsoft MVP&lt;/a&gt;”.&lt;/p&gt;

&lt;p&gt;Thanks for the kudos! And, I look forward to blogging, presenting, and sharing more throughout the next year!&lt;/p&gt;
</description>
        <pubDate>Mon, 01 Jul 2019 02:50:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2019/07/01/Chris-Pietschmann-Awarded-2019-Microsoft-MVP-Award</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2019/07/01/Chris-Pietschmann-Awarded-2019-Microsoft-MVP-Award</guid>
        
        <category>Azure</category>
        
        
        <category>Microsoft MVP</category>
        
        <category>Azure</category>
        
      </item>
    
      <item>
        <title>(Cross Post) Chris Pietschmann Awarded 2018 Microsoft MVP Award</title>
        <description>&lt;!-- more --&gt;
&lt;p class=&quot;no-underline&quot; style=&quot;box-sizing: border-box; border: 0px; font-family: 'Segoe UI', 'Open Sans', sans-serif; font-size: 19px; margin: 0px 0px 1.4em; outline: 0px; padding: 0px; vertical-align: baseline; caret-color: #343e47; color: #343e47;&quot;&gt;&lt;img class=&quot;alignright wp-image-2187&quot; style=&quot;box-sizing: border-box; height: auto; max-width: 100%; display: inline; float: right; margin: 0.5em 0px 1.5em 2em;&quot; src=&quot;https://i0.wp.com/buildazure.com/wp-content/uploads/2015/06/mvp_logo_horizontal_preferred_cyan300_rgb_300ppi.png?zoom=2&amp;amp;resize=200%2C81&amp;amp;ssl=1&quot; alt=&quot;&quot; width=&quot;200&quot; height=&quot;81&quot; data-attachment-id=&quot;2187&quot; data-permalink=&quot;https://buildazure.com/about/mvp_logo_horizontal_preferred_cyan300_rgb_300ppi/&quot; data-orig-file=&quot;https://i0.wp.com/buildazure.com/wp-content/uploads/2015/06/mvp_logo_horizontal_preferred_cyan300_rgb_300ppi.png?fit=751%2C303&amp;amp;ssl=1&quot; data-orig-size=&quot;751,303&quot; data-comments-opened=&quot;1&quot; data-image-meta=&quot;{&amp;quot;aperture&amp;quot;:&amp;quot;0&amp;quot;,&amp;quot;credit&amp;quot;:&amp;quot;&amp;quot;,&amp;quot;camera&amp;quot;:&amp;quot;&amp;quot;,&amp;quot;caption&amp;quot;:&amp;quot;&amp;quot;,&amp;quot;created_timestamp&amp;quot;:&amp;quot;0&amp;quot;,&amp;quot;copyright&amp;quot;:&amp;quot;&amp;quot;,&amp;quot;focal_length&amp;quot;:&amp;quot;0&amp;quot;,&amp;quot;iso&amp;quot;:&amp;quot;0&amp;quot;,&amp;quot;shutter_speed&amp;quot;:&amp;quot;0&amp;quot;,&amp;quot;title&amp;quot;:&amp;quot;&amp;quot;,&amp;quot;orientation&amp;quot;:&amp;quot;0&amp;quot;}&quot; data-image-title=&quot;mvp_logo_horizontal_preferred_cyan300_rgb_300ppi&quot; data-image-description=&quot;&quot; data-medium-file=&quot;https://i0.wp.com/buildazure.com/wp-content/uploads/2015/06/mvp_logo_horizontal_preferred_cyan300_rgb_300ppi.png?fit=300%2C121&amp;amp;ssl=1&quot; data-large-file=&quot;https://i0.wp.com/buildazure.com/wp-content/uploads/2015/06/mvp_logo_horizontal_preferred_cyan300_rgb_300ppi.png?fit=751%2C303&amp;amp;ssl=1&quot; /&gt;Hi! My name is Chris Pietschmann, and I&amp;rsquo;m the primary person behind BuildAzure.com and the Build Azure Weekly newsletter. I started BuildAzure.com back in June 2015 after I passed the &lt;a style=&quot;box-sizing: border-box; border-width: 0px 0px 2px; border-bottom-style: solid; border-color: rgba(199, 214, 228, 0.298039); font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: #191919; text-decoration: none; transition: 0.2s ease-in-out;&quot; href=&quot;https://buildazure.com/2015/07/16/mcsd-azure-solutions-architect-certification/&quot;&gt;Azure MCSD certification&lt;/a&gt; as an effort for me to be able to focus my Azure blogging efforts into a more targeted fashion. Over time, as a result of my many community contributions, including the success of sharing information on BuildAzure.com, I was awarded the Microsoft MVP award in 2017 in the expertise category of Microsoft Azure.
&lt;p class=&quot;no-underline&quot; style=&quot;box-sizing: border-box; border: 0px; font-family: 'Segoe UI', 'Open Sans', sans-serif; font-size: 19px; margin: 0px 0px 1.4em; outline: 0px; padding: 0px; vertical-align: baseline; caret-color: #343e47; color: #343e47;&quot;&gt;Most recently, on July 1, 2018, I was &lt;a style=&quot;box-sizing: border-box; border-width: 0px 0px 2px; border-bottom-style: solid; border-color: rgba(199, 214, 228, 0.298039); font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: #191919; text-decoration: none; transition: 0.2s ease-in-out;&quot; href=&quot;https://mvp.microsoft.com/en-us/PublicProfile/4015549&quot;&gt;re-awarded the Microsoft MVP award for 2018&lt;/a&gt; in the category of Microsoft Azure. While this is my 2nd Microsoft MVP award for Microsoft Azure, it&amp;rsquo;s actually my 7th time winning the Microsoft MVP award!
&lt;p class=&quot;no-underline&quot; style=&quot;box-sizing: border-box; border: 0px; font-family: 'Segoe UI', 'Open Sans', sans-serif; font-size: 19px; margin: 0px 0px 1.4em; outline: 0px; padding: 0px; vertical-align: baseline; caret-color: #343e47; color: #343e47;&quot;&gt;*This is a cross-post from BuildAzure.com. You can read the original and expanded post here: *&lt;a href=&quot;https://buildazure.com/2018/07/02/chris-pietschmann-awarded-2018-microsoft-mvp-award/&quot;&gt;&lt;span&gt;https://buildazure.com/2018/07/02/chris-pietschmann-awarded-2018-microsoft-mvp-award/&lt;/span&gt;&lt;/a&gt;
&lt;/p&gt;&lt;/p&gt;&lt;/p&gt;
</description>
        <pubDate>Mon, 02 Jul 2018 10:44:00 -0500</pubDate>
        <link>http://pietschsoft.com//post/2018/07/02/chris-pietschmann-awarded-2018-microsoft-mvp-award-cross-post</link>
        <guid isPermaLink="true">http://pietschsoft.com//post/2018/07/02/chris-pietschmann-awarded-2018-microsoft-mvp-award-cross-post</guid>
        
        <category>Azure</category>
        
        
        <category>Microsoft MVP</category>
        
        <category>Azure</category>
        
      </item>
    
  </channel>
</rss>
