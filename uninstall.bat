@echo off
setlocal enabledelayedexpansion
title Horizon-Visceral Mod Uninstaller

echo =====================================================================
echo  Horizon-Visceral: Desinstalador a Camara Vanilla de Fabrica
echo =====================================================================
echo.

:: 1. Detect Game Directory
set "GAME_DIR="

if exist "ForzaHorizon4.exe" (
    set "GAME_DIR=."
) else if exist "..\ForzaHorizon4.exe" (
    set "GAME_DIR=.."
)

if "!GAME_DIR!"=="" (
    for %%d in (
        "C:\Program Files (x86)\Steam\steamapps\common\ForzaHorizon4"
        "C:\SteamLibrary\steamapps\common\ForzaHorizon4"
        "D:\SteamLibrary\steamapps\common\ForzaHorizon4"
        "E:\SteamLibrary\steamapps\common\ForzaHorizon4"
        "F:\SteamLibrary\steamapps\common\ForzaHorizon4"
        "G:\SteamLibrary\steamapps\common\ForzaHorizon4"
        "D:\Games\ForzaHorizon4"
        "E:\Games\ForzaHorizon4"
        "F:\Games\ForzaHorizon4"
    ) do (
        if exist "%%~d\ForzaHorizon4.exe" (
            set "GAME_DIR=%%~d"
        )
    )
)

if "!GAME_DIR!"=="" (
    echo [AVISO] No se detecto automaticamente la carpeta de Forza Horizon 4.
    echo Escribe o arrastra la carpeta donde tienes instalado Forza Horizon 4:
    set /p "INPUT_DIR=> "
    set "INPUT_DIR=!INPUT_DIR:"=!"
    if exist "!INPUT_DIR!\ForzaHorizon4.exe" (
        set "GAME_DIR=!INPUT_DIR!"
    ) else (
        echo [ERROR] No se encontro ForzaHorizon4.exe en la ruta especificada.
        pause
        exit /b 1
    )
)

echo [OK] Directorio de juego detectado: !GAME_DIR!
echo.

:: 2. Check for vanilla backup inside repo or pre_mod_bak
set "RESTORE_SRC="
if exist "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml.pre_mod_bak" (
    set "RESTORE_SRC=!GAME_DIR!\mediapc\Camera\CameraPhysics.xml.pre_mod_bak"
    echo [INFO] Restaurando desde tu respaldo previo (.pre_mod_bak)...
) else if exist "vanilla_backup\CameraPhysics.xml" (
    set "RESTORE_SRC=vanilla_backup\CameraPhysics.xml"
    echo [INFO] Restaurando desde vanilla_backup oficial...
) else (
    echo [ERROR] No se encontro ningun archivo de respaldo vanilla.
    pause
    exit /b 1
)

copy /Y "!RESTORE_SRC!" "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml" >nul
copy /Y "!RESTORE_SRC!" "!GAME_DIR!\media\Camera\CameraPhysics.xml" >nul

echo.
echo =====================================================================
echo  RESTAURACION COMPLETADA CON EXITO
echo  Las camaras han vuelto a su estado original de fabrica de Playground Games.
echo =====================================================================
echo.
pause
