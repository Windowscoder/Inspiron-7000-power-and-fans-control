#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

if not A_IsAdmin
{
Run *RunAs "%A_ScriptFullPath%" 
ExitApp
}

RegWrite, REG_DWORD, HKLM\SYSTEM\CurrentControlSet\Control\Power, CsEnabled , 1
Process,Close,ThrottleStop.exe
Process,Close,Auto.exe
Process,Close,Hotkey.exe
FileDelete, C:\Intel\Hotkey.ini
FileDelete,C:\Intel\Auto.ini
