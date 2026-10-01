---
layout: page
title: Projects
permalink: /projects/
nav: true
nav_order: 4
---

{% comment %} Generated from _data/projects.yml. {% endcomment %}
<div class="pil-page">
<div class="pil-projects">
{% for pr in site.data.projects %}
<div class="pil-project">
<div class="pil-mono pil-project-period">{{ pr.period }}</div>
<div><div class="pil-project-title">{{ pr.title }}</div><div class="pil-muted">{{ pr.agency }}{% if pr.program %} · {{ pr.program }}{% endif %}</div></div>
{% if pr.role %}<span class="pil-pill">{{ pr.role }}</span>{% endif %}
</div>
{% endfor %}
</div>
</div>
