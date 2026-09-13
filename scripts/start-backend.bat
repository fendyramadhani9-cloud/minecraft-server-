@echo off
setlocal enabledelayedexpansion
title Minecraft Fabric 1.21.11 Backend Server

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

if exist "%BASE_DIR%\runtime\bin\java.exe" (
    set "JAVA_BIN=%BASE_DIR%\runtime\bin\java.exe"
) else (
    set "JAVA_BIN=java"
)

pushd "%BASE_DIR%\server"
echo [INFO] Menjalankan Backend Fabric 1.21.11 Server (Port 25565)...
set "JVM_FLAGS=-Xms3G -Xmx3G -XX:ActiveProcessorCount=2 -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1"
"!JAVA_BIN!" !JVM_FLAGS! -jar fabric-server-launch.jar nogui
popd
pause
