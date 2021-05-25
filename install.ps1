Write-Output "Install VcXsrv and Docker Desktop"

$software = "VcXsrv";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null
if (-Not $installed) {winget install -h VcXsrv
    if ($?) {Write-Output "VcXsrv installed successfully"}}
$software = "Docker Desktop";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null
if (-Not $installed) {winget install -h 'Docker Desktop'
    if ($?) {Write-Output "Docker Desktop installed successfully"}}
