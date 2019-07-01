  ---
  layout: post
  title: "ASP.NET 2.0: URL Mapping with RegEx Support"
  date: 2005-11-12 13:36:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2005/11/12/ASPNET-20-URL-Mapping-with-RegEx-Support", "/post/2005/11/12/aspnet-20-url-mapping-with-regex-support"]
  ---
<!-- more -->
<p>
<span style="font-size: 8.5pt; font-family: Verdana">The one big limitation of the URL Mapping functionality built in to <a href="http://asp.net/" target="_blank" title="ASP.NET"><font color="#336699">ASP.NET</font></a> 2.0 is that it doesn&#39;t support regular expressions. I ported my v1.1 URL Mapping implementation over to v2.0 and added support for regular expressions. It really wasn&#39;t too difficult; I only had to modify two lines of code to port it over to ASP.NET 2.0. Then I had to modify 4 lines of code to add RegEx support. My implementation works just like the ASP.NET 2.0 URL Mapping functionality with the addition of RegEx.</span>
</p>
<p>
<span style="font-size: 8.5pt; font-family: Verdana">My code allows to&nbsp;create Url Mappings similar to the following:<br />
~/Chris.aspx to ~/Default.aspx?p=chris<br />
~/Show154.aspx to ~/Default.aspx?p=154</span>
</p>
<p>
<strong><span style="font-size: 8.5pt; font-family: Verdana">Some Performance tips for using this code:</span></strong><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in" class="MsoNormal">
<span style="font-size: 8.5pt; font-family: Verdana"><span>1.<span style="font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style="font-size: 8.5pt; font-family: Verdana">Use as few Url Mapping definitions as possible since it parses them from the first to the last and stops when it finds a match. If a page requested doesn&#39;t match any of the definitions it will&nbsp;go through all of them before moving on to complete the page request. </span>
</p>
<p style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in" class="MsoNormal">
<span style="font-size: 8.5pt; font-family: Verdana"><span>2.<span style="font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style="font-size: 8.5pt; font-family: Verdana">Put the most frequently used Url Mappings first in the list so that they the ones that are parsed first.</span>
</p>
<p style="margin: 0in 0in 0pt 0.5in; text-indent: -0.25in" class="MsoNormal">
<span style="font-size: 8.5pt; font-family: Verdana"><span>3.<span style="font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style="font-size: 8.5pt; font-family: Verdana">The first Url Mapping in placed in my code (</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">add</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">url</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">~/(.*)default\.aspx</span>&quot;<span style="color: blue"> </span><span style="color: red">mappedUrl</span><span style="color: blue">=</span>&quot;<span style="color: blue">~/$1default.aspx</span>&quot;<span style="color: blue"> /&gt;</span></span><span style="font-size: 8.5pt; font-family: Verdana">) is a little trick that allows all requests for the Default.aspx page in the root or any sub-folder of the application to be completed with out having to parse through the entire list of Url Mappings.</span>
</p>
<p>
<span style="font-size: 8.5pt; font-family: Verdana">Regular expression support just seems logical in the v2.0 URL Mapping functionality, but I don&#39;t know why <a href="http://microsoft.com/" target="_blank" title="Microsoft"><font color="#336699">Microsoft</font></a> didn&#39;t add it. I guess they wanted me to have something to do.&nbsp; :)</span>
</p>
<p>
<span style="font-size: 8.5pt; font-family: Verdana">Enjoy!</span>
</p>
<p>
<span style="font-size: 8.5pt; font-family: Verdana">Code for this implementation listed below:</span>
</p>
<p>
<strong><span style="font-size: 18pt; font-family: Verdana">/App_Code/RegExUrlMappingBaseModule.vb</span></strong><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> Microsoft.VisualBasic</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> System.Web</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Namespace</span><span style="font-size: 10pt; font-family: Verdana"> RegExUrlMapping_HTTPModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Public</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Class</span> RegExUrlMappingBaseModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Implements</span><span style="font-size: 10pt; font-family: Verdana"> System.Web.IHttpModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Sub</span><span style="font-size: 10pt; font-family: Verdana"> Init(<span style="color: blue">ByVal</span> app <span style="color: blue">As</span> HttpApplication) <span style="color: blue">Implements</span> IHttpModule.Init</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">AddHandler</span><span style="font-size: 10pt; font-family: Verdana"> app.AuthorizeRequest, <span style="color: blue">AddressOf</span> <span style="color: blue">Me</span>.BaseModuleRewriter_AuthorizeRequest</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Sub</span><span style="font-size: 10pt; font-family: Verdana"> Dispose() <span style="color: blue">Implements</span> System.Web.IHttpModule.Dispose</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Sub</span><span style="font-size: 10pt; font-family: Verdana"> BaseModuleRewriter_AuthorizeRequest(<span style="color: blue">ByVal</span> sender <span style="color: blue">As</span> <span style="color: blue">Object</span>, <span style="color: blue">ByVal</span> e <span style="color: blue">As</span> EventArgs)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> app <span style="color: blue">As</span> HttpApplication = <span style="color: blue">CType</span>(sender, HttpApplication)</span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">Rewrite(app.Request.Path, app)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Overridable</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span> Rewrite(<span style="color: blue">ByVal</span> requestedPath <span style="color: blue">As</span> <span style="color: blue">String</span>, <span style="color: blue">ByVal</span> app <span style="color: blue">As</span> HttpApplication)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Class</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Namespace</span></span>
</p>
<p>
<strong><span style="font-size: 18pt; font-family: Verdana">/App_Code/RegExUrlMappingConfigHandler.vb</span></strong><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> Microsoft.VisualBasic</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> System.Configuration</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> System.Xml</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Namespace</span><span style="font-size: 10pt; font-family: Verdana"> RegExUrlMapping_HTTPModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Public</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Class</span> RegExUrlMappingConfigHandler</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Implements</span><span style="font-size: 10pt; font-family: Verdana"> IConfigurationSectionHandler</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> _Section <span style="color: blue">As</span> XmlNode</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Public</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Function</span> Create(<span style="color: blue">ByVal</span> parent <span style="color: blue">As</span> <span style="color: blue">Object</span>, <span style="color: blue">ByVal</span> configContext <span style="color: blue">As</span> <span style="color: blue">Object</span>, <span style="color: blue">ByVal</span> section <span style="color: blue">As</span> System.Xml.XmlNode) <span style="color: blue">As</span> <span style="color: blue">Object</span> <span style="color: blue">Implements</span> System.Configuration.IConfigurationSectionHandler.Create</span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">_Section = section</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Return</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Me</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Function</span></span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;&#39; Get whether url mapping is enabled in the app.config</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Friend</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Function</span> Enabled() <span style="color: blue">As</span> <span style="color: blue">Boolean</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> _Section.Attributes(<span style="color: maroon">&quot;enabled&quot;</span>).Value.ToLower = <span style="color: maroon">&quot;true&quot;</span> <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Return</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">True</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Else</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Return</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">False</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Function</span></span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;&#39; Get the matching &quot;mapped Url&quot; from the web.config file if there is one.</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Friend</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Function</span> MappedUrl(<span style="color: blue">ByVal</span> url <span style="color: blue">As</span> <span style="color: blue">String</span>) <span style="color: blue">As</span> <span style="color: blue">String</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> x <span style="color: blue">As</span> XmlNode</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> oReg <span style="color: blue">As</span> Regex</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">For</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Each</span> x <span style="color: blue">In</span> _Section.ChildNodes</span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">oReg = <span style="color: blue">New</span> Regex(x.Attributes(<span style="color: maroon">&quot;url&quot;</span>).Value.ToLower)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> oReg.Match(url).Success <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Return</span><span style="font-size: 10pt; font-family: Verdana"> oReg.Replace(url, x.Attributes(<span style="color: maroon">&quot;mappedUrl&quot;</span>).Value.ToLower)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Next</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Return</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: maroon">&quot;&quot;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Function</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Class</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Namespace</span></span>
</p>
<p>
<strong><span style="font-size: 18pt; font-family: Verdana">/App_Code/RegExUrlMappingModule.vb</span></strong><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> Microsoft.VisualBasic</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> System.Web</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Imports</span><span style="font-size: 10pt; font-family: Verdana"> System.Configuration</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Namespace</span><span style="font-size: 10pt; font-family: Verdana"> RegExUrlMapping_HTTPModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Public</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Class</span> RegExUrlMappingModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Inherits</span><span style="font-size: 10pt; font-family: Verdana"> RegExUrlMappingBaseModule</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Overrides</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span> Rewrite(<span style="color: blue">ByVal</span> requestedPath <span style="color: blue">As</span> <span style="color: blue">String</span>, <span style="color: blue">ByVal</span> app <span style="color: blue">As</span> HttpApplication)</span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;Implement functionality here that mimics the &#39;URL Mapping&#39; features of ASP.NET 2.0</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> config <span style="color: blue">As</span> RegExUrlMappingConfigHandler = <span style="color: blue">CType</span>(ConfigurationManager.GetSection(<span style="color: maroon">&quot;system.web/RegExUrlMapping&quot;</span>), RegExUrlMappingConfigHandler)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> pathOld <span style="color: blue">As</span> <span style="color: blue">String</span>, pathNew <span style="color: blue">As</span> <span style="color: blue">String</span> = <span style="color: maroon">&quot;&quot;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> config.Enabled <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">pathOld = app.Request.RawUrl</span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;Get the request page without the querystring parameters</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> requestedPage <span style="color: blue">As</span> <span style="color: blue">String</span> = app.Request.RawUrl.ToLower</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> requestedPage.IndexOf(<span style="color: maroon">&quot;?&quot;</span>) &gt; -1 <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">requestedPage = requestedPage.Substring(0, requestedPage.IndexOf(<span style="color: maroon">&quot;?&quot;</span>))</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;Format the requested page (url) to have a ~ instead of the virtual path of the app</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Dim</span><span style="font-size: 10pt; font-family: Verdana"> appVirtualPath <span style="color: blue">As</span> <span style="color: blue">String</span> = app.Request.ApplicationPath</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> requestedPage.Length &gt;= appVirtualPath.Length <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> requestedPage.Substring(0, appVirtualPath.Length).ToLower = appVirtualPath.ToLower <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">requestedPage = requestedPage.Substring(appVirtualPath.Length)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> requestedPage.Substring(0, 1) = <span style="color: maroon">&quot;/&quot;</span> <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">requestedPage = <span style="color: maroon">&quot;~&quot;</span> &amp; requestedPage</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Else</span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">requestedPage = <span style="color: maroon">&quot;~/&quot;</span> &amp; requestedPage</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;Get the new path to rewrite the url to if it meets one</span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;of the defined virtual urls.</span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">pathNew = config.MappedUrl(requestedPage)</span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;If the requested url matches one of the virtual one</span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;the lets go and rewrite it.</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> pathNew.Length &gt; 0 <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> pathNew.IndexOf(<span style="color: maroon">&quot;?&quot;</span>) &gt; -1 <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;The matched page has a querystring defined</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> pathOld.IndexOf(<span style="color: maroon">&quot;?&quot;</span>) &gt; -1 <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">pathNew += <span style="color: maroon">&quot;&amp;&quot;</span> &amp; Right(pathOld, pathOld.Length - pathOld.IndexOf(<span style="color: maroon">&quot;?&quot;</span>) - 1)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">Else</span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;The matched page doesn&#39;t have a querystring defined</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">If</span><span style="font-size: 10pt; font-family: Verdana"> pathOld.IndexOf(<span style="color: maroon">&quot;?&quot;</span>) &gt; -1 <span style="color: blue">Then</span></span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">pathNew += Right(pathOld, pathOld.Length - pathOld.IndexOf(<span style="color: maroon">&quot;?&quot;</span>))</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: green; font-family: Verdana">&#39;&#39;Rewrite to the new url</span>
</p>
<p>
<span style="font-size: 10pt; font-family: Verdana">HttpContext.Current.RewritePath(pathNew, <font color="#0000ff">false</font>)</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">If</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Sub</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Class</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">End</span><span style="font-size: 10pt; font-family: Verdana"> <span style="color: blue">Namespace</span></span>
</p>
<p>
<strong><span style="font-size: 18pt; font-family: Verdana">/Web.Config</span></strong><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">configuration</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;!--</span><span style="font-size: 10pt; color: green; font-family: Verdana"> Declare the custom &#39;RegExUrlMapping&#39; section and handler </span><span style="font-size: 10pt; color: blue; font-family: Verdana">--&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">configSections</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">sectionGroup</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">name</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">system.web</span>&quot;<span style="color: blue">&gt;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">section</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">name</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">RegExUrlMapping</span>&quot;<span style="color: blue"> </span><span style="color: red">type</span><span style="color: blue">=</span>&quot;<span style="color: blue">RegExUrlMapping_HTTPModule.RegExUrlMappingConfigHandler</span>&quot;<span style="color: blue">/&gt;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;/</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">sectionGroup</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;/</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">configSections</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">system.web</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt; </span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;!--</span><span style="font-size: 10pt; color: green; font-family: Verdana"> Tell ASP.NET to use the RegEx URL Mapping HTTP Module </span><span style="font-size: 10pt; color: blue; font-family: Verdana">--&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">httpModules</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">add</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">type</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">RegExUrlMapping_HTTPModule.RegExUrlMappingModule</span>&quot;<span style="color: blue"> </span><span style="color: red">name</span><span style="color: blue">=</span>&quot;<span style="color: blue">RegExUrlMappingModule</span>&quot;<span style="color: blue">/&gt;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;/</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">httpModules</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;!--</span><span style="font-size: 10pt; color: green; font-family: Verdana"> The RegEx URL Mapping parser goes through these in sequential order. </span><span style="font-size: 10pt; color: blue; font-family: Verdana">--&gt;</span>
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">RegExUrlMapping</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">enabled</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">true</span>&quot;<span style="color: blue">&gt; </span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">add</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">url</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">~/(.*)default\.aspx</span>&quot;<span style="color: blue"> </span><span style="color: red">mappedUrl</span><span style="color: blue">=</span>&quot;<span style="color: blue">~/$1default.aspx</span>&quot;<span style="color: blue"> /&gt;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">add</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">url</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">~/Chris.aspx</span>&quot;<span style="color: blue"> </span><span style="color: red">mappedUrl</span><span style="color: blue">=</span>&quot;<span style="color: blue">~/Default.aspx?p=chris</span>&quot;<span style="color: blue">/&gt;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">add</span><span style="font-size: 10pt; color: blue; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">url</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=</span><span style="font-size: 10pt; font-family: Verdana">&quot;<span style="color: blue">~/show(.*)\.aspx</span>&quot;<span style="color: blue"> </span><span style="color: red">mappedUrl</span><span style="color: blue">=</span>&quot;<span style="color: blue">~/Default.aspx?p=$1</span><span style="color: red">&amp;amp;</span><span style="color: blue">section=3</span>&quot;<span style="color: blue">/&gt;</span></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;/</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">RegExUrlMapping</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;/</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">system.web</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;/</span><span style="font-size: 10pt; color: maroon; font-family: Verdana">configuration</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&gt;</span><span style="font-size: 8.5pt; font-family: Verdana"></span>
</p>
<p>
<span style="font-size: 10pt; color: blue; font-family: Verdana">&nbsp;</span>
</p>
<p>
<span style="color: black; font-family: Arial">ASP.NET 1.1 Url Mapping code can be found here: <a href="/Blog/archive/2005/07/04/717.aspx"><font color="#336699">http://pietschsoft.com/Blog/archive/2005/07/04/717.aspx</font></a></span><span style="font-size: 10pt; color: blue; font-family: Verdana"></span>
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<strong>Update 11/14/2005</strong> <strong>-</strong> Scoth Guthrie has posted about why they didn&#39;t add Regular Expression support to the ASP.NET 2.0 URL Mapping on his blog. He has also posted a link to this blog entry in that blog post. It&#39;s pretty cool that my blog has gotten noticed by him.
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<a href="http://weblogs.asp.net/scottgu/archive/2005/11/14/430493.aspx">http://weblogs.asp.net/scottgu/archive/2005/11/14/430493.aspx</a>
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
&nbsp;
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<strong>Update 9/10/2007 - </strong>I fixed a bug in the RegExUrlMapping code that was preventing ASP.NET Themes from correctly loading.
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
In the RegExUrlMappingModule class change the following line of the Rewrite method:
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<em>&nbsp;&nbsp;&nbsp;HttpContext.Current.RewritePath(pathNew)</em>
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
To be the following instead:
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
&nbsp;&nbsp;&nbsp;<em>HttpContext.Current.RewritePath(pathNew, false)</em>
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
I already made this change to the code above so anyone copying it from now on will get this fix.
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
&nbsp;
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
<strong>Update 3/23/2009</strong> -I just found that this post is mentioned in the &quot;<a href="http://books.google.com/books?id=PTc6v1sKWmAC&amp;pg=PA357&amp;lpg=PA357&amp;dq=%22christopher+pietschmann%22&amp;source=bl&amp;ots=1S1NOYBYaS&amp;sig=y1SJixunMYU29Pgy8Am3L_NgI6U&amp;hl=en&amp;ei=TU7ISae7BtzmnQf_lsCdAw&amp;sa=X&amp;oi=book_result&amp;resnum=7&amp;ct=result#PPA357,M1" target="_blank">ASP.NET 2.0 MVP Hacks and Tips</a>&quot; book that was published in May 2006 on Page 357. I find that one of my blog posts being mentioned in a book like this to be really interesting. Thanks for the props guys!! 
</p>
<p style="margin: 0in 0in 0pt" class="MsoNormal">
&nbsp;
</p>
