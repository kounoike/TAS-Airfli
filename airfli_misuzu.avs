# �����ӂ�@�ϗ郂�[�h

# �v���O�C��
#LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\nnedi3.dll")
LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\warpsharp.dll")

# �����F�ݒ�
global halocolor = $333333
global textcolor = $ffffff
global fontface = "���C���I"

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


# ���[�r�[
m = AviSource("avi\airfli_misuzu.avi")
# 640x480 60fps YV12

# �����̍���
#snd = WavSource("avi\airfli_snd.avi")
#m = AudioDub(m, snd)


# ���ʒ���
#m = Amplify(m, 0.75)

# �E����؂藎�Ƃ�
border = 640-512
m = Crop(m, 0, 0, -border, 0)

# RGB32�ɂ�����ł���ɍ��E�ɍ��g������854x480�Ɋg��
m = ConvertToRGB32(m)
#m = AddBorders(m, (854-848)/2, 0, (854-848)/2, 0, $000000)
m = AddBorders(m, 0, 0, 854-512, 0, $000000)

# ���͉���
WScript("airfli_misuzu_input.js", "JScript")

t = 0

m = WriteText(m, "�ǂ����B�^���Ń��N�G�X�g�̂�����\n�n�Ӑ��쏊�̓��l�Q�[��\n�u�����ӂ�@�ϗ邿���@�ꔯ�v��\nTAS����ł�\n\n�ݒ�͓�Փx�ȊO�f�t�H���g\n��Փx�n�[�h�ł�\n\n�g�p�L�����͂Ƃ肠�����ϗ�ł��i�K���j", t)
t = t + 60 * 15

m = WriteText(m, "512x480�Ƃ����ϑ��I�ȉ𑜓x�̂��߁A\n���������Ȃ̂�16:9�ɂ��čŏ��̂�����\n�E���ɉ����t���܂�\n\n�Ƃ����Ă��A�����ǂ�ł�Ԃ�\n�ʂ��i��ōs���Ă��܂��̂ŁA\n�ŏ��̉����ǂ񂾂������x�Đ����ĉ�����", t)
t = t + 60 * 15

m = WriteText(m, "�{��́u�t���b�L�[�v�Ȃ�Q�[��(�m��Ȃ�)��\nAir�̃L�����N�^�[�Ŋy�������Ƃ������̂ł�\n\n���E�ƃW�����v�����̊ȒP�����\n��ʓ��ɂ���u���Ƃ������v�������āA\n�S�[���܂œ��������́A�ȒP�ȃQ�[���ł�\n\n���Ƃ������͎��L�����ɂ���ĕς��܂�", t)
t = t + 60 * 15

m = WriteText(m, "���L�������G�ɂӂ��ƃ��C�t-1�ł�\n�A��Ă��邨�Ƃ��������G�ɂӂ��ƁA\n�����Łu������v�܂�\n\n�����ꂽ���Ƃ������͈��̃p�^�[����\n��ʓ���������܂�\n\nRound10�Ȃǂł������Ƃ��낪����܂�", t)
t = t + 60 * 15

m = WriteText(m, "��Փx���n�[�h�ɂ����̂ŁA\n�G���G�̓����������A�{�X�ʂł̏o���p�x��\n�オ��܂�\n\n�G���G�̈ړ������邽�߁A�P���ɍŒZ���[�g��\n���Ƃ����������킯�ɂ͂����܂���", t)
t = t + 60 * 15

m = WriteText(m, "�X�e�[�W�\����1�`4�ʂ̂��ƁA5�ʂ�\n�{�[�i�X�X�e�[�W�ŁA6�`9�ʂ̂���\n10�ʂ��{�X�ʂƂ����\����5��J��Ԃ���\n�S50�ʍ\���ł�", t)
t = t + 60 * 15

m = WriteText(m, "���傤�ǃ{�[�i�X�X�e�[�W�ł��̂ŉ�����܂�\n\n�{�[�i�X�X�e�[�W�͑ł��グ����\n���Ƃ��������A��Ɏ������Ԃŕ߂܂��܂�\n�ŏ��͊ȒP�ł�����̖ʂقǖʓ|�ɂȂ�܂�", t)
t = t + 60 * 15

