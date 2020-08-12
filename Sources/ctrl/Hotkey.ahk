#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;以管理员模式运行插件
if not A_IsAdmin
{
Run *RunAs "%A_ScriptFullPath%" 
ExitApp
}

HideTrayTip() 
{ 
    TrayTip
}
/*
开启程序时运行哪个散热模式
1代表网页模式，2代表视频模式，3代表编程模式
*/

IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Open:=OutputVar

IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar

if (Open=1)
{
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run c:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\网页.ico, ,1
if(Remind=1)
{
TrayTip Dell, 网页模式
SetTimer, HideTrayTip, -3000
}
}

if(Open=2)
{
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run c:\Program Files\DellFans\Mode\Dell_command.exe
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\视频.ico, ,1
if(Remind=1)
{
TrayTip Dell, 视频模式
SetTimer, HideTrayTip, -3000
}
}

if(Open=3)
{
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run c:\Program Files\DellFans\Mode\Dell_command.exe
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\编程.ico, ,1
if(Remind=1)
{
TrayTip Dell, 编程模式
SetTimer, HideTrayTip, -3000
}
}

if(Open=4)
{
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run c:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\全速.ico, ,1
if(Remind=1)
{
TrayTip Dell, 全速模式
SetTimer, HideTrayTip, -3000
}
}

IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
Auto:=OutputVar

if(Auto=1)
{
    Run c:\Program Files\DellFans\Auto.exe
}

/*
设定退出程序后，自动切换到编程模式也即电脑原装模式的保护措施
*/

#Persistent  
OnExit("ExitFunc")
OnExit(ObjBindMethod(MyObject, "Exiting"))
ExitFunc(ExitReason, ExitCode)
{
    ;退出程序，并切换至原装散热控制    
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
}
class MyObject
{
    Exiting()
    {
       ;退出
    }
}

/*
右键任务栏图标模块
*/

#Persistent 
Menu, Tray, Add, 使用指南, MenuHandler_pdf
Menu, Tray, Add
Menu, Open, Add, 网页, MenuHandler_aa
Menu, Open, Add, 视频, MenuHandler_bb
Menu, Open, Add, 编程, MenuHandler_cc
Menu, Open, Add, 全速, MenuHandler_dd
Menu, Tray, Add, 启动模式选择,:Open
Menu, Tray, Add
Menu, Tray, Add, 网页, MenuHandler_a
Menu, Tray, Add, 视频, MenuHandler_b 
Menu, Tray, Add, 编程, MenuHandler_c 
Menu, Tray, Add, 全速, MenuHandler_d 
Menu, Tray, Add
Menu,Auto,Add,开启,MenuHandler_open
Menu,Auto,Add,关闭,MenuHandler_close
Menu, Tray, Add, 自动切换散热模式,:Auto
Menu, Tray, Add
Menu,Remind,Add,开启,MenuHandler_on
Menu,Remind,Add,关闭,MenuHandler_off
Menu,Tray,Add,模式切换提醒,:Remind
Menu,Tray,Add
Menu,Hotkey,Add,不占用热键,MenuHandler_none
Menu,Hotkey,Add,CTRL切换版,MenuHandler_ctrl
Menu,Hotkey,Add,ALT切换版,MenuHandler_alt
Menu,Tray,Add,热键模式选择,:Hotkey
Menu, tray, NoStandard
Menu, tray, Standard
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
A:=OutputVar
if (A=1)
{
Menu, Tray, Check, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Menu, Open, Check, 网页
Menu, Open, Uncheck, 视频
Menu, Open, Uncheck, 编程
Menu, Open, Uncheck, 全速
}

if(A=2)
{
Menu, Tray, Uncheck, 网页
Menu, Tray, Check, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Menu, Open, Uncheck, 网页
Menu, Open, Check, 视频
Menu, Open, Uncheck, 编程
Menu, Open, Uncheck, 全速
}

