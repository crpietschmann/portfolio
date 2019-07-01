---
layout: post
id: 345b4752-e49b-4612-83c3-6cdc13a1f024
title: "Virtual Earth Staging Environment Launched"
date: 2008-06-19 20:02:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/06/19/Virtual-Earth-Staging-Environment-Launched
  - /post/2008/06/19/virtual-earth-staging-environment-launched
  - /post.aspx?id=345b4752-e49b-4612-83c3-6cdc13a1f024
---
<!-- more -->
<p>The <a href="http://blogs.msdn.com/virtualearth/archive/2008/06/19/virtual-earth-staging-environment.aspx">Virtual Earth team has officially launched their Virtual Earth Staging Environment</a>. The staging environment allows you to access all the features of Virtual Earth (during development and testing) without incurring transaction costs against your production account.</p>
<p><strong>How do I access the Virtual Earth Staging Environment?</strong></p>
<p>Simple, just use the following url when you include the VE JavaScript Control in your page. Notice, the only change in the url is the "staging." in the beginning, otherwise the url is exactly the same.</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;script type="text/javascript" src="http://staging.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1"&gt;&lt;/script&gt;</pre>
<p>One thing to note about using the VE Staging environment is it doesn't work under SSL. If you need to test under SSL, and don't want to have the little "Yes/No" dialog show on each page load, then you'll need to test using the production url for now. I'm sure they'll fix this at some point, but we'll see.</p>
<p><strong>Should I use the Virtual Earth Staging Environment?</strong></p>
<p>You should use the Virtual Earth Staging Environment if you don't want to have the map transactions used during testing to count towards the transactions you're billed for. Also, if you haven't entered into a service level agreement with Microsoft for Virtual Earth, then you do not need to worry about the Staging environment, since you aren't being billed anyway.</p>
<p>&nbsp;</p>
<p>For more information on using the Virtual Earth Staging Environment with Implementing Customer Identification see the "<a href="http://msdn.microsoft.com/en-us/library/bb924353.aspx">Virtual Earth: Implementing Customer Identification</a>" article in MSDN.</p>
