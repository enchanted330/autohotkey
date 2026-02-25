;-----------------------------   Volume    -----------------------------;
vol_Step = 4

vol_DisplayTime = 1000

vol_CBM = Red

vol_CBW = Blue

vol_CW = Silver

; Bar's screen position.  Use -1 to center the bar in that dimension:
vol_PosX = -1
vol_PosY = -1
vol_Width = 150  ; width of bar
vol_Thick = 15   ; thickness of bar

; If your keyboard has multimedia buttons for Volume, you can
; try changing the below hotkeys to use them by specifying
; Volume_Up, ^Volume_Up, Volume_Down, and ^Volume_Down:

HotKey, #WheelUp, vol_MasterUp      ; Win+UpArrow
HotKey, #WheelDown, vol_MasterDown 


;___________________________________________ 
;_____Auto Execute Section__________________

; DON'T CHANGE ANYTHING HERE (unless you know what you're doing).

vol_BarOptionsMaster = 1:B ZH%vol_Thick% ZX0 ZY0 W%vol_Width% CB%vol_CBM% CW%vol_CW%
vol_BarOptionsWave   = 2:B ZH%vol_Thick% ZX0 ZY0 W%vol_Width% CB%vol_CBW% CW%vol_CW%

; If the X position has been specified, add it to the options.
; Otherwise, omit it to center the bar horizontally:
if vol_PosX >= 0
{
    vol_BarOptionsMaster = %vol_BarOptionsMaster% X%vol_PosX%
    vol_BarOptionsWave   = %vol_BarOptionsWave% X%vol_PosX%
}

; If the Y position has been specified, add it to the options.
; Otherwise, omit it to have it calculated later:
if vol_PosY >= 0
{
    vol_BarOptionsMaster = %vol_BarOptionsMaster% Y%vol_PosY%
    vol_PosY_wave = %vol_PosY%
    vol_PosY_wave += %vol_Thick%
    vol_BarOptionsWave = %vol_BarOptionsWave% Y%vol_PosY_wave%
}

#SingleInstance
SetBatchLines, 10ms
Return


;___________________________________________

vol_WaveUp:
SoundSet, +%vol_Step%, Wave
Gosub, vol_ShowBars
return

vol_WaveDown:
SoundSet, -%vol_Step%, Wave
Gosub, vol_ShowBars
return

vol_MasterUp:
SoundSet, +%vol_Step%
Gosub, vol_ShowBars
return

vol_MasterDown:
SoundSet, -%vol_Step%
Gosub, vol_ShowBars
return

vol_ShowBars:
; To prevent the "flashing" effect, only create the bar window if it
; doesn't already exist:
IfWinNotExist, vol_Wave
    Progress, %vol_BarOptionsWave%, , , vol_Wave
IfWinNotExist, vol_Master
{
    ; Calculate position here in case screen resolution changes while
    ; the script is running:
    if vol_PosY < 0
    {
        ; Create the Wave bar just above the Master bar:
        WinGetPos, , vol_Wave_Posy, , , vol_Wave
        vol_Wave_Posy -= %vol_Thick%
        Progress, %vol_BarOptionsMaster% Y%vol_Wave_Posy%, , , vol_Master
    }
    else
        Progress, %vol_BarOptionsMaster%, , , vol_Master
}
; Get both volumes in case the user or an external program changed them:
SoundGet, vol_Master, Master
SoundGet, vol_Wave, Wave
Progress, 1:%vol_Master%
Progress, 2:%vol_Wave%
SetTimer, vol_BarOff, %vol_DisplayTime%
return

vol_BarOff:
SetTimer, vol_BarOff, off
Progress, 1:Off
Progress, 2:Off
return

;-----------------------------   Key  Remap    ----------------------------;
;PgUp::Home
;PgDn::End

;-----------------------------   Hot Strings    -----------------------------;
::adblg::
send adb shell
send {enter}
send logcat | grep "&&&"
send {enter}
return

::sshh::
send ssh root:123456@192.168.137.
return

::gitcfg::
send git config core.autocrlf true
return

!d::send `t`tluzengmeng`tlzm`t202302{enter}
return
;------------------------------   Capslock+    ------------------------------;
CapsLock::
KeyWait, CapsLock     
if (A_ThisHotkey="CapsLock")
        {
        SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"    
        }
Return

#if GetKeyState("Capslock", "P")

`::Run D:\link\`
1::Run D:\link\1
2::Run D:\link\2
3::Run D:\link\3
4::Run D:\link\4
5::Run D:\link\5
6::Run D:\link\6
7::Run D:\link\7
8::Run D:\link\8
9::Run D:\link\9
0::Run D:\link\0
-::Run D:\link\-
=::Run D:\link\=
a::Run D:\link\a
b::Run D:\link\b
c::Run D:\link\c
d::Run D:\link\d
e::Run D:\link\e
f::Run D:\link\f
g::Run D:\link\g
p::Run D:\link\p
q::Run D:\link\q
r::Run D:\link\r
z::Run D:\link\z
v::Run D:\link\v
w::Run D:\link\w
s::Run D:\link\s
t::Run D:\link\t
x::Run D:\link\x

Numpad0::Run D:\link\Numpad0
Numpad1::Run D:\link\Numpad1
Numpad2::Run D:\link\Numpad2
Numpad3::Run D:\link\Numpad3
Numpad4::Run D:\link\Numpad4
Numpad5::Run D:\link\Numpad5
Numpad6::Run D:\link\Numpad6
Numpad7::Run D:\link\Numpad7
Numpad8::Run D:\link\Numpad8
Numpad9::Run D:\link\Numpad9

k:: SendInput,{Up}
j:: SendInput,{down}
h:: SendInput,{left}
l:: SendInput,{right}

i:: SendInput,{PgUp}
m:: SendInput,{PgDn}
u:: SendInput,{home}
n:: SendInput,{end}

#if

;------------------------------Edit This Script------------------------------;
^!e::
Edit This Script
Return

^!r::
Reload This Script
Return