if(A=3)
{
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Check, 编程
Menu, Tray, Uncheck, 全速
Menu, Open, Uncheck, 网页
Menu, Open, Uncheck, 视频
Menu, Open, Check, 编程
Menu, Open, Uncheck, 全速
}

if(A=4)
{
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Check, 全速
Menu, Open, Uncheck, 网页
Menu, Open, Uncheck, 视频
Menu, Open, Uncheck, 编程
Menu, Open, Check, 全速
}
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
B:=OutputVar
if(B=0)
{
Menu,Auto,Uncheck,开启
Menu,Auto,Check,关闭    
}
if(B=1)
{
Menu,Auto,Check,开启
Menu,Auto,Uncheck,关闭     
}
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
C:=OutputVar
if(C=1)
{
Menu,Hotkey,Check,不占用热键
Menu,Hotkey,Uncheck,CTRL切换版
Menu,Hotkey,Uncheck,ALT切换版 
}
if(C=2)
{
Menu,Hotkey,Uncheck,不占用热键
Menu,Hotkey,Check,CTRL切换版
Menu,Hotkey,Uncheck,ALT切换版 
}
if(C=3)
{
Menu,Hotkey,Uncheck,不占用热键
Menu,Hotkey,Uncheck,CTRL切换版
Menu,Hotkey,Check,ALT切换版 
}
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
D:=OutputVar
if(D=0)
{
Menu,Remind,Uncheck,开启
Menu,Remind,Check,关闭
}
if(D=1)
{
Menu,Remind,Check,开启
Menu,Remind,Uncheck,关闭
}
return

MenuHandler_pdf:
Run C:\Program Files\DellFans\Tips\使用指南.pdf
return

MenuHandler_a:
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\网页.ico, ,1
Menu, Tray, Tip , 网页（Internet）
Menu, Tray, Check, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run C:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 网页模式
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_b:
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\视频.ico, ,1
Menu, Tray, Tip , 视频（Video）
Menu, Tray, Uncheck, 网页
Menu, Tray, Check, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 视频模式
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_c:
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\编程.ico, ,1
Menu, Tray, Tip , 编程（Code）
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Check, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 编程模式
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_d:
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\全速.ico, ,1
Menu, Tray, Tip , 全速（Fury）
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Check, 全速
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run C:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 全速模式
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_aa:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Check, 网页
Menu, Open, Uncheck, 视频
Menu, Open, Uncheck, 编程
Menu, Open, Uncheck, 全速
TrayTip Dell, 开机或睡眠唤醒后会自动切换到网页模式.
SetTimer, HideTrayTip, -5000
return

MenuHandler_bb:
IniWrite, 2, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Uncheck, 网页
Menu, Open, Check, 视频
Menu, Open, Uncheck, 编程
Menu, Open, Uncheck, 全速
TrayTip Dell, 开机或睡眠唤醒后会自动切换到视频模式.
SetTimer, HideTrayTip, -5000
return

MenuHandler_cc:
IniWrite, 3, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Uncheck, 网页
Menu, Open, Uncheck, 视频
Menu, Open, Check, 编程
Menu, Open, Uncheck, 全速
TrayTip Dell, 开机或睡眠唤醒后会自动切换到编程模式.
SetTimer, HideTrayTip, -5000
return

MenuHandler_dd:
IniWrite, 4, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Uncheck, 网页
Menu, Open, Uncheck, 视频
Menu, Open, Uncheck, 编程
Menu, Open, Check, 全速
TrayTip Dell, 开机或睡眠唤醒后会自动切换到全速模式.
SetTimer, HideTrayTip, -5000
return

MenuHandler_open:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
Menu,Auto,Check,开启
Menu,Auto,Uncheck,关闭 
Run C:\Intel\Auto.ini
TrayTip Dell,已经开启自动切换功能，重启或注销重新登陆即生效，请确保已自行设定配置文件.
SetTimer, HideTrayTip, -8000
return

