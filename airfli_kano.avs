# えあふり　観鈴ちん危機一髪　ノーマルモードハード佳野
# WIP


# wtf_frames を読み込む
Import("airfli_kano_frames.txt")

frames = wtf_frames


# 字幕色設定
global halocolor = $333333
global textcolor = $ffffff
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


# ムービー
m = AviSource("avi\airfli_kano.avi")
# 640x480 60fps YV12

# 音声の合成
#snd = WavSource("avi\airfli_snd.avi")
#m = AudioDub(m, snd)


# 音量調整
#m = Amplify(m, 0.75)

# 右側を切り落とす
border = 640-512
m = Crop(m, 0, 0, -border, 0)

# RGB32にした上でさらに右にグレー枠を入れて854x480に拡大
m = ConvertToRGB32(m)
m = AddBorders(m, 0, 0, 854-512, 0, $666666)

# 入力可視化画像ファイルの読み込み
b = ImageSource("img_kano\btn_%06d.png", 0, frames, 60, pixel_type="RGB32")
me = ImageSource("img_kano\movie_end.png", 0, m.Framecount - b.Framecount, 60, pixel_type="RGB32")

# ボタン・カウンタ画像をオーバレイ
m = Layer(m, b, "add", level = 257, x = m.width - b.width, y = m.height - b.height)

# movie_end画像をオーバレイ
m = ApplyRange(m, b.FrameCount-1, m.FrameCount-1, "Layer", me, "add", 257, m.width - me.width, m.height - me.height)




t = 0

m = WriteText(m, "どうも。渡辺製作所の同人ゲーム\n「えあふり　観鈴ちん危機一髪」の\nTAS動画佳乃Verです\n\n設定は難易度以外デフォルト\n難易度ハードです\n\n使用キャラは観鈴に続いて佳乃です", t)
t = t + 60 * 25

m
