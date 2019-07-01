  ---
  layout: post
  title: "Virtual Earth: Convert Road Map Style to Shaded Like maps.live.com does"
  date: 2007-12-26 22:47:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["Bing Maps"]
  alias: ["/post/2007/12/26/Virtual-Earth-Convert-Road-Map-Style-to-Shaded-Like-mapslivecom-does", "/post/2007/12/26/virtual-earth-convert-road-map-style-to-shaded-like-mapslivecom-does"]
  ---
<!-- more -->
<h3>What is the Shaded map Style?</h3>
<p>
If you&#39;ve used <a href="http://maps.live.com/">maps.live.com</a> and Virtual Earth, then you&#39;ve probably noticed that the Road map style in the Virtual Earth API isn&#39;t the same as it is on <a href="http://maps.live.com/">maps.live.com</a>. This is because the&nbsp;Road map style on <a href="http://maps.live.com/">maps.live.com</a> is actually not using the VEMapStyle.Road map style, but instead is using VEMapStyle.Shaded. The <a href="http://msdn2.microsoft.com/en-us/library/bb412515.aspx">VEMapStyle.Shaded</a> map style is the standard Road style with Shaded Contours drawn on the map, and is new to Virtual Earth v6.0. In this article, I will show you how to hook in to Virtual Earth and make it show the Shaded map style when ever the user selects the Road style on the map dashboard.
</p>
<h3>Replace Road Map Style with the New Shaded Map&nbsp;Style</h3>
<p>
<strong>Step 1:</strong> This article assumes you have a basic understanding of Virtual Earth. If you don&#39;t, then go check out the following article before going on: <a href="/Blog/Post.aspx?PostID=1435">Virtual Earth: Getting Started - Adding a basic Map to a page</a>
</p>
<p>
<strong>Step 2:</strong> Set the Map to Load with the Shaded map style showing. The best way to do this is to send the Shaded Map Style as the Map Style Paramater of the maps LoadMap method.
</p>
<font size="2">
<p>
map.LoadMap(<font size="2" color="#0000ff">new</font><font size="2"> VELatLong(47.6, -122.33), 7, VEMapStyle.Shaded);</font>
</p>
</font>
<p>
<strong>Step 3: </strong>Attach an Event Handler to the Virtual Earth &quot;<a href="http://msdn2.microsoft.com/en-us/library/bb429617.aspx">onchangemapstyle</a>&quot; event.
</p>
<p>
To do this we first need to create our StyleChangeHandler method:
</p>
<font size="2" color="#0000ff">
<p>
function<font size="2"> StyleChangeHandler(e)<br />
{<br />
}</font>
</p>
</font>
<p>
Then, after the LoadMap method is called, we will use the maps <a href="http://msdn2.microsoft.com/en-us/library/bb412496.aspx">AttachEvent</a> method to attach our event handlers:
</p>
<font size="2">
<p>
map.AttachEvent(<font size="2" color="#a31515">&quot;onchangemapstyle&quot;</font><font size="2">, StyleChangeHandler);</font>
</p>
</font>
<p>
<em>Note: The variable named &quot;map&quot; is the global variable that holds a reference to our instance of the Virtual Earth Map. If you are using a different variable name, then you&#39;ll need to change it to your name through-out the rest of the article.</em>
</p>
<p>
<strong>Step 4:</strong> Now that we have our event handler in place, we need to add code to it that will change the map style to <a href="http://msdn2.microsoft.com/en-us/library/bb412515.aspx">Shaded</a> when ever the map style gets changed to Road. Add the following code to the StyleChangedHandler:
</p>
<font size="2" color="#0000ff">
<p>
if<font size="2"> (map.GetMapStyle() == VEMapStyle.Road)<br />
{<br />
map.SetMapStyle(VEMapStyle.Shaded);<br />
}</font>
</p>
</font>
<p>
<strong>Step 5:</strong> Now, run the page and you&#39;ll see the new Shaded map style in place of the Road map style, just like <a href="http://maps.live.com/">maps.live.com</a>.
</p>
<h3>Complete Code For This Article</h3>
<p>
For easier reference, and so you don&#39;t have to type everything in yourself; here&#39;s the complete code from this article:
</p>
<p>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;&gt;<br />
&lt;script type=&quot;text/javascript&quot; src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6</a>&quot; mce_src=&quot;<a href="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script">http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6&quot;&gt;&lt;/script</a>&gt;<br />
&lt;/head&gt;
</p>
<p>
&lt;body onload=&quot;PageLoad()&quot;&gt;<br />
&lt;script type=&quot;text/javascript&quot;&gt;<br />
var map = null; /// This is a global reference to the VEMap object
</p>
<p>
function PageLoad()<br />
{<br />
&nbsp;&nbsp;&nbsp; map = new VEMap(&#39;myMap&#39;);<br />
&nbsp;&nbsp;&nbsp; /// Load the map with the Shaded Map Style<br />
&nbsp;&nbsp;&nbsp; map.LoadMap(new VELatLong(47.6, -122.33), 7, VEMapStyle.Shaded);<br />
&nbsp;&nbsp;&nbsp; /// Attach our event handler<br />
&nbsp;&nbsp;&nbsp; map.AttachEvent(&quot;onchangemapstyle&quot;, StyleChangeHandler);<br />
}
</p>
<p>
function StyleChangeHandler(e)<br />
{<br />
&nbsp;&nbsp;&nbsp; /// Change the map style to Shaded if it&#39;s set to Road<br />
&nbsp;&nbsp;&nbsp; if (map.GetMapStyle() == VEMapStyle.Road)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map.SetMapStyle(VEMapStyle.Shaded);<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
&lt;/script&gt;
</p>
<p>
&lt;div id=&quot;myMap&quot; style=&quot;position:relative; width:400px; height:400px;&quot;&gt;&lt;/div&gt;
</p>
<p>
&lt;/body&gt;<br />
&lt;/html&gt;
</p>
