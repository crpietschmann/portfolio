---
layout: page
title: Blog
permalink: /blog/
redirect_from:
  - /post.aspx
  - /archive/
  - /archive
---

<div class="post-list">
  {% for post in site.posts %}
    <p style="margin-bottom: 0.5em">
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
    </p>
    <h2>
      <a class="post-link" href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
    </h2>
  {% endfor %}
</div>
<p class="rss-subscribe">subscribe <a href="{{ "/feed" | prepend: site.baseurl }}">via RSS</a></p>
