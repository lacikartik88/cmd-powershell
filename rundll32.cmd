@echo off
chcp 1252
cls
if not "%1"=="max" start /max cmd /c %0 max & Exit /b
:: ##################################################################################################
:: # Title     : Rundll32.exe Command List                                                          #
:: # Created By: Kártik László [(Senior IT System Engineer)]                                        #
:: # Created On: 22-11-2022                                                                         #
:: # Filename  : rundll32.cmd                                                                       #
:: # Tutorial  : https://github.com/cmd-powershell                                                  #
:: ##################################################################################################
set "Title=rundll32.exe Command List" & set "Author=Kártik László (Senior IT System Engineer)" & set "Copyright=Copyright © 2022"
title %Title% - Written by %Author%. - %Copyright%.

setlocal EnableDelayedExpansion
fsutil Dirty Query %SystemDrive% > nul && goto:[RunAs]
echo CreateObject^("Shell.Application"^). ^
ShellExecute "%~0","+","","RunAs",1 > "%Temp%\+.vbs" && "%Temp%\+.vbs" & Exit
:[RunAs]

set Arr[0]=Exit
set Arr[1]=Rundll32.exe shell32.dll,ShellAbout
set Arr[2]=Rundll32 %SystemRoot%\system32\shwebsvc.dll,AddNetPlaceRunDll
set Arr[3]=Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL AddPrinter
set Arr[4]=Rundll32.exe tcpmonui.dll,LocalAddPortUI
set Arr[5]=Rundll32.exe shell32.dll,Control_RunDLL
set Arr[6]=Rundll32.exe shell32.dll,Control_RunDLL timedate.cpl
set Arr[7]=Rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,1
set Arr[8]=Rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0
set Arr[9]=Rundll32.exe %SystemRoot%\System32\newdev.dll,DeviceInternetSettingUi
set Arr[10]=Rundll32.exe devmgr.dll DeviceManager_Execute
set Arr[11]=Rundll32.exe shell32.dll,Control_RunDLL desk.cpl
set Arr[12]=Rundll32.exe shell32.dll,Control_RunDLL access.cpl
set Arr[13]=Rundll32.exe sysdm.cpl,EditEnvironmentVariables
set Arr[14]=Rundll32.exe shell32.dll,Options_RunDLL 0
set Arr[15]=Rundll32.exe shell32.dll,Options_RunDLL 2
set Arr[16]=Rundll32.exe shell32.dll,Options_RunDLL 7
set Arr[17]=Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL FontsFolder
set Arr[18]=Rundll32.exe keymgr.dll,PRShowSaveWizardExW
set Arr[19]=Rundll32.exe shell32.dll,Control_RunDLL joy.cpl
set Arr[20]=Rundll32.exe powrprof.dll,SetSuspendState
set Arr[21]=Rundll32.exe shell32.dll,Control_RunDLL srchadmin.dll
set Arr[22]=Rundll32.exe shell32.dll,Control_RunDLL irprops.cpl
set Arr[23]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
set Arr[24]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
set Arr[25]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
set Arr[26]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 16384
set Arr[27]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
set Arr[28]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
set Arr[29]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
set Arr[30]=Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
set Arr[31]=Rundll32.exe shdocvw.dll,DoOrganizeFavDlg
set Arr[32]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl
set Arr[33]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,1
set Arr[34]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,2
set Arr[35]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,3
set Arr[36]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,4
set Arr[37]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,5
set Arr[38]=Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,6
set Arr[39]=Rundll32.exe shell32.dll,Control_RunDLL main.cpl @1
set Arr[40]=Rundll32.exe user32.dll,LockWorkStation
set Arr[41]=Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL Connect
set Arr[42]=Rundll32.exe user32.dll,SwapMouseButton
set Arr[43]=Rundll32.exe shell32.dll,Control_RunDLL main.cpl
set Arr[44]=Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,1
set Arr[45]=Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,2
set Arr[46]=Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,3
set Arr[47]=Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,4
set Arr[48]=Rundll32.exe shell32.dll,Control_RunDLL ncpa.cpl
set Arr[49]=Rundll32.exe shell32.dll,Control_RunDLL odbccp32.cpl
set Arr[50]=Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,0
set Arr[51]=Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,1
set Arr[52]=Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,2
set Arr[53]=Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,3
set Arr[54]=Rundll32.exe shell32.dll,Control_RunDLL tabletpc.cpl
set Arr[55]=Rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,2
set Arr[56]=Rundll32.exe shell32.dll,Control_RunDLL powercfg.cpl
set Arr[57]=Rundll32.exe Printui.dll,PrintUIEntry /?
set Arr[58]=Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder
set Arr[59]=Rundll32.exe advapi32.dll,ProcessIdleTasks
set Arr[60]=Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,0
set Arr[61]=Rundll32.exe shell32.dll,Control_RunDLL Intl.cpl,,0
set Arr[62]=Rundll32.exe shell32.dll,Control_RunDLL Intl.cpl,,1
set Arr[63]=Rundll32.exe shell32.dll,Control_RunDLL Intl.cpl,,2
set Arr[64]=Rundll32.exe shell32.dll,Control_RunDLL HotPlug.dll
set Arr[65]=Rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1
set Arr[66]=Rundll32.exe shell32.dll,Control_RunDLL wscui.cpl
set Arr[67]=Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,3
set Arr[68]=Rundll32.exe shell32.dll,Control_RunDLL NetSetup.cpl
set Arr[69]=Rundll32.exe powrprof.dll,SetSuspendState
set Arr[70]=Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,0
set Arr[71]=Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,1
set Arr[72]=Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,2
set Arr[73]=Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,3
set Arr[74]=Rundll32.exe shell32.dll,Control_RunDLL %SystemRoot%\System32\Speech\SpeechUX\sapi.cpl,,1
set Arr[75]=Rundll32.exe shell32.dll,Options_RunDLL 3
set Arr[76]=Rundll32.exe keymgr.dll,KRShowKeyMgr
set Arr[77]=Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,1
set Arr[78]=Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,2
set Arr[79]=Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,3
set Arr[80]=Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,4
set Arr[81]=Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,5
set Arr[82]=Rundll32.exe shell32.dll,Options_RunDLL 1
set Arr[83]=Rundll32.exe Shell32.dll,Control_RunDLL input.dll,,{C07337D3-DB2C-4D0B-9A93-B722A6C106E2}
set Arr[84]=Rundll32.exe shell32.dll,Control_RunDLL nusrmgr.cpl
set Arr[85]=Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2
set Arr[86]=Rundll32.exe shell32.dll,Control_RunDLL firewall.cpl
set Arr[87]=Rundll32.exe pwlauncher.dll,ShowPortableWorkspaceLauncherConfigurationUX

