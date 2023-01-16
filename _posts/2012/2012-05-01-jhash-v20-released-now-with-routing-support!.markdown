---
layout: post
blogengineid: 132350f3-c5ad-4eca-8c4f-2c1110f9a345
title: "jHash v2.0 Released: Now with Routing Support!"
date: 2012-05-01 17:34:30 -0500
comments: true
published: true
categories: ["jHash", "Open Source", "JavaScript"]
tags: ["JavaScript", "HTML", "js"]
redirect_from: 
  - /post/2012/05/01/jHash-v20-Released-Now-with-Routing-Support!.aspx
  - /post/2012/05/01/jHash-v20-Released-Now-with-Routing-Support!
  - /post/2012/05/01/jhash-v20-released-now-with-routing-support!
  - /post.aspx?id=132350f3-c5ad-4eca-8c4f-2c1110f9a345
header_image: /images/Header_Javascript_Tips.jpg
---

[jHash](https://github.com/crpietschmann/jHash) is a small, lightweight (4kb minified / 2kb compressed) javascript library that makes it extremely easy to work with `location.hash`. Version 1.0 had the ability to set / retrieve hash root values as well as “hash querystring” values. The newly released version 2.0 includes a new lightweight routing engine that facilitates an easier developer experience when building Single Page Applications.  

The [jHash documentation](https://github.com/crpietschmann/jHash) contains full descriptions of the libraries methods and their usage.  

Get jHash Here: <https://github.com/crpietschmann/jHash>

## Easily work with “location.hash”

Here are some simple examples of setting and retrieving hash “root” and “querystring” values:

```javascript
// URL:
// http://localhost/page.htm#SomeValue?name=Chris&location=Wisconsin

// get "root" hash value
var root = jHash.root(); // returns "SomeValue"

// get "name" hash querystring value
var name = jHash.val('name'); // returns "Chris"

// get "location" hash querystring value
var loc = jHash.val('location'); // return "Wisconsin"

// set new individual query string value
jHash.val('name', 'Steve');

// set all new query string hash values
jHash.val({
    name: 'Steve',
    location: 'Montana'
});
```

## Easy “location.hash” Routing with jHash

Hash routes are a technique that can be used to build Single Page Applications more easily. The Routing implementation contained within jHash works so you can declare Route Patterns in a similar fashion to ASP.NET Routes.

The ["Using jHash Routes article in the jHash documentation"](https://github.com/crpietschmann/jHash) contains full descriptions and examples on how to use jHash Routes.

Here’s a short code sample that shows how to add a simple hash route handler and a sample Hash value that will match the route specified:

```javascript
// Hash that would match this Route Pattern
// #Wisconsin/Milwaukee

jHash.route('{state}/{city}',
    function () {
        var stateName = this.state;
        // stateName will equal 'Wisconsin'

        var cityName = this.city;
        // cityName will equal 'Milwaukee'
    }
);
```
