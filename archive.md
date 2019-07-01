---
layout: page
title: Archive
permalink: /archive/
---

<div class="container">
  
  <div data-type="ad" data-publisher="lqm.pietschsoft.site" data-zone="ron" data-format="728x90"></div>
  
  <ul class="post-list">
    {% for post in site.posts %}
      <li>
        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

        <h2>
          <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>
      </li>
    {% endfor %}
  </ul>

  <p class="rss-subscribe">subscribe <a href="{{ "/feed" | prepend: site.baseurl }}">via RSS</a></p>
</div>