:Options
color 0a
echo. & echo  =====================================================================================================================================================================
        echo  %Title% - Written by %Author%. - %Copyright%.
        echo  =====================================================================================================================================================================
echo. & echo  INFORMATION:
echo. & echo    ^> Windows [rundll32] commands loads and runs 32-bit Dynamic-Link Libraries (DLLs) that can be used for directly invoking specified functions, or used to create
        echo      shortcuts with.
        echo    ^> This program provides a quick way to directly invoke these specified functions.
        echo    ^> The Windows that open may look slightly different to normal, this is because they are opened in their pure form WITHOUT ANY enhanced viual effects being applied.
echo. & echo  WARNING:
echo. & echo    The following immediately RUNS the commands associated with them:
echo. & echo    ^> [20] Hibernate or Sleep
        echo    ^> [40] Lock PC
        echo    ^> [69] Sleep or Hibernate
echo. & echo  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo. & echo  Options:
echo. & echo  [ 0] EXIT this Program.
echo. & echo  [ 1] About Windows                                                             [46] Mouse Properties - Wheel Tab
        echo  [ 2] Add Network Location Wizard                                               [47] Mouse Properties - Hardware Tab
        echo  [ 3] Add Printer Wizard                                                        [48] Network Connections
        echo  [ 4] Add Standard TCP/IP Printer Port Wizard                                   [49] ODBC Data Source Administrator
        echo  [ 5] Control Panel                                                             [50] Offline Files (General Tab)
        echo  [ 6] Date and Time                                                             [51] Offline Files (Disk Usage Tab)
        echo  [ 7] Date and Time - Additional Clocks Tab                                     [52] Offline Files (Encryption Tab)
        echo  [ 8] Desktop Icon Settings                                                     [53] Offline Files (Network Tab)
        echo  [ 9] Device Installation Settings                                              [54] Pen and Touch
        echo  [10] Device Manager                                                            [55] Personalization - Background Settings
        echo  [11] Display Settings                                                          [56] Power Options
        echo  [12] Ease of Access Center                                                     [57] Printer User Interface
        echo  [13] Environment Variables                                                     [58] Printers Folder
        echo  [14] File Explorer Options - General Tab                                       [59] Process Idle Tasks
        echo  [15] File Explorer Options - Search Tab                                        [60] Programs and Features
        echo  [16] File Explorer Options - View Tab                                          [61] Region - Formats Tab
        echo  [17] Fonts Folder                                                              [62] Region - Location Tab
        echo  [18] Forgotten Password Wizard                                                 [63] Region - Administrative Tab
        echo  [19] Game Controllers                                                          [64] Safely Remove Hardware
        echo  [20] Hibernate or Sleep                                                        [65] Screen Saver Settings
        echo  [21] Indexing Options                                                          [66] Security and Maintenance
        echo  [22] Infared                                                                   [67] Set Program Access and Computer Defaults
        echo  [23] Internet Explorer - Delete ALL Browsing History                           [68] Set Up a Network Wizard
        echo  [24] Internet Explorer - Delete ALL Browsing History and Add-Ons History       [69] Sleep or Hibernate
        echo  [25] Internet Explorer - Delete Cookies and Website Data                       [70] Sound - Playback Tab
        echo  [26] Internet Explorer - Delete Download History                               [71] Sound - Recording Tab
        echo  [27] Internet Explorer - Delete Form Data                                      [72] Sound - Sounds Tab
        echo  [28] Internet Explorer - Delete History                                        [73] Sound - Communications Tab
        echo  [29] Internet Explorer - Delete Passwords                                      [74] Speech Properties - Text to Speech Tab
        echo  [30] Internet Explorer - Delete Temporary Internet Files and Website Files     [75] Start Settings
        echo  [31] Internet Explorer - Organize Favorites                                    [76] Stored User Names and Passwords
        echo  [32] Internet Properties - General Tab                                         [77] System Properties - Computer Name Tab
        echo  [33] Internet Properties - Security Tab                                        [78] System Properties - Hardware Tab
        echo  [34] Internet Properties - Privacy Tab                                         [79] System Properties - Advanced Tab
        echo  [35] Internet Properties - Content Tab                                         [80] System Properties - System Protection Tab
        echo  [36] Internet Properties - Connections Tab                                     [81] System Properties - Remote Tab
        echo  [37] Internet Properties - Programs Tab                                        [82] Taskbar Settings
        echo  [38] Internet Properties - Advanced Tab                                        [83] Text Services and Input Languages
        echo  [39] Keyboard Properties                                                       [84] User Accounts
        echo  [40] Lock PC                                                                   [85] Windows Features
        echo  [41] Map Network Drive Wizard                                                  [86] Windows Firewall
        echo  [42] Mouse Button swap Left and Right Button Function                          [87] Windows To Go Startup Options
        echo  [43] Mouse Properties - Buttons Tab
        echo  [44] Mouse Properties - Pointers Tab
        echo  [45] Mouse Properties - Pointer Options Tab
echo. & echo  =====================================================================================================================================================================& echo.
set "UserInput="
set /p "UserInput=>Enter an Option number and press <Enter>: "
!Arr[%UserInput%]!
cls & goto :Options
