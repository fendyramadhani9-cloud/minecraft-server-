$ErrorActionPreference = "Stop"

$serverWorld = "D:\games\Server\server\world"
$prismSurvival = "$env:APPDATA\PrismLauncher\instances\1.21.11(1)\minecraft\saves\Survival"
$fallbackWorld = "D:\games\Survival"

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "        EXPORT WORLD SERVER KE SOLO SURVIVAL" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan

if (-not (Test-Path $serverWorld)) {
    Write-Host "[ERROR] Folder server world $serverWorld tidak ditemukan!" -ForegroundColor Red
    exit 1
}

# Cek apakah server masih berjalan
$tcp = Get-NetTCPConnection -LocalPort 25565 -State Listen -ErrorAction SilentlyContinue
if ($tcp) {
    Write-Host "[PERINGATAN] Server Minecraft masih berjalan!" -ForegroundColor Yellow
    Write-Host "Harap ketik 'stop' di konsol server terlebih dahulu agar data tersimpan sempurna." -ForegroundColor Yellow
    Write-Host "Menunggu server berhenti..."
    while ($tcp) {
        Start-Sleep -Seconds 2
        $tcp = Get-NetTCPConnection -LocalPort 25565 -State Listen -ErrorAction SilentlyContinue
    }
    Write-Host "Server telah berhenti." -ForegroundColor Green
    Start-Sleep -Seconds 2
}

# Export hanya ke folder 'Survival' di Prism Launcher
Write-Host "Menyinkronkan khusus ke folder 'Survival' di Prism Launcher..." -ForegroundColor Cyan
if (-not (Test-Path $prismSurvival)) {
    New-Item -ItemType Directory -Path $prismSurvival -Force | Out-Null
}
Copy-Item -Path "$serverWorld\*" -Destination $prismSurvival -Recurse -Force
Write-Host "Berhasil disinkronkan ke: $prismSurvival" -ForegroundColor Green
Write-Host "(World solo lain seperti 'Dunia Baru' tetap aman dan tidak disentuh)" -ForegroundColor Gray

# Export juga ke D:\games\Survival sebagai cadangan
Write-Host "Menyimpan cadangan ke $fallbackWorld..." -ForegroundColor Cyan
if (-not (Test-Path $fallbackWorld)) {
    New-Item -ItemType Directory -Path $fallbackWorld -Force | Out-Null
}
Copy-Item -Path "$serverWorld\*" -Destination $fallbackWorld -Recurse -Force

Write-Host ""
Write-Host "===================================================" -ForegroundColor Green
Write-Host " BERHASIL! World terbaru dari server telah di-export." -ForegroundColor Green
Write-Host " Anda bisa langsung buka Prism Launcher -> Singleplayer -> Survival!" -ForegroundColor Yellow
Write-Host "===================================================" -ForegroundColor Green
