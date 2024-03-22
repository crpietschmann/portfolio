---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "JavaScript: Redirect to another webpage with JavaScript and jQuery"
date: 2024-03-22 12:05:00 -0500
comments: true
published: true
ai-generated: true
categories: ["JavaScript"]
tags: ["JavaScript", "js", "jQuery"]
header_image: /images/Header_Javascript_Tips.jpg
---

Navigating users seamlessly through a web application is crucial for providing a smooth user experience. One fundamental aspect of this navigation process is redirecting users from one page to another. In this article, we'll explore how to accomplish this task using both pure JavaScript and jQuery, providing code examples for each approach.

- [Redirecting with pure JavaScript](#redirecting-with-pure-javascript)
- [Redirecting with jQuery](#redirecting-with-jquery)

## Redirecting with pure JavaScript

Redirecting with pure JavaScript is straightforward and doesn't require any additional libraries. We can achieve this by directly manipulating the `window.location` object.

```javascript
// Redirect to a new url
window.location = "https://pietschsoft.com";
```

Alternatively, you may want to perform the redirect on page load, this can be performed using an event listener for the `DOMContentLoaded` event that is fired when the document has finished loading content in the browser. Although simply embedding the setting of `window.location` in a `<script/>` tag within the page will have the same end result. Also, the `setTimeout()` function can be used to add a delay to the call to perform the redirect.

```javascript
// Redirecting with pure JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Redirect to a new page after a delay
    setTimeout(function() {
        window.location = "https://pietschsoft.com";
    }, 3000); // Redirect after 3 seconds
});
```

1. We use `document.addEventListener()` to execute the code once the DOM content is loaded.
1. Similar to the jQuery approach, we use `setTimeout()` to introduce a delay before the redirection.
1. Inside the `setTimeout()` function, we set window.location.href to the URL of the destination page.

## Redirecting with jQuery

jQuery simplifies JavaScript code and makes DOM manipulation and traversal much easier. Redirecting users with jQuery involves utilizing its event handling and DOM manipulation capabilities.

```javascript
// Redirecting with jQuery
$(document).ready(function() {
    // Redirect to a new page after a delay
    setTimeout(function() {
        window.location = "https://pietschsoft.com";
    }, 3000); // Redirect after 3 seconds
});
```

1. The `$(document).ready()` function ensures that the code inside it runs once the DOM is fully loaded.
1. We use `setTimeout()` to delay the redirection for a specified period (in milliseconds). In this example, the delay is set to 3000 milliseconds (3 seconds).
1. Inside the `setTimeout()` function, we set window.location.href to the URL of the page we want to redirect to.
