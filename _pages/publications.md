---
layout: page
title: Publications
permalink: /publications/
nav: true
nav_order: 3
---

{% comment %}
  Generated from _bibliography/papers.bib: @misc entries under "Preprint", everything else by year.
{% endcomment %}
<div class="pil-page">
<div class="pil-tabs pil-tabs-links"><a class="pil-tab is-active" href="{{ '/publications/' | relative_url }}">Publications</a><a class="pil-tab" href="{{ '/publications/patents/' | relative_url }}">Patents</a></div>
{% capture pil_pre %}{% bibliography --group_by none --query @misc %}{% endcapture %}
{% if pil_pre contains '<li' %}<div class="publications pil-publist"><h2 class="bibliography">Preprint</h2>{{ pil_pre }}</div>{% endif %}
<div class="publications pil-publist">{% bibliography --query !@misc %}</div>
</div>
