#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;�Թ���Աģʽ���в��
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
��������ʱ�����ĸ�ɢ��ģʽ
1������ҳģʽ��2������Ƶģʽ��3������ģʽ
*/

IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Open:=OutputVar

IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar

if (Open=1)
{
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run c:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\��ҳ.ico, ,1
if(Remind=1)
{
TrayTip Dell, ��ҳģʽ
SetTimer, HideTrayTip, -3000
}
}

if(Open=2)
{
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run c:\Program Files\DellFans\Mode\Dell_command.exe
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\��Ƶ.ico, ,1
if(Remind=1)
{
TrayTip Dell, ��Ƶģʽ
SetTimer, HideTrayTip, -3000
}
}

if(Open=3)
{
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run c:\Program Files\DellFans\Mode\Dell_command.exe
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\���.ico, ,1
if(Remind=1)
{
TrayTip Dell, ���ģʽ
SetTimer, HideTrayTip, -3000
}
}

if(Open=4)
{
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run c:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\ȫ��.ico, ,1
if(Remind=1)
{
TrayTip Dell, ȫ��ģʽ
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
�趨�˳�������Զ��л������ģʽҲ������ԭװģʽ�ı�����ʩ
*/

#Persistent  
OnExit("ExitFunc")
OnExit(ObjBindMethod(MyObject, "Exiting"))
ExitFunc(ExitReason, ExitCode)
{
    ;�˳����򣬲��л���ԭװɢ�ȿ���    
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
}
class MyObject
{
    Exiting()
    {
       ;�˳�
    }
}

/*
�Ҽ�������ͼ��ģ��
*/

#Persistent 
Menu, Tray, Add, ʹ��ָ��, MenuHandler_pdf
Menu, Tray, Add
Menu, Open, Add, ��ҳ, MenuHandler_aa
Menu, Open, Add, ��Ƶ, MenuHandler_bb
Menu, Open, Add, ���, MenuHandler_cc
Menu, Open, Add, ȫ��, MenuHandler_dd
Menu, Tray, Add, ����ģʽѡ��,:Open
Menu, Tray, Add
Menu, Tray, Add, ��ҳ, MenuHandler_a
Menu, Tray, Add, ��Ƶ, MenuHandler_b 
Menu, Tray, Add, ���, MenuHandler_c 
Menu, Tray, Add, ȫ��, MenuHandler_d 
Menu, Tray, Add
Menu,Auto,Add,����,MenuHandler_open
Menu,Auto,Add,�ر�,MenuHandler_close
Menu, Tray, Add, �Զ��л�ɢ��ģʽ,:Auto
Menu, Tray, Add
Menu,Remind,Add,����,MenuHandler_on
Menu,Remind,Add,�ر�,MenuHandler_off
Menu,Tray,Add,ģʽ�л�����,:Remind
Menu,Tray,Add
Menu,Hotkey,Add,��ռ���ȼ�,MenuHandler_none
Menu,Hotkey,Add,CTRL�л���,MenuHandler_ctrl
Menu,Hotkey,Add,ALT�л���,MenuHandler_alt
Menu,Tray,Add,�ȼ�ģʽѡ��,:Hotkey
Menu, tray, NoStandard
Menu, tray, Standard
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
A:=OutputVar
if (A=1)
{
Menu, Tray, Check, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Menu, Open, Check, ��ҳ
Menu, Open, Uncheck, ��Ƶ
Menu, Open, Uncheck, ���
Menu, Open, Uncheck, ȫ��
}

if(A=2)
{
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Check, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Menu, Open, Uncheck, ��ҳ
Menu, Open, Check, ��Ƶ
Menu, Open, Uncheck, ���
Menu, Open, Uncheck, ȫ��
}

if(A=3)
{
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Check, ���
Menu, Tray, Uncheck, ȫ��
Menu, Open, Uncheck, ��ҳ
Menu, Open, Uncheck, ��Ƶ
Menu, Open, Check, ���
Menu, Open, Uncheck, ȫ��
}

if(A=4)
{
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Check, ȫ��
Menu, Open, Uncheck, ��ҳ
Menu, Open, Uncheck, ��Ƶ
Menu, Open, Uncheck, ���
Menu, Open, Check, ȫ��
}
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
B:=OutputVar
if(B=0)
{
Menu,Auto,Uncheck,����
Menu,Auto,Check,�ر�    
}
if(B=1)
{
Menu,Auto,Check,����
Menu,Auto,Uncheck,�ر�     
}
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
C:=OutputVar
if(C=1)
{
Menu,Hotkey,Check,��ռ���ȼ�
Menu,Hotkey,Uncheck,CTRL�л���
Menu,Hotkey,Uncheck,ALT�л��� 
}
if(C=2)
{
Menu,Hotkey,Uncheck,��ռ���ȼ�
Menu,Hotkey,Check,CTRL�л���
Menu,Hotkey,Uncheck,ALT�л��� 
}
if(C=3)
{
Menu,Hotkey,Uncheck,��ռ���ȼ�
Menu,Hotkey,Uncheck,CTRL�л���
Menu,Hotkey,Check,ALT�л��� 
}
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
D:=OutputVar
if(D=0)
{
Menu,Remind,Uncheck,����
Menu,Remind,Check,�ر�
}
if(D=1)
{
Menu,Remind,Check,����
Menu,Remind,Uncheck,�ر�
}
return

MenuHandler_pdf:
Run C:\Program Files\DellFans\Tips\ʹ��ָ��.pdf
return

MenuHandler_a:
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\��ҳ.ico, ,1
Menu, Tray, Tip , ��ҳ��Internet��
Menu, Tray, Check, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run C:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ��ҳģʽ
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_b:
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\��Ƶ.ico, ,1
Menu, Tray, Tip , ��Ƶ��Video��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Check, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ��Ƶģʽ
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_c:
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\���.ico, ,1
Menu, Tray, Tip , ��̣�Code��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Check, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ���ģʽ
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_d:
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\ȫ��.ico, ,1
Menu, Tray, Tip , ȫ�٣�Fury��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Check, ȫ��
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run C:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ȫ��ģʽ
SetTimer, HideTrayTip, -3000
}
return

MenuHandler_aa:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Check, ��ҳ
Menu, Open, Uncheck, ��Ƶ
Menu, Open, Uncheck, ���
Menu, Open, Uncheck, ȫ��
TrayTip Dell, ������˯�߻��Ѻ���Զ��л�����ҳģʽ.
SetTimer, HideTrayTip, -5000
return

MenuHandler_bb:
IniWrite, 2, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Uncheck, ��ҳ
Menu, Open, Check, ��Ƶ
Menu, Open, Uncheck, ���
Menu, Open, Uncheck, ȫ��
TrayTip Dell, ������˯�߻��Ѻ���Զ��л�����Ƶģʽ.
SetTimer, HideTrayTip, -5000
return

MenuHandler_cc:
IniWrite, 3, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Uncheck, ��ҳ
Menu, Open, Uncheck, ��Ƶ
Menu, Open, Check, ���
Menu, Open, Uncheck, ȫ��
TrayTip Dell, ������˯�߻��Ѻ���Զ��л������ģʽ.
SetTimer, HideTrayTip, -5000
return

MenuHandler_dd:
IniWrite, 4, C:\Program Files\DellFans\DellFans.ini, DellFans, Open
Menu, Open, Uncheck, ��ҳ
Menu, Open, Uncheck, ��Ƶ
Menu, Open, Uncheck, ���
Menu, Open, Check, ȫ��
TrayTip Dell, ������˯�߻��Ѻ���Զ��л���ȫ��ģʽ.
SetTimer, HideTrayTip, -5000
return

MenuHandler_open:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
Menu,Auto,Check,����
Menu,Auto,Uncheck,�ر� 
Run C:\Intel\Auto.ini
TrayTip Dell,�Ѿ������Զ��л����ܣ�������ע�����µ�½����Ч����ȷ���������趨�����ļ�.
SetTimer, HideTrayTip, -8000
return

MenuHandler_close:
IniWrite, 0, C:\Program Files\DellFans\DellFans.ini, DellFans, Auto
Menu,Auto,Uncheck,����
Menu,Auto,Check,�ر� 
TrayTip Dell, �Ѿ��ر��Զ��л����ܣ�������ע�����µ�½����Ч.
SetTimer, HideTrayTip, -8000
return

MenuHandler_on:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Menu,Remind,Check,����
Menu,Remind,Uncheck,�ر�
TrayTip Dell, �ѿ���ģʽ�л�����.
SetTimer, HideTrayTip, -5000
return

MenuHandler_off:
IniWrite, 0, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Menu,Remind,Uncheck,����
Menu,Remind,Check,�ر�
TrayTip Dell,�ѹر�ģʽ�л�����.
SetTimer, HideTrayTip, -5000
return

MenuHandler_none:
IniWrite, 1, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
Menu,Hotkey,Check,��ռ���ȼ�
Menu,Hotkey,Uncheck,CTRL�л���
Menu,Hotkey,Uncheck,ALT�л��� 
Run C:\Program Files\DellFans\None\None.bat
TrayTip Dell, ���趨Ϊ���ȼ�ռ�ã�������ע�����µ�½����Ч.
SetTimer, HideTrayTip, -6000
return

MenuHandler_ctrl:
IniWrite, 2, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
Menu,Hotkey,Uncheck,��ռ���ȼ�
Menu,Hotkey,Check,CTRL�л���
Menu,Hotkey,Uncheck,ALT�л���
Run C:\Program Files\DellFans\ctrl\CTRL.bat
TrayTip Dell, ���趨ΪCTRL+�����л���������ע�����µ�½����Ч.
SetTimer, HideTrayTip, -6000
return

MenuHandler_alt:
IniWrite, 3, C:\Program Files\DellFans\DellFans.ini, DellFans, Mode
Menu,Hotkey,Uncheck,��ռ���ȼ�
Menu,Hotkey,Uncheck,CTRL�л���
Menu,Hotkey,Check,ALT�л���
Run C:\Program Files\DellFans\alt\ALT.bat
TrayTip Dell, ���趨ΪALT+�����л���������ע�����µ�½����Ч.
SetTimer, HideTrayTip, -6000
return

^1::
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\��ҳ.ico, ,1
Menu, Tray, Tip , ��ҳ��Internet��
Menu, Tray, Check, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run C:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ��ҳģʽ
SetTimer, HideTrayTip, -3000
}
return

