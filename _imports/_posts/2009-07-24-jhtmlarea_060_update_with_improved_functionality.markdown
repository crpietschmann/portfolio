---
layout: post
blogengineid: 9901a400-8fdb-4811-a030-6827de25695a
title: "jHtmlArea 0.6.0 Update with Improved Functionality"
date: 2009-07-24 16:44:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2009/07/24/jHtmlArea_060_Update_with_Improved_Functionality
  - /post/2009/07/24/jhtmlarea_060_update_with_improved_functionality
  - /post.aspx?id=9901a400-8fdb-4811-a030-6827de25695a
---
<!-- more -->

<img src="/files/2009/7/jHtmlArea_0.6.0_Screenshot.png" alt="" align="right" />

I just posted a pretty good update the the jHtmlArea project that includes quite a few more toolbar buttons and a new Color Picker Menu extension/plugin (jHtmlAreaColorPickerMenu) that adds a nice, simple color picker when using the "forecolor" toolbar button.

<span id="ctl00_ctl00_MasterContent_Content_wikiSourceLabel">jHtmlArea is a simple, light weight, extensible WYSIWYG HTML Editor built on top of jQuery. This component allows you to easily display a WYSIWYG HTML Editor in place of any TextArea DOM Elements on the page. The minified script alone is 8.7kb, and with css and image files it's a total of 22k.</span>

Download: <a href="http://jhtmlarea.codeplex.com">jHtmlArea Project Home</a>

To the right is an updated screenshot of the latest release, plus below is a full change log for this update release:

- Hide All Toolbar buttons except the "html" button when entering
HTML Source view (via clicking "html" button or executing
jHtmlArea.showHTMLView). When toggling view back to the WYSIWYG editor
all other buttons will then be shown again.

- Added jHtmlArea.dispose method - Allows you to remove the WYSIWYG

editor, and go back to having a plain TextArea. Beware, there is a
memory leak when using this method; it's not too bad, but you want
to call this as few a number of times if you can. The memory leak
is due to the way the browsers handle removing DOM Elements.

- Added Indent and Outdent functionality - This includes toolbar buttons
and jHtmlArea.indent and jHtmlArea.outdent buttons.

- Added justifyLeft, justifyCenter, justifyRight functionality and toolbar
buttons.

- Added insertHorizontalRule functionality and toolbar button. This adds a
<hr> tag to the currently selected area.

- Added an "alias" method for jHtmlArea.execCommand named "ec" to help reduce the
file size of the script.

- Added increaseFontSize and decreaseFontSize functionality and toolbar buttons.
The increaseFontSize and decreaseFontSize doesn't currently work in Safari.

- Added forecolor functionality - Changes a font color for the selection or at the
insertion point. Requires a color value string to be passed in as a value argument.

- Fixed bug in jHtmlArea.toString method

- Added jHtmlArea.queryCommandValue method and it's alias "jHtmlArea.qc"

- Added the jHtmlAreaColorPickerMenu plugin/extension that resides within the
"jHtmlAreaColorPickerMenu.js" file. This file includes a somewhat generic color
picker menu that can be used for any purpose, plus it includes the code to wire
up and override the "stock" jHtmlColor.forecolor functionality and inject the new
Color Picker Menu functionality in it's place when you click on the "forecolor"
toolbar button.

- Changed the "execCommand" and "ec" second parameter to default to "false" if not
specified, and third parameter to default to "null" if not specified. This helps to
reduce the overall file size of the script.

- Added support for Toolbar Button Grouping, now with the additional buttons included
in this release, or even when any custom buttons are used, they will be able to display
nicely by "auto-wrapping" to the next line.

- Added a gradient background to the Toolbar Button Groups, with a slight reverse
gradient on the Buttons when the mouse is hovered over.

 
