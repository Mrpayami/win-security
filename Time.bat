@echo off
setlocal enabledelayedexpansion

set /a seconds=20

:loop
cls
figlet Security Check
echo checking You security..
echo Time remaining: !seconds! seconds
timeout /t 1 >nul
set /a seconds-=1
if !seconds! geq 0 goto loop

echo Countdown finished!
pause
