---
layout: post
blogengineid: 9b322f99-5f61-45ac-902f-656e26f1253e
title: "jHtmlArea - The all NEW HTML WYSIWYG Editor for jQuery"
date: 2009-07-21 19:11:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2009/07/21/jHtmlArea-The-all-NEW-HTML-WYSIWYG-Editor-for-jQuery.aspx
  - /post/2009/07/21/jHtmlArea-The-all-NEW-HTML-WYSIWYG-Editor-for-jQuery
  - /post/2009/07/21/jhtmlarea-the-all-new-html-wysiwyg-editor-for-jquery
  - /post.aspx?id=9b322f99-5f61-45ac-902f-656e26f1253e
---
<!-- more -->

<img src="/files/2009/7/Screenshot.png" alt="" width="298" height="402" align="right" />

The last couple days I spent time working on a new simple, lightweight, extensible HTML WYSIWYG editor that's built on top of jQuery. I know there are a ton of existing editors, but <a href="http://stackoverflow.com/questions/1141073/whats-the-best-wysiwyg-editor-for-use-with-jquery">I couldn't seem to find any with a truely simple, lightweight design that allowed for really easy extensibility</a>, and that's built on top of jQuery to take advantage of the cross-platform capabilities that jQuery has to offer. I feel that I've come up with a really nice HTML editor component that has some pretty usefull extensibility points. Allow me to introduce you to <a href="http://jhtmlarea.codeplex.com">jHTMLArea</a>.

You can download jHtmlArea and some examples of using it over at the official project page on CodePlex: <a href="http://jhtmlarea.codeplex.com">http://jhtmlarea.codeplex.com</a>

To the right there's a screenshot of two instances of jHtmlArea in action. The first one is using the "default" configuration, and the second uses a couple of different custom options, including a completely custom "Save" button that's added using one of jHtmlArea's extensibility points.

## Using jHtmlArea is As Simple As 1.2.3.

Follow these 3 steps and you'll have jHtmlArea implemented within your application in no time.

**1.** Add a `<TextArea>` to your HTML page

```html
<textarea></textarea>
```

**2.** Include the following files in your website:

  - `jHtmlArea.js`

  - `jHtmlArea.css`

  - `jHtmlArea.png`

**3.** Add the following JavaScript code to your page to turn all `<TextArea>` elements into jHtmlArea's:

Include the jHtmlArea javascript file:

```html
<script type="text/javascript" src="jHtmlArea-0.6.0.min.js"></script>
```

Turn all TextArea's into jHtmlArea's:

```javascript
$(function(){
    $("textarea").htmlarea();
});
```

It can be as simple as that to use jHtmlArea within your pages to turn any TextArea DOM Elements into nice jHtmlArea WYSIWYG Editors.

## Easily Configure Toolbar Buttons

jHtmlArea makes it extremely simple to define your own custom set of Toolbar buttons; just in case you don't want to show the full set of "default" buttons.

You can easily specify them by name within an array that's passed in as one of the options specified when you call the `htmlarea` method:

```javascript
$("#txtCustomHtmlArea").htmlarea({
    toolbar: ["bold", "italic", "underline", "|", "h1", "h2", "h3", "h4", "h5", "h6", "|", "link", "unlink"]
});
```

This example will specify the same buttons displayed in the lower screenshot to the right; minus the "Save" button on the far right of the toolbar. I'll show you how to add this button in the next example.

## Add Custom Toolbar Buttons

One of the extensibility points that I was wanting to have in an HTML WYSIWYG editor is the ability to easily add any custom buttons to the toolbar. For instance, some times it may be nice to have a "Save" button in the toolbar to allow your users to easily save the contents of the editor.

Here's an example using the above "custom" toolbar buttons list, with a custom "Save" button added:

```javascript
$("#txtCustomHtmlArea").htmlarea({
    toolbar: ["bold", "italic", "underline", "|", "h1", "h2", "h3", "h4", "h5", "h6", "|", "link", "unlink", "|",
        // This is how to add a completely custom Toolbar Button
        {
            // The CSS Class to assign the Button <a> tag
            css: "custom_disk_button",

            // The Text to display in the buttons alt text / tooltip
            text: "Save",

            // The function to execute when the button is clicked
            action: function(btn) {
                // 'this' = jHtmlArea object
                // 'btn' = jQuery object that represents the <A> "anchor" tag for the Toolbar Button

                alert('SAVE!\n\n' + this.toHtmlString());

                // Add any Ajax Code here to save the contents of the editor

            }
        }
    ]
});
```

Once the JavaScript code is entered to add the custom "Save" button, we then need to add the buttons display image to the website, and then include the necessary CSS to allow it to be displayed:

```css
div.jHtmlArea .ToolBar ul li a.custom_disk_button 
{
    background: url(images/disk.png) no-repeat;
    background-position: 0 0;
}
```

## Localizing the Editor

Well, the jHtmlEditor currently only comes with English text for all the button names / tooltips. However, it is extremely simple to specify your own text to use when calling the "htmlarea" to create jHtmlArea editors within the page. You set the Text to be displayed for each button by referencing it by "name". This is the same "name" that is used in the first example to specify which buttons are displayed in the toolbar.

```javascript
$("#txtCustomHtmlArea").htmlarea({
    // Override any of the toolbarText values - these are the Alt Text / Tooltips shown
    // when the user hovers the mouse over the Toolbar Buttons
    // Here are a couple translated to German, thanks to Google Translate.
    toolbarText: $.extend({}, jHtmlArea.defaultOptions.toolbarText, {
            "bold": "fett",
            "italic": "kursiv",
            "underline": "unterstreichen"
        })
});
```

## Specify CSS File to be used by the Editor

You can also specify a specify CSS file to be used within the Editor itself.

```javascript
$("#txtCustomHtmlArea").htmlarea({
    css: "style//jHtmlArea.Editor.css"
});
```

## Specify a Callback when the Editor Finishes Loading

It may be nice in some instances to get notified when the editor has finished loading in the page so you can perform some kind of action. This is also really simple to do.

```javascript
$("#txtCustomHtmlArea").htmlarea({
    // Do something once the editor has finished loading
    loaded: function() {
        //// 'this' is equal to the jHtmlArea object

        alert("jHtmlArea has loaded!");

        //this.showHTMLView(); // show the HTML view once the editor has finished loading
    }
});
```

## Call any jHtmlArea object methods easily from jQuery

Another thing is that the jQuery object doesn't directly expose the different jHtmlArea object's methods. However, you can use the "htmlarea" method to call any of them you need to. All you need to do is specify the method by name that you want to call and pass any additional parameters to the "htmlarea" method and it'll return the results.

```javascript
// Get the HTML string value from within the editor
var html = $("#txtCustomHtmlArea").htmlarea("toHtmlString");

// Insert a specify Image that you want
$("#txtCustomHtmlArea").htmlarea("image", "image.jpg");
```

The jHtmlArea object has a few more methods, you can find out what they are by referencing the Visual Studio JavaScript Intellisense File (`jHtmlArea-0.5.0-vsdoc.js`) or the un-minified source code itself.

## Conclusion

As you can see the jHtmlEditor has some really simple extensibility points. I hope you enjoy using this editor as much as I do. Also, if you have any suggestions/issues, please go to the [official jHtmlArea project's Issue Tracker](https://github.com/crpietschmann/jhtmlarea/issues) and let me know.
