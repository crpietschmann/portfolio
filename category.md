---
layout: page
title: Categories
permalink: /category
redirect_from:
  - /category/
  - /categories
  - /categories/
---


<div id="categories">
    <div class="row">
    {% for category in site.categories %}
        {% capture category_name %}{{ category | first }}{% endcapture %}
          <a class="btn btn-dark" href="#{{ category_name | slugize }}" style="margin: 0.5em;">
              {{category_name}}
          </a>
    {% endfor %}
    </div>
</div>

<hr/>

<div id="archives">
{% for category in site.categories %}
  <div class="archive-group">
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <div id="#{{ category_name | slugize }}"></div>
    <a name="{{ category_name | slugize }}"></a>
    <h2 class="category-head">{{ category_name }}</h2>
    {% for post in site.categories[category_name] %}
        <p>
            <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
            <h3>
                <a class="post-link" href="{{ post.url | prepend: site.url }}">{{ post.title }}</a>
            </h3>
        </p>
    {% endfor %}
  </div>
  <hr/>
{% endfor %}
</div>