---
layout: post
blogengineid: 04d2d0bc-180b-4682-a281-a94363e2a1cd
title: "JavaScript: window.onbeforeunload Event - Show “Are you sure you want to leave this page?” Message"
date: 2011-09-09 17:03:49 -0500
comments: true
published: true
categories: ["JavaScript"]
tags: ["JavaScript", "js"]
redirect_from: 
  - /post/2011/09/09/JavaScript-windowonbeforeunload-Event-Show-e2809cAre-you-sure-you-want-to-leave-this-pagee2809d-Message.aspx
  - /post/2011/09/09/JavaScript-windowonbeforeunload-Event-Show-e2809cAre-you-sure-you-want-to-leave-this-pagee2809d-Message
  - /post/2011/09/09/javascript-windowonbeforeunload-event-show-e2809care-you-sure-you-want-to-leave-this-pagee2809d-message
  - /post.aspx?id=04d2d0bc-180b-4682-a281-a94363e2a1cd
header_image: /images/Header_Javascript_Tips.jpg
---

<a href="/files/browser_beforeunload_message.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: right; border-top: 0px; border-right: 0px; padding-top: 0px" title="browser_beforeunload_message" border="0" alt="browser_beforeunload_message" align="right" src="/files/browser_beforeunload_message_thumb.png" width="244" height="169" /></a>All web developers have likely seen how inconvenient it can be for a user to edit some data in an application, then click a link/button to go on to the next task, but only to later realize that all changes made were never saved. This can pose a major problem for users, until they get it down that they need to click the “Save” button before leaving the page. Wouldn’t it be nice for the app to remind them to click the “Save” button? 
 
Everyone has seen the “Are you sure you want to leave this page?” message (as shown to the right.). It is actually rather simple to implement, but has seemingly been a secret most web developers are unaware of. Good for us, it is actually really simple to do through the <a href="https://developer.mozilla.org/En/DOM/Window.onbeforeunload">window.onbeforeunload</a> event.

## Handle window.onbeforeunload event using jQuery

```javascript
$(window).bind('beforeunload', function() {
    return 'You have unsaved changes. If you leave the page these changes will be lost.';
});
```

## Handle window.onbeforeunload event using straight JavaScript

```javascript
window.onbeforeunload = function(e) {
    return 'You have unsaved changes. If you leave the page these changes will be lost.';
};
```

## Browser Support

The onbeforeunload event was first introduced with Internet Explorer 4, and has since been implemented by all the other web browsers. So basically, what ever browser your users are using, you will be able to take advantage of this.
