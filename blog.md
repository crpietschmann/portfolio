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
    <p>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
      <h2>
        <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
      </h2>
    </p>
  {% endfor %}
</div>
<p class="rss-subscribe">subscribe <a href="{{ "/feed" | prepend: site.baseurl }}">via RSS</a></p>
