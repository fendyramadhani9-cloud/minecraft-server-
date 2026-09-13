@echo off
setlocal enabledelayedexpansion
title Minecraft Fabric 1.21.11 Server + Bedrock Bridge

:: Resolve base directory (D:\games\Server)
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

:: Check Java Runtime (Prefer local portable runtime)
if exist "%BASE_DIR%\runtime\bin\java.exe" (
    set "JAVA_BIN=%BASE_DIR%\runtime\bin\java.exe"
    echo [INFO] Menggunakan portable Java 21: !JAVA_BIN!
) else if defined JAVA_HOME (
    if exist "%JAVA_HOME%\bin\java.exe" (
        set "JAVA_BIN=%JAVA_HOME%\bin\java.exe"
        echo [INFO] Menggunakan JAVA_HOME: !JAVA_BIN!
    )
)

if not defined JAVA_BIN (
    where java >nul 2>nul
    if %ERRORLEVEL% equ 0 (
        set "JAVA_BIN=java"
        echo [INFO] Menggunakan system PATH java
    ) else (
        echo [ERROR] Java runtime tidak ditemukan di runtime\bin\java.exe atau system PATH!
        pause
        exit /b 1
    )
)

echo ===================================================
echo   Starting Minecraft Fabric 1.21.11 Server
echo   RAM: 3 GB (Min: -Xms3G, Max: -Xmx3G)
echo   CPU: 2 Logical Processors (-XX:ActiveProcessorCount=2)
echo   Java Port: 25565 (TCP)
echo   Bedrock Port: 19132 (UDP)
echo ===================================================

:: Start Bridge (ViaProxy + Geyser) in separate process/window if jar exists
if exist "%BASE_DIR%\bridge\ViaProxy-3.4.12.jar" (
    echo [INFO] Menjalankan Bedrock Bridge ViaProxy + Geyser...
    pushd "%BASE_DIR%\bridge"
    start "Minecraft Bridge" /min "!JAVA_BIN!" -DGeyser.RakRateLimitingDisabled=true -DGeyser.RakPacketLimit=100000 -DGeyser.RakGlobalPacketLimit=1000000 -DGeyser.MaxConnectionsPerAddress=100 -Dsun.net.maxDatagramSockets=65535 -Dio.netty.allocator.type=pooled -Djava.net.preferIPv4Stack=true -Dnetworkaddress.cache.ttl=60 -jar "%BASE_DIR%\bridge\ViaProxy-3.4.12.jar" cli
    popd
    ping -n 4 127.0.0.1 >nul
)

:: Start Playit Tunnel if configured
if exist "%BASE_DIR%\bridge\playit.toml" (
    echo [INFO] Menjalankan Playit.gg Public Tunnel...
    pushd "%BASE_DIR%\bridge"
    start "Playit Public Tunnel" /min "%BASE_DIR%\bridge\playit.exe" --secret-path "%BASE_DIR%\bridge\playit.toml"
    popd
)

:: Optimized JVM Flags (Aikar's Flags for smooth RAM & 0 GC lag spikes)
set "JVM_FLAGS=-Xms3G -Xmx3G -XX:ActiveProcessorCount=2 -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1"

:: Start Backend Fabric Server in foreground
echo [INFO] Menjalankan Fabric 1.21.11 Server (Optimized RAM & GC)...
pushd "%BASE_DIR%\server"
"!JAVA_BIN!" !JVM_FLAGS! -jar fabric-server-launch.jar nogui
popd

:: When backend server stops, clean up bridge and tunnel
echo.
echo [INFO] Server utama telah berhenti. Menutup bridge dan tunnel...
taskkill /FI "WINDOWTITLE eq Minecraft Bridge*" /T /F >nul 2>nul
taskkill /FI "WINDOWTITLE eq Playit Public Tunnel*" /T /F >nul 2>nul
echo [INFO] Selesai.
pause
