# coding: utf-8

import os
import glob
import struct
from PIL import Image, ImageDraw, ImageFont

#img保存先
imgdir = 'img_kano'

# 利用するフォント、サイズ
font = ImageFont.truetype('consola.ttf', 18, encoding='utf-8')

shadow = '#252525'
fill = 'white'

def get_size(font, text):
    # フォントのサイズを取得するダミーのImage
    img_tmp = Image.new('RGBA', (128,128))
    draw_tmp = ImageDraw.Draw(img_tmp)

    w,h = draw_tmp.textsize(text, font)
    return (w,h)

def drawtext_withshadow(img, font, text, shadow_color, fill_color):
    # Draw 関数でオブジェクトを作成。
    draw = ImageDraw.Draw(img)
    # 画面の左上隅にテキストを描画する。
    # 影を先に描画する
    draw.text((0, 1), text, font=font, fill=shadow_color)
    draw.text((1, 0), text, font=font, fill=shadow_color)
    draw.text((1, 2), text, font=font, fill=shadow_color)
    draw.text((2, 1), text, font=font, fill=shadow_color)
    draw.text((1, 1), text, font=font, fill=fill_color)

def make_movieend():
    t = "Movie end."
    w,h = get_size(font, t)
    img = Image.new('RGBA', (w+2, h+3))
    drawtext_withshadow(img, font, t, shadow, fill)
    img.save(r'{0:s}\movie_end.png'.format(imgdir))

make_movieend()

button_text = '<v^>AB'
text_tmp = "{0:s} {1:5d}/{1:5d} ".format(button_text, 0)

(w,h) = get_size(font, text_tmp)

# ボタン・カウンタ画像の幅、高さ
image_width = w + 2
image_height = h + 3


wtffile = "AirFli_kano.wtf"
wtf_header_fmt = "4sII8sIIII48s16II160s712x"
wtf_key_fmt = "8c"

wtf = open(wtffile, "rb")

wtf_header_str = wtf.read(1024)

wtf_header = struct.unpack(wtf_header_fmt, wtf_header_str)

wtf_frames = wtf_header[1]
wtf_rr = wtf_header[2]

print "frames:{0:d} rr:{1:d}".format(wtf_frames, wtf_rr)

f = open("airfli_kano_frames.txt","w")
f.write("wtf_frames = {0:d}\n".format(wtf_frames))
#f.write(r'm = AviSource("AVI\airfli_kano.avi", "' + '", "'.join(glob.glob(r"AVI\airfli_kano[0-9]*.avi")) + '")\n')
f.close()



if not os.path.exists(imgdir):
    os.mkdir(imgdir)


for frame in range(wtf_frames):
    keys_str = wtf.read(8)
    wtf_keys = struct.unpack(wtf_key_fmt,keys_str)

    keys = [' ',' ',' ',' ',' ',' ']
    #print wtf_keys
    
    for k in wtf_keys:
        if k == 'Z':
            keys[4] = 'A'
        if k == 'X':
            keys[5] = 'B'
        if k == '\x25':
            keys[0] = '<'
        if k == '\x28':
            keys[1] = 'v'
        if k == '\x26':
            keys[2] = '^'
        if k == '\x27':
            keys[3] = '>'
    key_text = "".join(keys)
    counter_text = "{0:05d}/{1:05d}".format(frame, wtf_frames)
    text = "{0:s} {1:s} ".format(key_text, counter_text)
    #print text

    # デフォルト背景色の canvasを用意する。
    img = Image.new('RGBA', (image_width, image_height))
    drawtext_withshadow(img, font, text, shadow, fill)

    img.save(r'{0:s}\btn_{1:05d}.png'.format(imgdir,frame))


