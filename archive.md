---
layout: page
title: Archive
permalink: /archive/
redirect_from:
  - /post.aspx
---

<div class="container">
  <div class="row">
      <div class="col-md-9">    
          <div data-type="ad" data-publisher="lqm.pietschsoft.site" data-format="300x250" data-zone="ros" ></div>
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
        <div class="col-md-3">
            <div data-type="ad" data-publisher="lqm.pietschsoft.site" data-format="160x600" data-zone="ros" ></div>
        </div>
    </div>
</div>