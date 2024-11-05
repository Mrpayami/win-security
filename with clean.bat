@echo off
setlocal

:loop
timeout /t 20 >nul
if exist "%USERPROFILE%\Documents\mmd\" (
    echo "Folder exists."
) else (
    echo "Folder does not exist. Locking screen."
    rundll32.exe user32.dll,LockWorkStation
)
goto loop

:cleanup
rd /s /q "%USERPROFILE%\Documents\mmd"
exit
