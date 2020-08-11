#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, Tray, NoIcon

IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Open:=OutputVar

if (Open=1)
{
Run C:\Program Files\DellFans\Key\ALT_a.vbs
return
}

if(Open=2)
{
Run C:\Program Files\DellFans\Key\ALT_b.vbs
return
}

if(Open=3)
{
Run C:\Program Files\DellFans\Key\ALT_c.vbs
return
}

if(Open=4)
{
Run C:\Program Files\DellFans\Key\ALT_d.vbs
return
}
