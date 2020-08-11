#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, NoIcon

IniRead, OutputVar, C:\Intel\Auto.ini, Time,Time2
Time2:=OutputVar*1000

sleep,%Time2%

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game1
Game1:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game2
Game2:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game3
Game3:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Game, Game4
Game4:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video,Video1
Game5:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video, Video2
Game6:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video, Video3
Game7:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Video, Video4
Game8:=OutputVar


IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code1
Code1:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code2
Code2:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code3
Code3:=OutputVar

IniRead, OutputVar, C:\Intel\Auto.ini, Code, Code4
Code4:=OutputVar

Process,Exist , %Game1%
NewPID_a:=ErrorLevel

Process, Exist , %Game2%
NewPID_b:= ErrorLevel

Process,Exist , %Game3%
NewPID_c:=ErrorLevel

Process,Exist , %Game4%
NewPID_d:=ErrorLevel

Process,Exist , %Game5%
NewPID_e:=ErrorLevel

Process,Exist , %Game6%
NewPID_f:=ErrorLevel

Process,Exist , %Game7%
NewPID_g:=ErrorLevel

Process,Exist , %Game8%
NewPID_h:=ErrorLevel

Process,Exist , %Code1%
NewPID_i:=ErrorLevel

Process, Exist , %Code2%
NewPID_j:= ErrorLevel

Process,Exist , %Code3%
NewPID_k:=ErrorLevel

Process,Exist , %Code4%
NewPID_l:=ErrorLevel


 if %NewPID_a%=0
 {
    if %NewPID_b%=0
    {
        if %NewPID_c%=0
        {
            if %NewPID_d%=0
            {
                if %NewPID_e%=0
                {
                    if %NewPID_f%=0
                    {
                        if %NewPID_g%=0
                        {
                            if %NewPID_h%=0
                            {
	                            if %NewPID_i%=0
   		                         {
             		                if %NewPID_j%=0
         		                    {
            		                    if %NewPID_k%=0
           		                            {
               		                            if %NewPID_l%=0
               		                            {
                                                Run C:\Program Files\DellFans\Key\ALT_a.vbs
		                                        return
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
 }

return

