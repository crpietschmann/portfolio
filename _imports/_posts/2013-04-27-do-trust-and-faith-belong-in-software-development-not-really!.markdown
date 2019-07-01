---
layout: post
title: "Do Trust and Faith belong in Software Development? Not Really!"
date: 2013-04-27 07:21:14 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: []
redirect_from: 
  - /post/2013/04/27/Do-Trust-and-Faith-belong-in-Software-Development-Not-Really!
  - /post/2013/04/27/do-trust-and-faith-belong-in-software-development-not-really!
---
<!-- more -->
<p>The words "Trust" and "Faith" don't normally come up in discussion surrounding software development. However, whether we like to say it or not, we really do put a lot of both trust and faith in software. In fact, software developers often put a lot trust and faith in there development tool. While this can be justified in certain cases; it is most often a mistake.
</p><h3>The Good
</h3><p>When following Test Driven Development (TDD) you basically don't trust anything by writing unit tests to verify everything at every level. It is often thought that Unit Tests are only testing the source code you write, but really it's simultaneously integration testing the development tools and frameworks your code uses as well.
</p><p>Writing proper test cases for your code with the highest code coverage reasonable is the best practice to follow.
</p><h3>The Bad
</h3><p>When a tool doesn't lend itself to Testability, thus disallowing you to write unit tests against it in full or just making it difficult, you need to fully evaluate whether that tool is the best tool for the job.
</p><p>Here's a couple tools that generally fall into this category either in whole or partially:
</p><ul><li>SQL Server Integration Services (SSIS)
</li><li>Crystal Reports
</li><li>Database Stored Procedures
</li><li>Entity Framework
</li><li>LINQ to SQL
</li><li>ASP.NET WebForms
</li><li>.NET Windows Forms
</li></ul><p>While there may be methods for either unit testing or integration testing things using the above frameworks/tools, they appropriately represent the types of tools that need to be fully evaluated before selecting them as the tool of choice for any new project.
</p><p>It is worth mentioning, that generally legacy frameworks/tools don't easily lend themselves to proper testability, so this is an area that some newer technologies really shine bright!
</p><h3>Grey Areas
</h3><p>There are also plenty of gray area tools and frameworks. These are tools that do allow for testability, but it can be a pain to do in certain cases. In these cases, it's important to evaluate which parts of the tool/framework are appropriate to get the job done.
</p><p>An example of this is the fact that some of the legacy ASP.NET framework stuff is present in ASP.NET MVC. While ASP.NET MVC was built with testability in mind, it is still built on top of ASP.NET which has its fair share of legacy pieces that are either impossibly to properly unit test or are just a pain to do so.
</p><h3>Conclusion
</h3><p>Don't put too much Trust and Faith in your software development tools and frameworks. Sure while it's in the vendor's best interest to keep them bug free; it is still your job as the developer to do the same. You must not just reduce the amount of bugs in your own code; you must also protect your applications from bugs in the vendor's code as well to the best of your abilities.</p>
