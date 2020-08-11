#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

menu,tray,noicon

global a:=0
global b:=0
global c:=0

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game1
Game1:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game2
Game2:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game3
Game3:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game4
Game4:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video,Video1
Video1:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video,Video2
Video2:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video,Video3
Video3:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video,Video4
Video4:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code1
Code1:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code2
Code2:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code3
Code3:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code4
Code4:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Time,Time4
Time4:=OutputVar*1000

Loop
{
Process,Exist , %Game1%
NewPID_a:=ErrorLevel

Process, Exist , %Game2%
NewPID_b:= ErrorLevel

Process,Exist , %Game3%
NewPID_c:=ErrorLevel

Process,Exist , %Game4%
NewPID_d:=ErrorLevel

Process,Exist , %Video1%
NewPID_e:=ErrorLevel

Process,Exist , %Video2%
NewPID_f:=ErrorLevel

Process,Exist , %Video3%
NewPID_g:=ErrorLevel

Process,Exist , %Video4%
NewPID_h:=ErrorLevel

Process,Exist , %Code1%
NewPID_i:=ErrorLevel

Process, Exist , %Code2%
NewPID_j:= ErrorLevel

Process,Exist , %Code3%
NewPID_k:=ErrorLevel

Process,Exist , %Code4%
NewPID_l:=ErrorLevel

if %NewPID_a% 
{
if not a
{
    Run C:\Program Files\DellFans\Key\ALT_b.vbs
    a:=1
}
}

if %NewPID_b% 
{
if not a
{
    Run C:\Program Files\DellFans\Key\ALT_b.vbs
    a:=1
}
}

if %NewPID_c% 
{
if not a
{
    Run C:\Program Files\DellFans\Key\ALT_b.vbs
    a:=1
}
}

if %NewPID_d% 
{
if not a
{  
    Run C:\Program Files\DellFans\Key\ALT_b.vbs
    a:=1
}
}

if %NewPID_e% 
{
if not c
{
Run C:\Program Files\DellFans\Key\ALT_b.vbs
c:=1
}
}

if %NewPID_f% 
{
if not c
{
Run C:\Program Files\DellFans\Key\ALT_b.vbs
c:=1
}
}

if %NewPID_g% 
{
if not c
{
Run C:\Program Files\DellFans\Key\ALT_b.vbs
c:=1
}
}

if %NewPID_h% 
{
if not c
{
Run C:\Program Files\DellFans\Key\ALT_b.vbs
c:=1
}
}

if c
{
                if %NewPID_e%=0
                {
                    if %NewPID_f%=0
                    {
                        if %NewPID_g%=0
                        {
                            if %NewPID_h%=0
                            {
                                c:=0
                                Run C:\Program Files\DellFans\Fans\Video_Fans.exe
                            }
                        }
                    }
                }
}

if a
{
 if %NewPID_a%=0
 {
    if %NewPID_b%=0
    {
        if %NewPID_c%=0
        {
            if %NewPID_d%=0
            {
            a:=0
 		    Run C:\Program Files\DellFans\Fans\Game_Fans.exe
            }
        }
    }
 }
}

if %NewPID_i%
{
if not b
{
Run C:\Program Files\DellFans\Key\ALT_c.vbs
b:=1
}
}

if %NewPID_j%
{
if not b
{
Run C:\Program Files\DellFans\Key\ALT_c.vbs
b:=1
}
}

if %NewPID_k%
{
if not b
{
Run C:\Program Files\DellFans\Key\ALT_c.vbs
b:=1
}
}

if %NewPID_l%
{
if not b
{
Run C:\Program Files\DellFans\Key\ALT_c.vbs
b:=1
}
}

if b
{
    if %NewPID_i%=0
    {
        if %NewPID_j%=0
        {
            if %NewPID_k%=0
            {
                if %NewPID_l%=0
                {
                    b:=0
                    Run C:\Program Files\DellFans\Fans\Code_Fans.exe
                }
            }
        }
    }
}
sleep,%Time4%
}