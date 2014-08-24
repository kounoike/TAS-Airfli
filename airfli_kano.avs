# えあふり　観鈴ちん危機一髪　ノーマルモードハード佳乃
# WIP

# 字幕色設定
global halocolor = color_gray10
global textcolor = color_white
global fontface = "Noto Sans Japanese Light"

global texttop = 200
global textleft = 512 + 4

function WriteText(clip m, string text, int firstframe, int "contframe")
{
    contframe = default(contframe, 60 * 24)

    mv = Subtitle(m, text, align = 7, lsp = -28, spc = 0, \
        x = textleft, y = texttop, \
        font = fontface, size = 24, \
        first_frame = firstframe, last_frame = firstframe + contframe, \
        text_color = textcolor, halo_color=halocolor )
    return mv
}

# wtf_frames を読み込む
Import("airfli_kano_frames.txt")
# 640x480 60fps RGB?

m = AviSource("AVI\airfli_kano.avi")
# 入力フォーマット次第でRGB32にする
m = ConvertToRGB32(m)

frames = wtf_frames


# 音声の合成
#snd = WavSource("AVI\airfli_kano_snd.avi")
#m = AudioDub(m, snd)

# 音量調整
#m = Amplify(m, 0.75)

# 右側を切り落とす
border = 640-512
m = Crop(m, 0, 0, -border, 0)

# 右にグレー枠を入れて854x480に拡大
m = AddBorders(m, 0, 0, 854-512, 0, color_gray50)

# 入力可視化画像ファイルの読み込み
b = ImageSource("img_kano\btn_%05d.png", 0, frames, 60, pixel_type="RGB32")
me = ImageSource("img_kano\movie_end.png", 0, m.Framecount - b.Framecount, 60, pixel_type="RGB32")

# ボタン・カウンタ画像をオーバレイ
m = Layer(m, b, "add", level = 257, x = m.width - b.width, y = m.height - b.height)

# movie_end画像をオーバレイ
m = ApplyRange(m, b.FrameCount-1, m.FrameCount-1, "Layer", me, "add", 257, m.width - me.width, m.height - me.height)




t = 0

m = WriteText(m, "どうも。渡辺製作所の同人ゲーム\n「えあふり　観鈴ちん危機一髪」の\nTAS動画佳乃Verです\n\n設定は難易度以外デフォルト\n難易度ハードです\n\n使用キャラは観鈴に続いて佳乃です", t)
t = t + 60 * 25

m = WriteText(m, "観鈴と佳乃では慣性パラメータが違い\n佳乃の方がジャンプ慣性が強いです。\n3面の最後のジャンプなどに影響します\nその分地上慣性は弱いようです\n地上振り向きが使える場面があります\n\nとはいえ、ほとんどやることは同じです\nなので、解説はありません\n",t)

t = 5165
m = WriteText(m, "最初のボーナスステージは暇なので\nちょっと遊んでみました\n観鈴のときも遊べば良かったですね", t)


t = 17397
m = WriteText(m, "ここ、\n良く見ると正面を向いて落ちています\n今後も時々やります", t, 60 * 12)

t = 19225
m = WriteText(m, "まだ遊ぶ余裕があります\n", t, 60 * 8)

t = 23525
m = WriteText(m, "ここと・・・\n", t, 60 * 4)

t = 23870
m = WriteText(m, "ここの調整がシビアでした\nわずかな隙をぬっています\n", t, 60 * 8)

t = 26578
m = WriteText(m, "ボス戦では無敵を取ってしまえば\n好き放題できますね", t, 60 * 8)


# テスト用
#m = Trim(m, 5000, 6000)


m
