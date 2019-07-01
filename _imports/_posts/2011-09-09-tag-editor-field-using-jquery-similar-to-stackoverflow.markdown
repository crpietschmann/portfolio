---
layout: post
blogengineid: 5aca9707-739d-418e-b754-0156d97b13cc
title: "Tag Editor Field using jQuery similar to StackOverflow"
date: 2011-09-09 00:55:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["JavaScript"]
redirect_from: 
  - /post/2011/09/09/Tag-Editor-Field-using-jQuery-similar-to-StackOverflow
  - /post/2011/09/09/tag-editor-field-using-jquery-similar-to-stackoverflow
  - /post.aspx?id=5aca9707-739d-418e-b754-0156d97b13cc
---
<!-- more -->
<p>The tag editor featured on the <a href="http://stackoverflow.com">StackOverflow</a> website (and all the StackExchange websites) is a real slick tag editor that makes it much nicer to enter tags than just a plain textbox. I searched a little and couldn&rsquo;t find anything that works just like theirs, so I decided to build one.</p>
<p><a href="/images/postsjquery.selectit-0.1.png"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="jquery.selectit-0.1" src="/images/postsjquery.selectit-0.1_thumb.png" alt="jquery.selectit-0.1" width="435" height="213" border="0" /></a></p>
<div id="scid:fb3a1972-4489-4e52-abe7-25a00bb07fdf:2cd303ff-9fa7-4cb2-9b87-b1a4b5159285" class="wlWriterEditableSmartContent" style="margin: 0px; display: inline; float: none; padding: 0px;">
<p><strong>Download Full Source Code: <a href="/file.axd?file=jquery.selectit-0.1.zip" target="_blank">jquery.selectit-0.1.zip</a></strong></p>
</div>
<p>Here&rsquo;s some example usage of the tag editor:</p>
<pre class="brush: xml; first-line: 1; tab-size: 4; toolbar: false; ">&lt;div id='SelectBox' style='width: 350px'&gt;&lt;/div&gt;

&lt;input id='btnClear' type='button' value='Clear' /&gt;
&lt;input id='btnGetTags' type='button' value='Get Tags' /&gt;
&lt;input id='btnAdd' type='button' value='Add Tag' /&gt;

&lt;script&gt;
$(function () {
    // initialize tag editor and add a couple
    // pre-selected tags
    $('#SelectBox').selectit({

        // the name of hidden input elements created
        fieldname: 'tags', 

        // pre-selected tags
        values: [
            'javascript',
            'css',
            'jquery'
        ]
    });

    $('#btnGetTags').click(function () {
        // display entered tags to user
        alert($('#SelectBox').selectit('values').join(', '));
    });

    $('#btnClear').click(function () {
        // clear al tags from editor
        $('#SelectBox').selectit('clear');
    });
    $('#btnAdd').click(function () {
        // programatically add tag to editor
        var tag = prompt('Enter tag to add:', '');
        if (tag &amp;&amp; tag !== '') {
            $('#SelectBox').selectit('add', tag);
        }
    });
});
&lt;/script&gt;</pre>
<p>Use at your own risk. This code is quick and dirty, and may contain bugs. This is the reason I didn&rsquo;t throw it up on Github or CodePlex.</p>
<p>Have fun!</p>
