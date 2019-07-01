---
layout: post
blogengineid: b2c236d6-8ab5-4a25-8909-fa8773a93b2b
title: "EMail (POP3, SMTP and MIME) looks complex but is in fact really simple"
date: 2004-12-31 02:07:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/12/31/EMail-(POP3-SMTP-and-MIME)-looks-complex-but-is-in-fact-really-simple
  - /post/2004/12/31/email-(pop3-smtp-and-mime)-looks-complex-but-is-in-fact-really-simple
  - /post.aspx?id=b2c236d6-8ab5-4a25-8909-fa8773a93b2b
---
<!-- more -->

Email at first glance appears to be really complex, but once you look further down at how it work you will find out that Email is in fact really simple. POP3 and SMTP each only have about a handfull of command that you need to know to Send/Recieve email messages. The internet mail message format and MIME both appear complex, but are actually very simple and could be thought of as being somewhat object oriented. Really, the most complex part of email is MIME Attachments which is just complex because binary data is Base64 encoded. All you need is a Base64 Encode/Decode library.

I'm still working on my POP3/SMTP Email Client, nothing to show you guys yet. (I haven't had alot of time to work on it that last couple weeks.)
