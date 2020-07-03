---
layout: page
title: Categories
permalink: /category/
redirect_from:
  - /categories
---


<div id="categories">
<ul>
{% for category in site.categories %}
    <li>
        <a href="#{{ category_name | slugize }}">
        {% capture category_name %}{{ category | first }}{% endcapt
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
            <h2>
                <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
            </h2>
        </p>
    {% endfor %}
  </div>
{% endfor %}
</div>