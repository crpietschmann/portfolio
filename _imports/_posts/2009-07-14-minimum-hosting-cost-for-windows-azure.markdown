---
layout: post
id: 73f87ea2-e1fe-4231-b8b9-c849938fad4e
title: "What's the Minimum Hosting Cost for Windows Azure?"
date: 2009-07-14 15:36:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2009/07/14/Minimum-Hosting-Cost-for-Windows-Azure
  - /post/2009/07/14/minimum-hosting-cost-for-windows-azure
  - /post.aspx?id=73f87ea2-e1fe-4231-b8b9-c849938fad4e
---
<!-- more -->
<p><img style="float: right;" src="/images/posts2009/7/azure-logo.jpg" alt="" /></p>
<p><em>NOTE: Azure pricing and functionality has changes alot since this post was written making the details below out of date.</em></p>
<p>Microsoft has announced the <a href="http://blogs.msdn.com/windowsazure/archive/2009/07/14/confirming-commercial-availability-and-announcing-business-model.aspx">initial pricing for Windows Azure, SQL Azure and .NET Services</a>. My question is still "<strong>What is the Minimum it will cost to host a small website/application on Azure?</strong>"<br /><br />If your application is racking up "Compute" time when ever it is "live", then that equals a total of approximately 720 hours of "compute" time for a total of $86.40 per month.<br /><br />If you store less than 1GB of files, that's $0.15 per month.<br /><br />Then if you also use a database with SQL Azure, that's an additional $9.99 per month for up to a 1GB relational database.<br /><br />Now if the website uses 10GB of bandwidth (that's how much my blog used last month), then that's about $1.50 per month.<br /><br />If you add all these up, that's a <strong>Total of $98.04!</strong> And that looks like the very minimum cost of hosting an average "small" app/website on Azure. That surely doesn't make me want to switch my DiscountASP.NET and GoDaddy.com hosting accounts over to Windows Azure.<br /><br /><strong>I can't believe Microsoft isn't making it cheaper to host a small website on Azure, by making the "Compute" time so expensive. Unless of course I'm misunderstanding how "Compute" time is calculated. Does anyone know if I am correct in assuming that 1 full day of hosting your application will rack up 24 hours of total "Compute" time? I hope I'm wrong on this.</strong><br /><br />Below is a summary of the pricing:<br /><br /><em>Windows Azure:<br /><br />&nbsp;&nbsp;&nbsp; * Compute @ $0.12 / hour<br />&nbsp;&nbsp;&nbsp; * Storage @ $0.15 / GB stored<br />&nbsp;&nbsp;&nbsp; * Storage Transactions @ $0.01 / 10K<br /><br />SQL Azure:<br /><br />&nbsp;&nbsp;&nbsp; * Web Edition &ndash; Up to 1 GB relational database @ $9.99<br />&nbsp;&nbsp;&nbsp; * Business Edition &ndash; Up to 10 GB relational database @ $99.99<br /><br />Bandwidth across all three services will be charged at $0.10 in / $0.15 out / GB<br /></em><br /><a href="http://blogs.msdn.com/windowsazure/archive/2009/07/14/confirming-commercial-availability-and-announcing-business-model.aspx">More Info on Azure Pricing</a></p>
