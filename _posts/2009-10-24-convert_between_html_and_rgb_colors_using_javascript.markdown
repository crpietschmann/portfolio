---
layout: post
blogengineid: 4b595a62-7f09-41cc-9ca3-da351bb27a8a
title: "Easily Convert Between HTML and RGB Colors using JavaScript"
date: 2009-10-24 14:08:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps", "JavaScript"]
redirect_from: 
  - /post/2009/10/24/Convert_Between_HTML_and_RGB_Colors_using_JavaScript
  - /post/2009/10/24/convert_between_html_and_rgb_colors_using_javascript
  - /post.aspx?id=4b595a62-7f09-41cc-9ca3-da351bb27a8a
---
<!-- more -->

To make things easier for converting between HTML Colors and RGB Colors using JavaScript I wrote the below &ldquo;ColorConverter&rdquo; object. This object has 2 methods that easily allow you to convert between HTML Colors (ex: #FF33C2) and RGB Colors (ex: 255, 0, 233). There isn&rsquo;t anything built into JavaScript for doing this, and it can come in very handing when working with the <a href="http://msdn.microsoft.com/en-us/library/bb412453.aspx" target="_blank">Bing Maps VEColor object</a>.

Usage Examples:
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">var rgb = ColorConverter.toRGB("#FF000A"); // returns {r:255, g:0, b:10}

var htmlColor = ColorConverter.toHTML(255,0,14); // returns "FF0021"

// Also supports 3 character HTML color values like the Web Browsers and CSS do
rgb = ColorConverter.toRGB("#DDD"); // returns {r:255, g:255, b:255}</pre>

Full Code for the &ldquo;ColorConverter&rdquo;:
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">(function(){
    window.ColorConverter = {
        toHTML: function(r, g, b){
            return $ensureHexLength(r.toString(16)) + $ensureHexLength(g.toString(16)) + $ensureHexLength(b.toString(16));
        },
        toRGB: function(color){
            var r, g, b;
            var html = color;
            
            // Parse out the RGB values from the HTML Code
            if (html.substring(0, 1) == "#")
            {
                html = html.substring(1);
            }
            
            if (html.length == 3)
            {
                r = html.substring(0, 1);
                r = r + r;
                
                g = html.substring(1, 2);
                g = g + g;
                
                b = html.substring(2, 3);
                b = b + b;
            }
            else if (html.length == 6)
            {
                r = html.substring(0, 2);
                g = html.substring(2, 4);
                b = html.substring(4, 6);
            }
        
            // Convert from Hex (Hexidecimal) to Decimal
            r = parseInt(r, 16);
            g = parseInt(g, 16);
            b = parseInt(b, 16);
        
            return {r: r, g: g, b: b};
        }
    };
    
    function $ensureHexLength(str){
        if (str.length == 1){
            str = "0" + str;
        }
        return str;
    }
})();</pre>
