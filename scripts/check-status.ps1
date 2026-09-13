Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "        PENGECEKAN STATUS SERVER DAN TUNNEL" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "1. Backend Java Server (Port 25565 TCP): " -NoNewline
$tcp = Get-NetTCPConnection -LocalPort 25565 -State Listen -ErrorAction SilentlyContinue
if ($tcp) { Write-Host "[AKTIF / ONLINE]" -ForegroundColor Green } else { Write-Host "[MATI / OFFLINE]" -ForegroundColor Red }

Write-Host "2. Bedrock Bridge ViaProxy (Port 19132 UDP): " -NoNewline
$udp = Get-NetUDPEndpoint -LocalPort 19132 -ErrorAction SilentlyContinue
if ($udp) { Write-Host "[AKTIF / ONLINE]" -ForegroundColor Green } else { Write-Host "[MATI / OFFLINE]" -ForegroundColor Red }

Write-Host "3. Playit.gg Internet Tunnel: " -NoNewline
$playit = Get-Process playit -ErrorAction SilentlyContinue
if ($playit) { Write-Host "[AKTIF / ONLINE]" -ForegroundColor Green } else { Write-Host "[MATI / OFFLINE]" -ForegroundColor Red }

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "ALAMAT UNTUK TEMAN (BEDA RUMAH / LUAR JARINGAN):" -ForegroundColor Yellow
Write-Host "  - Minecraft JAVA (PC):" -ForegroundColor White
Write-Host "      IP/Domain: schmidt-affairs.tun.ply.gg" -ForegroundColor Green
Write-Host "      Port:      25565 (default)" -ForegroundColor Green
Write-Host "  - Minecraft BEDROCK (HP / Android / iOS / Win10 / MCPE):" -ForegroundColor White
Write-Host "      IP/Domain: schmidt-challenge.tun.ply.gg" -ForegroundColor Green
Write-Host "      Port:      61426  <-- (WAJIB DIGANTI KE 61426, JANGAN 19132!)" -ForegroundColor Magenta
Write-Host "===================================================" -ForegroundColor Cyan
