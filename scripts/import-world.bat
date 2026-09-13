@echo off
setlocal enabledelayedexpansion
title Import World Survival ke Server

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

powershell -NoProfile -ExecutionPolicy Bypass -File "%BASE_DIR%\scripts\import-world.ps1"

echo.
pause
