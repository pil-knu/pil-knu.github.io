---
layout: page
title: Lab Info
nav_title: Lab # shorter label in the menu
permalink: /lab-info/
nav: true
nav_order: 1
---

{% comment %}
  Everything on this page comes from the faculty file in _members/ (dae-ung-jo.md).
  No publication list here: the professor is on every paper, so the Publications page is that list.
{% endcomment %}
{% assign pi = site.members | where: 'group', 'faculty' | sort: 'order' | first %}
<div class="pil-page">
{% include person_profile.liquid person=pi %}
<section class="pil-section">
<h2 class="pil-h2">Office</h2>
<div class="pil-map"><iframe src="https://www.google.com/maps/embed?pb=!1m5!3m3!1m2!1s0x3565e19db8c10093%3A0xc37cf6174405f3e7!2z6rK967aB64yA7ZWZ6rWQIElU64yA7ZWZIDHtmLjqtIA!5e0!3m2!1sko!2skr!4v1790779585302!5m2!1sko!2skr" title="Map: IT Building 1, Kyungpook National University" allowfullscreen loading="lazy" referrerpolicy="strict-origin-when-cross-origin"></iframe></div>
<p class="pil-map-caption">{{ pi.office }}</p>
</section>
</div>
