@echo off
cls
:start
echo.
echo 1. Notepad
echo 2. Calculator
echo 3. Microsoft Word
echo 4. Microsoft Excel
echo 5. Internet Explorer
echo 6. Firefox
echo 7. I'm Done
echo.
echo.
set /p x=Pick:
IF '%x%' == '%x%' GOTO Item_%x%

:Item_1
start /MIN /DC:\Windows\System32 notepad.exe
GOTO Start

:Item_2
start /MIN /DC:\Windows\System32 calc.exe
GOTO Start

:Item_3
start /MIN /D"C:\Program Files\Microsoft Office\Office10" WINWORD.EXE
GOTO Start

:Item_4
start /MIN /D"C:\Program Files\Microsoft Office\Office10" EXCEL.EXE
GOTO Start

:Item_5
start /MIN /D"C:\Program Files\Internet Explorer\iexplore.exe" http://www.streamedsecurity.com
GOTO Start

:Item_6
start /MIN /D"C:\Program Files\Mozilla Firefox" firefox.exe http://www.whiteknightlabs.com
GOTO Start

:Item_7
exit