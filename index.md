---
layout: page
title: TAS-Airfli
tagline: TAS-Airfli
---
{% include JB/setup %}

## 作ったもの

* [観鈴ノーマルモード難易度ハード](misuzu.html)

<iframe width="312" height="176" src="http://ext.nicovideo.jp/thumb/sm23280135" scrolling="no" style="border:solid 1px #CCC;" frameborder="0"><a href="http://www.nicovideo.jp/watch/sm23280135">【ニコニコ動画】【TAS】えあふり　観鈴ちん危機一髪　ノーマルモードハード観鈴 in 20:41.60</a></iframe>

***

## ブログエントリ
{% for post in site.posts %}
  <h3><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h3>
  {{ post.content }}
{% endfor %}


