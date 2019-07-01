  ---
  layout: post
  title: "jHtmlArea - The all NEW HTML WYSIWYG Editor for jQuery"
  date: 2009-07-21 19:11:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2009/07/21/jHtmlArea-The-all-NEW-HTML-WYSIWYG-Editor-for-jQuery", "/post/2009/07/21/jhtmlarea-the-all-new-html-wysiwyg-editor-for-jquery"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p><img src="/image.axd?picture=2009%2f7%2fScreenshot.png" alt="" width="298" height="402" align="right" /></p>
<p>The last couple days I spent time working on a new simple, lightweight, extensible HTML WYSIWYG editor that's built on top of jQuery. I know there are a ton of existing editors, but <a href="http://stackoverflow.com/questions/1141073/whats-the-best-wysiwyg-editor-for-use-with-jquery">I couldn't seem to find any with a truely simple, lightweight design that allowed for really easy extensibility</a>, and that's built on top of jQuery to take advantage of the cross-platform capabilities that jQuery has to offer. I feel that I've come up with a really nice HTML editor component that has some pretty usefull extensibility points. Allow me to introduce you to <a href="http://jhtmlarea.codeplex.com">jHTMLArea</a>.</p>
<p>You can download jHtmlArea and some examples of using it over at the official project page on CodePlex: <a href="http://jhtmlarea.codeplex.com">http://jhtmlarea.codeplex.com</a></p>
<p>To the right there's a screenshot of two instances of jHtmlArea in action. The first one is using the "default" configuration, and the second uses a couple of different custom options, including a completely custom "Save" button that's added using one of jHtmlArea's extensibility points.</p>
<h3>Using jHtmlArea is As Simple As 1.2.3.</h3>
<p>Follow these 3 steps and you'll have jHtmlArea implemented within your application in no time.</p>
<p><strong>1. </strong>Add a &lt;TextArea&gt; to your HTML page</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;textarea&gt;&lt;/textarea&gt;</pre>
<p><strong>2. </strong>Add the "jHtmlArea.js", "jHtmlArea.css" and "jHtmlArea.png" files to your website</p>
<p><strong>3.</strong> Add the following JavaScript code to your page to turn all TextArea elements into jHtmlArea's:</p>
<p>Include the jHtmlArea javascript file:</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;script type="text/javascript" src="jHtmlArea-0.6.0.min.js"&gt;&lt;/script&gt;</pre>
<p>Turn all TextArea&rsquo;s into jHtmlArea&rsquo;s:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$(function(){
    $("textarea").htmlarea();
});</pre>
<p>It can be as simple as that to use jHtmlArea within your pages to turn any TextArea DOM Elements into nice jHtmlArea WYSIWYG Editors.</p>
<h3>Easily Configure Toolbar Buttons</h3>
<p>jHtmlArea makes it extremely simple to define your own custom set of Toolbar buttons; just in case you don't want to show the full set of "default" buttons.</p>
<p>You can easily specify them by name within an array that's passed in as one of the options specified when you call the "htmlarea" method:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$("#txtCustomHtmlArea").htmlarea({
    toolbar: ["bold", "italic", "underline", "|", "h1", "h2", "h3", "h4", "h5", "h6", "|", "link", "unlink"]
});</pre>
<p>This example will specify the same buttons displayed in the lower screenshot to the right; minus the "Save" button on the far right of the toolbar. I'll show you how to add this button in the next example.</p>
<h3>Add Custom Toolbar Buttons</h3>
<p>One of the extensibility points that I was wanting to have in an HTML WYSIWYG editor is the ability to easily add any custom buttons to the toolbar. For instance, some times it may be nice to have a "Save" button in the toolbar to allow your users to easily save the contents of the editor.</p>
<p>Here's an example using the above "custom" toolbar buttons list, with a custom "Save" button added:</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$("#txtCustomHtmlArea").htmlarea({
    toolbar: ["bold", "italic", "underline", "|", "h1", "h2", "h3", "h4", "h5", "h6", "|", "link", "unlink", "|",
        // This is how to add a completely custom Toolbar Button
        {
            // The CSS Class to assign the Button &lt;a&gt; tag
            css: "custom_disk_button",

            // The Text to display in the buttons alt text / tooltip
            text: "Save",

            // The function to execute when the button is clicked
            action: function(btn) {
                // 'this' = jHtmlArea object
                // 'btn' = jQuery object that represents the &lt;A&gt; "anchor" tag for the Toolbar Button

                alert('SAVE!\n\n' + this.toHtmlString());

                // Add any Ajax Code here to save the contents of the editor

            }
        }
    ]
});</pre>
<p>Once the JavaScript code is entered to add the custom "Save" button, we then need to add the buttons display image to the website, and then include the necessary CSS to allow it to be displayed:</p>
<pre class="brush: css; first-line: 1; tab-size: 4; toolbar: false; ">div.jHtmlArea .ToolBar ul li a.custom_disk_button 
{
    background: url(images/disk.png) no-repeat;
    background-position: 0 0;
}</pre>
<h3>What about Localization?</h3>
<p>Well, the jHtmlEditor currently only comes with English text for all the button names / tooltips. However, it is extremely simple to specify your own text to use when calling the "htmlarea" to create jHtmlArea editors within the page. You set the Text to be displayed for each button by referencing it by "name". This is the same "name" that is used in the first example to specify which buttons are displayed in the toolbar.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$("#txtCustomHtmlArea").htmlarea({
    // Override any of the toolbarText values - these are the Alt Text / Tooltips shown
    // when the user hovers the mouse over the Toolbar Buttons
    // Here are a couple translated to German, thanks to Google Translate.
    toolbarText: $.extend({}, jHtmlArea.defaultOptions.toolbarText, {
            "bold": "fett",
            "italic": "kursiv",
            "underline": "unterstreichen"
        })
});</pre>
<h3>Specify CSS File to be used by the Editor</h3>
<p>You can also specify a specify CSS file to be used within the Editor itself.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$("#txtCustomHtmlArea").htmlarea({
    css: "style//jHtmlArea.Editor.css"
});</pre>
<h3>Specify a Callback when the Editor Finishes Loading</h3>
<p>It may be nice in some instances to get notified when the editor has finsihed loading in the page so you can perform some kind of action. This is also really simple to do.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">$("#txtCustomHtmlArea").htmlarea({
    // Do something once the editor has finished loading
    loaded: function() {
        //// 'this' is equal to the jHtmlArea object

        alert("jHtmlArea has loaded!");

        //this.showHTMLView(); // show the HTML view once the editor has finished loading
    }
});</pre>
<h3>Call any jHtmlArea object methods easily from jQuery</h3>
<p>Another thing is that the jQuery object doesn't directly expose the different jHtmlArea object's methods. However, you can use the "htmlarea" method to call any of them you need to. All you need to do is specify the method by name that you want to call and pass any additional parameters to the "htmlarea" method and it'll return the results.</p>
<pre class="brush: js; first-line: 1; tab-size: 4; toolbar: false; ">// Get the HTML string value from within the editor
var html = $("#txtCustomHtmlArea").htmlarea("toHtmlString");

// Insert a specify Image that you want
$("#txtCustomHtmlArea").htmlarea("image", "image.jpg");</pre>
<p>The jHtmlArea object has a few more methods, you can find out what they are by referencing the Visual Studio JavaScript Intellisense File ("jHtmlArea-0.5.0-vsdoc.js") or the un-minified source code itself.</p>
<h3>Conclusion</h3>
<p>As you can see the jHtmlEditor has some really simple extensibility points. I hope you enjoy using this editor as much as I do. Also, if you have any suggestions/issues, please go to the <a href="http://jhtmlarea.codeplex.com/WorkItem/List.aspx">official jHtmlArea project's Issue Tracker</a> and let me know.</p>
