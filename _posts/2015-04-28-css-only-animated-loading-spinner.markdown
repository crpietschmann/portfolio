  ---
  layout: post
  title: "CSS-only Animated Loading Spinner"
  date: 2015-04-28 09:00:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["CSS"]
  alias: ["/post/2015/04/28/CSS-only-Animated-Loading-Spinner", "/post/2015/04/28/css-only-animated-loading-spinner"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p><a href="http://www.w3schools.com/css/css3_animations.asp" target="_blank">CSS Animations</a> are a feature that's been around for a few years, but not many web developers know about it. CSS Animations allow you to define animations and transitions for HTML elements without the need to write JavaScript to do it, or even create an animated GIF file.</p>
<p><img src="/image.axd?picture=%2f2015%2f04%2fCSS-Spinner.gif" alt="" /></p>
<p>Here's a simple Loading Spinner using a simple CSS Animation:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">&lt;style&gt;
    @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
    .spinner {
        animation: spin 1s infinite linear;
        width: 1em;
        height: 1em;
    }
    .spinner.stop {
        /* when this class is applied the animation will stop */
        animation: none;
    }
    .circle {
        border: solid 0.05em black;
        width: 1em;
        height: 1em;
        border-radius: 1em;
        border-left: none;
        border-bottom: none;
        border-right: none;
    }
&lt;/style&gt;
&lt;div class="spinner"&gt;
    &lt;div class="circle"&gt;&lt;/div&gt;
&lt;/div&gt;</pre>
<p>Download Full Code:</p>
<p><a href="/FILES%2f2015%2f04%2fCSS-Spinner.zip.axdx">CSS-Spinner.zip (547.00 bytes)</a></p>
