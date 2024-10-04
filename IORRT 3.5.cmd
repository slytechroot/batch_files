@echo off
@color 0A
title IORRT 3.5

REM Variables
set InstallRoot=
set OfficeArchType=

REM Check Office Architecture Type
if '%processor_architecture%'=='x86' Set OfficeArchType=32 && Goto:EndArchCheck
goto:WOWCheck

:WOWCheck
2>nul REG QUERY HKLM\SOFTWARE\Microsoft\Office\14.0\Common | find /i "InstallRoot" 1>nul
IF ERRORLEVEL 1 Set OfficeArchType=WOW && Goto:EndArchCheck
Set OfficeArchType=64

:EndArchCheck

REM Get Office Installed Path
if %OfficeArchType%==WOW (
FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\14.0\Common\InstallRoot" /v Path') DO SET InstallRoot=%%B 
Goto:FoundPath
)
FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\14.0\Common\InstallRoot" /v Path') DO SET InstallRoot=%%B

:FoundPath

REM Start OSPPSVC (To make sure it is started to prevent strange cases where it doesn't start automatically from failing (XP))
1>nul 2>nul net start osppsvc

:MAINMENU
mode con: cols=45 lines=9
CLS
echo.
echo.  
echo.    InfiniteOfficeRestoreRearmTask (IORRT) 
echo.    
echo.                A. Install
echo.                B. Uninstall
echo.                C. Status
echo.                D. Exit
echo.
  
:CHOOSEACTION
set /p userinp=    ^   Make your selection: 
set userinp=%userinp:~0,1%
if /i "%userinp%"=="A" goto Install
if /i "%userinp%"=="B" goto Uninstall
if /i "%userinp%"=="C" goto Status
if /i "%userinp%"=="D" goto Exit
echo.Try Again...
GOTO CHOOSEACTION

:Install
CLS
title IORRT 3.5
mode con: cols=45 lines=9
schtasks /query | FINDSTR /I "IORRT" >NUL 
IF ERRORLEVEL 1 (
echo.
) ELSE (
echo IORRT is already installed...
ping -n 4 127.0.0.1 >nul
GOTO MAINMENU
)
mode con: cols=62 lines=5
title IORRT 3.5
echo Installing IORRT...
echo.
mkdir "%SystemDrive%\Check"
net stop osppsvc >NUL
xcopy /cheriky "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" "%SystemDrive%\Check\Backup\Files\Tokens" >NUL
mkdir "%SystemDrive%\Check\Backup\Registry" >NUL
reg save "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\Check\Backup\Registry\OfficeSPPInfo.hiv >NUL
net start osppsvc >NUL
IF Exist "%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" (
"%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >NUL
) ELSE ( "%commonprogramfiles(x86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >NUL
)
if errorlevel==0 goto Pass
net stop osppsvc >NUL
xcopy /cheriky "%SystemDrive%\Check\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" >NUL
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >NUL
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >NUL
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\Check\Backup\Registry\OfficeSPPInfo.hiv >NUL
net start osppsvc >NUL
DEL "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\Backup.hiv" 2> nul
SET file=%SystemDrive%\Check
IF EXIST %file% attrib -h %file%
RD /S /Q  %file%
cd /d "%InstallRoot%"
echo.
cscript OSPP.VBS /dstatus | FINDSTR /i "Status"
cscript OSPP.VBS /dstatus | FINDSTR /i "Remaining"
echo.
echo No Rearms Detected...
set msg=No rearms detected
call :speak "No rearms detected"
goto :END
:speak
echo On Error Resume Next: CreateObject("SAPI.SpVoice").Speak %1 >"%~dp0vc.vbs"
"%~dp0vc.vbs" & del "%~dp0vc.vbs"
ping -n 4 127.0.0.1 >nul
GOTO MAINMENU
:Pass
net stop osppsvc >NUL
xcopy /cheriky "%SystemDrive%\Check\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" >NUL
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >NUL
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >NUL
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\Check\Backup\Registry\OfficeSPPInfo.hiv >NUL
net start osppsvc >NUL
DEL "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\Backup.hiv" 2> nul
SET file=%SystemDrive%\Check
IF EXIST %file% attrib -h %file%
RD /S /Q  %file%
mkdir "%SystemDrive%\IORRT"
net stop osppsvc >NUL
xcopy /cheriky "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" "%SystemDrive%\IORRT\Backup\Files\Tokens" >NUL
mkdir "%SystemDrive%\IORRT\Backup\Registry"
reg save "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv >NUL
net start osppsvc >NUL
SET file=%SystemDrive%\IORRT\IORRT.bat
IF EXIST %file% attrib -h %file% 
echo @echo off >%file%
echo net stop osppsvc >>%file%
echo xcopy /cheriky "%SystemDrive%\IORRT\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" >>%file%
echo REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >>%file%
echo REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >>%file%
echo reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv >>%file%
echo net start osppsvc >>%file%
echo IF Exist "%COMMONPROGRAMFILES%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" ( >>%file%
echo "%COMMONPROGRAMFILES%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >>%file%
echo ) ELSE ( "%COMMONPROGRAMFILES(X86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >>%file%
echo ) >>%file%
echo schtasks /delete /tn "IORRT" /f >>%file%
echo schtasks /create /tn "IORRT" /tr "%SystemDrive%\IORRT\IORRT.bat" /sc daily /mo 1 /ru "" >>%file%
IF Exist "%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" (
"%CommonProgramFiles%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >NUL
) ELSE ( "%commonprogramfiles(x86)%\microsoft shared\OfficeSoftwareProtectionPlatform\OSPPREARM.exe" >NUL
)
attrib +h "%SystemDrive%\IORRT"
schtasks /create /tn "Hybrid" /tr "%SystemDrive%\IORRT\IORRT.bat" /sc onstart /ru "" >NUL
schtasks /create /tn "IORRT" /tr "%SystemDrive%\IORRT\IORRT.bat" /sc daily /mo 1 /ru "" >NUL
echo.
title IORRT 3.5
cd /d "%InstallRoot%"
echo.
echo.
cscript OSPP.VBS /dstatus | FINDSTR /i "Status"
cscript OSPP.VBS /dstatus | FINDSTR /i "Remaining"
echo.
echo Installation Successful...
set msg=Installation Successful
call :speak "Installation Successful"
goto :END
:speak
echo On Error Resume Next: CreateObject("SAPI.SpVoice").Speak %1 >"%~dp0vc.vbs"
"%~dp0vc.vbs" & del "%~dp0vc.vbs"
ping -n 4 127.0.0.1 >nul
GOTO MAINMENU

:Uninstall
schtasks /query | FINDSTR /I "IORRT" >NUL
IF '%ERRORLEVEL%' EQU '0' (
echo.
) ELSE (
mode con: cols=45 lines=9
title IORRT 3.5
echo IORRT is already uninstalled...
ping -n 4 127.0.0.1 >nul
GOTO MAINMENU
)
mode con: cols=62 lines=5
title IORRT 3.5
echo Uninstalling IORRT...
echo.
net stop osppsvc >NUL
xcopy /cheriky "%SystemDrive%\IORRT\Backup\Files\Tokens" "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform" >NUL
REG DELETE HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >NUL
REG ADD HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform /f >NUL
reg restore "HKLM\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform" %SystemDrive%\IORRT\Backup\Registry\OfficeSPPInfo.hiv >NUL
net start osppsvc >NUL
DEL "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\Backup.hiv" 2> nul
SET file=%SystemDrive%\IORRT
IF EXIST %file% attrib -h %file%
RD /S /Q  %file%
schtasks /delete /tn "Hybrid" /f >NUL
schtasks /delete /tn "IORRT" /f >NUL
cd /d "%InstallRoot%"
echo.
echo.
cscript OSPP.VBS /dstatus | FINDSTR /i "Status" 
cscript OSPP.VBS /dstatus | FINDSTR /i "Remaining" 
echo.
echo Successfully Uninstalled...
set msg=Successfully Uninstalled
call :speak "Successfully Uninstalled"
goto :END
:speak
echo On Error Resume Next: CreateObject("SAPI.SpVoice").Speak %1 >"%~dp0vc.vbs"
"%~dp0vc.vbs" & del "%~dp0vc.vbs"
ping -n 4 127.0.0.1 >nul
GOTO MAINMENU

:Status
mode con: cols=64 lines=6
title IORRT 3.5
cd /d "%InstallRoot%"
cscript OSPP.VBS /dstatus | FINDSTR /i "Status"
cscript OSPP.VBS /dstatus | FINDSTR /i "Remaining"
echo.
schtasks /query | FINDSTR /I "IORRT"
IF ERRORLEVEL 1 echo IORRT is not Installed...
ping -n 4 127.0.0.1 >nul
GOTO MAINMENU
)

:Exit
exit