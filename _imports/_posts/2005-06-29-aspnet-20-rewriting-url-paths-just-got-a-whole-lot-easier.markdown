  ---
  layout: post
  title: "ASP.NET 2.0: Rewriting URL Paths just got a whole lot easier"
  date: 2005-06-29 14:43:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2005/06/29/ASPNET-20-Rewriting-URL-Paths-just-got-a-whole-lot-easier", "/post/2005/06/29/aspnet-20-rewriting-url-paths-just-got-a-whole-lot-easier"]
  ---
<!-- more -->
<p>
Rewriting URL paths in <a href="http://asp.net" target="_blank" title="ASP.NET">ASP.NET</a> 2.0 is referred to as URL Mapping. Instead of putting some code in your Application_BeginRequest method, you can now just put a few lines in your Web.Config file and like magic you can rewrite those URL paths with ease.
</p>
<p>
With URL Mapping you can turn a not so freindly URL like ~/Blog/Post/11/12/2005/145.aspx into ~/TheCoolestPost.aspx
</p>
<p>
Example Web.Config File:
</p>
<p>
[code:html]<br />
&lt;?xml version=&quot;1.0&quot; ?&gt;<br />
&lt;configuration xmlns=&quot;<a href="http://schemas.microsoft.com/.NetConfiguration/v2.0">http://schemas.microsoft.com/.NetConfiguration/v2.0</a>&quot;&gt;<br />
&nbsp; &lt;system.web&gt;
</p>
<p>
&nbsp;&nbsp;&nbsp; &lt;urlMappings enabled=&quot;true&quot;&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;add<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url=&quot;~/Category.aspx&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mappedUrl=&quot;~/Default.aspx?category=default&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;add<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url=&quot;~/Autos.aspx&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mappedUrl=&quot;~/Default.aspx?category=autos&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;add<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url=&quot;~/Games.aspx&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mappedUrl=&quot;~/Default.aspx?category=games&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;add<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url=&quot;~/Health.aspx&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mappedUrl=&quot;~/Default.aspx?category=health&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;add<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url=&quot;~/News.aspx&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mappedUrl=&quot;~/Default.aspx?category=news&quot; /&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;/urlMappings&gt;
</p>
<p>
&nbsp; &lt;/system.web&gt;<br />
&lt;/configuration&gt;<br />
[/code]
</p>
<p>
Since the Web.Config file is an XML document, you could add functionality to the admin section of your app to add/edit/delete custom URL Mappings. This is definately something I&#39;m going to keep in mind for future ASP.NET 2.0 app I design/build.
</p>
<p>
kudos to the ASP.NET team. This is just one of the many new features added to ASP.NET 2.0. And they couldn&#39;t have made it any easier to use!
</p>
<p>
URL Mapping in ASP.NET 2.0: <a href="http://beta.asp.net/QUICKSTART/aspnet/doc/navigation/urlmapping.aspx">http://beta.asp.net/QUICKSTART/aspnet/doc/navigation/urlmapping.aspx</a>
</p>
<p>
If you want to see how to rewrite url paths with ASP.NET 1.x go here: <a href="http://edsid.com/blog/articles/160.aspx">http://edsid.com/blog/articles/160.aspx</a>
</p>
