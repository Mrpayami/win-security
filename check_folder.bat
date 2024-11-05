@echo off
:loop
timeout /t 20 /nobreak
if not exist "%USERPROFILE%\Documents\sec" (
    rundll32.exe user32.dll,LockWorkStation
    exit
)
goto loop
