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
echo Выберите 1 или 2:
echo 1. Включить оффлайн режим
echo 2. Выключить оффлайн режим

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
    echo Оффлайн режим включён
) else (
    echo Оффлайн режим выключен
)
timeout /t 5 /nobreak >nul
