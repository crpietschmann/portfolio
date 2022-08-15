---
layout: post
blogengineid: 74ed3208-1e9a-48aa-8dfa-af424e5e9164
title: "JavaScript Basics: Url / Page Navigation via document.location"
date: 2015-09-16 19:15:00 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript", "js"]
redirect_from: 
  - /post/2015/09/16/JavaScript-Basics-Url-Page-Rediction-via-document-location.aspx
  - /post/2015/09/16/JavaScript-Basics-Url-Page-Rediction-via-document-location
  - /post/2015/09/16/javascript-basics-url-page-rediction-via-document-location
  - /post.aspx?id=74ed3208-1e9a-48aa-8dfa-af424e5e9164
header_image: /images/Header_Javascript_Tips.jpg
---
<!-- more -->

Most often from an HTML page when you need to navigate the user to a different page it will be done via an anchor tag (`<a>`). This works fine if the user explicitly initiates the navigation by clicking the link. However, there are many times when building a web application the page navigation needs to be performed from JavaScript / Ajax code. This can be done using `document.location` in the HTML DOM, but it supports a couple more features than most developers are aware of.

## Simple Page Navigation from JavaScript

The simplest way to perform page navigation using JavaScript is to simple set "document.location" to a new value. This will cause the browser to navigate away from the current page to the URL specified.

```js
document.location = '';
```

The behavior of this method of navigation is identical to a user clicking on an anchor (`<a>`) tag within the page. This navigates to the new URL an leave both in the history, so the browsers back button works to go back to the previous page after navigating to the new URL.

<!-- ad -->

## Page Navigation Without Back Button Support

A feature of "document.location" that isn't the most widely known is the ability to basically replace (or swap out) the current page with a new URL.

```js
document.location.replace('http://build5nines.com')
```

The behavior of this method of navigation is a bit different than the previous. Using the `document.location.replace` method will cause the browser to replace the current page with the new URL. This essentially navigates to the new URL while removing the previous URL from the browser history. After navigating using this method, the browser back button will no longer bring the user back to the previous URL.

Using this method of navigating can be useful if you have a web application where the application may break or behave in an unexpected way when allowing the back button to function with it's default behavior. This essentially gives you an option to disable the browsers back button for your website or application.

Documentation: <a href="https://developer.mozilla.org/en-US/docs/Web/API/Location/replace" target="_blank">https://developer.mozilla.org/en-US/docs/Web/API/Location/replace</a>

## Reload the Current Page

Reloading the current page isn't normally considered a method of "_page navigation_", however, with web applications this may give you a desired behavior that could reset the current state of the page.

```js
document.location.reload(true);
```

The `location.reload` method accepts a single boolean parameter that determines if the page is forced to reload from the web server (if `true`), or if it's allowed to load from cache (if `false`).

Documentation: <a href="https://developer.mozilla.org/en-US/docs/Web/API/Location/reload" target="_blank">https://developer.mozilla.org/en-US/docs/Web/API/Location/reload</a>

Happy coding!