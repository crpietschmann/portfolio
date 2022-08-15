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
<ul>
{% for category in site.categories %}
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <li>
        <a href="#{{ category_name | slugize }}">
            {{category_name}}    
        </a>
    </li>
{% endfor %}
</ul>
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
{% endfor %}
</div>