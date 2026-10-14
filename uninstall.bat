@echo off
setlocal enabledelayedexpansion
title Horizon-Visceral Mod Uninstaller

echo =====================================================================
echo  Horizon-Visceral: Desinstalador a Camara Vanilla de Fabrica
echo =====================================================================
echo.

:: Detect Game Directory
set "GAME_DIR="
if exist "..\ForzaHorizon4.exe" (
    set "GAME_DIR=.."
) else if exist "ForzaHorizon4.exe" (
    set "GAME_DIR=."
) else (
    echo [ERROR] No se encontro ForzaHorizon4.exe en la carpeta superior ni actual.
    pause
    exit /b 1
)

echo [OK] Directorio de juego detectado: %GAME_DIR%
echo.

:: Check for vanilla backup inside repo or pre_mod_bak
set "RESTORE_SRC="
if exist "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml.pre_mod_bak" (
    set "RESTORE_SRC=%GAME_DIR%\mediapc\Camera\CameraPhysics.xml.pre_mod_bak"
    echo [INFO] Restaurando desde tu respaldo previo (.pre_mod_bak)...
) else if exist "vanilla_backup\CameraPhysics.xml" (
    set "RESTORE_SRC=vanilla_backup\CameraPhysics.xml"
    echo [INFO] Restaurando desde vanilla_backup oficial...
) else (
    echo [ERROR] No se encontro ningun archivo de respaldo vanilla.
    pause
    exit /b 1
)

copy /Y "!RESTORE_SRC!" "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml" >nul
copy /Y "!RESTORE_SRC!" "%GAME_DIR%\media\Camera\CameraPhysics.xml" >nul

echo.
echo =====================================================================
echo  RESTAURACION COMPLETADA
echo  Las camaras han vuelto a su estado original de fabrica de Playground Games.
echo =====================================================================
echo.
pause
