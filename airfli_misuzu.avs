# えあふり　観鈴モード
#

# プラグイン
#LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\nnedi3.dll")
LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\warpsharp.dll")

# 字幕色設定
global halocolor = $333333
global textcolor = $ffffff
global fontface = "メイリオ"

global texttop = 200
global textleft = 512 + 4

function WriteText(clip m, string text, int firstframe, int "contframe")
{
    contframe = default(contframe, 60 * 14)

    mv = Subtitle(m, text, align = 7, lsp = -40, spc = 0, \
        x = textleft, y = texttop, \
        font = fontface, size = 24, \
        first_frame = firstframe, last_frame = firstframe + contframe, \
        text_color = textcolor, halo_color=halocolor )
    return mv
}


# ムービー
m = AviSource("avi\airfli_misuzu.avi")
# 640x480 60fps YV12

# 音声の合成
#snd = WavSource("avi\airfli_snd.avi")
#m = AudioDub(m, snd)


# 音量調整
#m = Amplify(m, 0.75)

# 右側を切り落とす
border = 640-512
m = Crop(m, 0, 0, -border, 0)

# RGB32にした上でさらに左右に黒枠を入れて854x480に拡大
m = ConvertToRGB32(m)
#m = AddBorders(m, (854-848)/2, 0, (854-848)/2, 0, $000000)
m = AddBorders(m, 0, 0, 854-512, 0, $000000)

# 入力可視化
WScript("airfli_misuzu_input.js", "JScript")

t = 0

m = WriteText(m, "どうも。某所でリクエストのあった\n渡辺製作所の同人ゲーム\n「えあふり　観鈴ちん危機一髪」の\nTAS動画です\n\n設定は難易度以外デフォルト\n難易度ハードです\n\n使用キャラはとりあえず観鈴です（適当）", t)
t = t + 60 * 15

m = WriteText(m, "512x480という変則的な解像度のため、\nせっかくなので16:9にして最初のうちは\n右側に解説を付けます\n\nといっても、解説を読んでる間に\n面が進んで行ってしまうので、\n最初の解説を読んだらもう一度再生して下さい", t)
t = t + 60 * 15

m = WriteText(m, "本作は「フリッキー」なるゲーム(知らない)を\nAirのキャラクターで楽しもうというものです\n\n左右とジャンプだけの簡単操作で\n画面内にいる「おともだち」を助けて、\nゴールまで導くだけの、簡単なゲームです\n\nおともだちは自キャラによって変わります", t)
t = t + 60 * 15

m = WriteText(m, "自キャラが敵にふれるとライフ-1です\n連れているおともだちが敵にふれると、\nそこで「ちぎれ」ます\n\nちぎれたおともだちは一定のパターンで\n画面内をうろつきます\n\nRound10などでちぎれるところが見れます", t)
t = t + 60 * 15

m = WriteText(m, "難易度をハードにしたので、\n雑魚敵の動きが速く、ボス面での出現頻度が\n上がります\n\n雑魚敵の移動があるため、単純に最短ルートで\nおともだちを回るわけにはいきません", t)
t = t + 60 * 15

m = WriteText(m, "ステージ構成は1～4面のあと、5面が\nボーナスステージで、6～9面のあと\n10面がボス面という構成を5回繰り返した\n全50面構成です", t)
t = t + 60 * 15

m = WriteText(m, "ちょうどボーナスステージですので解説します\n\nボーナスステージは打ち上げられる\nおともだちを、手に持った網で捕まえます\n最初は簡単ですが後の面ほど面倒になります", t)
t = t + 60 * 15

m = WriteText(m, "使用可能キャラは最初は観鈴、佳乃、美凪の\n3人で、3人をクリアすると神奈が、\nボーナスステージを全てパーフェクト取ると\n渚が、それぞれ使用可能になります\n\n渚の存在は当時都市伝説だと思ってました…", t)
t = t + 60 * 15

m = WriteText(m, "攻撃はマップに設置されているカップ等\n（面によって変わる）を使います\n\n単純に重なればカップ等を持って、\nジャンプボタンを押すと向いている方向に\n思いっきり放り投げて攻撃します", t)
t = t + 60 * 15

m = WriteText(m, "操作が単純なこともあって、TASらしい\n変態ムーブはありません\n変態をご所望の方はマイリスから\nスライディング動画をどうぞ（宣伝）\n\nTASならではの動きとしては2つ、\n「角着地」と「ジャンプふりむき」があります\n（勝手に命名）", t)
t = t + 60 * 15

m = WriteText(m, "「角着地」について\n\n普通はジャンプすると頂点か\n頭をぶつけるまで止められませんが\n地形の角に接触することによって\nすぐに着地し行動できるようになります\nこの動きを角着地と呼んでます", t)
t = t + 60 * 15

m = WriteText(m, "「ジャンプふりむき」について\n\nこのゲームは、とにかく慣性がすごいです。\n振り向くだけでかなりの時間がかかります\n（観鈴の場合）地上で振り向くよりも\nジャンプして振り向く方が早いです\nこの動きをジャンプふりむきと呼んでます\n\n", t)
t = t + 60 * 15

m = WriteText(m, "可能な限りふりむきはジャンプふりむきで\n行います\n地上ふりむきはほとんど使いません", t)
t = t + 60 * 15

m = WriteText(m, "アイテムについて\n\n上から色々なアイテムが落ちてきますが、\nあまり使いません\nフレームごとの入力によって乱数が変わる\nようですが、あまり使わないので…\n\n一応解説\n星：無敵8秒　羽：二段ジャンプ10秒\nx2：スコア2倍30秒 x3：スコア3倍30秒\n砂時計：制限タイム回復\nカップ：攻撃アイテム復活\n1UP：ライフ+1 スマートボム：全体攻撃", t)
t = t + 60 * 15

m = WriteText(m, "ボス面について\n\nこちらより速く動き回るボスが相手です\n攻撃アイテムを何度もぶつけて倒します\n\n晴子さんの場合、こちらのいる高さに合わせてきます\nまた、振り向くことが出来ません", t)
t = t + 60 * 15

m = WriteText(m, "ボス面が終わるとステージが変わります\n見た目だけでなく雑魚敵の性能なども\n変わります\n\n以上で解説を一旦終わります\n\nボスの動きについてと特徴的な面について、\nそれぞれの面で個別に解説します", t)
t = t + 60 * 15


t = 25970
m = WriteText(m, "聖さんです\n\nまずは移動パターンが晴子さんのように単純\nではなくなっています。\n足場の端で振り向いたり、高さを合わせて\n来なかったり\n\nそして、足場の端にいるとき等に高さが合うと\nメスを2回投げてきます", t)



return m
