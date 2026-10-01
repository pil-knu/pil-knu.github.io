---
layout: page
title: Courses
permalink: /courses/
nav: true
nav_order: 5
---

{% comment %}
  Generated from _data/courses.yml. Each term is a green tag; a term with a `url`
  becomes a link (see the comment at the top of _data/courses.yml).
{% endcomment %}
<div class="pil-page">
<div class="pil-course-grid">
{% for c in site.data.courses %}
<div class="pil-course">
<div class="pil-course-visual">{% if c.image %}<img src="{{ c.image | prepend: '/assets/img/courses/' | relative_url }}" alt="">{% endif %}</div>
<div class="pil-course-body">
<div class="pil-course-title">{{ c.title }}</div>
{% if c.subtitle %}<div class="pil-muted">{{ c.subtitle }}</div>{% endif %}
<div class="pil-course-terms">{% for t in c.terms %}{% if t.term %}{% if t.url %}<a class="pil-term" href="{{ t.url }}">{{ t.term }}</a>{% else %}<span class="pil-term">{{ t.term }}</span>{% endif %}{% else %}<span class="pil-term">{{ t }}</span>{% endif %}{% endfor %}</div>
</div>
</div>
{% endfor %}
</div>
</div>
