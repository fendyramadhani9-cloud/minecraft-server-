param(
    [string]$HostName = "schmidt-challenge.tun.ply.gg",
    [int]$Port = 61426
)

$client = New-Object System.Net.Sockets.UdpClient
$client.Client.ReceiveTimeout = 4000

# RakNet Unconnected Ping packet
[byte[]]$packet = @(
    0x01,                                             # ID_UNCONNECTED_PING
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, # Time
    0x00, 0xff, 0xff, 0x00, 0xfe, 0xfe, 0xfe, 0xfe, # Magic
    0xfd, 0xfd, 0xfd, 0xfd, 0x12, 0x34, 0x56, 0x78,
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08  # Client GUID
)

$ips = [System.Net.Dns]::GetHostAddresses($HostName)
$targetIp = $ips[0]
Write-Host "Connecting to $HostName ($targetIp):$Port via UDP..." -ForegroundColor Yellow

$endpoint = New-Object System.Net.IPEndPoint($targetIp, $Port)
[void]$client.Send($packet, $packet.Length, $endpoint)

try {
    $remoteEP = New-Object System.Net.IPEndPoint([System.Net.IPAddress]::Any, 0)
    $response = $client.Receive([ref]$remoteEP)
    $str = [System.Text.Encoding]::UTF8.GetString($response)
    Write-Host "Bedrock Response from Public Tunnel received! Length: $($response.Length)" -ForegroundColor Green
    Write-Host "Raw payload: $str" -ForegroundColor Cyan
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $client.Close()
}
