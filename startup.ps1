$env:DISPLAY = -join ((
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress, ":0")
$vcxsrv = Get-Process vcxsrv -ErrorAction SilentlyContinue
if (!$vcxsrv) {
    .\config.xlaunch
}
docker compose build
docker compose up
