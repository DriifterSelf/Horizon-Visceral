@echo off
setlocal enabledelayedexpansion
title FH4 - NFS Action Camera Mod Installer

echo =====================================================================
echo  FH4 - Need for Speed (2015) Action Camera & Telemetry Mod Installer
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
    echo Por favor, coloca la carpeta de este mod dentro del directorio raiz de Forza Horizon 4.
    pause
    exit /b 1
)

echo [OK] Directorio de juego detectado: %GAME_DIR%
echo.

:: Check mod files
if not exist "mod_files\mediapc\Camera\CameraPhysics.xml" (
    echo [ERROR] No se encontro el archivo modificado en mod_files\mediapc\Camera\CameraPhysics.xml
    pause
    exit /b 1
)

:: Backup existing files if backup does not already exist
if not exist "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml.pre_mod_bak" (
    echo [INFO] Creando respaldo de seguridad de tus archivos actuales...
    if exist "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml" (
        copy /Y "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml" "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml.pre_mod_bak" >nul
    )
    if exist "%GAME_DIR%\media\Camera\CameraPhysics.xml" (
        copy /Y "%GAME_DIR%\media\Camera\CameraPhysics.xml" "%GAME_DIR%\media\Camera\CameraPhysics.xml.pre_mod_bak" >nul
    )
    echo [OK] Respaldo creado en .pre_mod_bak
) else (
    echo [INFO] Respaldo previo existente detectado. Conservando respaldo original.
)

:: Deploy mod files
echo [INFO] Instalando mod en mediapc y media...
copy /Y "mod_files\mediapc\Camera\CameraPhysics.xml" "%GAME_DIR%\mediapc\Camera\CameraPhysics.xml" >nul
copy /Y "mod_files\media\Camera\CameraPhysics.xml" "%GAME_DIR%\media\Camera\CameraPhysics.xml" >nul

echo.
echo =====================================================================
echo  INSTALACION COMPLETADA CON EXITO
echo  - Mod instalado en: mediapc/Camera/CameraPhysics.xml
echo  - Mod instalado en: media/Camera/CameraPhysics.xml
echo  - Camara 1 (Seguimiento Cerca): NFS 2015 Hero Drift + Frenado Visceral
echo  - Camara 2 (Seguimiento Lejos): Version de mayor amplitud
echo  - DriverCam (Interior): 100%% Original e intocada
echo =====================================================================
echo.
pause
