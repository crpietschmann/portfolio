---
layout: post
title: "TDD: Testable is most important"
date: 2016-02-04 18:55:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Software Craftsmanship", "TDD"]
alias: ["/post/2016/02/04/TDD-Testable-is-most-important", "/post/2016/02/04/tdd-testable-is-most-important"]
---
<!-- more -->
<p>Test Driven Development (TDD) is great and it really helps you build better, higher quality systems. Unit Tests FTW! However, when TDD meets the real world, there is a clash and many times developers just don't write unit tests. This is bad, but it can be better if the right steps are taken. Writing code that is testable is the key; whether you write the unit tests now or later. Testability FTW!</p>
<p>Testability is when you write code using the same best practices (short methods, use interfaces, clean code, etc.) that lend to being able to write unit tests to get good code coverage. While it can take quite a bit of practice to be able to design class / interface structures and method signatures that are more easily unit testable, it is a key to building more maintainable systems in the long run. Refactoring code to allow for testability is hard; it can be really hard. As long as your code is unit testable in the first place you can always write unit tests at any time in the future.</p>
<p>Once you've written nice, testable code, you can write unit tests with good code coverage at any time. Many developers sacrifice those unit tests to meet client / user deadlines and eventually get to production. Instead of creating a huge pile of technical debt that needs to be refactored in addition to have unit tests written, just make it testable in the first place. Technical debt is bad, and writing non-testable systems will kill the code and make it a bad kind of legacy before you even ship to production. Always strive to write code that is unit testable, so you can always go back and add unit tests at any time.</p>
<p>Now that you have unit testable code written and likely deployed to production, you will still have bugs reported from either UAT testing or PROD users. When a bug comes in, you'll be able to easily write a unit test to expose the bug since you wrote the code to be unit testable in the first place. Then you can fix the bug and verify that the bug never occurs again. You can even take a few minutes to add more unit tests while you're in there to increase the code coverage percentage to help with future testing, maintenance and bug fixes.</p>
<p>Testable code is the most important part of Test Driven Development (TDD). Unit Test help verify bugs are fixed and future changes don't break existing functionality, but in order for this all to work properly the code must first be written in a manner that lends itself to being testable.</p>
<p>Go write testable code. Always!</p>
