@echo off
setlocal enabledelayedexpansion
title Playit.gg Public Tunnel

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

if not exist "%BASE_DIR%\bridge\playit.exe" (
    echo [ERROR] playit.exe tidak ditemukan di %BASE_DIR%\bridge!
    pause
    exit /b 1
)

pushd "%BASE_DIR%\bridge"
echo [INFO] Menjalankan Playit.gg Public Tunnel...
echo [INFO] Java Address: schmidt-affairs.tun.ply.gg:25565
echo [INFO] Bedrock Address: schmidt-challenge.tun.ply.gg:61426
"%BASE_DIR%\bridge\playit.exe" --secret-path "%BASE_DIR%\bridge\playit.toml"
popd
pause
