;�ŏI�ύX 20160218

#Include IME.ahk

;CapsLock�L�[�̖�����
SetCapsLockState, AlwaysOff
sc03a::return

;���ϊ�+edsf -> �㉺���E
vk1Dsc07B & e::
    if GetKeyState("shift", "P"){
        if GetKeyState("Ctrl", "P"){
            Send, ^+{Up}
        }else{
            Send, +{Up}
        }
    }else{
        if GetKeyState("Ctrl", "P"){
            Send, ^{Up}
        }else{
            Send, {Up}
        }
    }
    return
vk1Dsc07B & d::
    if GetKeyState("shift", "P"){
        if GetKeyState("Ctrl", "P"){
            Send, ^+{Down}
        }else{
            Send, +{Down}
        }
    }else{
        if GetKeyState("Ctrl", "P"){
            Send, ^{Down}
        }else{
            Send, {Down}
        }
    }
    return
vk1Dsc07B & s::
    if GetKeyState("shift", "P"){
        if GetKeyState("Ctrl", "P"){
            Send, ^+{Left}
        }else{
            Send, +{Left}
        }
    }else{
        if GetKeyState("Ctrl", "P"){
            Send, ^{Left}
        }else{
            Send, {Left}
        }
    }
    return
vk1Dsc07B & f::
    if GetKeyState("shift", "P"){
        if GetKeyState("Ctrl", "P"){
            Send, ^+{Right}
        }else{
            Send, +{Right}
        }
    }else{
        if GetKeyState("Ctrl", "P"){
            Send, ^{Right}
        }else{
            Send, {Right}
        }
    }
    return

;���ϊ�+ikjl -> (Shift+)Ctrl+�㉺���E
;edsf�ł����蓖�Ă������Ctrl+�̓����������g���h���̂�
vk1Dsc07B & i::	
    if GetKeyState("Shift", "P"){
        Send, ^+{Up}
    }else{
        Send, ^{Up}
    }
    return

vk1Dsc07B & k::
    if GetKeyState("Shift", "P"){
        Send, ^+{Down}
    }else{
        Send, ^{Down}
    }
    return
vk1Dsc07B & j::
    if GetKeyState("Shift", "P"){
        Send, ^+{Left}
    }else{
        Send, ^{Left}
    }
    return
vk1Dsc07B & l::
    if GetKeyState("Shift", "P"){
        Send, ^+{Right}
    }else{
        Send, ^{Right}
    }
    return

; OneNote�p ���̂��ʏ�ݒ�ł͏�肭�����Ȃ�
; EnableUIAccess.ahk�̓����K�v����
; �w��exe�͑S��AutoHotkey.exe(����)��OK
; ���ϊ�+ed -> �㉺�A 
; �ϊ�+gh -> �y�[�W�؂�ւ�

#IfWinActive, ahk_class Framework::CFrame
vk1Dsc07B & e::SendPlay {blind}{Up}
vk1Dsc07B & d::SendPlay {blind}{Down}
vk1Csc079 & g::SendPlay ^{PgUp}
vk1Csc079 & h::SendPlay ^{PgDn}
vk1Csc079 & p::
    SendPlay !^g{Enter}	
return
#IfWinActive 


;���ϊ�+uo -> Home, End

vk1Dsc07B & u::
    if GetKeyState("shift", "P"){
        if GetKeyState("Ctrl", "P"){
            Send, ^+{Home}
        }else{
            Send, +{Home}
        }
    }else{
        if GetKeyState("Ctrl", "P"){
            Send, ^{Home}
        }else{
            Send, {Home}
        }
    }
    return

vk1Dsc07B & o::
    if GetKeyState("shift", "P"){
        if GetKeyState("Ctrl", "P"){
            Send, ^+{End}
        }else{
            Send, +{End}
        }
    }else{
        if GetKeyState("Ctrl", "P"){
            Send, ^{End}
        }else{
            Send, {End}
        }
    }
    return

;���ϊ�+wr -> PgUp,PgDown

vk1Dsc07B & w::
    if GetKeyState("shift", "P"){
        Send, +{PgUp}
    }else{
        Send, {PgUp}
    }
    return

vk1Dsc07B & r::
    if GetKeyState("shift", "P"){
        Send, +{PgDn}
    }else{
        Send, {PgDn}
    }
    return

;���ϊ�+zxcv -> ��78910
;�{���͕ϊ��L�[�Ŋ��蓖�Ă��������B�B�B
;Shift+F10�͉E�N���b�N���j���[�p
vk1Dsc07B & z:: Send, {F7}
vk1Dsc07B & x:: Send, {F8}
vk1Dsc07B & c:: Send, {F9}
vk1Dsc07B & v::
    if GetKeyState("shift", "P"){
       Send, +{F10}
    }else{
       Send, {F10}
    }
    return 

;���ϊ�+aqt -> f123
vk1Dsc07B & a::
    if GetKeyState("shift", "P"){
        Send, +{F1}
    }else{
        Send, {F1}
    }
    return
vk1Dsc07B & q:: Send, {F2}
vk1Dsc07B & t:: Send, {F3}

;���ϊ�+23 -> shift+ f23
vk1Dsc07B & 2:: Send, +{F2}
vk1Dsc07B & 3:: Send, +{F3}

;�ϊ�+2 -> Ctrl + f2
vk1Csc079 & 2:: Send, ^{F2}

;�ϊ�+j,l -> Alt + Tab
vk1Csc079 & l:: AltTab
vk1Csc079 & j:: ShiftAltTab

;�ϊ�+u,o -> Ctrl + Tab
vk1Csc079 & u::Send, ^+{Tab}
vk1Csc079 & o::Send, ^{Tab}

;�ϊ�+f -> �o�b�N�X�y�[�X
;shift+�ϊ�+f -> delete
vk1Csc079 & i::
    if GetKeyState("shift", "P"){
        Send, {delete}
    }else{
        Send, {BS}
    }
    return
;�ϊ�+k -> Enter
vk1Csc079 & k::
    if GetKeyState("shift", "P"){
        Send, {End}
        Send, {Enter}
    }else{
        Send, {Enter}
    }
    return
;Alt+k -> Alt+Enter Excel�p
!k:: Send, !{Enter}

;Mac���C�N�ȃV���[�g�J�b�g�L�[
;�ϊ�+q -> ����
vk1Csc079 & q:: Send, !{F4}
;�ϊ�+w -> tab����
vk1Csc079 & w:: Send, ^{F4}
;�ϊ�+r -> f5
vk1Csc079 & r:: Send, {F5}

;�ϊ�+s, c, v, x, z, y, a, t, n, d, f, g, b, e, h, Space -> Ctrl + ~
vk1Csc079 & s:: Send, ^s
vk1Csc079 & c:: Send, ^c
vk1Csc079 & x:: Send, ^x
vk1Csc079 & v:: Send, ^v
vk1Csc079 & z:: Send, ^z
vk1Csc079 & y:: Send, ^y
vk1Csc079 & a:: Send, ^a
vk1Csc079 & t:: Send, ^t
vk1Csc079 & n:: Send, ^n
vk1Csc079 & d:: Send, ^d
vk1Csc079 & f:: Send, ^f
vk1Csc079 & g:: Send, ^g
vk1Csc079 & b:: Send, ^b
vk1Csc079 & e:: Send, ^e
vk1Csc079 & h:: Send, ^h
vk1Csc079 & Space:: Send, ^{Space}

;�ϊ�+���ϊ� -> ���p/�S�p
vk1Csc079 & vk1Dsc07B:: Send, {vkF3sc029}

;�ϊ�+f -> �E�N���b�N���j���[
;�|�W�V�����ɉE�N���b�N���邩��s�v
;vk1Csc079 & f::
;    Send,{RButton down}
;   KeyWait,MButton
;  Send,{RButton up}
; Return

;Alt + jl -> �i�ޖ߂�
!j:: Send, !{Left}
!l:: Send, !{Right}

vk1Csc079 & m:: 
	Send, {Esc}
	IME_SET(0)
return