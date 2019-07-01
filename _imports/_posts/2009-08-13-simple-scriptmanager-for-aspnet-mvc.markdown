  ---
  layout: post
  title: "A Simple ScriptManager for ASP.NET MVC"
  date: 2009-08-13 16:23:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["ASP.NET MVC"]
  alias: ["/post/2009/08/13/Simple-ScriptManager-for-ASPNET-MVC", "/post/2009/08/13/simple-scriptmanager-for-aspnet-mvc"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>The <a href="http://www.asp.net/Ajax/Documentation/Live/overview/ScriptManagerOverview.aspx" target="_blank">ASP.NET AJAX ScriptManager</a> makes it really easy to include JavaScript references and register JavaScript blocks into the rendered Page output of an ASP.NET WebForms application. However nice the ScriptManager control is, it&rsquo;s still just a WebForms control for use with ASP.NET AJAX; thus it&rsquo;s use isn&rsquo;t really supported with ASP.NET MVC. Also, to make things just a little more difficult, ASP.NET MVC doesn&rsquo;t have it&rsquo;s own &ldquo;ScriptManager&rdquo; implementation. This brings me to the point of posting this&hellip;</p>
<p>I have worked out a really simple &ldquo;ScriptManager&rdquo; component for use with ASP.NET MVC, and I think it works really nice to help simplify the effort of including JavaScript blocks and references in a page.</p>
<h3>Setting up the &ldquo;SimpleScriptManager&rdquo; for use</h3>
<p>To use the &ldquo;SimpleScriptManager&rdquo; with ASP.NET MVC you must first Import the &ldquo;SimpleScriptManager&rdquo; namespace into your Master Page. Then you must place a single line of code in the Master Page file at the location you want to Render the Script Includes and Blocks to the Page. In order for it to work properly, the Render code needs to be place at the very end of the Master Page; preferably just before the closing Body tag.</p>
<p>Here&rsquo;s a really short example Master Page file with the &ldquo;SimpleScriptManager&rdquo; namespace imported and the call to &ldquo;SimpleScriptManager().Render()&rdquo; located at the very end of the page just before the closing Body tag.</p>
<pre class="csharpcode"><span class="asp">&lt;%@ Master Language="C#" Inherits="System.Web.Mvc.ViewMasterPage" %&gt;</span>

<span class="asp">&lt;%</span>-- The SimpleScriptManager Namespace must be Imported to be able to use the Html.SimpleScriptManager Extension --<span class="asp">%&gt;</span>
<span class="asp">&lt;%@ Import Namespace="SimpleScriptManager" %&gt;</span>

<span class="kwrd">&lt;!</span><span class="html">DOCTYPE</span> <span class="attr">html</span> <span class="attr">PUBLIC</span> <span class="kwrd">"-//W3C//DTD XHTML 1.0 Strict//EN"</span> <span class="kwrd">"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">html</span> <span class="attr">xmlns</span><span class="kwrd">="http://www.w3.org/1999/xhtml"</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">head</span> <span class="attr">runat</span><span class="kwrd">="server"</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">title</span><span class="kwrd">&gt;&lt;</span><span class="html">asp:ContentPlaceHolder</span> <span class="attr">ID</span><span class="kwrd">="TitleContent"</span> <span class="attr">runat</span><span class="kwrd">="server"</span> <span class="kwrd">/&gt;&lt;/</span><span class="html">title</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">link</span> <span class="attr">href</span><span class="kwrd">="../../Content/Site.css"</span> <span class="attr">rel</span><span class="kwrd">="stylesheet"</span> <span class="attr">type</span><span class="kwrd">="text/css"</span> <span class="kwrd">/&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">head</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;</span><span class="html">body</span><span class="kwrd">&gt;</span>
    <span class="kwrd">&lt;</span><span class="html">asp:ContentPlaceHolder</span> <span class="attr">ID</span><span class="kwrd">="MainContent"</span> <span class="attr">runat</span><span class="kwrd">="server"</span> <span class="kwrd">/&gt;</span>
    
    <span class="asp">&lt;%</span>-- Render all the Scripts to the Page --<span class="asp">%&gt;</span>
    <span class="asp">&lt;%</span>-- Must be located at the very end of the Master Page to work properly --<span class="asp">%&gt;</span>
    <span class="asp">&lt;%</span> Html.SimpleScriptManager().Render(); <span class="asp">%&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">body</span><span class="kwrd">&gt;</span>
<span class="kwrd">&lt;/</span><span class="html">html</span><span class="kwrd">&gt;</span></pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<p>This may look a little strange to you since you may be used to placing all your JavaScript Blocks and Script Includes at the top of the page within the &lt;HEAD&gt; tags. However, in order for the &ldquo;SimpleScriptManager&rdquo; to work property the call to Render to the page MUST be located at the end of the Master Page file. This allows any other server controls, user controls or pages to add Script Blocks and Includes at any time during the process or building/rendering the page, and then at the end of the Master Page (when the page is just about finished being rendered) the &ldquo;SimpleScriptManager().Render()&rdquo; method is called and the scripts are all rendered out to the page at that time. If the &ldquo;"SimpleScriptManager().Render()&rdquo; method is called prior to all other components on the Page, then any Script Blocks or Includes added to the &ldquo;SimpleScriptManager&rdquo; after Render is called will not be included within the final rendering of the Page that gets sent to the client.</p>
<h3>Using the &ldquo;SimpleScriptManager&rdquo;</h3>
<p>The &ldquo;SimpleScriptManager&rdquo; has only two fairly simple methods: ScriptInclude and Script.</p>
<h4>&ldquo;SimpleScriptManager.ScriptInclude&rdquo; Method</h4>
<p>To add a simple Script Include within the page, you just call the &ldquo;ScriptManager.ScriptInclude&rdquo; method and pass in the Location / Url of the JavaScript file to include within the page. The Script Location / Url can be either an Absolute or Virtual (&ldquo;App Relative&rdquo;) Url.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Html.SimpleScriptManager().ScriptInclude(<span class="str">"~/Scripts/jquery-1.3.2.js"</span>); <span class="asp">%&gt;</span></pre>
<pre class="csharpcode"><span class="asp">&lt;%</span> Html.SimpleScriptManager().ScriptInclude(<span class="str">"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"</span>); <span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<p>You can also pass in a &ldquo;Key&rdquo; for the specific Script Include you&rsquo;re registering. This key is a unique identifier used within your application for the specified Script Include, and it allows you to ensure that only a single include/reference to that specific script will get rendered within the Page.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Html.SimpleScriptManager().ScriptInclude(<span class="str">"jquery"</span>, <span class="str">"~/Scripts/jquery-1.3.2.js"</span>); <span class="asp">%&gt;</span></pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<p>For instance the second example of &ldquo;ScriptInclude&rdquo; above specifies the Key of &ldquo;jquery&rdquo;. You would be able to include this &ldquo;ScriptInclude&rdquo; call within any User Controls and/or Pages within your application that require that the &ldquo;jquery-1.3.2.js&rdquo; script be included within the page to work, and no matter how many of those controls are rendered to the page, the script would only have a single include/reference rendered to the Page.</p>
<p>I know this isn&rsquo;t a very good example of adding a script reference that may only be needed within a couple pages of an application, since you&rsquo;ll most likely want jQuery included within every Page of your Application. To do this you&rsquo;ll just add the &ldquo;ScriptInclude&rdquo; call to top of the Master Page file itself. However, I&rsquo;m sure you get the idea I&rsquo;m trying to reference on how to &ldquo;optionally&rdquo; include a script reference only when it&rsquo;s needed, instead of including it within every single page of your application by adding it within the Master Page file.</p>
<h4>&ldquo;SimpleScriptManager.ScriptInclude&rdquo; Method to Add Web Resource References</h4>
<p>One of the things necessary when building Custom Server Controls (instead of just User Controls) is the fact that they reside within an Assembly and contain scripts as Embedded Web Resources. This can cause issues when adding Script Include references for these controls since you need to load the script from the Embedded Web Resource into the Page.</p>
<p>However, this is really simple to do with an additional &ldquo;ScriptInclude&rdquo; method overload that uses generics to specify the Assembly to find the Embedded Web Resource within, plus the full resource name to include. There is also a method overload that accept a unique &ldquo;Key&rdquo; for the script just like the above &ldquo;ScriptInclude&rdquo; example.</p>
<p>To use these overloads of the &ldquo;ScriptInclude&rdquo; method you must add a reference to the &ldquo;SimpleScriptManager&rdquo; namespace within your custom control. Also, your Custom Control/Component must inherit from the ViewUserControl class so that it gets access to the HtmlHelper object through the Html property.</p>
<p>Here&rsquo;s a really simple example of this:</p>
<pre class="csharpcode"><span class="rem">// The SimpleScriptManager Namespace must be Imported to be able to use the Html.SimpleScriptManager Extension</span>
<span class="kwrd">using</span> SimpleScriptManager;

<span class="rem">// Specify that the "Embedded Resource" is to be a "Web Resource"</span>
[assembly: System.Web.UI.WebResource(<span class="str">"EmbeddedScriptResourceTest.TestScriptOne.js"</span>, <span class="str">"text/javascript"</span>)]

<span class="kwrd">namespace</span> EmbeddedScriptResourceTest
{
    <span class="kwrd">public</span> <span class="kwrd">class</span> TestScriptOneControl : System.Web.Mvc.ViewUserControl
    {
        <span class="kwrd">public</span> <span class="kwrd">string</span> Message { get; set; }

        <span class="kwrd">public</span> <span class="kwrd">override</span> <span class="kwrd">void</span> RenderControl(System.Web.UI.HtmlTextWriter writer)
        {
            <span class="kwrd">base</span>.RenderControl(writer);

            <span class="rem">// By specifying a Key when adding the ScriptInclude below, we are ensuring that the script only gets included</span>
            <span class="rem">// within the Page once, no matter how many instances of this control are renderd to the Page.</span>
            <span class="kwrd">this</span>.Html.SimpleScriptManager().ScriptInclude&lt;TestScriptOneControl&gt;(</pre>
<pre class="csharpcode">                 <span class="str">"TestScriptOneKey"</span>, </pre>
<pre class="csharpcode">                 <span class="str">"EmbeddedScriptResourceTest.TestScriptOne.js"</span>);
        }
    }
}</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<h4>&ldquo;SimpleScriptManager.Script&rdquo; Method</h4>
<p>To add a Script Block in to the Page you just call the &ldquo;SimpleScriptManager.Script&rdquo; method and pass it a String that contains the JavaScript code to include within the Page.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Html.SimpleScriptManager().Script(<span class="str">"alert('Hello!');"</span>); <span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<p>You can also pass in a &ldquo;Key&rdquo; that uniquely identifies this specific Script Block. Just as with the &ldquo;ScriptInclude&rdquo; method, this allows you to specify that you only want this particular Script Block to be included within the Page only once no matter how many times any components within the Page specify it to be added.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Html.SimpleScriptManager().Script(<span class="str">"ScriptKey"</span>, <span class="str">"alert('Hello!');"</span>); <span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<h4>&ldquo;SimpleScriptManager.Script&rdquo; Method using a Lambda Expression</h4>
<p>I also included the ability to pass the &ldquo;SimpleScriptManager.Script&rdquo; method a Lambda Expression that will output the desired JavaScript code to the Page. This is something that makes it a little easier to add some Script to the Page and still be able to keep any code formatting in place (for readability) without requiring you to build it within a big, long String within the Page or User Control.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Html.SimpleScriptManager().Script( () =&gt; {<span class="asp">%&gt;</span>
    $(function(){
        alert('Hello!');
    });"
<span class="asp">&lt;%</span>}); <span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<p>This method also supports the ability to pass in a &ldquo;Key&rdquo; to specify you only want this script to be included within the Page a single time.</p>
<h3>How &ldquo;SimpleScriptManager&rdquo; Works</h3>
<p>Besides the &ldquo;SimpleScriptManager&rdquo; being included as an Extension Method to the HtmlHelper object; it also &ldquo;attaches&rdquo; itself to the HttpContext.Items Dictionary the first time &ldquo;Html.SimpleScriptManager()&rdquo; is called and then any subsequent calls just add any Script Includes or Blocks to that same SimpleScriptManager instance. Then when you call the &ldquo;Render&rdquo; method it writes out the entire Html code necessary to Render all the Script Includes and Blocks to the Page.</p>
<p>This is actually a fairly simple design, and the code that &ldquo;attaches&rdquo; the SimpleScriptManager to the HttpContext is includes within the HtmlHelper Extension Method itself; the rest of the code is contained within the actual SimpleScriptManager object.</p>
<h3>Full &ldquo;SimpleScriptManager&rdquo; Code</h3>
<p>SimpleScriptManagerExtension.cs</p>
<pre class="csharpcode"><span class="rem">// Copyright (c) 2009 Chris Pietschmann (http://pietschsoft.com)</span>
<span class="rem">// All rights reserved.</span>
<span class="rem">// Licensed under the Microsoft Public License (Ms-PL)</span>
<span class="rem">// http://opensource.org/licenses/ms-pl.html</span>

<span class="kwrd">using</span> System.Web.Mvc;

<span class="kwrd">namespace</span> SimpleScriptManager
{
    <span class="kwrd">public</span> <span class="kwrd">static</span> <span class="kwrd">class</span> SimpleScriptManagerExtensions
    {
        <span class="kwrd">private</span> <span class="kwrd">static</span> <span class="kwrd">readonly</span> <span class="kwrd">string</span> simpleScriptManagerKey = <span class="str">"SimpleScriptManager"</span>;

        <span class="kwrd">public</span> <span class="kwrd">static</span> SimpleScriptManager SimpleScriptManager(<span class="kwrd">this</span> HtmlHelper helper)
        {
            <span class="rem">// Get SimpleScriptManager from HttpContext.Items</span>
            <span class="rem">// This allows for a single SimpleScriptManager to be created and used per HTTP request.</span>
            var scriptmanager = helper.ViewContext.HttpContext.Items[simpleScriptManagerKey] <span class="kwrd">as</span> SimpleScriptManager;
            <span class="kwrd">if</span> (scriptmanager == <span class="kwrd">null</span>)
            {
                <span class="rem">// If SimpleScriptManager hasn't been initialized yet, then initialize it.</span>
                scriptmanager = <span class="kwrd">new</span> SimpleScriptManager(helper);
                <span class="rem">// Store it in HttpContext.Items for subsequent requests during this HTTP request.</span>
                helper.ViewContext.HttpContext.Items[simpleScriptManagerKey] = scriptmanager;
            }
            <span class="rem">// Return the SimpleScriptManager</span>
            <span class="kwrd">return</span> scriptmanager;
        }
    }
}</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<p>SimpleScriptManager.cs</p>
<pre class="csharpcode"><span class="rem">// Copyright (c) 2009 Chris Pietschmann (http://pietschsoft.com)</span>
<span class="rem">// All rights reserved.</span>
<span class="rem">// Licensed under the Microsoft Public License (Ms-PL)</span>
<span class="rem">// http://opensource.org/licenses/ms-pl.html</span>

<span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Collections.Generic;
<span class="kwrd">using</span> System.Reflection;
<span class="kwrd">using</span> System.Web;
<span class="kwrd">using</span> System.Web.Mvc;

<span class="kwrd">namespace</span> SimpleScriptManager
{
    <span class="kwrd">public</span> <span class="kwrd">class</span> SimpleScriptManager
    {
        <span class="kwrd">private</span> HtmlHelper htmlHelper;

        <span class="kwrd">private</span> Dictionary&lt;<span class="kwrd">string</span>, <span class="kwrd">string</span>&gt; scriptIncludes = <span class="kwrd">new</span> Dictionary&lt;<span class="kwrd">string</span>, <span class="kwrd">string</span>&gt;();

        <span class="kwrd">private</span> Dictionary&lt;<span class="kwrd">string</span>, <span class="kwrd">string</span>&gt; scripts = <span class="kwrd">new</span> Dictionary&lt;<span class="kwrd">string</span>, <span class="kwrd">string</span>&gt;();
        <span class="kwrd">private</span> Dictionary&lt;<span class="kwrd">string</span>, Action&gt; scriptsActions = <span class="kwrd">new</span> Dictionary&lt;<span class="kwrd">string</span>, Action&gt;();

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// SimpleScriptManager Constructor</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="helper"&gt;The HtmlHelper that this SimpleScriptManager will use to render to.&lt;/param&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager(HtmlHelper helper)
        {
            <span class="rem">// Store reference to the HtmlHelper object this SimpleScriptManager is tied to.</span>
            <span class="kwrd">this</span>.htmlHelper = helper;
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script file reference to the page.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="scriptPath"&gt;The URL of the script file.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager ScriptInclude(<span class="kwrd">string</span> scriptPath)
        {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.ScriptInclude(Guid.NewGuid().ToString(), scriptPath);
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script file reference to the page.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="key"&gt;A unique identifier for the script file.&lt;/param&gt;</span>
        <span class="rem">/// &lt;param name="scriptPath"&gt;The URL of the script file.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager ScriptInclude(<span class="kwrd">string</span> key, <span class="kwrd">string</span> scriptPath)
        {
            <span class="kwrd">if</span> (!<span class="kwrd">this</span>.scriptIncludes.ContainsKey(key))
            {
                <span class="rem">// Check if the scriptPath is a Virtual Path</span>
                <span class="kwrd">if</span> (scriptPath.StartsWith(<span class="str">"~/"</span>))
                {
                    <span class="rem">// Convert the Virtual Path to an Application Absolute Path</span>
                    scriptPath = VirtualPathUtility.ToAbsolute(scriptPath);
                }
                <span class="kwrd">this</span>.scriptIncludes.Add(key, scriptPath);
            }
            <span class="kwrd">return</span> <span class="kwrd">this</span>;
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script file reference to the page for an Embedded Web Resource.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;typeparam name="T"&gt;The Type whos Assembly contains the Web Resource.&lt;/typeparam&gt;</span>
        <span class="rem">/// &lt;param name="key"&gt;A unique identifier for the script file.&lt;/param&gt;</span>
        <span class="rem">/// &lt;param name="resourceName"&gt;The name of the Web Resource.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager ScriptInclude&lt;T&gt;(<span class="kwrd">string</span> key, <span class="kwrd">string</span> resourceName)
        {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.ScriptInclude(key, getWebResourceUrl&lt;T&gt;(resourceName));
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script file reference to the page for an Embedded Web Resource.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;typeparam name="T"&gt;The Type whos Assembly contains the Web Resource.&lt;/typeparam&gt;</span>
        <span class="rem">/// &lt;param name="resourceName"&gt;The name of the Web Resource.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager ScriptInclude&lt;T&gt;(<span class="kwrd">string</span> resourceName)
        {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.ScriptInclude(getWebResourceUrl&lt;T&gt;(resourceName));
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script block to the page.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="javascript"&gt;The JavaScript code to include in the Page.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager Script(<span class="kwrd">string</span> javascript)
        {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.Script(Guid.NewGuid().ToString(), javascript);
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script block to the page.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="key"&gt;A unique identifier for the script.&lt;/param&gt;</span>
        <span class="rem">/// &lt;param name="javascript"&gt;The JavaScript code to include in the Page.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager Script(<span class="kwrd">string</span> key, <span class="kwrd">string</span> javascript)
        {
            <span class="kwrd">if</span> (!<span class="kwrd">this</span>.scripts.ContainsKey(key) &amp;&amp; !<span class="kwrd">this</span>.scriptsActions.ContainsKey(key))
            {
                <span class="kwrd">this</span>.scripts.Add(key, javascript);
            }
            <span class="kwrd">return</span> <span class="kwrd">this</span>;
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script block to the page.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="javascript"&gt;The JavaScript code to include in the Page.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager Script(Action javascript)
        {
            <span class="kwrd">return</span> <span class="kwrd">this</span>.Script(Guid.NewGuid().ToString(), javascript);
        }
        
        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Adds a script block to the page.</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="rem">/// &lt;param name="key"&gt;A unique identifier for the script.&lt;/param&gt;</span>
        <span class="rem">/// &lt;param name="javascript"&gt;The JavaScript code to include in the Page.&lt;/param&gt;</span>
        <span class="rem">/// &lt;returns&gt;Returns the SimpleScriptManager&lt;/returns&gt;</span>
        <span class="kwrd">public</span> SimpleScriptManager Script(<span class="kwrd">string</span> key, Action javascript)
        {
            <span class="kwrd">if</span> (!<span class="kwrd">this</span>.scripts.ContainsKey(key) &amp;&amp; !<span class="kwrd">this</span>.scriptsActions.ContainsKey(key))
            {
                <span class="kwrd">this</span>.scriptsActions.Add(key, javascript);
            }
            <span class="kwrd">return</span> <span class="kwrd">this</span>;
        }

        <span class="rem">/// &lt;summary&gt;</span>
        <span class="rem">/// Renders the SimpleScriptManager to the Page</span>
        <span class="rem">/// &lt;/summary&gt;</span>
        <span class="kwrd">public</span> <span class="kwrd">void</span> Render()
        {
            var writer = <span class="kwrd">this</span>.htmlHelper.ViewContext.HttpContext.Response.Output;

            <span class="rem">// Render All Script Includes to the Page</span>
            <span class="kwrd">foreach</span> (var scriptInclude <span class="kwrd">in</span> <span class="kwrd">this</span>.scriptIncludes)
            {
                writer.WriteLine(String.Format(<span class="str">"&lt;script type='text/javascript' src='{0}'&gt;&lt;/script&gt;"</span>, scriptInclude.Value));
            }
            
            <span class="rem">// Render All other scripts to the Page</span>
            <span class="kwrd">if</span> (<span class="kwrd">this</span>.scripts.Count &gt; 0 || <span class="kwrd">this</span>.scriptsActions.Count &gt; 0)
            {
                writer.WriteLine(<span class="str">"&lt;script type='text/javascript'&gt;"</span>);

                <span class="kwrd">if</span> (<span class="kwrd">this</span>.scripts.Count &gt; 0)
                {
                    <span class="kwrd">foreach</span> (var script <span class="kwrd">in</span> <span class="kwrd">this</span>.scripts)
                    {
                        writer.WriteLine(script.Value);
                    }
                }

                <span class="kwrd">if</span> (<span class="kwrd">this</span>.scriptsActions.Count &gt; 0)
                {
                    <span class="kwrd">foreach</span> (var script <span class="kwrd">in</span> <span class="kwrd">this</span>.scriptsActions)
                    {
                        script.Value();
                    }
                }

                writer.WriteLine(<span class="str">"&lt;/script&gt;"</span>);
            }
        }


        <span class="kwrd">private</span> <span class="kwrd">static</span> MethodInfo _getWebResourceUrlMethod;
        <span class="kwrd">private</span> <span class="kwrd">static</span> <span class="kwrd">object</span> _getWebResourceUrlLock = <span class="kwrd">new</span> <span class="kwrd">object</span>();

        <span class="kwrd">private</span> <span class="kwrd">static</span> <span class="kwrd">string</span> getWebResourceUrl&lt;T&gt;(<span class="kwrd">string</span> resourceName)
        {
            <span class="kwrd">if</span> (<span class="kwrd">string</span>.IsNullOrEmpty(resourceName))
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> ArgumentNullException(<span class="str">"resourceName"</span>);
            }

            <span class="kwrd">if</span> (_getWebResourceUrlMethod == <span class="kwrd">null</span>)
            {
                <span class="kwrd">lock</span> (_getWebResourceUrlLock)
                {
                    <span class="kwrd">if</span> (_getWebResourceUrlMethod == <span class="kwrd">null</span>)
                    {
                        _getWebResourceUrlMethod = <span class="kwrd">typeof</span>(System.Web.Handlers.AssemblyResourceLoader).GetMethod(
                            <span class="str">"GetWebResourceUrlInternal"</span>,
                            BindingFlags.NonPublic | BindingFlags.Static);
                    }
                }
            }

            <span class="kwrd">return</span> <span class="str">"/"</span> + (<span class="kwrd">string</span>)_getWebResourceUrlMethod.Invoke(<span class="kwrd">null</span>,
                <span class="kwrd">new</span> <span class="kwrd">object</span>[] { Assembly.GetAssembly(<span class="kwrd">typeof</span>(T)), resourceName, <span class="kwrd">false</span> });
        }

    }
}</pre>
<h3>&nbsp;</h3>
<h3>Conclusion</h3>
<p>At first it seemed that the easiest way to get similar functionality to this was to use the ASP.NET AJAX ScriptManager control; however that control requires that it be embedded within a <em>&lt;form runat=&rdquo;server&rdquo;&gt;&lt;/form&gt;</em> tag, and that just doesn&rsquo;t really work with ASP.NET MVC. Actually the methods to get the ASP.NET AJAX ScriptManager to work with ASP.NET MVC are just plain &ldquo;Hacks&rdquo; and they made me feel like I wasn&rsquo;t being True to the new ASP.NET MVC Platform.</p>
<p>In the end, I&rsquo;m very happy that I was able to work out an extremely simple solution to this problem that will definitely help when building out ASP.NET MVC Web Applications.</p>
<p>If you have any feedback on this, please leave a comment.</p>
