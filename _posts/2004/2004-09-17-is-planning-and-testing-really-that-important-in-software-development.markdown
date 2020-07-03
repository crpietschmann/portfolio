---
layout: post
blogengineid: 4191866f-bf18-4c00-b667-03051474ab52
title: "Is Planning and Testing really that important in Software Development???"
date: 2004-09-17 15:04:00 -0500
comments: true
published: true
categories: ["Technology", "Career"]
tags: ["General"]
redirect_from: 
  - /post/2004/09/17/Is-Planning-and-Testing-really-that-important-in-Software-Development.aspx
  - /post/2004/09/17/Is-Planning-and-Testing-really-that-important-in-Software-Development
  - /post/2004/09/17/is-planning-and-testing-really-that-important-in-software-development
  - /post.aspx?id=4191866f-bf18-4c00-b667-03051474ab52
---

When you wrote essays in school, didn’t you plan out what you were going to write about before you started writing? The same needs to be done with software development.

Specifications documents need to be written out for all new features/enhancements, before any development begins.  That way the developers have a blueprint to work with of how the feature/enhancement is to work. This should be written from the original description that is gotten from the client that is requesting it. Something that’s not too bad of an idea is to send this specs document to the client and have them approve it. Preferably the Specs document would also include a simple layout of how the user interface and any reports are desired to look.

Then when the developer gets these specs, they need to create something like a “plan of attack”, which is basically how they plan on implementing the feature/enhancement described in the Specs document. This “plan of attack” would include any database schema changes, DLL functions that already exist and new ones that need to be created, etc. that are necessary to implement this feature/enhancement. Preferably the “plan of attack” would be done by the developer that is going to code the feature/enhancement and at least one other developer, this way the best architectural decisions can be made.

Both of these documents should be saved and used for later reference (like: writing the product manual, fixing a bug, and TESTING to see that it works properly).

Have you ever found a bug in a piece of software you were using? If so, what did you think about that that piece of software or the company that wrote the software? A user sees a bug, and says in their head, “This software sucks.” Do we want users thinking our software sucks?

I don’t know exactly what percentage of bugs we miss and the clients find, but I think it’s something like 50%. That is a terrible number; we NEED to do more TESTING of things before they go live. At a job I used to have doing software testing (Time and Attendance/Payroll software) I was able to catch 70-90% of the bugs. The developer to Tester ratio their was 50% of Programming time was done Testing, if it took 8 hrs to program then there was 4 hrs spent testing. I tested every single part of the specs document pertaining to the feature/enhancement and related areas. I also tested inputting weird data into the application to make sure that it handled it correctly. When testing you need to test every single possibility of a setting, and as many possibilities of data as you can think of.
