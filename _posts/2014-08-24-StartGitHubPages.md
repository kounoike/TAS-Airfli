---
layout: post
category: blog
title: GitHub Pages 始めました
tags: [TAS, Airfli, AviSynth]
---

Github Pagesを始めました。まずは手始めにえあふりTASのページからです。  

[プロジェクトページ](https://github.com/kounoike/TAS-Airfli)  

[ニコニコ動画（観鈴）](http://www.nicovideo.jp/watch/sm23280135)  

作成には[Hourglass](http://code.google.com/p/hourglass-win32/)を使用しています。

編集にはAviSynthを使っています。
観鈴ではSubtitleコマンドによってキー入力表示を実現しています。  
もちろん、Hourglassのムービーファイルからバイナリで取り出して変換して出力しています。  
ところが、この表示処理が困ったもので、SubtitleコマンドをAVSファイルにだらだらと書くと
スタックオーバーフローで落ちてしまいます。  
そこで観鈴モードでは、WarpSharpプラグインを利用してJScriptで記述した別ファイルに
Subtitleコマンドを列挙しました。
しかし、このときはVirtualDubによるプレビューではやはりスタックオーバーフローで
落ちてしまい、つんでれんこによる変換でしか上手くいきませんでした。 

一方、作成中の佳乃モードでは発想を変えて、Pythonを使ってボタン入力の画像を1フレームごとに
作成し、ImageSourceコマンドによって読み込むことにしました。  
ImageSourceコマンドは驚くほど軽く、VirtualDubによるプレビューに支障がないものでした。
現在、40ステージまで完成していますので、まもなく公開できると思います。お楽しみに。
