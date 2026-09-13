$ErrorActionPreference = "Stop"

$savesDir = "$env:APPDATA\PrismLauncher\instances\1.21.11(1)\minecraft\saves"
$fallbackWorld = "D:\games\Survival"
$targetWorld = "D:\games\Server\server\world"

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "        IMPORT WORLD SURVIVAL KE SERVER" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan

# Cek daftar world yang ada di Prism Launcher
$selectedWorldPath = $null

if (Test-Path $savesDir) {
    $worlds = Get-ChildItem -Path $savesDir -Directory
    Write-Host "[INFO] Daftar world solo yang ditemukan di Prism Launcher:" -ForegroundColor Yellow
    foreach ($w in $worlds) {
        if ($w.Name -eq "Survival") {
            Write-Host "  -> $($w.Name)  [TARGET UTAMA]" -ForegroundColor Green
        } else {
            Write-Host "  -> $($w.Name)  (Aman / Tidak disentuh)" -ForegroundColor Gray
        }
    }
    
    # Kunci secara spesifik ke folder 'Survival'
    $targetSolo = Join-Path $savesDir "Survival"
    if (Test-Path $targetSolo) {
        $selectedWorldPath = $targetSolo
    }
}

if (-not $selectedWorldPath -and (Test-Path $fallbackWorld)) {
    $selectedWorldPath = $fallbackWorld
}

if (-not $selectedWorldPath) {
    Write-Host "[ERROR] Folder world 'Survival' tidak ditemukan di Prism Launcher maupun D:\games\Survival!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "World yang akan diimpor: $selectedWorldPath" -ForegroundColor Green
Write-Host "Catatan: Hanya folder 'Survival' yang disalin. World solo lainnya 100% aman!" -ForegroundColor Cyan
Write-Host ""

# Cek apakah server masih berjalan
$tcp = Get-NetTCPConnection -LocalPort 25565 -State Listen -ErrorAction SilentlyContinue
if ($tcp) {
    Write-Host "[PERINGATAN] Server Minecraft masih berjalan di port 25565!" -ForegroundColor Yellow
    Write-Host "Harap ketik 'stop' di konsol server terlebih dahulu agar file dunia tidak terkunci." -ForegroundColor Yellow
    Write-Host "Menunggu server berhenti..."
    while ($tcp) {
        Start-Sleep -Seconds 2
        $tcp = Get-NetTCPConnection -LocalPort 25565 -State Listen -ErrorAction SilentlyContinue
    }
    Write-Host "Server telah berhenti." -ForegroundColor Green
    Start-Sleep -Seconds 2
}

# Hapus folder world server sebelumnya
if (Test-Path $targetWorld) {
    Write-Host "Menghapus world server sebelumnya..." -ForegroundColor Yellow
    Remove-Item -Path $targetWorld -Recurse -Force
}

# Salin isi folder Survival ke server
Write-Host "Menyalin data dari '$selectedWorldPath' ke '$targetWorld'..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path $targetWorld -Force | Out-Null
Copy-Item -Path "$selectedWorldPath\*" -Destination $targetWorld -Recurse -Force

# Hapus session.lock agar tidak bentrok
if (Test-Path "$targetWorld\session.lock") {
    Remove-Item -Path "$targetWorld\session.lock" -Force -ErrorAction SilentlyContinue
}

# Verifikasi playerdata Fendy
$fendyDat = "$targetWorld\playerdata\8e03e23f-b008-3a38-9611-e5568f3bbff0.dat"
if (Test-Path $fendyDat) {
    Write-Host "Verifikasi data pemain (fendy): DITEMUKAN & UTUH ($((Get-Item $fendyDat).Length) bytes)" -ForegroundColor Green
} else {
    Write-Host "[PERINGATAN] File playerdata fendy tidak ditemukan di $fendyDat" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "===================================================" -ForegroundColor Green
Write-Host " BERHASIL! World 'Survival' berhasil diimpor." -ForegroundColor Green
Write-Host " World solo lainnya di Prism Launcher tetap aman." -ForegroundColor Green
Write-Host " Anda sekarang bisa menjalankan 'start-server.bat'!" -ForegroundColor Yellow
Write-Host "===================================================" -ForegroundColor Green
