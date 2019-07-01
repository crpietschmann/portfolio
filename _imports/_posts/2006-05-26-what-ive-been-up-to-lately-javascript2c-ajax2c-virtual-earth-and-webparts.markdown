  ---
  layout: post
  title: "What I've been up to lately: JavaScript, AJAX, Virtual Earth and WebParts"
  date: 2006-05-26 03:42:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General", "Bing Maps"]
  alias: ["/post/2006/05/26/What-Ive-been-up-to-lately-JavaScript2c-AJAX2c-Virtual-Earth-and-WebParts", "/post/2006/05/26/what-ive-been-up-to-lately-javascript2c-ajax2c-virtual-earth-and-webparts"]
  ---
<!-- more -->
<p>
The last couple months at work, I&#39;ve been working a lot on a new real estate mapping product&nbsp;that was&nbsp;launched last week called eNavigator (<a href="http://thinkrealtygroup.com/">Try out eNavigator&nbsp;here</a>). It utilizes AJAX and the Microsoft Virtual Earth v1 Commercial control and&nbsp;supports IE and Firefox. The coolest feature is the Interactive Map search that allows you to click and drag the map around to find that home of your dreams.
</p>
<p>
Something I started working with tonight is the new&nbsp;Virtual Earth v3 control that Microsoft released on May 23rd. Some of the new features include Geocoding, Driving Directions and built-in Pushpins and Popups.
</p>
<p>
There is currently a bug in the Virtual Earth v3 API. When you create a map on the page the follow JavaScript error occurs:
</p>
<p>
<em>Line: 2<br />
Char: 159480<br />
Error: &#39;footer&#39; is undefined</em>
</p>
<p>
What&#39;s this &quot;footer&quot; it&#39;s looking for? I don&#39;t see it in the documentation; the error even occurs on the Virtual Earth Interactive SDK site.&nbsp;It&#39;s been a couple days already;&nbsp;I wonder how long it will take for them to fix it.
</p>
<p>
More Info on Virtual Earth:<br />
<a id="bp___v___r___postlist___EntryItems__ctl0_PostTitle" href="http://blogs.msdn.com/virtualearth/archive/2006/05/23/596729.aspx">Virtual Earth Map Control v3 &ndash; Great new features!</a><br />
<a href="http://dev.live.com/virtualearth/sdk/">The Virtual Earth Interactive SDK</a><br />
<a href="http://viavirtualearth.com/">ViaVirtualEarth.com</a>
</p>
<p>
Most programmers hate JavaScript (I used to), but I&#39;ve actually come to like it.&nbsp;It&#39;s takes a bit to get down what works in which browser and what works in all browsers, but once you get a good base of familiarity it&#39;s actually quite nice. I think I&#39;ve crossed that boundary to becoming somewhat of a JavaScript &quot;expert&quot;. (I&#39;m not claming to be one, I just think I&#39;m on my way as long as I keep working with it more and more.)
</p>
<p>
Another thing I&#39;ve been working with lately&nbsp;is WebParts. They are actually quite easy to use. I especially like how easy it is to use the Import/Export feature of saving/loading a WebPart XML file. They guys on the ASP.NET team did a great job with this feature set.
</p>
<p>
I&#39;ve found there really aren&#39;t very many articles or code examples&nbsp;out there on&nbsp;using Virtual Earth. So, I plan on blogging more about Virtual Earth in the next few months. Tonight, I actually started working on an ASP.NET Virtual Earth v3&nbsp;library&nbsp;that I plan on releasing once I get it far enough along. So, look for it&#39;s release&nbsp;in the coming weeks.
</p>
<p>
Enough rambling for now, I should probably get back to programming or go to bed.
</p>
