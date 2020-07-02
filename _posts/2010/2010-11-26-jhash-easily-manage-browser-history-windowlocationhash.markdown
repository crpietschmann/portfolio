---
layout: post
blogengineid: af2d7ca7-0a4a-4d50-ad41-fbc320ec714c
title: "jHash: Easily Manage Browser History / window.location.hash"
date: 2010-11-26 10:11:56 -0600
comments: true
published: true
categories: ["jHash", "JavaScript", "Open Source"]
tags: ["JavaScript", "JavaScript"]
redirect_from: 
  - /post/2010/11/26/jHash-Easily-Manage-Browser-History-windowlocationhash.aspx
  - /post/2010/11/26/jHash-Easily-Manage-Browser-History-windowlocationhash
  - /post/2010/11/26/jhash-easily-manage-browser-history-windowlocationhash
  - /post.aspx?id=af2d7ca7-0a4a-4d50-ad41-fbc320ec714c
---
<!-- more -->

When building Ajax-based web applications it can be difficult to get the web browsers back and forward buttons to work appropriately for each client-side state change. I recently published the new <a href="http://jhash.codeplex.com">jHash</a> library that can help alleviate this issue.  
Put simply: <a href="http://jhash.codeplex.com">jHash</a> allows you to easily be notified when the “window.location.hash” changes. It also allows you to easily store/retrieve values from the hash in a similar fashion to server-side query string values.

Download: <a href="http://jhash.codeplex.com">http://jhash.codeplex.com</a>

## JavaScript Framework Support (jQuery, Prototype, etc.)

The library lives entirely within the “jHash” namespace so it can be used along with any JavaScript framework (jQuery, Prototype, etc.) you choose.  

## Receive Hash Change Notifications

The library primarily uses the `window.onhashchange` event to allow for hash change notifications to be raises. However, since the `onhashchange` event is only supported by newer web browsers (mainly Internet Explorer 8 and Firefox 3.6), the library also implements a fall back mechanism using `window.setInterval` to monitor the `window.location.hash` for changes in older web browsers that do not support this event.

To set a function to be called/notified when the hash changes, you just pass it to jHash using `jHash.change` You can also remove a function from being notified by calling `jHash.unbind` Below are examples of both of these:

```javascript
// Add "onhashchange" handler
jHash.change(function(){
    // hash changed - do something
});

// Create a function and set it to be called
// on the "onhashchange" event
function myHashChanged(){
    // do something
}
// Set "myHashChanged" to be called when
// the "onhashchange" event is fired
jHash.change(myHashChanged);

// Remove "myHashChanged" from being
// called when "onhashchange" is fired
jHash.unbind(myHashChanged);
```

## Retrieving the Hash Values

To retrieve values from the `location.hash` you use the `jHash.root` and `jHash.val` functions.

Here’s a sample URL with Hash:

```url
http://localhost/page.aspx#SomeAnchor?page=4&name=Chris
```

jHash allows you to have both a “root” element and “query” values stored in the hash. In the above example, then “root” is “SomeAnchor” and the query values are `page=4&name=Chris`

The query values are prefixed with a question mark (`?`) and delimited with an ampersand (`&`) just like server-side query string values to keep things familiar.

Here are some examples of using jHash to parse the above hash value to retrieve its values:

```javascript
/* ---- Get the root ---- */
var root = jHash.root();
// root now equals "SomeAnchor"

/* ---- Get query values ---- */
var page = jHash.val("page");
// page now equals "4"

var name = jHash.val("name");
// name now equals "Chris"
```

One thing to not about the `jHash.val` function is that the key of the query value is not case sensitive. The following will also work:

```javascript
var page = jHash.val("PaGe");
var name = jHash.val("Name");
```

## Setting the Hash Values

To set values and consequentially change the `location.hash`, you can use the same `jHash.root` and `jHash.value` functions.

Here are some examples of using jHash to set/change values within the `location.hash`:

```javascript
// Set the root
jHash.root("SomeAnchor");

// Set some query values
jHash.val("page", 4);
jHash.val("name", "Chris");

// The resulting Hash value is:
// "#SomeAnchor?page=4&name=Chris"
```

The previous example will set the hash to the same end result as the shown previously for retrieving hash values.

## Removing Hash Query Values

Sometimes you may want to remove a query value from the hash. jHash handles this using the “jHash.remove” method.

Here’s an example of using it to remove the query value for the key “name”:

```javascript
// Remove "name" query value from hash
jHash.remove("name"</span>);
```

## Set Hash Query Values from an Object / Dictionary

The “jHash.set” function allows you to set both the “root” and “query” values while overwriting any existing hash values. This function is actually used internally with the library by the “root” and “val” functions. This allows you to easily set either just the “query” values or both the “root” and “query” values with only a single line of code.

Here are a couple examples:

```javascript
// Set just the root value
jHash.set("SomeAnchor");

// Set both root and query values from object / dictionary
jHash.set("SomeAnchor", { page: 4, name: "Chris" });
```

When using the “jHash.set” method it is important to remember that it completely overwrites any previous “root” or “query” values stored in the hash.

## Fluent Interface

The jHash functions also implement a fluent interface; meaning they return the jHash object. This allows you to chain multiple calls together in a&#160; single line of code.

Here’s an example:

```javascript
jHash.change(someFunction).root("myRoot").val("page", 5).val("name", "Chris");

## Conclusion

I searched for some good libraries for doing this type of thing before I began writing jHash. As you have probably assumed, I did not find anything that quite fit my liking. Consequentially, we all have <a href="http://jhash.codeplex.com">jHash</a> to use in our applications as desired.
