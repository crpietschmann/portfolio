---
layout: post
blogengineid: c34da319-5160-4b22-918b-bfea938271ef
title: "jHtmlArea – Adding Custom Toolbar Buttons"
date: 2009-08-18 17:21:00 -0500
comments: true
published: true
categories: ["jHtmlArea", "Open Source"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2009/08/18/jHtmlArea-Adding-Custom-Toolbar-Buttons.aspx
  - /post/2009/08/18/jHtmlArea-Adding-Custom-Toolbar-Buttons
  - /post/2009/08/18/jhtmlarea-adding-custom-toolbar-buttons
  - /post.aspx?id=c34da319-5160-4b22-918b-bfea938271ef
---
<!-- more -->

I've gotten a couple questions lately about extending the [jHtmlArea WYSIWYG editor](https://github.com/crpietschmann/jhtmlarea), so I thought I'd post a little bit about how to add your own custom toolbar buttons to it. There is one example that is included with the component, but that does not cover inserting some html into the editor, so I'm going to cover that here.

You can download the jHtmlArea Editor here: <https://github.com/crpietschmann/jhtmlarea>

This article was written with jHtmlArea v0.6.0 in mind, but it will work with newer releases.

## Add a simple Custom Toolbar Button

As the [jHtmlArea](https://github.com/crpietschmann/jhtmlarea) samples show you can specify your own list of toolbar buttons to display at the time of initializing the editor. You do this by passing in the "toolbar" option with an array of toolbar button groups ("Arrays") that include the toolbar buttons. The editor has a bunch of buttons built in and those are specified by name. But, to add a custom toolbar button, you just need to pass in a simple JavaScript object that defines the button.

Here's an example object literal that can be used to create the custom toolbar button:

```javascript
{
    css: "custombutton", // The CSS class used to Style the <A> tag of the Toolbar Button
    test: "Custom Button Tooltip", // The text to use as the <A> tags "Alt" attribute, or tooltip
    action: function(btn) { // The function to execute when the Toolbar Button is Clicked
        // 'this' = jHtmlArea Object
        // 'btn' = jQuery object that represents the <A> "anchor" tag for the Toolbar Button

        // Take some action or Do Something Here
    }
}
```

As you can see it's really pretty straight forward to define a custom toolbar button. Now to include the Custom Toolbar Button, you can send it in the "toolbar" option with all the other buttons you want displayed. Here's an example that specifies a few of the built in toolbar buttons along with a new Custom Toolbar Button:

```javascript
$("textarea").htmlarea({
    // Override/Specify the Toolbar buttons to show
    toolbar: [
        ["html"], ["bold", "italic", "underline", "|", "forecolor"],
        ["h1", "h2", "h3", "h4", "h5", "h6"],
        ["link", "unlink", "|", "image"],
        [{
            // This is how to add a completely custom Toolbar Button
            css: "datebutton",
            text: "Today's Date",
            action: function(btn) {
                // 'this' = jHtmlArea object
                // 'btn' = jQuery object that represents the <A> "anchor" tag for the Toolbar Button

                // Take some action or Do Something Here
            }
        }]
    ]
});
```

A couple things to note when specifying the custom set of Toolbar Buttons to display

  - A Custom Toolbar Button is specified by passing in a JavaScript Object that has the "css", "text" and "action" properties set accordingly. As shown above.
  - The "toolbar" option accepts an Array of Arrays. This allows for you to specify as many Toolbar Button Groups as you want. These Toolbar Button Groups will auto-wrap to the next line if they cannot all be displayed on the same line because of the width of the editor being too small. If you include ALL your buttons in a single group, then they will not wrap.
  - You can specify the "built in" Toolbar Buttons by "name". To look what the names are, just reference the "jHtmlArea.defaultOptions" objects "toolbar" property as this is a full list of all the "built in" buttons.
  - To specify a "Separator" or vertical line to display in between the buttons within the same group, just specify a vertical pipe ("|") character as the "name" of the toolbar button to display, and the editor will take care of the rest.
  - Also do not forget to specify the CSS class you are telling the editor to use for the Custom Toolbar Button. You can see an example of this with the Custom "Save" Toolbar Button that is contained within the "default.htm" file that comes with the jHtmlArea editor download zip file.

## Performing Basic Actions from a Custom Toolbar Button

Something that was omitted from the above example was how to actually perform some action on the editor. You can actually call any of the jHtmlArea objects methods from within the Custom Toolbar Buttons "action" method to perform some kind of manipulation or action on the editor. The jHtmlArea editor object is passed to the "action" method as the "this" keyword so it can be accessed directly without needing to curry any variables.

Here are some of the methods that you can call with a note as to what they do. You can find more within the jHtmlArea's script file, or with documentation comments within the `-vsdoc.js` file.

```javascript
{
    css: "custombutton",
    text: "Custom Toolbar Button",
    action: function(btn) {

        // Paste some specific HTML / Text value into the Editor
        this.pasteHTML("");

        // Get the currently selected HTML / Text within the Editor
        var s = this.getSelectedHTML();

        // Set the current selection to Bold
        this.bold();

        // Set the current selection to Italic
        this.italic();

        // Set the current selection to Underline
        this.underline();

        // Center Justify the current selection
        this.justifyCenter();

        // Indent the current selection
        this.indent();

        // Insert horizontal rule or <hr> tag
        this.insertHorizontalRule();

        // Insert an Image by URL
        this.image("http://domain/image.png");

        // Set the Forecolor / Text Color of the current selection
        this.forecolor("#336699");

        // Get the Full HTML that's contained within the Editor
        var html = this.toHtmlString();
    }
}
```

One thing to note about using "pasteHTML" to insert your own custom HTML string into the editor, is because of the way the browsers handle comment tag ("<!-- -->") they wont pasted/inserted and no exceptions will be raised. The reason I mention this is because I got a question from someone about inserting "<!&mdash;more&mdash;>" into the Editor.

Also the "btn" argument that's passed to the "action" method is a reference to the jQuery object for the `<a>` "anchor" tag that is contained within the Custom Toolbar Button. This allows you to modify it's CSS styles or absolute position an element near it, similarly to how the "jHtmlArea.ColorPickerMenu" extension does.

## Append the Custom Toolbar Button to the "Default" Toolbar Button Set

You can append any Custom Toolbar Buttons you want to the "Default" Toolbar Button Set if you wish for those Custom Toolbar Buttons to be shown on ALL jHtmlArea editors on the Page. To do this you can just append a new Toolbar Button Group to the "jHtmlArea.defaultOptions.toolbar" array. However, make sure you do this before initializing an instance of jHtmlArea, otherwise the button will not be displayed.

Here's an example that demonstrates appending a Custom Toolbar Button that  pasted the current days date into the editor when clicked:

```javascript
jHtmlArea.defaultOptions.toolbar.push([
    {
        // This is how to add a completely custom Toolbar Button
        css: "datebutton",
        text: "Today's Date",
        action: function(btn) {
            // 'this' = jHtmlArea object
            // 'btn' = jQuery object that represents the <A> "anchor" tag for the Toolbar Button

            var m_names = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

            var d = new Date();
            var curr_date = d.getDate();
            var curr_month = d.getMonth();
            var curr_year = d.getFullYear();
            this.pasteHTML(m_names[curr_month] + " " + curr_date + ", " + curr_year);
        }
    }
]);
```
