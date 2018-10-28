;--------------------------------------------Volume
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
;--------------------------------------------Application
^`:: 
Run D:\link\¡¤ 
return 

^1:: 
Run D:\link\1 
return 

^2::
Run D:\link\2
return 

^3:: 
Run D:\link\3
return 

^4:: 
Run D:\link\4
return 

^5:: 
Run D:\link\5
return 

^6:: 
Run D:\link\6
return 

^7::
Run D:\link\7 
return 

^8::
Run D:\link\8
return 


^9::
Run D:\link\9
return 

^0::
Run D:\link\0
return 

^=::
Run D:\link\=
return 

;--------------------------------------------Volume



;--------------------------------------------Script
^!e::
Edit This Script
Return

^!r::
Reload This Script
Return
