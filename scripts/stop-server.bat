@echo off
setlocal
echo ===================================================
echo   Stopping Minecraft Server and Bridge
echo ===================================================

echo [INFO] Menutup jendela bridge dan tunnel...
taskkill /FI "WINDOWTITLE eq Minecraft Bridge*" /T /F >nul 2>nul
taskkill /FI "WINDOWTITLE eq Playit Public Tunnel*" /T /F >nul 2>nul

echo [INFO] Menutup jendela server jika berjalan...
taskkill /FI "WINDOWTITLE eq Minecraft Fabric 1.21.11 Server*" /T /F >nul 2>nul

echo [INFO] Berhasil dihentikan.
ping -n 3 127.0.0.1 >nul
