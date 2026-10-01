---
layout: page
title: Members
permalink: /members/
nav: true
nav_order: 2
---

{% comment %}
  Lists every file in _members/, grouped by `group:` and sorted by `order:`.
  To add a person, copy _members/student-template.md. Nothing to edit here.
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
{% if gk == 'faculty' %}
{% for m in people %}
{% assign mlink = m.link | default: m.url %}
<div class="pil-faculty">
{% if m.photo %}<img class="pil-photo" src="{{ m.photo | prepend: '/assets/img/' | relative_url }}" alt="{{ m.name }}">{% else %}<div class="pil-photo pil-photo-empty" aria-hidden="true">{{ m.name | slice: 0 }}</div>{% endif %}
<div class="pil-faculty-body">
<div class="pil-profile-name pil-profile-name-sm">{{ m.name }}</div>
<div class="pil-profile-affil">{{ m.position }}, {{ m.affiliation }}</div>
{% if m.interests %}<div class="pil-block"><div class="pil-label">Research Interests</div><ul class="pil-dash pil-dash-2col">{% for i in m.interests %}<li>{{ i }}</li>{% endfor %}</ul></div>{% endif %}
<div class="pil-block"><div class="pil-label">Contact</div>
<div class="pil-inline-links">{% if m.email %}<span>{{ m.email_display | default: m.email | replace: '@', ' [at] ' | replace: '.', ' [dot] ' }}</span>{% endif %}{% for l in m.links %}<a class="pil-chip-link" href="{{ l.url }}">{{ l.label }}</a>{% endfor %}<a class="pil-chip-link pil-chip-internal" href="{{ mlink | relative_url }}">Full profile →</a></div>
</div>
</div>
</div>
{% endfor %}
{% else %}
<div class="pil-member-grid">
{% for m in people %}
{% assign mlink = m.link | default: m.url %}
<a class="pil-member-card" href="{{ mlink | relative_url }}">
{% if m.photo %}<img class="pil-photo" src="{{ m.photo | prepend: '/assets/img/' | relative_url }}" alt="{{ m.name }}">{% else %}<div class="pil-photo pil-photo-empty" aria-hidden="true">{{ m.name | slice: 0 }}</div>{% endif %}
<div class="pil-member-name">{{ m.name }}</div>
<div class="pil-member-sub">{{ m.interests | join: " · " }}</div>
</a>
{% endfor %}
</div>
{% endif %}
</section>
{% endif %}
{% endfor %}
</div>
