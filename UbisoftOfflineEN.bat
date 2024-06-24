@echo off
chcp 65001
title "Ubisoft offline mode | by xromzas"
:LoopStart
cls
echo ██╗░░██╗██████╗░░█████╗░███╗░░░███╗███████╗░█████╗░░██████╗
echo ╚██╗██╔╝██╔══██╗██╔══██╗████╗░████║╚════██║██╔══██╗██╔════╝
echo ░╚███╔╝░██████╔╝██║░░██║██╔████╔██║░░███╔═╝███████║╚█████╗░
echo ░██╔██╗░██╔══██╗██║░░██║██║╚██╔╝██║██╔══╝░░██╔══██║░╚═══██╗
echo ██╔╝╚██╗██║░░██║╚█████╔╝██║░╚═╝░██║███████╗██║░░██║██████╔╝
echo ╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░
echo by xromzas.
echo.
echo Select 1 or 2:
echo 1. Turn on Offline Mode
echo 2. Turn off Offline Mode

set /p choice=">>> "
if not "%choice%"=="1" if not "%choice%"=="2" (
    goto LoopStart
) else (
    goto LoopEnd
)
:LoopEnd
set "f1=%localappdata%\Ubisoft Game Launcher\settings.yaml"
if "%choice%" == "1" (
    set "r1=offline: false"
    set "r2=offline: true"
) else (
    set "r1=offline: true"
    set "r2=offline: false"
)

(for /f "usebackq delims=" %%i in ("%f1%") do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    if "!line!"=="  %r1%" (
        echo   %r2%
    ) else (
        echo !line!
    )
    endlocal
)) > new_settings.yaml

move /y new_settings.yaml "%f1%"

if "%choice%" == "1" (
    echo Offline mode is turned on
) else (
    echo Offline mode is turned off
)
timeout /t 5 /nobreak >nul
