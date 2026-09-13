@echo off
setlocal enabledelayedexpansion
title Export World Server ke Solo Survival

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

powershell -NoProfile -ExecutionPolicy Bypass -File "%BASE_DIR%\scripts\export-world.ps1"

echo.
pause
