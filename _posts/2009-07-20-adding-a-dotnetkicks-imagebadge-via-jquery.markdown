  ---
  layout: post
  title: "Adding a DotNetKicks Image/Badge via jQuery"
  date: 2009-07-20 18:08:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2009/07/20/Adding-a-DotNetKicks-ImageBadge-via-jQuery", "/post/2009/07/20/adding-a-dotnetkicks-imagebadge-via-jquery"]
  ---
<!-- more -->
<p>A while ago Jon Galloway posted a short article titled "<a href="http://weblogs.asp.net/jgalloway/archive/2007/03/08/adding-a-dotnetkicks-image-via-javascript.aspx">Adding a DotNetKicks image via JavaScript</a>" which contains the small amount of JavaScript code necessary to add a <a href="http://www.dotnetkicks.com/docs/kickitbadge">DotNetKicks.com Image / Badge</a> to your web pages. The DotNetKicks Badge is essentially a link that allows users to go to <a href="http://dotnetkicks.com">DotNetKicks.com</a> to vote for you web page, and the badge also displays the total number of "kicks" that your page has received. Since <a href="http://jquery.com">jQuery</a> has become insanely popular since Jon originally posted his JavaScript code, I thought I would post a jQuery version of his code.</p>
<p>Here's a simple demonstration of the DotNetKicks.com Badge that the below jQuery/JavaScript code will generate:</p>
<p><a href="http://www.dotnetkicks.com/kick/?url=http%3A%2F%2Fpietschsoft.com%2Fpost%2F2009%2F07%2F20%2FAdding-a-DotNetKicks-ImageBadge-via-jQuery.aspx"><img src="http://www.dotnetkicks.com/Services/Images/KickItImageGenerator.ashx?url=http%3A%2F%2Fpietschsoft.com%2Fpost%2F2009%2F07%2F20%2FAdding-a-DotNetKicks-ImageBadge-via-jQuery.aspx&amp;bgcolor=0099FF" border="0" alt="kick it on DotNetKicks.com" /></a></p>
<p>To use the below code you just need to follow the following steps:</p>
<ol>
<li>Create a &lt;DIV&gt; element wher you want the badge to be displayed.</li>
<li>Set the &lt;DIV&gt;'s ID to 'postToolbar'.</li>
<li>Make sure that the <a href="http://jquery.com">jQuery Library</a> is included within the page.</li>
<li>Include the below jQuery / JavaScript code within the page.</li>
</ol>
<p>&nbsp;</p>
<p>Here's the jQuery / JavaScript code:</p>
<p>[code:js]</p>
<p>$(function() {<br />&nbsp;&nbsp;&nbsp; var currentPageUrl = document.location.protocol + "//" + document.location.host + document.location.pathname;<br />&nbsp;&nbsp;&nbsp; $('#postToolbar').append(<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $('&lt;a/&gt;').<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attr('href', 'http://www.dotnetkicks.com/kick/?url=' + currentPageUrl).<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; css({ border: 'none' }).<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append(<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $('&lt;img/&gt;').<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attr('src', 'http://www.dotnetkicks.com/Services/Images/KickItImageGenerator.ashx?url=' + currentPageUrl).<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; css({ border: 'none' })<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );<br />});</p>
<p>[/code]</p>
