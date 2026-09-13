@echo off
setlocal enabledelayedexpansion
title Minecraft Bridge (ViaProxy + Geyser)

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "BASE_DIR=%%~fI"

if exist "%BASE_DIR%\runtime\bin\java.exe" (
    set "JAVA_BIN=%BASE_DIR%\runtime\bin\java.exe"
) else (
    set "JAVA_BIN=java"
)

pushd "%BASE_DIR%\bridge"
echo [INFO] Menjalankan Bridge (ViaProxy + Geyser) Bedrock Port: 19132 UDP...
"!JAVA_BIN!" -DGeyser.RakRateLimitingDisabled=true -DGeyser.RakPacketLimit=100000 -DGeyser.RakGlobalPacketLimit=1000000 -DGeyser.MaxConnectionsPerAddress=100 -Dsun.net.maxDatagramSockets=65535 -Dio.netty.allocator.type=pooled -Djava.net.preferIPv4Stack=true -Dnetworkaddress.cache.ttl=60 -jar "%BASE_DIR%\bridge\ViaProxy-3.4.12.jar" cli
popd
pause
