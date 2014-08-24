---
layout: post
title: "Hourglass Resurrection"
description: ""
category: 
tags: [TAS, hourglass, hourglass-resurrection]
---
{% include JB/setup %}

[Hourglass Resurrection](https://code.google.com/p/hourglass-resurrection/)というプロジェクトが
立ち上がっていますが、今のままでは使わないでしょう。   
なぜかというと、フレームアドバンスの動作に違いがあるからです。具体的にはスペースキーによるコマ送りが、
押しっぱなしで連打にならないからです。
数百フレームの演出をスキップするのが日常茶飯事な魔物ハンター舞やえあふりの製作では
使い物にならないでしょう。   
この動作が改善されたら、次はムービーファイルフォーマットの違いです。
固定長だったHourglass-win32のムービーファイルヘッダに対して、
可変長のヘッダが導入されています。フレームごとの入力データは良く分かっていません。   
ムービーファイルの仕様が明文化されるまでは入力可視化のためのスクリプト作成にはソースの
解読が必要ということなので、わざわざ-resurrectionを使うことは無いでしょう。
