  ---
  layout: post
  title: "JavaScript: Add Search Engine Keyword Highlight Support to your site with ease"
  date: 2007-09-24 14:01:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2007/09/24/JavaScript-Add-Search-Engine-Keyword-Highlight-Support-to-your-site-with-ease", "/post/2007/09/24/javascript-add-search-engine-keyword-highlight-support-to-your-site-with-ease"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>When looking at the source code for the <a href="http://dotnetblogengine.net">BlogEngine.NET</a> project, I noticed that they are implementing some <a href="http://fucoder.com/code/se-hilite/">javascript to highlight search engine keywords</a>. What happens is when a user searches (using Google, Yahoo, MSN, etc.) and then clicks through to your site, this javascript then highlights any words on the page that match the keywords they are search for. This isn't critical functionality to add to a site, but it sure helps in making your site much more user friendly by allowing them to more easily find what they are searching for.</p>
<p>The script they implemented in BlogEngine.NET is called <a href="http://fucoder.com/code/se-hilite/">se-hilite</a>. The current version has support for all the major search engines and browsers, and this script is pretty mature having been around since June 2004.&nbsp;It is also fairly easy to implement, all you have to do is add a CSS class named <em>hilite</em> to your CSS file, and then add a javascript&nbsp;include&nbsp;to the <em>se-hilite.js</em> file to your page.</p>
<p>My blog is implemented with ASP.NET 2.0, so to include the se-hilite.js file in my entire site I just added the following line to the load event of my master page:</p>
<p><span style="color: #2b91af; font-size: x-small;"> </span></p>
<p><span style="color: #2b91af; font-size: x-small;">ScriptManager</span><span style="font-size: x-small;">.RegisterClientScriptInclude(</span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.Page, </span><span style="color: #0000ff; font-size: x-small;">this</span><span style="font-size: x-small;">.GetType(), </span><span style="color: #a31515; font-size: x-small;">"se_hilite"</span><span style="font-size: x-small;">, </span><span style="color: #2b91af; font-size: x-small;">VirtualPathUtility</span><span style="font-size: x-small;">.ToAbsolute(</span><span style="color: #a31515; font-size: x-small;">"~/js/se_hilite.js"</span><span style="font-size: x-small;">));</span></p>
<p>&nbsp;</p>
<p>I just implemented this on my blog, so I hope all you who come here from the search engines enjoy!</p>
