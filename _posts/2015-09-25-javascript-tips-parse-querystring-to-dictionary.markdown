---
layout: post
id: a7e18d8b-5554-48db-b679-51f9c0575c3d
title: "JavaScript Tips: Parse QueryString to Dictionary"
date: 2015-09-25 06:04:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2015/09/25/JavaScript-Tips-Parse-QueryString-to-Dictionary
  - /post/2015/09/25/javascript-tips-parse-querystring-to-dictionary
  - /post.aspx?id=a7e18d8b-5554-48db-b679-51f9c0575c3d
---
<!-- more -->
<p>The URL Query String is something that is usually just sent to the server-side code and parse there for use in specifying the data to query. A somewhat little known feature of the JavaScript DOM is that the QueryString values are accessible from client-side javaScript code too.</p>
<p>The following code can be used to read what the full QueryString value is from the current pages URL:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">var queryString = document.location.search;</pre>
<p>Although, the QueryString value can be accessed from JavaScript, it isn't parsed and separated out into any kind of Key/Value pairs automatically. This parsing must be done manually. Below is an example parsing function and it's example usage:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">// get raw QueryString value
var queryString = document.location.search;
var dict = parseQueryStringToDictionary(queryString);


// Enumerate through all the Key/Value pairs
// in the Dictionary object
for(var item in dict) {
	var key = item;
	var value = dict[item];
	
	alert('Key: ' + key + '\nValue: ' + value);
}

// Get Value by Key directly
alert(dict['name']);



/* Parse QueryString using String Splitting */
function parseQueryStringToDictionary(queryString) {
	var dictionary = {};
	
	// remove the '?' from the beginning of the
	// if it exists
	if (queryString.indexOf('?') === 0) {
		queryString = queryString.substr(1);
	}
	
	// Step 1: separate out each key/value pair
	var parts = queryString.split('&amp;');
	
	for(var i = 0; i &lt; parts.length; i++) {
		var p = parts[i];
		// Step 2: Split Key/Value pair
		var keyValuePair = p.split('=');
		
		// Step 3: Add Key/Value pair to Dictionary object
		var key = keyValuePair[0];
		var value = keyValuePair[1];
		
		// decode URI encoded string
		value = decodeURIComponent(value);
		value = value.replace(/\+/g, ' ');
		
		dictionary[key] = value;
	}
	
	// Step 4: Return Dictionary Object
	return dictionary;
}</pre>
<p>&nbsp;</p>
