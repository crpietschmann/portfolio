---
layout: post
blogengineid: 0d14aac9-24f0-4208-a3b2-a902d34047f3
title: "Color the background of items in a Dropdown box in your HTML pages."
date: 2004-09-20 22:02:00 -0500
comments: true
published: true
categories: ["HTML", "Color", "CSS"]
tags: ["General"]
redirect_from: 
  - /post/2004/09/20/Color-the-background-of-items-in-a-Dropdown-box-in-your-HTML-pages.aspx
  - /post/2004/09/20/Color-the-background-of-items-in-a-Dropdown-box-in-your-HTML-pages
  - /post/2004/09/20/color-the-background-of-items-in-a-dropdown-box-in-your-html-pages
  - /post.aspx?id=0d14aac9-24f0-4208-a3b2-a902d34047f3
---
<!-- more -->

It is possible to color the background of items in a Dropdown box within your HTML pages. It's very easy to do by setting the `style` CSS of the `<option>` tags within the `<select>` element.

> **Note:** It's worth noting that you'll need to test this in your target browser and platform. This feature may or may not be supported for certain web browser and / or operating system combinations. This is especially true with the modern mobile device platforms.

Please see the below example:

## Example

<select>
<option value="">Highlight</option>
<option style="background-color: black; color: #ffffff;" value="#000000">Black</option>
<option style="background-color: gray;" value="#808080">Gray</option>
<option style="background-color: darkgray;" value="#A9A9A9">DarkGray</option>
<option style="background-color: lightgrey;" value="#D3D3D3">LightGray</option>
<option style="background-color: white;" value="#FFFFFF">White</option>
<option style="background-color: aquamarine;" value="#7FFFD4">Aquamarine</option>
<option style="background-color: blue;" value="#0000FF">Blue</option>
<option style="background-color: navy; color: #ffffff;" value="#000080">Navy</option>
<option style="background-color: purple; color: #ffffff;" value="#800080">Purple</option>
<option style="background-color: deeppink;" value="#FF1493">DeepPink</option>
<option style="background-color: violet;" value="#EE82EE">Violet</option>
<option style="background-color: pink;" value="#FFC0CB">Pink</option>
<option style="background-color: darkgreen; color: #ffffff;" value="#006400">DarkGreen</option>
<option style="background-color: green; color: #ffffff;" value="#008000">Green</option>
<option style="background-color: yellowgreen;" value="#9ACD32">YellowGreen</option>
<option style="background-color: yellow;" value="#FFFF00">Yellow</option>
<option style="background-color: orange;" value="#FFA500">Orange</option>
<option style="background-color: red;" value="#FF0000">Red</option>
<option style="background-color: brown;" value="#A52A2A">Brown</option>
<option style="background-color: burlywood;" value="#DEB887">BurlyWood</option>
<option style="background-color: beige;" value="#F5F5DC">Beige</option>
</select>

## Source Code

```html
<select>
<option value="">Highlight</option>
<option value="#000000" style="background-color: Black;color: #FFFFFF;">Black</option>
<option value="#808080" style="background-color: Gray;">Gray</option>
<option value="#A9A9A9" style="background-color: DarkGray;">DarkGray</option>
<option value="#D3D3D3" style="background-color: LightGrey;">LightGray</option>
<option value="#FFFFFF" style="background-color: White;">White</option>
<option value="#7FFFD4" style="background-color: Aquamarine;">Aquamarine</option>
<option value="#0000FF" style="background-color: Blue;">Blue</option>
<option value="#000080" style="background-color: Navy;color: #FFFFFF;">Navy</option>
<option value="#800080" style="background-color: Purple;color: #FFFFFF;">Purple</option>
<option value="#FF1493" style="background-color: DeepPink;">DeepPink</option>
<option value="#EE82EE" style="background-color: Violet;">Violet</option>
<option value="#FFC0CB" style="background-color: Pink;">Pink</option>
<option value="#006400" style="background-color: DarkGreen;color: #FFFFFF;">DarkGreen</option>
<option value="#008000" style="background-color: Green;color: #FFFFFF;">Green</option>
<option value="#9ACD32" style="background-color: YellowGreen;">YellowGreen</option>
<option value="#FFFF00" style="background-color: Yellow;">Yellow</option>
<option value="#FFA500" style="background-color: Orange;">Orange</option>
<option value="#FF0000" style="background-color: Red;">Red</option>
<option value="#A52A2A" style="background-color: Brown;">Brown</option>
<option value="#DEB887" style="background-color: BurlyWood;">BurlyWood</option>
<option value="#F5F5DC" style="background-color: Beige;">Beige</option>
</select>
```
