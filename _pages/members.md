---
layout: page
title: Members
permalink: /members/
nav: true
nav_order: 2
---

{% comment %}
  One card per file in _members/, grouped by `group:` and sorted by `order:`.
  A card always shows the photo (the first letter of the name if there is no `photo:`) and the name;
  the research line (`summary:`) and link buttons (`links:`) appear only when the member file has them. Photo and name open the person's page (the professor's opens Lab Info via `link:`).
{% endcomment %}
{% assign groups = "faculty|Faculty,phd|Ph.D. Students,ms|M.S. Students,undergrad|Undergraduate Students,alumni|Alumni" | split: "," %}
<div class="pil-page">
{% for g in groups %}
{% assign gk = g | split: "|" | first %}
{% assign gl = g | split: "|" | last %}
{% assign people = site.members | where: 'group', gk | sort: 'order' %}
{% if people.size > 0 %}
<section class="pil-section pil-members-group">
<h2 class="pil-h2">{{ gl }}</h2>
<div class="pil-member-grid">
{% for m in people %}
{% assign mlink = m.link | default: m.url %}
<div class="pil-member-card">
<a class="pil-member-photo" href="{{ mlink | relative_url }}">{% if m.photo %}<img class="pil-photo" src="{{ m.photo | prepend: '/assets/img/' | relative_url }}" alt="{{ m.name }}">{% else %}<div class="pil-photo pil-photo-empty" aria-hidden="true">{{ m.name | slice: 0 }}</div>{% endif %}</a>
<a class="pil-member-name" href="{{ mlink | relative_url }}">{{ m.name }}</a>
{% if m.summary %}<div class="pil-member-sub">{{ m.summary }}</div>{% endif %}
{% if m.links %}<div class="pil-member-links">{% for l in m.links %}<a class="pil-chip-link" href="{{ l.url }}">{{ l.label }}</a>{% endfor %}</div>{% endif %}
</div>
{% endfor %}
</div>
</section>
{% endif %}
{% endfor %}
</div>
