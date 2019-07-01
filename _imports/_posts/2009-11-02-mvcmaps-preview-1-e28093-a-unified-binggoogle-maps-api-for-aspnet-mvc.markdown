  ---
  layout: post
  title: "MvcMaps Preview 1 – A Unified Bing/Google Maps API for ASP.NET MVC"
  date: 2009-11-02 22:01:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["ASP.NET MVC", "Bing Maps"]
  alias: ["/post/2009/11/02/MvcMaps-Preview-1-e28093-A-Unified-BingGoogle-Maps-API-for-ASPNET-MVC", "/post/2009/11/02/mvcmaps-preview-1-e28093-a-unified-binggoogle-maps-api-for-aspnet-mvc"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>I spent some time lately working on bringing some of the concepts of Web.Maps.VE to ASP.NET MVC. The concepts I&rsquo;m referring to are Simplicity and Ease of Development in making the implementation of mapping within ASP.NET MVC applications as simple as possible along with the Flexibility and Customizability of the Base Mapping API itself. Then I thought, Since I&rsquo;m building an abstraction layer to simplify Bing Maps development, why not implement it in a flexible manor as to be able to support other Mapping API&rsquo;s as well?</p>
<p>The result of such an effort in a nice Unified API that allows virtually the same code to be written when implementing either Bing Maps or Google Maps. In fact, all you need to do to change your application over to using one mapping provider instead of the other is to just change a single line of code.</p>
<p>Sound too good to be true?</p>
<p>I introduce you to the all new &ldquo;<a title="MvcMaps Project" href="http://mvcmaps.codeplex.com" target="_blank">MvcMaps</a>&rdquo; project, and I&rsquo;m releasing it as Open Source under the Microsoft Public License.</p>
<p>Source Code: <a title="MvcMaps Preview 1 Release Source Code" href="http://mvcmaps.codeplex.com/Release/ProjectReleases.aspx?ReleaseId=35231" target="_blank">MvcMaps Preview 1 (698Kb)</a></p>
<h3>Preview Release?</h3>
<p>This initial release is just a &ldquo;Preview&rdquo; release and isn&rsquo;t really meant for production use, although there&rsquo;s absolutely nothing stopping you from using it in such an environment.</p>
<h3>Introduction</h3>
<p>The above source code download link contains the full source code for the component, plus a very basic &ldquo;Interactive SDK&rdquo; style website demonstrating some basic examples of using it.</p>
<p>The following snippet is the most basic example of how to add both a Bing Map and a Google Map within a View:</p>
<pre class="csharpcode"><span class="asp">&lt;%@ Import Namespace="MvcMaps" %&gt;</span>

<span class="kwrd">&lt;</span><span class="html">style</span> <span class="attr">type</span><span class="kwrd">="text/javascript"</span><span class="kwrd">&gt;</span>
.BingMap
{
    width: 600px;
    height: 400px;
    border: solid 1px black;
}
.GoogleMap
{
    width: 600px;
    height: 400px;
    border: solid 1px black;
}
<span class="kwrd">&lt;/</span><span class="html">style</span><span class="kwrd">&gt;</span>

<span class="kwrd">&lt;</span><span class="html">h3</span><span class="kwrd">&gt;</span>Bing Map<span class="kwrd">&lt;/</span><span class="html">h3</span><span class="kwrd">&gt;</span>
<span class="asp">&lt;%</span> Ajax.BingMap()     <span class="rem">// Create a Bing Map</span>
    .CssClass(<span class="str">"BingMap"</span>) <span class="rem">// Define the CSS Style to use. These specify the Maps Size</span>
    .Render();           <span class="rem">// Render all the HTML / JavaScript necessary to create the Map to Server.Response</span>
    <span class="asp">%&gt;</span>

<span class="kwrd">&lt;</span><span class="html">h3</span><span class="kwrd">&gt;</span>Google Map<span class="kwrd">&lt;/</span><span class="html">h3</span><span class="kwrd">&gt;</span>
<span class="asp">&lt;%</span> Ajax.GoogleMap()      <span class="rem">// Create a Google Map</span>
    .CssClass(<span class="str">"GoogleMap"</span>)  <span class="rem">// Define the CSS Style to use. These specify the Maps Size</span>
    .Render();              <span class="rem">// Render all the HTML / JavaScript necessary to create the Map to Server.Response</span>
    <span class="asp">%&gt;</span></pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<p>Notice that the code is idential, except for the &ldquo;BingMap&rdquo; and &ldquo;GoogleMap&rdquo; parts. That is how you define the specific mapping provider to use, but the rest of the code is the same.</p>
<h3>Plotting Pushpins, Polylines and Polygons</h3>
<p>Adding some Pushpins, Polylines and Polygons is extremely simple, and its the same code for both Bing Maps and Google Maps!</p>
<p>Here&rsquo;s a basic example of adding one of each:</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Ajax.BingMap().CssClass(<span class="str">"BingMap"</span>)
    <span class="rem">// Add Pushpin Shape</span>
    .AddPushpin(
        <span class="kwrd">new</span> Pushpin(39.9097362345372, -97.470703125,
             <span class="str">"Some Pushpin Title"</span>, <span class="str">"Some Pushpin Description"</span>)
        )
    
    <span class="rem">// Add Polyline Shape</span>
    .AddPolyline(
        <span class="kwrd">new</span> Polyline(<span class="kwrd">new</span> List&lt;LatLng&gt;() {
            <span class="kwrd">new</span> LatLng(48.166085, -121.11328),
            <span class="kwrd">new</span> LatLng(34.270835, -118.34472),
            <span class="kwrd">new</span> LatLng(43.041543, -87.901954),
            <span class="kwrd">new</span> LatLng(38.889546, -77.035338)
        }) {
            LineColor = <span class="str">"#0000FF"</span>,
            LineWeight = 6
        }
    )
    
    <span class="rem">// Add Polygon Shape</span>
    .AddPolygon(
        <span class="kwrd">new</span> Polygon(<span class="kwrd">new</span> List&lt;LatLng&gt;() {
            <span class="kwrd">new</span> LatLng(34.270835, -118.34472),
            <span class="kwrd">new</span> LatLng(43.041543, -87.901954),
            <span class="kwrd">new</span> LatLng(38.889546, -77.035338)
        }) {
            FillColor = <span class="str">"#00ff00"</span>,
            FillOpacity = 0.5,
            LineWeight = 2,
            LineColor = <span class="str">"#FF0000"</span>
        }
    )
    
    <span class="rem">// Render Map (HTML and JavaScript) to the Page</span>
    .Render()
<span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<h3>Dynamic / Interactive Style Map</h3>
<p>One of the <strong>coolest</strong> features I&rsquo;ve built into the component so far is the ability to extremely easily add Dynamic / Interactive Style Map.</p>
<p>You probably wouldn&rsquo;t believe me if I explained in words how simple it is to add a dynamic style map, so instead I&rsquo;ll just show you the most basic code to get it working.</p>
<p>Here&rsquo;s the code to add the Map to the Page. In this example you just tell the Map what Controller and Action to call to get the Map data to be displayed.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span> Ajax.BingMap()
    .CssClass(<span class="str">"BingMap"</span>)
    .DynamicMap( <span class="kwrd">new</span> { controller = <span class="str">"DynamicMap"</span>, action = <span class="str">"SchoolDistricts"</span> })
    .Render();
<span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<p>Then you define your Controller Action, make it accept the Map View (or Map Bounds) which are essentially the Min and Max Lat/Lng values of the visible area on the client, and then you just return a &ldquo;MapDataResult&rdquo; object that contains the Pushpins, Polylines and Polygons to be plotted.</p>
<p>The following example demonstrates searching an XML file for School Districts within the Maps Viewable Area, and then plots them on the Map using Pushpins. As of MvcMaps Preview 1, only Pushpins are supported with the MapDataResult object.</p>
<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> DynamicMapController : Controller
{
    <span class="kwrd">public</span> ActionResult SchoolDistricts(<span class="kwrd">double</span> minLat, <span class="kwrd">double</span> maxLat, <span class="kwrd">double</span> minLng, <span class="kwrd">double</span> maxLng)
    {
        <span class="rem">// Query and Get all School Districts within the passed in "Map View".</span>
        var doc = XDocument.Load(Server.MapPath(<span class="str">"~/App_Data/WISchoolDistricts.xml"</span>));
        var schooldistricts = (from d <span class="kwrd">in</span> doc.Element(<span class="str">"schooldistricts"</span>).Elements(<span class="str">"schooldistrict"</span>)
                        <span class="kwrd">where</span> <span class="kwrd">double</span>.Parse(d.Attribute(<span class="str">"latitude"</span>).Value) &gt;= minLat
                        &amp;&amp; <span class="kwrd">double</span>.Parse(d.Attribute(<span class="str">"latitude"</span>).Value) &lt;= maxLat
                        &amp;&amp; <span class="kwrd">double</span>.Parse(d.Attribute(<span class="str">"longitude"</span>).Value) &gt;= minLng
                        &amp;&amp; <span class="kwrd">double</span>.Parse(d.Attribute(<span class="str">"longitude"</span>).Value) &lt;= maxLng
                        select d
                    );

        <span class="rem">// Generate "Pushpin" objects for each School District to be Plotted on the Map.</span>
        var pushpins = (from d <span class="kwrd">in</span> schooldistricts
                        select(<span class="kwrd">new</span> Pushpin(
                            <span class="kwrd">double</span>.Parse(d.Attribute(<span class="str">"latitude"</span>).Value),
                            <span class="kwrd">double</span>.Parse(d.Attribute(<span class="str">"longitude"</span>).Value)
                        ){
                            Title = d.Attribute(<span class="str">"name"</span>).Value,
                            Description = d.Attribute(<span class="str">"address"</span>).Value
                        }));

        <span class="rem">// Return a "MapDataResult" object that contains all the data that is to be Plotted on the Map.</span>
        <span class="kwrd">return</span> <span class="kwrd">new</span> MapDataResult()
        {
            Pushpins = pushpins
        };
    }
}</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<p><strong>Yes it really is that simple!!</strong></p>
<h3>How to Customize the Dynamic Map</h3>
<p>The Dynamic Map example above is nice and simple, but if you need to customize the client-side map behavior somehow, don&rsquo;t worry, there are &ldquo;override&rdquo; hooks built in to the component that allow you to override the complete behavior of the map in how it displays the data, or just execute some custom code on the returned data after it&rsquo;s already been plotted.</p>
<p>You can use the DynamicMap&nbsp; DataLoad option to specify a JavaScript function to get called every time map data is automatically loaded. The following example displayed the total number of Pushpins currently plotted in a SPAN tag above the Map. The &ldquo;data&rdquo; parameter on the function is the data object that is returned from the MapDataResult passed down from the controller action method.</p>
<pre class="csharpcode">Pushpin Count: <span class="kwrd">&lt;</span><span class="html">span</span> <span class="attr">id</span><span class="kwrd">='lblPushpinCount'</span><span class="kwrd">&gt;&lt;/</span><span class="html">span</span><span class="kwrd">&gt;&lt;</span><span class="html">br</span> <span class="kwrd">/&gt;</span>
<span class="asp">&lt;%</span> Ajax.BingMap()
    .CssClass(<span class="str">"BingMap"</span>)
    .DynamicMap(
        <span class="kwrd">new</span> { controller = <span class="str">"DynamicMap"</span>, action = <span class="str">"SchoolDistricts"</span> },
        <span class="kwrd">new</span> DynamicMapOptions() {
            DataLoaded = <span class="str">"function(data) { $('#lblPushpinCount').html(data.pushpins.length); }"</span>
        })
    .Render();
<span class="asp">%&gt;</span></pre>
<p>&nbsp;</p>
<p>Also, you can use the DynamicMap DisplayData option to completely override the maps default behavior of plotting the data. Just in case you need to completely customize it, and the default behavior just doesn&rsquo;t cut it. The following example plots the Pushpins returned and displays the total number of pushpins in a SPAN tag above the Map:</p>
<pre class="csharpcode">Pushpin Count: <span class="kwrd">&lt;</span><span class="html">span</span> <span class="attr">id</span><span class="kwrd">='lblPushpinCount'</span><span class="kwrd">&gt;&lt;/</span><span class="html">span</span><span class="kwrd">&gt;</span>
<span class="asp">&lt;%</span> Ajax.BingMap()
    .CssClass(<span class="str">"BingMap"</span>)
    .DynamicMap(
        <span class="kwrd">new</span> { controller = <span class="str">"DynamicMap"</span>, action = <span class="str">"SchoolDistricts"</span> },
        <span class="kwrd">new</span> DynamicMapOptions() {
            DisplayData = <span class="str">"DynamicMap_DisplayData_Handler"</span>
        })
    .Render();
<span class="asp">%&gt;</span>

<span class="kwrd">&lt;</span><span class="html">script</span> <span class="attr">type</span><span class="kwrd">="text/javascritp"</span><span class="kwrd">&gt;</span>
<span class="kwrd">function</span> DynamicMap_DisplayData_Handler(data) {
    <span class="rem">// Method gets called with "this" equaling the Mvc.Maps JavaScript Map Object</span>
    
    <span class="rem">// Clear All Currently Plotted Data</span>
    <span class="kwrd">this</span>.clearDynamicMapData();
    
    <span class="rem">// Plot New Pushpins that were Loaded</span>
    <span class="kwrd">this</span>.plotPushpins(data.pushpins);

    <span class="rem">// Display Pushpin Count</span>
    $(<span class="str">'#lblPushpinCount'</span>).html(data.pushpins.length);
}
<span class="kwrd">&lt;/</span><span class="html">script</span><span class="kwrd">&gt;</span></pre>
<p>&nbsp;</p>
<h3>Map Load Event</h3>
<p>In case you need to execute some code on the Page as soon as the Map has finished loading, you can specify any JavaScript code you need to be executed.</p>
<pre class="csharpcode"><span class="asp">&lt;%</span>-- Pass <span class="kwrd">in</span> JavaScript <span class="kwrd">as</span> String --<span class="asp">%&gt;</span>
<span class="asp">&lt;%</span> Ajax.GoogleMap()
        .Load(<span class="str">"alert('Map Loaded!');"</span>)
        .Render();
        <span class="asp">%&gt;</span>
        
<span class="asp">&lt;%</span>-- Use Lambda Expression to define JavaScript code --<span class="asp">%&gt;</span>
<span class="asp">&lt;%</span> Ajax.GoogleMap()
        .Load( () =&gt; {<span class="asp">%&gt;</span>
            alert('Map Loaded!');
            // var map = this.mapObject  //<span class="kwrd">&lt;</span><span class="html">--</span> get ref to underlying map providers object
        <span class="asp">&lt;%</span>})
        .Render();
        <span class="asp">%&gt;</span></pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>When specifying code to execute on the Load event, the context of the &ldquo;this&rdquo; keyword will be a reference to the client-side MvcMaps Map Object. To get a reference to the underlying Map Providers object (VEMap or GMap2), just access it&rsquo;s &ldquo;mapObject&rdquo; property like so:</p>
<pre class="csharpcode"><span class="kwrd">var</span> map = <span class="kwrd">this</span>.mapObject;</pre>
<p><!-- .csharpcode, .csharpcode pre { 	font-size: small; 	color: black; 	font-family: consolas, "Courier New", courier, monospace; 	background-color: #ffffff; 	/*white-space: pre;*/ } .csharpcode pre { margin: 0em; } .csharpcode .rem { color: #008000; } .csharpcode .kwrd { color: #0000ff; } .csharpcode .str { color: #006080; } .csharpcode .op { color: #0000c0; } .csharpcode .preproc { color: #cc6633; } .csharpcode .asp { background-color: #ffff00; } .csharpcode .html { color: #800000; } .csharpcode .attr { color: #ff0000; } .csharpcode .alt  { 	background-color: #f4f4f4; 	width: 100%; 	margin: 0em; } .csharpcode .lnum { color: #606060; } --></p>
<p>&nbsp;</p>
<h3>Conclusion</h3>
<p>The <a href="http://mvcmaps.codeplex.com" target="_blank">MvcMaps</a> project really makes it dead simple to implement mapping in an ASP.NET MVC Web Application. There&rsquo;s no need to worry about all the tedious work that you used to have to do on every page.</p>
<p>I plan on building out a few more features into the component, and getting it to the point of a &ldquo;Stable&rdquo; release soon. I just wanted to share what I&rsquo;ve done so far, so others can provide feedback.</p>
<p>If you have any comments and/or suggestions on the Preview 1 release, please either leave a comment here or post to the projects <a title="MvcMaps Discussion Forums" href="http://mvcmaps.codeplex.com/Thread/List.aspx" target="_blank">Discussion Forums</a>.</p>
<p>Also, don&rsquo;t forget to download the code and the &ldquo;Interactive SDK&rdquo; from the link at the top of this post.</p>
