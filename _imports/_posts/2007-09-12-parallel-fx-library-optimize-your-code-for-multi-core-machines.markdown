---
layout: post
title: "Parallel FX Library: Optimize your code for Multi-Core machines"
date: 2007-09-12 11:43:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "vb.net"]
alias: ["/post/2007/09/12/Parallel-FX-Library-Optimize-your-code-for-Multi-Core-machines", "/post/2007/09/12/parallel-fx-library-optimize-your-code-for-multi-core-machines"]
---
<!-- more -->
<p>I was reading the <a href="http://msdn.microsoft.com/msdnmag/issues/07/10/">October 2007 edition of MSDN Magazine </a>and came across an article titled "<a href="http://msdn.microsoft.com/msdnmag/issues/07/10/Futures/default.aspx">Parallel Performance: Optimize Managed Code For Multi-Core Machines</a>." At first I thought that this was just another article explaining how to use the ThreadPool in .NET to improve the performance of you app, but they are actually talking about the new Parallel FX Library that is about to reach its first CTP.</p>
<p><strong>What is this Parallel FX Library?</strong></p>
<p>Simple... It's a .NET library that is designed to make is much easier to optimize .NET applications to utilize multiple processor cores automatically if they are available. If you run on a single core system, it'll just run on one core. But, if you run on an 8 core system, it'll utilize all 8 cores to get things done.</p>
<p><strong>How does it work?</strong></p>
<p>There are a few different things explained in the article that you can do, but the one that sticks out the most too me is Parallel.For. The reason I find it so interesting is because of its simplicity to use.</p>
<p>Take a normal For loop in C#:</p>
<p><em>for (int i = 0; i &lt; 100; i++) {<br />&nbsp;&nbsp; a[i] = a[i] * a[i];<br />}</em></p>
<p>Now the optimized version using Parallel FX:</p>
<p><em>Parallel.For(0, 100, delagate(int i) {<br />&nbsp;&nbsp; a[i] = a[i] * a[i];<br />});</em></p>
<p>Now isn't that simple to do? The Parallel.For does all the optimizations for you to spawn off multiple threads (one per cpu core) to do parallelize the work and get it done as fast as possible. Remember, when running on a single core system, the Parallel.For wont give you any performance boost, but when you run on a 2 or more core system the benefit just scales with the number of cores.</p>
<p><strong>Could I inadvertently decrease performance?</strong></p>
<p>Yes, you must keep in mind what tasks can be run in parallel or you could render some of your optimizations meaningless.</p>
<p>Look at the following nested Parallel.For:</p>
<p><em>Parallel.For(0, 100, deleagate(int a) {<br />&nbsp;&nbsp; Parallel.For(0, 100, delegate(int b) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result[a, b] = 0;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int c = 0; c &lt; 100; c++) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result[a,b] += a1[a,c] * a2[b,c];<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp; });<br />});</em></p>
<p>Even though the above code will still run, you are making the nested Parallel.For meaningless since it cannot be correctly multi-threaded since the machine probably doesn't have enough cores to run every iteration of this matrix in parallel. Another reason that the nested iterations wont multi-thread properly is because they are very dependant on the outer Parallel.For to run. There is also the hit on memory (however very small) that you incur by uing Delegates</p>
<p><strong>What are the requirements?</strong></p>
<p>It requires the .NET Framework 3.5 or higher. I don't know when it's to be released, the first CTP isn't even yet available. The article did state that it's expected in Fall '07.</p>
<p><strong>How do I find out more?</strong></p>
<p>Well, you can read the article in the <a href="http://msdn.microsoft.com/msdnmag/issues/07/10/">October 2007 edition of MSDN Magazine</a> (I would have posted a link to it here, but I could find the link since it's not October yet.) Otherwise, good luck searching for information. The reason I decided to post about it is actually because I tried searching on google and the only information I could find was the hard copy of MSDN Magazine sitting in front of me.</p>
<p>I really encourage anyone interested in reading more about the <a href="http://msdn.microsoft.com/msdnmag/issues/07/10/Futures/default.aspx">Parallel FX Library to go read the MSDN article</a>, since I've only summarized a small part of it (it's actually 7 pages long.)</p>
<p><strong>Updated 9/17/2007 - </strong>The article has since becom available online, so I've put the link within the article where appropriate. <a href="http://msdn.microsoft.com/msdnmag/issues/07/10/Futures/default.aspx">http://msdn.microsoft.com/msdnmag/issues/07/10/Futures/default.aspx</a></p>