MenuHandler_close:
IniWrite, 0, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
Menu,Auto,Uncheck,开启
Menu,Auto,Check,关闭 
TrayTip Dell, 已经关闭自动切换功能，重启或注销重新登陆即生效.
SetTimer, HideTrayTip, -8000
return

MenuHandler_on:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Menu,Remind,Check,开启
Menu,Remind,Uncheck,关闭
TrayTip Dell, 已开启模式切换提醒.
SetTimer, HideTrayTip, -5000
return

MenuHandler_off:
IniWrite, 0, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Menu,Remind,Uncheck,开启
Menu,Remind,Check,关闭
TrayTip Dell,已关闭模式切换提醒.
SetTimer, HideTrayTip, -5000
return

MenuHandler_none:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
Menu,Hotkey,Check,不占用热键
Menu,Hotkey,Uncheck,CTRL切换版
Menu,Hotkey,Uncheck,ALT切换版 
Run C:\Program Files\DellFans\None\None.bat
TrayTip Dell, 已设定为无热键占用，重启或注销重新登陆即生效.
SetTimer, HideTrayTip, -6000
return

MenuHandler_ctrl:
IniWrite, 2, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
Menu,Hotkey,Uncheck,不占用热键
Menu,Hotkey,Check,CTRL切换版
Menu,Hotkey,Uncheck,ALT切换版
Run C:\Program Files\DellFans\ctrl\CTRL.bat
TrayTip Dell, 已设定为CTRL+数字切换，重启或注销重新登陆即生效.
SetTimer, HideTrayTip, -6000
return

MenuHandler_alt:
IniWrite, 3, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
Menu,Hotkey,Uncheck,不占用热键
Menu,Hotkey,Uncheck,CTRL切换版
Menu,Hotkey,Check,ALT切换版
Run C:\Program Files\DellFans\alt\ALT.bat
TrayTip Dell, 已设定为ALT+数字切换，重启或注销重新登陆即生效.
SetTimer, HideTrayTip, -6000
return

^1::
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\网页.ico, ,1
Menu, Tray, Tip , 网页（Internet）
Menu, Tray, Check, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run C:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 网页模式
SetTimer, HideTrayTip, -3000
}
return

^2::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\视频.ico, ,1
Menu, Tray, Tip , 视频（Video）
Menu, Tray, Uncheck, 网页
Menu, Tray, Check, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 视频模式
SetTimer, HideTrayTip, -3000
}
return

^3::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\编程.ico, ,1
Menu, Tray, Tip , 编程（Code）
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Check, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 编程模式
SetTimer, HideTrayTip, -3000
}
return

^4::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\全速.ico, ,1
Menu, Tray, Tip , 全速（Fury）
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Check, 全速
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run C:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 全速模式
SetTimer, HideTrayTip, -3000
}
return

^!F9::
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\网页.ico, ,1
Menu, Tray, Tip , 网页（Internet）
Menu, Tray, Check, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run C:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 网页模式
SetTimer, HideTrayTip, -3000
}
return

^+F9::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\视频.ico, ,1
Menu, Tray, Tip , 视频（Video）
Menu, Tray, Uncheck, 网页
Menu, Tray, Check, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 视频模式
SetTimer, HideTrayTip, -3000
}
return

!+F9::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\编程.ico, ,1
Menu, Tray, Tip , 编程（Code）
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Check, 编程
Menu, Tray, Uncheck, 全速
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 编程模式
SetTimer, HideTrayTip, -3000
}
return

^!+F9::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\全速.ico, ,1
Menu, Tray, Tip , 全速（Fury）
Menu, Tray, Uncheck, 网页
Menu, Tray, Uncheck, 视频
Menu, Tray, Uncheck, 编程
Menu, Tray, Check, 全速
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run C:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, 全速模式
SetTimer, HideTrayTip, -3000
}
return