m = WriteText(m, "�g�p�\�L�����͍ŏ��͊ϗ�A���T�A�����\n3�l�ŁA3�l���N���A����Ɛ_�ނ��A\n�{�[�i�X�X�e�[�W��S�ăp�[�t�F�N�g����\n�����A���ꂼ��g�p�\�ɂȂ�܂�\n\n���̑��݂͓����s�s�`�����Ǝv���Ă܂����c", t)
t = t + 60 * 15

m = WriteText(m, "�U���̓}�b�v�ɐݒu����Ă���J�b�v��\n�i�ʂɂ���ĕς��j���g���܂�\n\n�P���ɏd�Ȃ�΃J�b�v���������āA\n�W�����v�{�^���������ƌ����Ă��������\n�v����������蓊���čU�����܂�", t)
t = t + 60 * 15

m = WriteText(m, "���삪�P���Ȃ��Ƃ������āATAS�炵��\n�ϑԃ��[�u�͂���܂���\n�ϑԂ������]�̕��̓}�C���X����\n�X���C�f�B���O������ǂ����i��`�j\n\nTAS�Ȃ�ł͂̓����Ƃ��Ă�2�A\n�u�p���n�v�Ɓu�W�����v�ӂ�ނ��v������܂�\n�i����ɖ����j", t)
t = t + 60 * 15

m = WriteText(m, "�u�p���n�v�ɂ���\n\n���ʂ̓W�����v����ƒ��_��\n�����Ԃ���܂Ŏ~�߂��܂���\n�n�`�̊p�ɐڐG���邱�Ƃɂ����\n�����ɒ��n���s���ł���悤�ɂȂ�܂�\n���̓������p���n�ƌĂ�ł܂�", t)
t = t + 60 * 15

m = WriteText(m, "�u�W�����v�ӂ�ނ��v�ɂ���\n\n���̃Q�[���́A�Ƃɂ����������������ł��B\n�U����������ł��Ȃ�̎��Ԃ�������܂�\n�i�ϗ�̏ꍇ�j�n��ŐU���������\n�W�����v���ĐU��������������ł�\n���̓������W�����v�ӂ�ނ��ƌĂ�ł܂�\n\n", t)
t = t + 60 * 15

m = WriteText(m, "�\�Ȍ���ӂ�ނ��̓W�����v�ӂ�ނ���\n�s���܂�\n�n��ӂ�ނ��͂قƂ�ǎg���܂���", t)
t = t + 60 * 15

m = WriteText(m, "�A�C�e���ɂ���\n\n�ォ��F�X�ȃA�C�e���������Ă��܂����A\n���܂�g���܂���\n�t���[�����Ƃ̓��͂ɂ���ė������ς��\n�悤�ł����A���܂�g��Ȃ��̂Łc\n\n�ꉞ���\n���F���G8�b�@�H�F��i�W�����v10�b\nx2�F�X�R�A2�{30�b x3�F�X�R�A3�{30�b\n�����v�F�����^�C����\n�J�b�v�F�U���A�C�e������\n1UP�F���C�t+1 �X�}�[�g�{���F�S�̍U��", t)
t = t + 60 * 15

m = WriteText(m, "�{�X�ʂɂ���\n\n�������葬���������{�X������ł�\n�U���A�C�e�������x���Ԃ��ē|���܂�\n\n���q����̏ꍇ�A������̂��鍂���ɍ��킹�Ă��܂�\n�܂��A�U��������Ƃ��o���܂���", t)
t = t + 60 * 15

m = WriteText(m, "�{�X�ʂ��I���ƃX�e�[�W���ς��܂�\n�����ڂ����łȂ��G���G�̐��\�Ȃǂ�\n�ς��܂�\n\n�ȏ�ŉ������U�I���܂�\n\n�{�X�̓����ɂ��ĂƓ����I�Ȗʂɂ��āA\n���ꂼ��̖ʂŌʂɉ�����܂�", t)
t = t + 60 * 15


t = 25970
m = WriteText(m, "������ł�\n\n�܂��͈ړ��p�^�[�������q����̂悤�ɒP��\n�ł͂Ȃ��Ȃ��Ă��܂��B\n����̒[�ŐU���������A���������킹��\n���Ȃ�������\n\n�����āA����̒[�ɂ���Ƃ����ɍ�����������\n���X��2�񓊂��Ă��܂�", t)



return m