  ---
  layout: post
  title: "ASP.NET 2.0: RewritePath breaks HyperLink's ImageUrl in App_Theme file when path with slash is rewritten"
  date: 2007-10-28 01:08:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["asp.net"]
  alias: ["/post/2007/10/28/ASPNET-RewritePath-breaks-HyperLinks-ImageUrl-in-App_Theme-file-when-path-with-slash-is-rewritten", "/post/2007/10/28/aspnet-rewritepath-breaks-hyperlinks-imageurl-in-app_theme-file-when-path-with-slash-is-rewritten"]
  ---
<!-- more -->
<p>Rewriting&nbsp;a path with a slash ("/") in it will cause a HyperLink's image specified in the ImageUrl property within an App_Theme file to not be displayed. This can also lead to a "Cannot use a leading ..." error when running the website within IIS.</p>
<p>Here's a screenshot of the issue occuring:</p>
<p><img src="/image.axd?picture=ASPNETRewritePathHyperLinkBug.png" alt="" />&nbsp;</p>
<p>This is kind of a strange bug, since doing the same thing with an Image works just fine. It's only the HyperLink that breaks. I experienced this issue the other day, and it took me a little bit to figure out what was causing the problem. The answer is ASP.NET, kind of.</p>
<p>Download Code: <a rel="enclosure" href="/file.axd?file=ASPNETRewritePathHyperLinkBug.zip">ASPNETRewritePathHyperLinkBug.zip (3.28 kb)</a></p>
