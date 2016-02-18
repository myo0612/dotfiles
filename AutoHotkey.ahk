;最終変更 20160218

#Include IME.ahk

;CapsLockキーの無効化
SetCapsLockState, AlwaysOff
sc03a::return

;無変換+edsf -> 上下左右
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

;無変換+ikjl -> (Shift+)Ctrl+上下左右
;edsfでも割り当てたけれどCtrl+の同時押しが使い辛いので
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

; OneNote用 何故か通常設定では上手くいかない
; EnableUIAccess.ahkの導入必要あり
; 指定exeは全てAutoHotkey.exe(無印)でOK
; 無変換+ed -> 上下、 
; 変換+gh -> ページ切り替え

#IfWinActive, ahk_class Framework::CFrame
vk1Dsc07B & e::SendPlay {blind}{Up}
vk1Dsc07B & d::SendPlay {blind}{Down}
vk1Csc079 & g::SendPlay ^{PgUp}
vk1Csc079 & h::SendPlay ^{PgDn}
vk1Csc079 & p::
    SendPlay !^g{Enter}	
return
#IfWinActive 


;無変換+uo -> Home, End

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

;無変換+wr -> PgUp,PgDown

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

;無変換+zxcv -> ｆ78910
;本当は変換キーで割り当てたかった。。。
;Shift+F10は右クリックメニュー用
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

;無変換+aqt -> f123
vk1Dsc07B & a::
    if GetKeyState("shift", "P"){
        Send, +{F1}
    }else{
        Send, {F1}
    }
    return
vk1Dsc07B & q:: Send, {F2}
vk1Dsc07B & t:: Send, {F3}

;無変換+23 -> shift+ f23
vk1Dsc07B & 2:: Send, +{F2}
vk1Dsc07B & 3:: Send, +{F3}

;変換+2 -> Ctrl + f2
vk1Csc079 & 2:: Send, ^{F2}

;変換+j,l -> Alt + Tab
vk1Csc079 & l:: AltTab
vk1Csc079 & j:: ShiftAltTab

;変換+u,o -> Ctrl + Tab
vk1Csc079 & u::Send, ^+{Tab}
vk1Csc079 & o::Send, ^{Tab}

;変換+f -> バックスペース
;shift+変換+f -> delete
vk1Csc079 & i::
    if GetKeyState("shift", "P"){
        Send, {delete}
    }else{
        Send, {BS}
    }
    return
;変換+k -> Enter
vk1Csc079 & k::
    if GetKeyState("shift", "P"){
        Send, {End}
        Send, {Enter}
    }else{
        Send, {Enter}
    }
    return
;Alt+k -> Alt+Enter Excel用
!k:: Send, !{Enter}

;Macライクなショートカットキー
;変換+q -> 閉じる
vk1Csc079 & q:: Send, !{F4}
;変換+w -> tab閉じる
vk1Csc079 & w:: Send, ^{F4}
;変換+r -> f5
vk1Csc079 & r:: Send, {F5}

;変換+s, c, v, x, z, y, a, t, n, d, f, g, b, e, h, Space -> Ctrl + ~
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

;変換+無変換 -> 半角/全角
vk1Csc079 & vk1Dsc07B:: Send, {vkF3sc029}

;変換+f -> 右クリックメニュー
;ポジションに右クリックあるから不要
;vk1Csc079 & f::
;    Send,{RButton down}
;   KeyWait,MButton
;  Send,{RButton up}
; Return

;Alt + jl -> 進む戻る
!j:: Send, !{Left}
!l:: Send, !{Right}

vk1Csc079 & m:: 
	Send, {Esc}
	IME_SET(0)
return