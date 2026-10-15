@echo off
setlocal enabledelayedexpansion
title Horizon-Visceral Mod Installer

echo =====================================================================
echo  Horizon-Visceral: Need for Speed Action Camera & Telemetry Installer
echo  Autor: DriifterSelf
echo =====================================================================
echo.

:: 1. Detect Game Directory
set "GAME_DIR="

:: Check current folder and parent folder
if exist "ForzaHorizon4.exe" (
    set "GAME_DIR=."
) else if exist "..\ForzaHorizon4.exe" (
    set "GAME_DIR=.."
)

:: Check common Steam / Xbox drives if not found
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

:: If still not found, prompt user directly
if "!GAME_DIR!"=="" (
    echo [AVISO] No se detecto automaticamente la carpeta de Forza Horizon 4.
    echo Por favor, escribe o arrastra la carpeta donde tienes instalado Forza Horizon 4
    echo y presiona Enter:
    echo.
    set /p "INPUT_DIR=> "
    set "INPUT_DIR=!INPUT_DIR:"=!"
    if exist "!INPUT_DIR!\ForzaHorizon4.exe" (
        set "GAME_DIR=!INPUT_DIR!"
    ) else (
        echo.
        echo [ERROR] No se encontro ForzaHorizon4.exe en la ruta especificada.
        echo Asegurate de seleccionar la carpeta principal del juego.
        pause
        exit /b 1
    )
)

echo [OK] Directorio de Forza Horizon 4 localizado en:
echo      !GAME_DIR!
echo.

:: 2. Check mod source files
set "SRC_MEDAPC=mod_files\mediapc\Camera\CameraPhysics.xml"
set "SRC_MEDIA=mod_files\media\Camera\CameraPhysics.xml"

if not exist "!SRC_MEDAPC!" (
    echo [ERROR] No se encontraron los archivos del mod en la carpeta mod_files.
    echo Asegurate de haber descomprimido el archivo ZIP completo.
    pause
    exit /b 1
)

:: 3. Backup existing files if backup does not already exist
if not exist "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml.pre_mod_bak" (
    echo [INFO] Creando respaldo de seguridad de tus archivos originales...
    if exist "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml" (
        copy /Y "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml" "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml.pre_mod_bak" >nul
    )
    if exist "!GAME_DIR!\media\Camera\CameraPhysics.xml" (
        copy /Y "!GAME_DIR!\media\Camera\CameraPhysics.xml" "!GAME_DIR!\media\Camera\CameraPhysics.xml.pre_mod_bak" >nul
    )
    echo [OK] Respaldo de seguridad creado (.pre_mod_bak)
) else (
    echo [INFO] Respaldo previo existente detectado. Conservando tu copia original.
)

:: 4. Deploy mod files
echo [INFO] Instalando Horizon-Visceral en mediapc y media...
copy /Y "!SRC_MEDAPC!" "!GAME_DIR!\mediapc\Camera\CameraPhysics.xml" >nul
copy /Y "!SRC_MEDIA!" "!GAME_DIR!\media\Camera\CameraPhysics.xml" >nul

echo.
echo =====================================================================
echo  INSTALACION DE HORIZON-VISCERAL COMPLETADA CON EXITO
echo =====================================================================
echo  - Mod instalado en: mediapc\Camera\CameraPhysics.xml
echo  - Mod instalado en: media\Camera\CameraPhysics.xml
echo.
echo  CAMARAS ACTIVAS:
echo  * Camara Seguimiento Cerca:  NFS 2015 3D Drift Orbit + Frenado Visceral
echo  * Camara Seguimiento Lejos:  Version panoramica amplia
echo  * Camara Parachoques/Bumper: Giro dinamico al apice de curva (10.5 deg)
echo  * Camara Cofre/Capo:         Giro al derrape y telemetria de chasis
echo  * Camara Interior Cabina:    100%% Original e intocada de fabrica
echo =====================================================================
echo.
echo Ya puedes iniciar Forza Horizon 4 y disfrutar del mod.
echo.
pause
