param(
    [string]$Code = "b628caca15474238"
)

$ErrorActionPreference = "Stop"
$claimUrl = "https://playit.gg/claim/$Code"
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "        Playit.gg Automated Agent Setup" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "Silakan buka link berikut di browser Anda:" -ForegroundColor Yellow
Write-Host "-> $claimUrl" -ForegroundColor Green
Write-Host "Lalu klik 'Add Agent' atau 'Accept'." -ForegroundColor Yellow
Write-Host ""
Write-Host "Menunggu konfirmasi dari browser (polling setiap 3 detik)..."

$maxAttempts = 40
$attempt = 0
$secretKey = $null

while ($attempt -lt $maxAttempts) {
    Start-Sleep -Seconds 3
    $attempt++
    
    try {
        # Check claim setup status
        $setupBody = @{
            code = $Code;
            agent_type = "self-managed";
            version = "0.2.0"
        } | ConvertTo-Json
        
        $setupRes = Invoke-RestMethod -Uri 'https://api.playit.gg/claim/setup' -Method POST -Body $setupBody -ContentType 'application/json' -ErrorAction SilentlyContinue
        
        if ($setupRes.data -eq "UserAccepted") {
            Write-Host "User Accepted! Mengambil secret key..." -ForegroundColor Green
            $exchangeBody = @{ code = $Code } | ConvertTo-Json
            $exchRes = Invoke-RestMethod -Uri 'https://api.playit.gg/claim/exchange' -Method POST -Body $exchangeBody -ContentType 'application/json'
            if ($exchRes.status -eq "success") {
                $secretKey = $exchRes.data.secret_key
                break
            }
        } else {
            Write-Host "Status: $($setupRes.data) ($attempt/$maxAttempts)..."
        }
    } catch {
        # continue polling
    }
}

if ($secretKey) {
    Write-Host "BERHASIL! Secret key diperoleh." -ForegroundColor Green
    $tomlPath = "D:\games\Server\bridge\playit.toml"
    "secret_key = `"$secretKey`"" | Set-Content -Path $tomlPath -Encoding UTF8
    Write-Host "playit.toml berhasil disimpan ke $tomlPath" -ForegroundColor Green
    
    # Also save to User AppData as default
    $userAppDir = "$env:LOCALAPPDATA\playit_gg"
    if (-not (Test-Path $userAppDir)) {
        New-Item -ItemType Directory -Path $userAppDir -Force | Out-Null
    }
    Copy-Item -Path $tomlPath -Destination "$userAppDir\playit.toml" -Force
} else {
    Write-Host "Waktu tunggu habis atau belum diklik. Anda bisa menjalankan script ini lagi kapan saja." -ForegroundColor Red
}
