  ---
  layout: post
  title: "Bing Maps Ajax 7: Add Custom Navigation Bar Buttons using jQuery"
  date: 2010-12-18 09:42:19 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["Bing Maps"]
  alias: ["/post/2010/12/18/Bing-Maps-Ajax-7-Add-Custom-Navigation-Bar-Buttons-using-jQuery", "/post/2010/12/18/bing-maps-ajax-7-add-custom-navigation-bar-buttons-using-jquery"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>The Bing Maps Ajax v7 control does not include support for adding custom buttons to the navigation bar (where the zoom, pan and map style buttons are). There may be times when you will want to add a custom button or two, and this post contains some simple code that will help you do so.</p>  <p>Here’s a screenshot of this in action. The ‘Click Me’ link in the navigation bar is a custom button that the below code adds.</p>  <p><a href="http://pietschsoft.com/image.axd?picture=BingMapsAjax7CustomNavBarButton.png"><img style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top: 0px; border-right: 0px; padding-top: 0px" title="BingMapsAjax7CustomNavBarButton" border="0" alt="BingMapsAjax7CustomNavBarButton" src="http://pietschsoft.com/image.axd?picture=BingMapsAjax7CustomNavBarButton_thumb.png" width="359" height="105" /></a></p>  <h3>Code</h3>  <p>First, here’s the code that I came up with to add custom navigation bar buttons:</p>  <pre class="csharpcode"><span class="rem">// Simple Method to Add a Custom Button to the NavBar using jQuery</span>
<span class="kwrd">var</span> addNavButton = <span class="kwrd">function</span> (mapElement, content, onclick) {
    $(mapElement).find(<span class="str">'.NavBar_typeButtonContainer'</span>).append(
        <span class="rem">// Add a Separator between this button and any existing buttons</span>
        $(<span class="str">'&lt;span&gt;'</span>).addClass(<span class="str">'NavBar_separator'</span>)
    ).append(
        <span class="rem">// Add the Custom Button itself</span>
        $(<span class="str">'&lt;a&gt;'</span>).attr(<span class="str">'href'</span>, <span class="str">'#'</span>).addClass(<span class="str">'NavBar_button'</span>).
            append($(<span class="str">'&lt;span&gt;'</span>).html(content).click(onclick))
    );
};
<span class="rem">// Use setTimeout to load Custom NavBar button if you are adding</span>
<span class="rem">// the button immediatly after instantiating the map.</span>
<span class="rem">// Timeout is needed since Bing Maps 7 doesn't currently have</span>
<span class="rem">// any kind of &quot;onload&quot; event to handle.</span>
window.setTimeout(<span class="kwrd">function</span> () {
    <span class="rem">// Add Custom Button to NavBar</span>
    addNavButton(
        document.getElementById(<span class="str">'myMap'</span>), <span class="rem">// &lt;- Maps DIV</span>
        <span class="str">'Click Me'</span>, <span class="rem">// &lt;- Content of Button - You can put HTML in here if you want</span>
        <span class="kwrd">function</span> () { <span class="rem">// &lt;- Method to call during buttons Click event</span>
            alert(<span class="str">'You Clicked Me!'</span>);
        }
    );
}, 100);</pre>
<style type="text/css">
.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>

<h3>Explanations</h3>

<p>The above code does require the <a href="http://jquery.com">jQuery</a> library, which is how this code is so short and simple.</p>

<p>If you call the ‘addNavButton’ function immediately after instantiating the Bing Map, then you will need to include a ‘window.setTimeout’ (as in the code above) to make sure that the Map has finished loading before you try to add the custom button. This is necessary because the Bing Maps Ajax v7 control doesn’t include any kind of ‘onload’ event to be handled.</p>
