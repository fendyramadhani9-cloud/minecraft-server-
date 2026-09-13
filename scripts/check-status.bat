@echo off
setlocal enabledelayedexpansion
title Cek Status Server dan Tunnel

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

powershell -NoProfile -ExecutionPolicy Bypass -File "%BASE_DIR%\scripts\check-status.ps1"

echo.
pause
