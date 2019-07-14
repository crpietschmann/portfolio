---
layout: page
title: Blog
permalink: /blog/
redirect_from:
  - /post.aspx
  - /archive/
  - /archive
---

<div class="container">
  <div class="row">
      <div class="col-md-12">    
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
    </div>
</div>