^2::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\��Ƶ.ico, ,1
Menu, Tray, Tip , ��Ƶ��Video��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Check, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ��Ƶģʽ
SetTimer, HideTrayTip, -3000
}
return

^3::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\���.ico, ,1
Menu, Tray, Tip , ��̣�Code��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Check, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ���ģʽ
SetTimer, HideTrayTip, -3000
}
return

^4::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\ȫ��.ico, ,1
Menu, Tray, Tip , ȫ�٣�Fury��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Check, ȫ��
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run C:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ȫ��ģʽ
SetTimer, HideTrayTip, -3000
}
return

^!F9::
Menu, Tray, Icon, C:\Program Files\DellFans\Icons\��ҳ.ico, ,1
Menu, Tray, Tip , ��ҳ��Internet��
Menu, Tray, Check, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_1.vbs
Run C:\Program Files\DellFans\Mode\LFan_Low_RFan_Low.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ��ҳģʽ
SetTimer, HideTrayTip, -3000
}
return

^+F9::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\��Ƶ.ico, ,1
Menu, Tray, Tip , ��Ƶ��Video��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Check, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_2.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ��Ƶģʽ
SetTimer, HideTrayTip, -3000
}
return

!+F9::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\���.ico, ,1
Menu, Tray, Tip , ��̣�Code��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Check, ���
Menu, Tray, Uncheck, ȫ��
Run C:\Program Files\DellFans\Key\ALT_3.vbs
Run C:\Program Files\DellFans\Mode\Dell_command.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ���ģʽ
SetTimer, HideTrayTip, -3000
}
return

^!+F9::
Menu, Tray, Icon, c:\Program Files\DellFans\Icons\ȫ��.ico, ,1
Menu, Tray, Tip , ȫ�٣�Fury��
Menu, Tray, Uncheck, ��ҳ
Menu, Tray, Uncheck, ��Ƶ
Menu, Tray, Uncheck, ���
Menu, Tray, Check, ȫ��
Run C:\Program Files\DellFans\Key\ALT_4.vbs
Run C:\Program Files\DellFans\Mode\LFan_Max_RFan_Max.exe
IniRead, OutputVar, C:\Program Files\DellFans\DellFans.ini, DellFans, Remind
Remind:=OutputVar
if(Remind=1)
{
TrayTip Dell, ȫ��ģʽ
SetTimer, HideTrayTip, -3000
}
return